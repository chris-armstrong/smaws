open Types
open Service_metadata

module AssociateGlossaryTerms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_glossary_terms_request) =
    let input = Json_serializers.associate_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.AssociateGlossaryTerms" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_glossary_terms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_glossary_terms_request) =
    let input = Json_serializers.associate_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.AssociateGlossaryTerms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_glossary_terms_response_of_yojson
      ~error_deserializer
end

module BatchCreatePartition = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_partition_request) =
    let input = Json_serializers.batch_create_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchCreatePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_create_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_partition_request) =
    let input = Json_serializers.batch_create_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchCreatePartition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_partition_response_of_yojson
      ~error_deserializer
end

module BatchDeleteConnection = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_connection_request) =
    let input = Json_serializers.batch_delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchDeleteConnection" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_connection_request) =
    let input = Json_serializers.batch_delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchDeleteConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_connection_response_of_yojson
      ~error_deserializer
end

module BatchDeletePartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_partition_request) =
    let input = Json_serializers.batch_delete_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchDeletePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_delete_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_partition_request) =
    let input = Json_serializers.batch_delete_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchDeletePartition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_partition_response_of_yojson
      ~error_deserializer
end

module BatchDeleteTable = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_table_request) =
    let input = Json_serializers.batch_delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchDeleteTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_delete_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_table_request) =
    let input = Json_serializers.batch_delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchDeleteTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_table_response_of_yojson
      ~error_deserializer
end

module BatchDeleteTableVersion = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_table_version_request) =
    let input = Json_serializers.batch_delete_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchDeleteTableVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_table_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_table_version_request) =
    let input = Json_serializers.batch_delete_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchDeleteTableVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_table_version_response_of_yojson
      ~error_deserializer
end

module BatchGetBlueprints = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_blueprints_request) =
    let input = Json_serializers.batch_get_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetBlueprints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_blueprints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_blueprints_request) =
    let input = Json_serializers.batch_get_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetBlueprints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_blueprints_response_of_yojson
      ~error_deserializer
end

module BatchGetCrawlers = struct
  let error_to_string = function
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_crawlers_request) =
    let input = Json_serializers.batch_get_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetCrawlers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_crawlers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_crawlers_request) =
    let input = Json_serializers.batch_get_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetCrawlers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_crawlers_response_of_yojson
      ~error_deserializer
end

module BatchGetCustomEntityTypes = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_custom_entity_types_request) =
    let input = Json_serializers.batch_get_custom_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetCustomEntityTypes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_custom_entity_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_custom_entity_types_request) =
    let input = Json_serializers.batch_get_custom_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.BatchGetCustomEntityTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_custom_entity_types_response_of_yojson
      ~error_deserializer
end

module BatchGetDataQualityResult = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_data_quality_result_request) =
    let input = Json_serializers.batch_get_data_quality_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetDataQualityResult" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_data_quality_result_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_data_quality_result_request) =
    let input = Json_serializers.batch_get_data_quality_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.BatchGetDataQualityResult" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_data_quality_result_response_of_yojson
      ~error_deserializer
end

module BatchGetDevEndpoints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_dev_endpoints_request) =
    let input = Json_serializers.batch_get_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetDevEndpoints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_dev_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_dev_endpoints_request) =
    let input = Json_serializers.batch_get_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetDevEndpoints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_dev_endpoints_response_of_yojson
      ~error_deserializer
end

module BatchGetIterableForms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_iterable_forms_request) =
    let input = Json_serializers.batch_get_iterable_forms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetIterableForms" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_iterable_forms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_iterable_forms_request) =
    let input = Json_serializers.batch_get_iterable_forms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetIterableForms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_iterable_forms_response_of_yojson
      ~error_deserializer
end

module BatchGetJobs = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_jobs_request) =
    let input = Json_serializers.batch_get_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_jobs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : batch_get_jobs_request) =
    let input = Json_serializers.batch_get_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetJobs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_get_jobs_response_of_yojson
      ~error_deserializer
end

module BatchGetPartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `InvalidStateException _ -> "com.amazonaws.glue#InvalidStateException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_partition_request) =
    let input = Json_serializers.batch_get_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetPartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_partition_request) =
    let input = Json_serializers.batch_get_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetPartition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_partition_response_of_yojson
      ~error_deserializer
end

module BatchGetTableOptimizer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_table_optimizer_request) =
    let input = Json_serializers.batch_get_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetTableOptimizer" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_table_optimizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_table_optimizer_request) =
    let input = Json_serializers.batch_get_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetTableOptimizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_table_optimizer_response_of_yojson
      ~error_deserializer
end

module BatchGetTriggers = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_triggers_request) =
    let input = Json_serializers.batch_get_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetTriggers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_triggers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_triggers_request) =
    let input = Json_serializers.batch_get_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetTriggers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_triggers_response_of_yojson
      ~error_deserializer
end

module BatchGetWorkflows = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_workflows_request) =
    let input = Json_serializers.batch_get_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchGetWorkflows" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_get_workflows_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_workflows_request) =
    let input = Json_serializers.batch_get_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchGetWorkflows"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_workflows_response_of_yojson
      ~error_deserializer
end

module BatchPutDataQualityStatisticAnnotation = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_put_data_quality_statistic_annotation_request) =
    let input =
      Json_serializers.batch_put_data_quality_statistic_annotation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchPutDataQualityStatisticAnnotation"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_put_data_quality_statistic_annotation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_put_data_quality_statistic_annotation_request)
      =
    let input =
      Json_serializers.batch_put_data_quality_statistic_annotation_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.BatchPutDataQualityStatisticAnnotation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_put_data_quality_statistic_annotation_response_of_yojson
      ~error_deserializer
end

module BatchStopJobRun = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_stop_job_run_request) =
    let input = Json_serializers.batch_stop_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchStopJobRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_stop_job_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_stop_job_run_request) =
    let input = Json_serializers.batch_stop_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchStopJobRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_stop_job_run_response_of_yojson
      ~error_deserializer
end

module BatchUpdatePartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_partition_request) =
    let input = Json_serializers.batch_update_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.BatchUpdatePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.batch_update_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_update_partition_request) =
    let input = Json_serializers.batch_update_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.BatchUpdatePartition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_partition_response_of_yojson
      ~error_deserializer
end

module CancelDataQualityRuleRecommendationRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_data_quality_rule_recommendation_run_request) =
    let input =
      Json_serializers.cancel_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CancelDataQualityRuleRecommendationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_data_quality_rule_recommendation_run_request)
      =
    let input =
      Json_serializers.cancel_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CancelDataQualityRuleRecommendationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer
end

module CancelDataQualityRulesetEvaluationRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.cancel_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CancelDataQualityRulesetEvaluationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.cancel_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CancelDataQualityRulesetEvaluationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.cancel_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer
end

module CancelMLTaskRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_ml_task_run_request) =
    let input = Json_serializers.cancel_ml_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CancelMLTaskRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_ml_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_ml_task_run_request) =
    let input = Json_serializers.cancel_ml_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CancelMLTaskRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.cancel_ml_task_run_response_of_yojson
      ~error_deserializer
end

module CancelStatement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_statement_request) =
    let input = Json_serializers.cancel_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CancelStatement" ~service ~context
      ~input ~output_deserializer:Json_deserializers.cancel_statement_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_statement_request) =
    let input = Json_serializers.cancel_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CancelStatement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.cancel_statement_response_of_yojson
      ~error_deserializer
end

module CheckSchemaVersionValidity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : check_schema_version_validity_input) =
    let input = Json_serializers.check_schema_version_validity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CheckSchemaVersionValidity" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.check_schema_version_validity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : check_schema_version_validity_input) =
    let input = Json_serializers.check_schema_version_validity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CheckSchemaVersionValidity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.check_schema_version_validity_response_of_yojson
      ~error_deserializer
end

module CreateBlueprint = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_blueprint_request) =
    let input = Json_serializers.create_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateBlueprint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_blueprint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_blueprint_request) =
    let input = Json_serializers.create_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateBlueprint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_blueprint_response_of_yojson
      ~error_deserializer
end

module CreateCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederatedResourceAlreadyExistsException _ ->
        "com.amazonaws.glue#FederatedResourceAlreadyExistsException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederatedResourceAlreadyExistsException" ->
          `FederatedResourceAlreadyExistsException
            (Json_deserializers.federated_resource_already_exists_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_catalog_request) =
    let input = Json_serializers.create_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_catalog_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_catalog_request) =
    let input = Json_serializers.create_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_catalog_response_of_yojson
      ~error_deserializer
end

module CreateClassifier = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_classifier_request) =
    let input = Json_serializers.create_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateClassifier" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_classifier_request) =
    let input = Json_serializers.create_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_classifier_response_of_yojson
      ~error_deserializer
end

module CreateColumnStatisticsTaskSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ColumnStatisticsTaskRunningException _ ->
        "com.amazonaws.glue#ColumnStatisticsTaskRunningException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ColumnStatisticsTaskRunningException" ->
          `ColumnStatisticsTaskRunningException
            (Json_deserializers.column_statistics_task_running_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_column_statistics_task_settings_request) =
    let input = Json_serializers.create_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateColumnStatisticsTaskSettings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_column_statistics_task_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_column_statistics_task_settings_request) =
    let input = Json_serializers.create_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateColumnStatisticsTaskSettings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_column_statistics_task_settings_response_of_yojson
      ~error_deserializer
end

module CreateConnection = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connection_request) =
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer
end

module CreateCrawler = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_crawler_request) =
    let input = Json_serializers.create_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_crawler_request) =
    let input = Json_serializers.create_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_crawler_response_of_yojson
      ~error_deserializer
end

module CreateCustomEntityType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_entity_type_request) =
    let input = Json_serializers.create_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateCustomEntityType" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_entity_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_entity_type_request) =
    let input = Json_serializers.create_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateCustomEntityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_entity_type_response_of_yojson
      ~error_deserializer
end

module CreateDatabase = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `FederatedResourceAlreadyExistsException _ ->
        "com.amazonaws.glue#FederatedResourceAlreadyExistsException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "FederatedResourceAlreadyExistsException" ->
          `FederatedResourceAlreadyExistsException
            (Json_deserializers.federated_resource_already_exists_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_database_request) =
    let input = Json_serializers.create_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_database_request) =
    let input = Json_serializers.create_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_database_response_of_yojson
      ~error_deserializer
end

module CreateDataQualityRuleset = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_data_quality_ruleset_request) =
    let input = Json_serializers.create_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateDataQualityRuleset" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_data_quality_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_data_quality_ruleset_request) =
    let input = Json_serializers.create_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateDataQualityRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_data_quality_ruleset_response_of_yojson
      ~error_deserializer
end

module CreateDevEndpoint = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_dev_endpoint_request) =
    let input = Json_serializers.create_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateDevEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_dev_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_dev_endpoint_request) =
    let input = Json_serializers.create_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateDevEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_dev_endpoint_response_of_yojson
      ~error_deserializer
end

module CreateGlossary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_glossary_request) =
    let input = Json_serializers.create_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateGlossary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_glossary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_glossary_request) =
    let input = Json_serializers.create_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateGlossary" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_glossary_response_of_yojson
      ~error_deserializer
end

module CreateGlossaryTerm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_glossary_term_request) =
    let input = Json_serializers.create_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateGlossaryTerm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_glossary_term_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_glossary_term_request) =
    let input = Json_serializers.create_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateGlossaryTerm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_glossary_term_response_of_yojson
      ~error_deserializer
end

module CreateGlueIdentityCenterConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.create_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateGlueIdentityCenterConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.create_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateGlueIdentityCenterConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer
end

module CreateIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.glue#IntegrationConflictOperationFault"
    | `IntegrationQuotaExceededFault _ -> "com.amazonaws.glue#IntegrationQuotaExceededFault"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `KMSKeyNotAccessibleFault _ -> "com.amazonaws.glue#KMSKeyNotAccessibleFault"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IntegrationConflictOperationFault" ->
          `IntegrationConflictOperationFault
            (Json_deserializers.integration_conflict_operation_fault_of_yojson tree path)
      | _, "IntegrationQuotaExceededFault" ->
          `IntegrationQuotaExceededFault
            (Json_deserializers.integration_quota_exceeded_fault_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "KMSKeyNotAccessibleFault" ->
          `KMSKeyNotAccessibleFault
            (Json_deserializers.kms_key_not_accessible_fault_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_integration_request) =
    let input = Json_serializers.create_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateIntegration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_integration_request) =
    let input = Json_serializers.create_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_integration_response_of_yojson
      ~error_deserializer
end

module CreateIntegrationResourceProperty = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_integration_resource_property_request) =
    let input = Json_serializers.create_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateIntegrationResourceProperty"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_integration_resource_property_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_integration_resource_property_request) =
    let input = Json_serializers.create_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateIntegrationResourceProperty" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_integration_resource_property_response_of_yojson
      ~error_deserializer
end

module CreateIntegrationTableProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_integration_table_properties_request) =
    let input = Json_serializers.create_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateIntegrationTableProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_integration_table_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_integration_table_properties_request) =
    let input = Json_serializers.create_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateIntegrationTableProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_integration_table_properties_response_of_yojson
      ~error_deserializer
end

module CreateJob = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_job_request) =
    let input = Json_serializers.create_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_job_request) =
    let input = Json_serializers.create_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_job_response_of_yojson
      ~error_deserializer
end

module CreateMLTransform = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ml_transform_request) =
    let input = Json_serializers.create_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateMLTransform" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_ml_transform_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ml_transform_request) =
    let input = Json_serializers.create_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateMLTransform"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ml_transform_response_of_yojson
      ~error_deserializer
end

module CreatePartition = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partition_request) =
    let input = Json_serializers.create_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreatePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partition_request) =
    let input = Json_serializers.create_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreatePartition" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_partition_response_of_yojson
      ~error_deserializer
end

module CreatePartitionIndex = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_partition_index_request) =
    let input = Json_serializers.create_partition_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreatePartitionIndex" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_partition_index_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partition_index_request) =
    let input = Json_serializers.create_partition_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreatePartitionIndex"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_partition_index_response_of_yojson
      ~error_deserializer
end

module CreateRegistry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_registry_input) =
    let input = Json_serializers.create_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateRegistry" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_registry_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_registry_input) =
    let input = Json_serializers.create_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateRegistry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_registry_response_of_yojson
      ~error_deserializer
end

module CreateSchema = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_schema_input) =
    let input = Json_serializers.create_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateSchema" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_schema_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_schema_input) =
    let input = Json_serializers.create_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_schema_response_of_yojson
      ~error_deserializer
end

module CreateScript = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_script_request) =
    let input = Json_serializers.create_script_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateScript" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_script_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_script_request) =
    let input = Json_serializers.create_script_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateScript" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_script_response_of_yojson
      ~error_deserializer
end

module CreateSecurityConfiguration = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_security_configuration_request) =
    let input = Json_serializers.create_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateSecurityConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_security_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_security_configuration_request) =
    let input = Json_serializers.create_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateSecurityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_security_configuration_response_of_yojson
      ~error_deserializer
end

module CreateSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_session_request) =
    let input = Json_serializers.create_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_session_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_session_request) =
    let input = Json_serializers.create_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_session_response_of_yojson
      ~error_deserializer
end

module CreateTable = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_table_request) =
    let input = Json_serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_table_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_table_request) =
    let input = Json_serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_table_response_of_yojson
      ~error_deserializer
end

module CreateTableOptimizer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_table_optimizer_request) =
    let input = Json_serializers.create_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateTableOptimizer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_table_optimizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_table_optimizer_request) =
    let input = Json_serializers.create_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateTableOptimizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_table_optimizer_response_of_yojson
      ~error_deserializer
end

module CreateTrigger = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_trigger_request) =
    let input = Json_serializers.create_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_trigger_request) =
    let input = Json_serializers.create_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_trigger_response_of_yojson
      ~error_deserializer
end

module CreateUsageProfile = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_usage_profile_request) =
    let input = Json_serializers.create_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateUsageProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_usage_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_usage_profile_request) =
    let input = Json_serializers.create_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateUsageProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_usage_profile_response_of_yojson
      ~error_deserializer
end

module CreateUserDefinedFunction = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_defined_function_request) =
    let input = Json_serializers.create_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateUserDefinedFunction" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_user_defined_function_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_user_defined_function_request) =
    let input = Json_serializers.create_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.CreateUserDefinedFunction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_user_defined_function_response_of_yojson
      ~error_deserializer
end

module CreateWorkflow = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.CreateWorkflow" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workflow_request) =
    let input = Json_serializers.create_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.CreateWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_workflow_response_of_yojson
      ~error_deserializer
end

module DeleteAsset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_asset_request) =
    let input = Json_serializers.delete_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteAsset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_asset_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_asset_request) =
    let input = Json_serializers.delete_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteAsset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_asset_response_of_yojson
      ~error_deserializer
end

module DeleteAssetType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_asset_type_request) =
    let input = Json_serializers.delete_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteAssetType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_asset_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_asset_type_request) =
    let input = Json_serializers.delete_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteAssetType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_asset_type_response_of_yojson
      ~error_deserializer
end

module DeleteAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_attachment_request) =
    let input = Json_serializers.delete_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteAttachment" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_attachment_request) =
    let input = Json_serializers.delete_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteAttachment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_attachment_response_of_yojson
      ~error_deserializer
end

module DeleteBlueprint = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_blueprint_request) =
    let input = Json_serializers.delete_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteBlueprint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_blueprint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_blueprint_request) =
    let input = Json_serializers.delete_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteBlueprint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_blueprint_response_of_yojson
      ~error_deserializer
end

module DeleteCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_catalog_request) =
    let input = Json_serializers.delete_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_catalog_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_catalog_request) =
    let input = Json_serializers.delete_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_catalog_response_of_yojson
      ~error_deserializer
end

module DeleteClassifier = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_classifier_request) =
    let input = Json_serializers.delete_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteClassifier" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_classifier_request) =
    let input = Json_serializers.delete_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_classifier_response_of_yojson
      ~error_deserializer
end

module DeleteColumnStatisticsForPartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_column_statistics_for_partition_request) =
    let input = Json_serializers.delete_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteColumnStatisticsForPartition"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_column_statistics_for_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_column_statistics_for_partition_request) =
    let input = Json_serializers.delete_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteColumnStatisticsForPartition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_column_statistics_for_partition_response_of_yojson
      ~error_deserializer
end

module DeleteColumnStatisticsForTable = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_column_statistics_for_table_request) =
    let input = Json_serializers.delete_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteColumnStatisticsForTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_column_statistics_for_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_column_statistics_for_table_request) =
    let input = Json_serializers.delete_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteColumnStatisticsForTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_column_statistics_for_table_response_of_yojson
      ~error_deserializer
end

module DeleteColumnStatisticsTaskSettings = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_column_statistics_task_settings_request) =
    let input = Json_serializers.delete_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteColumnStatisticsTaskSettings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_column_statistics_task_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_column_statistics_task_settings_request) =
    let input = Json_serializers.delete_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteColumnStatisticsTaskSettings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_column_statistics_task_settings_response_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_request) =
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer
end

module DeleteConnectionType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_type_request) =
    let input = Json_serializers.delete_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteConnectionType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_connection_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_type_request) =
    let input = Json_serializers.delete_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteConnectionType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_type_response_of_yojson
      ~error_deserializer
end

module DeleteCrawler = struct
  let error_to_string = function
    | `CrawlerRunningException _ -> "com.amazonaws.glue#CrawlerRunningException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `SchedulerTransitioningException _ -> "com.amazonaws.glue#SchedulerTransitioningException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CrawlerRunningException" ->
          `CrawlerRunningException
            (Json_deserializers.crawler_running_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "SchedulerTransitioningException" ->
          `SchedulerTransitioningException
            (Json_deserializers.scheduler_transitioning_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_crawler_request) =
    let input = Json_serializers.delete_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_crawler_request) =
    let input = Json_serializers.delete_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_crawler_response_of_yojson
      ~error_deserializer
end

module DeleteCustomEntityType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_entity_type_request) =
    let input = Json_serializers.delete_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteCustomEntityType" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_custom_entity_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_entity_type_request) =
    let input = Json_serializers.delete_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteCustomEntityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_custom_entity_type_response_of_yojson
      ~error_deserializer
end

module DeleteDatabase = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_database_request) =
    let input = Json_serializers.delete_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_database_request) =
    let input = Json_serializers.delete_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_database_response_of_yojson
      ~error_deserializer
end

module DeleteDataQualityRuleset = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_data_quality_ruleset_request) =
    let input = Json_serializers.delete_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteDataQualityRuleset" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_quality_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_data_quality_ruleset_request) =
    let input = Json_serializers.delete_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteDataQualityRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_data_quality_ruleset_response_of_yojson
      ~error_deserializer
end

module DeleteDevEndpoint = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_dev_endpoint_request) =
    let input = Json_serializers.delete_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteDevEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_dev_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_dev_endpoint_request) =
    let input = Json_serializers.delete_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteDevEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_dev_endpoint_response_of_yojson
      ~error_deserializer
end

module DeleteFormType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_form_type_request) =
    let input = Json_serializers.delete_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteFormType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_form_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_form_type_request) =
    let input = Json_serializers.delete_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteFormType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_form_type_response_of_yojson
      ~error_deserializer
end

module DeleteGlossary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_glossary_request) =
    let input = Json_serializers.delete_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteGlossary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_glossary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_glossary_request) =
    let input = Json_serializers.delete_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteGlossary" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_glossary_response_of_yojson
      ~error_deserializer
end

module DeleteGlossaryTerm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_glossary_term_request) =
    let input = Json_serializers.delete_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteGlossaryTerm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_glossary_term_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_glossary_term_request) =
    let input = Json_serializers.delete_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteGlossaryTerm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_glossary_term_response_of_yojson
      ~error_deserializer
end

module DeleteGlueIdentityCenterConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.delete_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteGlueIdentityCenterConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.delete_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteGlueIdentityCenterConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.glue#IntegrationConflictOperationFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.glue#IntegrationNotFoundFault"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `InvalidIntegrationStateFault _ -> "com.amazonaws.glue#InvalidIntegrationStateFault"
    | `InvalidStateException _ -> "com.amazonaws.glue#InvalidStateException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IntegrationConflictOperationFault" ->
          `IntegrationConflictOperationFault
            (Json_deserializers.integration_conflict_operation_fault_of_yojson tree path)
      | _, "IntegrationNotFoundFault" ->
          `IntegrationNotFoundFault
            (Json_deserializers.integration_not_found_fault_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidIntegrationStateFault" ->
          `InvalidIntegrationStateFault
            (Json_deserializers.invalid_integration_state_fault_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_integration_request) =
    let input = Json_serializers.delete_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteIntegration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_integration_request) =
    let input = Json_serializers.delete_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_integration_response_of_yojson
      ~error_deserializer
end

module DeleteIntegrationResourceProperty = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_integration_resource_property_request) =
    let input = Json_serializers.delete_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteIntegrationResourceProperty"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_integration_resource_property_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_integration_resource_property_request) =
    let input = Json_serializers.delete_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteIntegrationResourceProperty" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_integration_resource_property_response_of_yojson
      ~error_deserializer
end

module DeleteIntegrationTableProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_integration_table_properties_request) =
    let input = Json_serializers.delete_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteIntegrationTableProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_integration_table_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_integration_table_properties_request) =
    let input = Json_serializers.delete_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteIntegrationTableProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_integration_table_properties_response_of_yojson
      ~error_deserializer
end

module DeleteJob = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_job_request) =
    let input = Json_serializers.delete_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_job_request) =
    let input = Json_serializers.delete_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_job_response_of_yojson
      ~error_deserializer
end

module DeleteMLTransform = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ml_transform_request) =
    let input = Json_serializers.delete_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteMLTransform" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_ml_transform_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ml_transform_request) =
    let input = Json_serializers.delete_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteMLTransform"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ml_transform_response_of_yojson
      ~error_deserializer
end

module DeletePartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_partition_request) =
    let input = Json_serializers.delete_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeletePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_partition_request) =
    let input = Json_serializers.delete_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeletePartition" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_partition_response_of_yojson
      ~error_deserializer
end

module DeletePartitionIndex = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_partition_index_request) =
    let input = Json_serializers.delete_partition_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeletePartitionIndex" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_partition_index_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_partition_index_request) =
    let input = Json_serializers.delete_partition_index_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeletePartitionIndex"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_partition_index_response_of_yojson
      ~error_deserializer
end

module DeleteRegistry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_registry_input) =
    let input = Json_serializers.delete_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteRegistry" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_registry_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_registry_input) =
    let input = Json_serializers.delete_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteRegistry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_registry_response_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `ConditionCheckFailureException _ -> "com.amazonaws.glue#ConditionCheckFailureException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConditionCheckFailureException" ->
          `ConditionCheckFailureException
            (Json_deserializers.condition_check_failure_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_response_of_yojson
      ~error_deserializer
end

module DeleteSchema = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_schema_input) =
    let input = Json_serializers.delete_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteSchema" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_schema_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_schema_input) =
    let input = Json_serializers.delete_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_schema_response_of_yojson
      ~error_deserializer
end

module DeleteSchemaVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_schema_versions_input) =
    let input = Json_serializers.delete_schema_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteSchemaVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_schema_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_schema_versions_input) =
    let input = Json_serializers.delete_schema_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteSchemaVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_schema_versions_response_of_yojson
      ~error_deserializer
end

module DeleteSecurityConfiguration = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_security_configuration_request) =
    let input = Json_serializers.delete_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteSecurityConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_security_configuration_request) =
    let input = Json_serializers.delete_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteSecurityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_session_request) =
    let input = Json_serializers.delete_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_session_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_session_request) =
    let input = Json_serializers.delete_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_session_response_of_yojson
      ~error_deserializer
end

module DeleteTable = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_table_request) =
    let input = Json_serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_table_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_table_request) =
    let input = Json_serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_table_response_of_yojson
      ~error_deserializer
end

module DeleteTableOptimizer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_table_optimizer_request) =
    let input = Json_serializers.delete_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteTableOptimizer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_table_optimizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_table_optimizer_request) =
    let input = Json_serializers.delete_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteTableOptimizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_table_optimizer_response_of_yojson
      ~error_deserializer
end

module DeleteTableVersion = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_table_version_request) =
    let input = Json_serializers.delete_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteTableVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_table_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_table_version_request) =
    let input = Json_serializers.delete_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteTableVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_table_version_response_of_yojson
      ~error_deserializer
end

module DeleteTrigger = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_trigger_request) =
    let input = Json_serializers.delete_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : delete_trigger_request) =
    let input = Json_serializers.delete_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_trigger_response_of_yojson
      ~error_deserializer
end

module DeleteUsageProfile = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_usage_profile_request) =
    let input = Json_serializers.delete_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteUsageProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_usage_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_usage_profile_request) =
    let input = Json_serializers.delete_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteUsageProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_usage_profile_response_of_yojson
      ~error_deserializer
end

module DeleteUserDefinedFunction = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_defined_function_request) =
    let input = Json_serializers.delete_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteUserDefinedFunction" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_defined_function_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_user_defined_function_request) =
    let input = Json_serializers.delete_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DeleteUserDefinedFunction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_user_defined_function_response_of_yojson
      ~error_deserializer
end

module DeleteWorkflow = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DeleteWorkflow" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workflow_request) =
    let input = Json_serializers.delete_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DeleteWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_workflow_response_of_yojson
      ~error_deserializer
end

module DescribeConnectionType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_type_request) =
    let input = Json_serializers.describe_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DescribeConnectionType" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connection_type_request) =
    let input = Json_serializers.describe_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DescribeConnectionType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_type_response_of_yojson
      ~error_deserializer
end

module DescribeEntity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entity_request) =
    let input = Json_serializers.describe_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DescribeEntity" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_entity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_entity_request) =
    let input = Json_serializers.describe_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DescribeEntity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_entity_response_of_yojson
      ~error_deserializer
end

module DescribeInboundIntegrations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.glue#IntegrationNotFoundFault"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `TargetResourceNotFound _ -> "com.amazonaws.glue#TargetResourceNotFound"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IntegrationNotFoundFault" ->
          `IntegrationNotFoundFault
            (Json_deserializers.integration_not_found_fault_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "TargetResourceNotFound" ->
          `TargetResourceNotFound (Json_deserializers.target_resource_not_found_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inbound_integrations_request) =
    let input = Json_serializers.describe_inbound_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DescribeInboundIntegrations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_inbound_integrations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_inbound_integrations_request) =
    let input = Json_serializers.describe_inbound_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DescribeInboundIntegrations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_inbound_integrations_response_of_yojson
      ~error_deserializer
end

module DescribeIntegrations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.glue#IntegrationNotFoundFault"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IntegrationNotFoundFault" ->
          `IntegrationNotFoundFault
            (Json_deserializers.integration_not_found_fault_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_integrations_request) =
    let input = Json_serializers.describe_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DescribeIntegrations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_integrations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_integrations_request) =
    let input = Json_serializers.describe_integrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.DescribeIntegrations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_integrations_response_of_yojson
      ~error_deserializer
end

module DisassociateGlossaryTerms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_glossary_terms_request) =
    let input = Json_serializers.disassociate_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.DisassociateGlossaryTerms" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_glossary_terms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_glossary_terms_request) =
    let input = Json_serializers.disassociate_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.DisassociateGlossaryTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_glossary_terms_response_of_yojson
      ~error_deserializer
end

module GetAsset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_asset_input) =
    let input = Json_serializers.get_asset_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetAsset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_asset_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_asset_input) =
    let input = Json_serializers.get_asset_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetAsset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_asset_output_of_yojson
      ~error_deserializer
end

module GetAssetType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_asset_type_request) =
    let input = Json_serializers.get_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetAssetType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_asset_type_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_asset_type_request) =
    let input = Json_serializers.get_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetAssetType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_asset_type_response_of_yojson
      ~error_deserializer
end

module GetBlueprint = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_blueprint_request) =
    let input = Json_serializers.get_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetBlueprint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_blueprint_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_blueprint_request) =
    let input = Json_serializers.get_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetBlueprint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_blueprint_response_of_yojson
      ~error_deserializer
end

module GetBlueprintRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_blueprint_run_request) =
    let input = Json_serializers.get_blueprint_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetBlueprintRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_blueprint_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_blueprint_run_request) =
    let input = Json_serializers.get_blueprint_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetBlueprintRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_blueprint_run_response_of_yojson
      ~error_deserializer
end

module GetBlueprintRuns = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_blueprint_runs_request) =
    let input = Json_serializers.get_blueprint_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetBlueprintRuns" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_blueprint_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_blueprint_runs_request) =
    let input = Json_serializers.get_blueprint_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetBlueprintRuns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_blueprint_runs_response_of_yojson
      ~error_deserializer
end

module GetCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_catalog_request) =
    let input = Json_serializers.get_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_catalog_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_catalog_request) =
    let input = Json_serializers.get_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_catalog_response_of_yojson
      ~error_deserializer
end

module GetCatalogImportStatus = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_catalog_import_status_request) =
    let input = Json_serializers.get_catalog_import_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCatalogImportStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_catalog_import_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_catalog_import_status_request) =
    let input = Json_serializers.get_catalog_import_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCatalogImportStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_catalog_import_status_response_of_yojson
      ~error_deserializer
end

module GetCatalogs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_catalogs_request) =
    let input = Json_serializers.get_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCatalogs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_catalogs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_catalogs_request) =
    let input = Json_serializers.get_catalogs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCatalogs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_catalogs_response_of_yojson
      ~error_deserializer
end

module GetClassifier = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_classifier_request) =
    let input = Json_serializers.get_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetClassifier" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_classifier_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_classifier_request) =
    let input = Json_serializers.get_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetClassifier" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_classifier_response_of_yojson
      ~error_deserializer
end

module GetClassifiers = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_classifiers_request) =
    let input = Json_serializers.get_classifiers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetClassifiers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_classifiers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_classifiers_request) =
    let input = Json_serializers.get_classifiers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetClassifiers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_classifiers_response_of_yojson
      ~error_deserializer
end

module GetColumnStatisticsForPartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_column_statistics_for_partition_request) =
    let input = Json_serializers.get_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetColumnStatisticsForPartition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_for_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_column_statistics_for_partition_request) =
    let input = Json_serializers.get_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetColumnStatisticsForPartition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_for_partition_response_of_yojson
      ~error_deserializer
end

module GetColumnStatisticsForTable = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_column_statistics_for_table_request) =
    let input = Json_serializers.get_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetColumnStatisticsForTable" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_for_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_column_statistics_for_table_request) =
    let input = Json_serializers.get_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetColumnStatisticsForTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_for_table_response_of_yojson
      ~error_deserializer
end

module GetColumnStatisticsTaskRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_column_statistics_task_run_request) =
    let input = Json_serializers.get_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetColumnStatisticsTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_column_statistics_task_run_request) =
    let input = Json_serializers.get_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetColumnStatisticsTaskRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_run_response_of_yojson
      ~error_deserializer
end

module GetColumnStatisticsTaskRuns = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_column_statistics_task_runs_request) =
    let input = Json_serializers.get_column_statistics_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetColumnStatisticsTaskRuns" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_column_statistics_task_runs_request) =
    let input = Json_serializers.get_column_statistics_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetColumnStatisticsTaskRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_runs_response_of_yojson
      ~error_deserializer
end

module GetColumnStatisticsTaskSettings = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_column_statistics_task_settings_request) =
    let input = Json_serializers.get_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetColumnStatisticsTaskSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_column_statistics_task_settings_request) =
    let input = Json_serializers.get_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetColumnStatisticsTaskSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_column_statistics_task_settings_response_of_yojson
      ~error_deserializer
end

module GetConnection = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_connection_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_connection_request) =
    let input = Json_serializers.get_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_connection_response_of_yojson
      ~error_deserializer
end

module GetConnections = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_connections_request) =
    let input = Json_serializers.get_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetConnections" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_connections_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_connections_request) =
    let input = Json_serializers.get_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetConnections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_connections_response_of_yojson
      ~error_deserializer
end

module GetCrawler = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_crawler_request) =
    let input = Json_serializers.get_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_crawler_request) =
    let input = Json_serializers.get_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_crawler_response_of_yojson
      ~error_deserializer
end

module GetCrawlerMetrics = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_crawler_metrics_request) =
    let input = Json_serializers.get_crawler_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCrawlerMetrics" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_crawler_metrics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_crawler_metrics_request) =
    let input = Json_serializers.get_crawler_metrics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCrawlerMetrics"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_crawler_metrics_response_of_yojson
      ~error_deserializer
end

module GetCrawlers = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_crawlers_request) =
    let input = Json_serializers.get_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCrawlers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_crawlers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_crawlers_request) =
    let input = Json_serializers.get_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCrawlers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_crawlers_response_of_yojson
      ~error_deserializer
end

module GetCustomEntityType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_custom_entity_type_request) =
    let input = Json_serializers.get_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetCustomEntityType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_custom_entity_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_custom_entity_type_request) =
    let input = Json_serializers.get_custom_entity_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetCustomEntityType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_custom_entity_type_response_of_yojson
      ~error_deserializer
end

module GetDashboardUrl = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dashboard_url_request) =
    let input = Json_serializers.get_dashboard_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDashboardUrl" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_dashboard_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dashboard_url_request) =
    let input = Json_serializers.get_dashboard_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDashboardUrl" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_dashboard_url_response_of_yojson
      ~error_deserializer
end

module GetDatabase = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_database_request) =
    let input = Json_serializers.get_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDatabase" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_database_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_database_request) =
    let input = Json_serializers.get_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_database_response_of_yojson
      ~error_deserializer
end

module GetDatabases = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_databases_request) =
    let input = Json_serializers.get_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDatabases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_databases_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_databases_request) =
    let input = Json_serializers.get_databases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDatabases" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_databases_response_of_yojson
      ~error_deserializer
end

module GetDataCatalogEncryptionSettings = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_catalog_encryption_settings_request) =
    let input = Json_serializers.get_data_catalog_encryption_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataCatalogEncryptionSettings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_catalog_encryption_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_catalog_encryption_settings_request) =
    let input = Json_serializers.get_data_catalog_encryption_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetDataCatalogEncryptionSettings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_catalog_encryption_settings_response_of_yojson
      ~error_deserializer
end

module GetDataflowGraph = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dataflow_graph_request) =
    let input = Json_serializers.get_dataflow_graph_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataflowGraph" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_dataflow_graph_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dataflow_graph_request) =
    let input = Json_serializers.get_dataflow_graph_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDataflowGraph"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_dataflow_graph_response_of_yojson
      ~error_deserializer
end

module GetDataQualityModel = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_model_request) =
    let input = Json_serializers.get_data_quality_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityModel" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_data_quality_model_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_model_request) =
    let input = Json_serializers.get_data_quality_model_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDataQualityModel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_model_response_of_yojson
      ~error_deserializer
end

module GetDataQualityModelResult = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_model_result_request) =
    let input = Json_serializers.get_data_quality_model_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityModelResult" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_model_result_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_model_result_request) =
    let input = Json_serializers.get_data_quality_model_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetDataQualityModelResult" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_model_result_response_of_yojson
      ~error_deserializer
end

module GetDataQualityResult = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_result_request) =
    let input = Json_serializers.get_data_quality_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityResult" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_data_quality_result_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_result_request) =
    let input = Json_serializers.get_data_quality_result_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDataQualityResult"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_result_response_of_yojson
      ~error_deserializer
end

module GetDataQualityRuleRecommendationRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_rule_recommendation_run_request) =
    let input =
      Json_serializers.get_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityRuleRecommendationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_rule_recommendation_run_request) =
    let input =
      Json_serializers.get_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetDataQualityRuleRecommendationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer
end

module GetDataQualityRuleset = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_ruleset_request) =
    let input = Json_serializers.get_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityRuleset" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_ruleset_request) =
    let input = Json_serializers.get_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDataQualityRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_data_quality_ruleset_response_of_yojson
      ~error_deserializer
end

module GetDataQualityRulesetEvaluationRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.get_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDataQualityRulesetEvaluationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.get_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetDataQualityRulesetEvaluationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer
end

module GetDevEndpoint = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dev_endpoint_request) =
    let input = Json_serializers.get_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDevEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_dev_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dev_endpoint_request) =
    let input = Json_serializers.get_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDevEndpoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_dev_endpoint_response_of_yojson
      ~error_deserializer
end

module GetDevEndpoints = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_dev_endpoints_request) =
    let input = Json_serializers.get_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetDevEndpoints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_dev_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_dev_endpoints_request) =
    let input = Json_serializers.get_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetDevEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_dev_endpoints_response_of_yojson
      ~error_deserializer
end

module GetEntityRecords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_entity_records_request) =
    let input = Json_serializers.get_entity_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetEntityRecords" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_entity_records_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_entity_records_request) =
    let input = Json_serializers.get_entity_records_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetEntityRecords"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entity_records_response_of_yojson
      ~error_deserializer
end

module GetFormType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_form_type_request) =
    let input = Json_serializers.get_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetFormType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_form_type_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_form_type_request) =
    let input = Json_serializers.get_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetFormType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_form_type_response_of_yojson
      ~error_deserializer
end

module GetGlossary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_glossary_request) =
    let input = Json_serializers.get_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetGlossary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_glossary_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_glossary_request) =
    let input = Json_serializers.get_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetGlossary" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_glossary_response_of_yojson
      ~error_deserializer
end

module GetGlossaryTerm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_glossary_term_request) =
    let input = Json_serializers.get_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetGlossaryTerm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_glossary_term_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_glossary_term_request) =
    let input = Json_serializers.get_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetGlossaryTerm" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_glossary_term_response_of_yojson
      ~error_deserializer
end

module GetGlueIdentityCenterConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_glue_identity_center_configuration_request) =
    let input = Json_serializers.get_glue_identity_center_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetGlueIdentityCenterConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_glue_identity_center_configuration_request) =
    let input = Json_serializers.get_glue_identity_center_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetGlueIdentityCenterConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer
end

module GetIntegrationResourceProperty = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_integration_resource_property_request) =
    let input = Json_serializers.get_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetIntegrationResourceProperty"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_integration_resource_property_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_integration_resource_property_request) =
    let input = Json_serializers.get_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetIntegrationResourceProperty" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_integration_resource_property_response_of_yojson
      ~error_deserializer
end

module GetIntegrationTableProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_integration_table_properties_request) =
    let input = Json_serializers.get_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetIntegrationTableProperties" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_integration_table_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_integration_table_properties_request) =
    let input = Json_serializers.get_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetIntegrationTableProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_integration_table_properties_response_of_yojson
      ~error_deserializer
end

module GetJob = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_request) =
    let input = Json_serializers.get_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_job_request) =
    let input = Json_serializers.get_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_job_response_of_yojson ~error_deserializer
end

module GetJobBookmark = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_bookmark_request) =
    let input = Json_serializers.get_job_bookmark_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetJobBookmark" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_job_bookmark_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_job_bookmark_request) =
    let input = Json_serializers.get_job_bookmark_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetJobBookmark" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_job_bookmark_response_of_yojson
      ~error_deserializer
end

module GetJobRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_run_request) =
    let input = Json_serializers.get_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetJobRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_job_run_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_job_run_request) =
    let input = Json_serializers.get_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetJobRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_job_run_response_of_yojson
      ~error_deserializer
end

module GetJobRuns = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_runs_request) =
    let input = Json_serializers.get_job_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetJobRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_job_runs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_job_runs_request) =
    let input = Json_serializers.get_job_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetJobRuns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_job_runs_response_of_yojson
      ~error_deserializer
end

module GetJobs = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_jobs_request) =
    let input = Json_serializers.get_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_jobs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_jobs_request) =
    let input = Json_serializers.get_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetJobs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_jobs_response_of_yojson
      ~error_deserializer
end

module GetMapping = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mapping_request) =
    let input = Json_serializers.get_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMapping" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_mapping_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_mapping_request) =
    let input = Json_serializers.get_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetMapping" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_mapping_response_of_yojson
      ~error_deserializer
end

module GetMaterializedViewRefreshTaskRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_materialized_view_refresh_task_run_request) =
    let input = Json_serializers.get_materialized_view_refresh_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMaterializedViewRefreshTaskRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_materialized_view_refresh_task_run_request) =
    let input = Json_serializers.get_materialized_view_refresh_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetMaterializedViewRefreshTaskRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer
end

module GetMLTaskRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ml_task_run_request) =
    let input = Json_serializers.get_ml_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMLTaskRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ml_task_run_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_ml_task_run_request) =
    let input = Json_serializers.get_ml_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetMLTaskRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ml_task_run_response_of_yojson
      ~error_deserializer
end

module GetMLTaskRuns = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ml_task_runs_request) =
    let input = Json_serializers.get_ml_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMLTaskRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ml_task_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ml_task_runs_request) =
    let input = Json_serializers.get_ml_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetMLTaskRuns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ml_task_runs_response_of_yojson
      ~error_deserializer
end

module GetMLTransform = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ml_transform_request) =
    let input = Json_serializers.get_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMLTransform" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ml_transform_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ml_transform_request) =
    let input = Json_serializers.get_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetMLTransform" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ml_transform_response_of_yojson
      ~error_deserializer
end

module GetMLTransforms = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ml_transforms_request) =
    let input = Json_serializers.get_ml_transforms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetMLTransforms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ml_transforms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ml_transforms_request) =
    let input = Json_serializers.get_ml_transforms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetMLTransforms" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ml_transforms_response_of_yojson
      ~error_deserializer
end

module GetPartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_partition_request) =
    let input = Json_serializers.get_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetPartition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_partition_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_partition_request) =
    let input = Json_serializers.get_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetPartition" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_partition_response_of_yojson
      ~error_deserializer
end

module GetPartitionIndexes = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_partition_indexes_request) =
    let input = Json_serializers.get_partition_indexes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetPartitionIndexes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_partition_indexes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_partition_indexes_request) =
    let input = Json_serializers.get_partition_indexes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetPartitionIndexes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_partition_indexes_response_of_yojson
      ~error_deserializer
end

module GetPartitions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `InvalidStateException _ -> "com.amazonaws.glue#InvalidStateException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_partitions_request) =
    let input = Json_serializers.get_partitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetPartitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_partitions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_partitions_request) =
    let input = Json_serializers.get_partitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetPartitions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_partitions_response_of_yojson
      ~error_deserializer
end

module GetPlan = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_plan_request) =
    let input = Json_serializers.get_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_plan_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_plan_request) =
    let input = Json_serializers.get_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetPlan" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_plan_response_of_yojson
      ~error_deserializer
end

module GetRegistry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_registry_input) =
    let input = Json_serializers.get_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetRegistry" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_registry_input) =
    let input = Json_serializers.get_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetRegistry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_registry_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicies = struct
  let error_to_string = function
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policies_request) =
    let input = Json_serializers.get_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetResourcePolicies" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_resource_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policies_request) =
    let input = Json_serializers.get_resource_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetResourcePolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policies_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module GetSchema = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_schema_input) =
    let input = Json_serializers.get_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSchema" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_schema_input) =
    let input = Json_serializers.get_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_schema_response_of_yojson
      ~error_deserializer
end

module GetSchemaByDefinition = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_schema_by_definition_input) =
    let input = Json_serializers.get_schema_by_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSchemaByDefinition" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_by_definition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_schema_by_definition_input) =
    let input = Json_serializers.get_schema_by_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSchemaByDefinition"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_by_definition_response_of_yojson
      ~error_deserializer
end

module GetSchemaVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_schema_version_input) =
    let input = Json_serializers.get_schema_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSchemaVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_schema_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_schema_version_input) =
    let input = Json_serializers.get_schema_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSchemaVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_version_response_of_yojson
      ~error_deserializer
end

module GetSchemaVersionsDiff = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_schema_versions_diff_input) =
    let input = Json_serializers.get_schema_versions_diff_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSchemaVersionsDiff" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_versions_diff_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_schema_versions_diff_input) =
    let input = Json_serializers.get_schema_versions_diff_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSchemaVersionsDiff"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_schema_versions_diff_response_of_yojson
      ~error_deserializer
end

module GetSecurityConfiguration = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_security_configuration_request) =
    let input = Json_serializers.get_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSecurityConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_security_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_security_configuration_request) =
    let input = Json_serializers.get_security_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSecurityConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_security_configuration_response_of_yojson
      ~error_deserializer
end

module GetSecurityConfigurations = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_security_configurations_request) =
    let input = Json_serializers.get_security_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSecurityConfigurations" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_security_configurations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_security_configurations_request) =
    let input = Json_serializers.get_security_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetSecurityConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_security_configurations_response_of_yojson
      ~error_deserializer
end

module GetSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_request) =
    let input = Json_serializers.get_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_session_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_session_request) =
    let input = Json_serializers.get_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_session_response_of_yojson
      ~error_deserializer
end

module GetSessionEndpoint = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_session_endpoint_request) =
    let input = Json_serializers.get_session_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetSessionEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_session_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_session_endpoint_request) =
    let input = Json_serializers.get_session_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetSessionEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_session_endpoint_response_of_yojson
      ~error_deserializer
end

module GetStatement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_statement_request) =
    let input = Json_serializers.get_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_statement_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_statement_request) =
    let input = Json_serializers.get_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetStatement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_statement_response_of_yojson
      ~error_deserializer
end

module GetTable = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_request) =
    let input = Json_serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_table_request) =
    let input = Json_serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_table_response_of_yojson
      ~error_deserializer
end

module GetTableOptimizer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_optimizer_request) =
    let input = Json_serializers.get_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTableOptimizer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_table_optimizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_table_optimizer_request) =
    let input = Json_serializers.get_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTableOptimizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_optimizer_response_of_yojson
      ~error_deserializer
end

module GetTables = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tables_request) =
    let input = Json_serializers.get_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_tables_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_tables_request) =
    let input = Json_serializers.get_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTables" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_tables_response_of_yojson
      ~error_deserializer
end

module GetTableVersion = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_version_request) =
    let input = Json_serializers.get_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTableVersion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_table_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_table_version_request) =
    let input = Json_serializers.get_table_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTableVersion" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_table_version_response_of_yojson
      ~error_deserializer
end

module GetTableVersions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_versions_request) =
    let input = Json_serializers.get_table_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTableVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_table_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_table_versions_request) =
    let input = Json_serializers.get_table_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTableVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_versions_response_of_yojson
      ~error_deserializer
end

module GetTags = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_tags_request) =
    let input = Json_serializers.get_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_tags_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_tags_request) =
    let input = Json_serializers.get_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_tags_response_of_yojson
      ~error_deserializer
end

module GetTrigger = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_trigger_request) =
    let input = Json_serializers.get_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_trigger_request) =
    let input = Json_serializers.get_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_trigger_response_of_yojson
      ~error_deserializer
end

module GetTriggers = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_triggers_request) =
    let input = Json_serializers.get_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetTriggers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_triggers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_triggers_request) =
    let input = Json_serializers.get_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetTriggers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_triggers_response_of_yojson
      ~error_deserializer
end

module GetUnfilteredPartitionMetadata = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `PermissionTypeMismatchException _ -> "com.amazonaws.glue#PermissionTypeMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "PermissionTypeMismatchException" ->
          `PermissionTypeMismatchException
            (Json_deserializers.permission_type_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_unfiltered_partition_metadata_request) =
    let input = Json_serializers.get_unfiltered_partition_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUnfilteredPartitionMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_partition_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_unfiltered_partition_metadata_request) =
    let input = Json_serializers.get_unfiltered_partition_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetUnfilteredPartitionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_partition_metadata_response_of_yojson
      ~error_deserializer
end

module GetUnfilteredPartitionsMetadata = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `PermissionTypeMismatchException _ -> "com.amazonaws.glue#PermissionTypeMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "PermissionTypeMismatchException" ->
          `PermissionTypeMismatchException
            (Json_deserializers.permission_type_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_unfiltered_partitions_metadata_request) =
    let input = Json_serializers.get_unfiltered_partitions_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUnfilteredPartitionsMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_partitions_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_unfiltered_partitions_metadata_request) =
    let input = Json_serializers.get_unfiltered_partitions_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetUnfilteredPartitionsMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_partitions_metadata_response_of_yojson
      ~error_deserializer
end

module GetUnfilteredTableMetadata = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `PermissionTypeMismatchException _ -> "com.amazonaws.glue#PermissionTypeMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "PermissionTypeMismatchException" ->
          `PermissionTypeMismatchException
            (Json_deserializers.permission_type_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_unfiltered_table_metadata_request) =
    let input = Json_serializers.get_unfiltered_table_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUnfilteredTableMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_table_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_unfiltered_table_metadata_request) =
    let input = Json_serializers.get_unfiltered_table_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.GetUnfilteredTableMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_unfiltered_table_metadata_response_of_yojson
      ~error_deserializer
end

module GetUsageProfile = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_usage_profile_request) =
    let input = Json_serializers.get_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUsageProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_usage_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_usage_profile_request) =
    let input = Json_serializers.get_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetUsageProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_usage_profile_response_of_yojson
      ~error_deserializer
end

module GetUserDefinedFunction = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_defined_function_request) =
    let input = Json_serializers.get_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUserDefinedFunction" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_user_defined_function_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_defined_function_request) =
    let input = Json_serializers.get_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetUserDefinedFunction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_defined_function_response_of_yojson
      ~error_deserializer
end

module GetUserDefinedFunctions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_user_defined_functions_request) =
    let input = Json_serializers.get_user_defined_functions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetUserDefinedFunctions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_user_defined_functions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_user_defined_functions_request) =
    let input = Json_serializers.get_user_defined_functions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetUserDefinedFunctions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_user_defined_functions_response_of_yojson
      ~error_deserializer
end

module GetWorkflow = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workflow_request) =
    let input = Json_serializers.get_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetWorkflow" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workflow_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_workflow_request) =
    let input = Json_serializers.get_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workflow_response_of_yojson
      ~error_deserializer
end

module GetWorkflowRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workflow_run_request) =
    let input = Json_serializers.get_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetWorkflowRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workflow_run_request) =
    let input = Json_serializers.get_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetWorkflowRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workflow_run_response_of_yojson
      ~error_deserializer
end

module GetWorkflowRunProperties = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workflow_run_properties_request) =
    let input = Json_serializers.get_workflow_run_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetWorkflowRunProperties" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_workflow_run_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workflow_run_properties_request) =
    let input = Json_serializers.get_workflow_run_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetWorkflowRunProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_workflow_run_properties_response_of_yojson
      ~error_deserializer
end

module GetWorkflowRuns = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_workflow_runs_request) =
    let input = Json_serializers.get_workflow_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.GetWorkflowRuns" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_workflow_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_workflow_runs_request) =
    let input = Json_serializers.get_workflow_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.GetWorkflowRuns" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_workflow_runs_response_of_yojson
      ~error_deserializer
end

module ImportCatalogToGlue = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_catalog_to_glue_request) =
    let input = Json_serializers.import_catalog_to_glue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ImportCatalogToGlue" ~service ~context
      ~input ~output_deserializer:Json_deserializers.import_catalog_to_glue_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_catalog_to_glue_request) =
    let input = Json_serializers.import_catalog_to_glue_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ImportCatalogToGlue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_catalog_to_glue_response_of_yojson
      ~error_deserializer
end

module ListAssetTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_asset_types_request) =
    let input = Json_serializers.list_asset_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListAssetTypes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_asset_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_asset_types_request) =
    let input = Json_serializers.list_asset_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListAssetTypes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_asset_types_response_of_yojson
      ~error_deserializer
end

module ListBlueprints = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_blueprints_request) =
    let input = Json_serializers.list_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListBlueprints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_blueprints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_blueprints_request) =
    let input = Json_serializers.list_blueprints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListBlueprints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_blueprints_response_of_yojson
      ~error_deserializer
end

module ListColumnStatisticsTaskRuns = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_column_statistics_task_runs_request) =
    let input = Json_serializers.list_column_statistics_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListColumnStatisticsTaskRuns" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_column_statistics_task_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_column_statistics_task_runs_request) =
    let input = Json_serializers.list_column_statistics_task_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListColumnStatisticsTaskRuns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_column_statistics_task_runs_response_of_yojson
      ~error_deserializer
end

module ListConnectionTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connection_types_request) =
    let input = Json_serializers.list_connection_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListConnectionTypes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_connection_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_connection_types_request) =
    let input = Json_serializers.list_connection_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListConnectionTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_connection_types_response_of_yojson
      ~error_deserializer
end

module ListCrawlers = struct
  let error_to_string = function
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_crawlers_request) =
    let input = Json_serializers.list_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListCrawlers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_crawlers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_crawlers_request) =
    let input = Json_serializers.list_crawlers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListCrawlers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_crawlers_response_of_yojson
      ~error_deserializer
end

module ListCrawls = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_crawls_request) =
    let input = Json_serializers.list_crawls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListCrawls" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_crawls_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_crawls_request) =
    let input = Json_serializers.list_crawls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListCrawls" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_crawls_response_of_yojson
      ~error_deserializer
end

module ListCustomEntityTypes = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_entity_types_request) =
    let input = Json_serializers.list_custom_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListCustomEntityTypes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_entity_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_entity_types_request) =
    let input = Json_serializers.list_custom_entity_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListCustomEntityTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_entity_types_response_of_yojson
      ~error_deserializer
end

module ListDataQualityResults = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_results_request) =
    let input = Json_serializers.list_data_quality_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityResults" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_results_request) =
    let input = Json_serializers.list_data_quality_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListDataQualityResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_results_response_of_yojson
      ~error_deserializer
end

module ListDataQualityRuleRecommendationRuns = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_rule_recommendation_runs_request) =
    let input =
      Json_serializers.list_data_quality_rule_recommendation_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityRuleRecommendationRuns"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_rule_recommendation_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_rule_recommendation_runs_request) =
    let input =
      Json_serializers.list_data_quality_rule_recommendation_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListDataQualityRuleRecommendationRuns" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_rule_recommendation_runs_response_of_yojson
      ~error_deserializer
end

module ListDataQualityRulesetEvaluationRuns = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_ruleset_evaluation_runs_request) =
    let input =
      Json_serializers.list_data_quality_ruleset_evaluation_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityRulesetEvaluationRuns"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_ruleset_evaluation_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_ruleset_evaluation_runs_request) =
    let input =
      Json_serializers.list_data_quality_ruleset_evaluation_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListDataQualityRulesetEvaluationRuns" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_ruleset_evaluation_runs_response_of_yojson
      ~error_deserializer
end

module ListDataQualityRulesets = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_rulesets_request) =
    let input = Json_serializers.list_data_quality_rulesets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityRulesets" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_rulesets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_rulesets_request) =
    let input = Json_serializers.list_data_quality_rulesets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListDataQualityRulesets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_rulesets_response_of_yojson
      ~error_deserializer
end

module ListDataQualityStatisticAnnotations = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_statistic_annotations_request) =
    let input =
      Json_serializers.list_data_quality_statistic_annotations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityStatisticAnnotations"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_statistic_annotations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_statistic_annotations_request) =
    let input =
      Json_serializers.list_data_quality_statistic_annotations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListDataQualityStatisticAnnotations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_data_quality_statistic_annotations_response_of_yojson
      ~error_deserializer
end

module ListDataQualityStatistics = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_data_quality_statistics_request) =
    let input = Json_serializers.list_data_quality_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDataQualityStatistics" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_statistics_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_data_quality_statistics_request) =
    let input = Json_serializers.list_data_quality_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListDataQualityStatistics" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_data_quality_statistics_response_of_yojson
      ~error_deserializer
end

module ListDevEndpoints = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_dev_endpoints_request) =
    let input = Json_serializers.list_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListDevEndpoints" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_dev_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_dev_endpoints_request) =
    let input = Json_serializers.list_dev_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListDevEndpoints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_dev_endpoints_response_of_yojson
      ~error_deserializer
end

module ListEntities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_entities_request) =
    let input = Json_serializers.list_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListEntities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_entities_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_entities_request) =
    let input = Json_serializers.list_entities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListEntities" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_entities_response_of_yojson
      ~error_deserializer
end

module ListFormTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_form_types_request) =
    let input = Json_serializers.list_form_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListFormTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_form_types_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_form_types_request) =
    let input = Json_serializers.list_form_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListFormTypes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_form_types_response_of_yojson
      ~error_deserializer
end

module ListGlossaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_glossaries_request) =
    let input = Json_serializers.list_glossaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListGlossaries" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_glossaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_glossaries_request) =
    let input = Json_serializers.list_glossaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListGlossaries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_glossaries_response_of_yojson
      ~error_deserializer
end

module ListGlossaryTerms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_glossary_terms_request) =
    let input = Json_serializers.list_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListGlossaryTerms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_glossary_terms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_glossary_terms_request) =
    let input = Json_serializers.list_glossary_terms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListGlossaryTerms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_glossary_terms_response_of_yojson
      ~error_deserializer
end

module ListIntegrationResourceProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_integration_resource_properties_request) =
    let input = Json_serializers.list_integration_resource_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListIntegrationResourceProperties"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_integration_resource_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_integration_resource_properties_request) =
    let input = Json_serializers.list_integration_resource_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListIntegrationResourceProperties" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_integration_resource_properties_response_of_yojson
      ~error_deserializer
end

module ListIterableForms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_iterable_forms_request) =
    let input = Json_serializers.list_iterable_forms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListIterableForms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_iterable_forms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_iterable_forms_request) =
    let input = Json_serializers.list_iterable_forms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListIterableForms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_iterable_forms_response_of_yojson
      ~error_deserializer
end

module ListJobs = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_jobs_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_jobs_request) =
    let input = Json_serializers.list_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListJobs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_jobs_response_of_yojson
      ~error_deserializer
end

module ListMaterializedViewRefreshTaskRuns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_materialized_view_refresh_task_runs_request) =
    let input =
      Json_serializers.list_materialized_view_refresh_task_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListMaterializedViewRefreshTaskRuns"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_materialized_view_refresh_task_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_materialized_view_refresh_task_runs_request) =
    let input =
      Json_serializers.list_materialized_view_refresh_task_runs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.ListMaterializedViewRefreshTaskRuns" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_materialized_view_refresh_task_runs_response_of_yojson
      ~error_deserializer
end

module ListMLTransforms = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ml_transforms_request) =
    let input = Json_serializers.list_ml_transforms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListMLTransforms" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_ml_transforms_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ml_transforms_request) =
    let input = Json_serializers.list_ml_transforms_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListMLTransforms"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ml_transforms_response_of_yojson
      ~error_deserializer
end

module ListRegistries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_registries_input) =
    let input = Json_serializers.list_registries_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListRegistries" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_registries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_registries_input) =
    let input = Json_serializers.list_registries_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListRegistries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_registries_response_of_yojson
      ~error_deserializer
end

module ListSchemas = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_schemas_input) =
    let input = Json_serializers.list_schemas_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListSchemas" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_schemas_input) =
    let input = Json_serializers.list_schemas_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListSchemas" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_schemas_response_of_yojson
      ~error_deserializer
end

module ListSchemaVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_schema_versions_input) =
    let input = Json_serializers.list_schema_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListSchemaVersions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_schema_versions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_schema_versions_input) =
    let input = Json_serializers.list_schema_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListSchemaVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_schema_versions_response_of_yojson
      ~error_deserializer
end

module ListSessions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_sessions_request) =
    let input = Json_serializers.list_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_sessions_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_sessions_request) =
    let input = Json_serializers.list_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListSessions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_sessions_response_of_yojson
      ~error_deserializer
end

module ListStatements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_statements_request) =
    let input = Json_serializers.list_statements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListStatements" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_statements_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_statements_request) =
    let input = Json_serializers.list_statements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListStatements" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_statements_response_of_yojson
      ~error_deserializer
end

module ListTableOptimizerRuns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_table_optimizer_runs_request) =
    let input = Json_serializers.list_table_optimizer_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListTableOptimizerRuns" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_table_optimizer_runs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_table_optimizer_runs_request) =
    let input = Json_serializers.list_table_optimizer_runs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListTableOptimizerRuns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_table_optimizer_runs_response_of_yojson
      ~error_deserializer
end

module ListTriggers = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_triggers_request) =
    let input = Json_serializers.list_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListTriggers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_triggers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_triggers_request) =
    let input = Json_serializers.list_triggers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListTriggers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_triggers_response_of_yojson
      ~error_deserializer
end

module ListUsageProfiles = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_usage_profiles_request) =
    let input = Json_serializers.list_usage_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListUsageProfiles" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_usage_profiles_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_usage_profiles_request) =
    let input = Json_serializers.list_usage_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListUsageProfiles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_usage_profiles_response_of_yojson
      ~error_deserializer
end

module ListWorkflows = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ListWorkflows" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_workflows_request) =
    let input = Json_serializers.list_workflows_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ListWorkflows" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_workflows_response_of_yojson
      ~error_deserializer
end

module ModifyIntegration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IntegrationConflictOperationFault _ -> "com.amazonaws.glue#IntegrationConflictOperationFault"
    | `IntegrationNotFoundFault _ -> "com.amazonaws.glue#IntegrationNotFoundFault"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `InvalidIntegrationStateFault _ -> "com.amazonaws.glue#InvalidIntegrationStateFault"
    | `InvalidStateException _ -> "com.amazonaws.glue#InvalidStateException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IntegrationConflictOperationFault" ->
          `IntegrationConflictOperationFault
            (Json_deserializers.integration_conflict_operation_fault_of_yojson tree path)
      | _, "IntegrationNotFoundFault" ->
          `IntegrationNotFoundFault
            (Json_deserializers.integration_not_found_fault_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidIntegrationStateFault" ->
          `InvalidIntegrationStateFault
            (Json_deserializers.invalid_integration_state_fault_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_integration_request) =
    let input = Json_serializers.modify_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ModifyIntegration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.modify_integration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_integration_request) =
    let input = Json_serializers.modify_integration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ModifyIntegration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_integration_response_of_yojson
      ~error_deserializer
end

module PutAsset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_asset_request) =
    let input = Json_serializers.put_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutAsset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_asset_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_asset_request) =
    let input = Json_serializers.put_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutAsset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_asset_response_of_yojson
      ~error_deserializer
end

module PutAssetType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_asset_type_request) =
    let input = Json_serializers.put_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutAssetType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_asset_type_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_asset_type_request) =
    let input = Json_serializers.put_asset_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutAssetType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_asset_type_response_of_yojson
      ~error_deserializer
end

module PutAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_attachment_request) =
    let input = Json_serializers.put_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_attachment_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_attachment_request) =
    let input = Json_serializers.put_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutAttachment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_attachment_response_of_yojson
      ~error_deserializer
end

module PutDataCatalogEncryptionSettings = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_data_catalog_encryption_settings_request) =
    let input = Json_serializers.put_data_catalog_encryption_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutDataCatalogEncryptionSettings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_data_catalog_encryption_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_data_catalog_encryption_settings_request) =
    let input = Json_serializers.put_data_catalog_encryption_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.PutDataCatalogEncryptionSettings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_data_catalog_encryption_settings_response_of_yojson
      ~error_deserializer
end

module PutDataQualityProfileAnnotation = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_data_quality_profile_annotation_request) =
    let input = Json_serializers.put_data_quality_profile_annotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutDataQualityProfileAnnotation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_data_quality_profile_annotation_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_data_quality_profile_annotation_request) =
    let input = Json_serializers.put_data_quality_profile_annotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.PutDataQualityProfileAnnotation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_data_quality_profile_annotation_response_of_yojson
      ~error_deserializer
end

module PutFormType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_form_type_request) =
    let input = Json_serializers.put_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutFormType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_form_type_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : put_form_type_request) =
    let input = Json_serializers.put_form_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutFormType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_form_type_response_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `ConditionCheckFailureException _ -> "com.amazonaws.glue#ConditionCheckFailureException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConditionCheckFailureException" ->
          `ConditionCheckFailureException
            (Json_deserializers.condition_check_failure_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module PutSchemaVersionMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_schema_version_metadata_input) =
    let input = Json_serializers.put_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutSchemaVersionMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_schema_version_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_schema_version_metadata_input) =
    let input = Json_serializers.put_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutSchemaVersionMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_schema_version_metadata_response_of_yojson
      ~error_deserializer
end

module PutWorkflowRunProperties = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_workflow_run_properties_request) =
    let input = Json_serializers.put_workflow_run_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.PutWorkflowRunProperties" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_workflow_run_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_workflow_run_properties_request) =
    let input = Json_serializers.put_workflow_run_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.PutWorkflowRunProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_workflow_run_properties_response_of_yojson
      ~error_deserializer
end

module QuerySchemaVersionMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : query_schema_version_metadata_input) =
    let input = Json_serializers.query_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.QuerySchemaVersionMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.query_schema_version_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : query_schema_version_metadata_input) =
    let input = Json_serializers.query_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.QuerySchemaVersionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.query_schema_version_metadata_response_of_yojson
      ~error_deserializer
end

module RegisterConnectionType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_connection_type_request) =
    let input = Json_serializers.register_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.RegisterConnectionType" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_connection_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_connection_type_request) =
    let input = Json_serializers.register_connection_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.RegisterConnectionType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_connection_type_response_of_yojson
      ~error_deserializer
end

module RegisterSchemaVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_schema_version_input) =
    let input = Json_serializers.register_schema_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.RegisterSchemaVersion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_schema_version_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_schema_version_input) =
    let input = Json_serializers.register_schema_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.RegisterSchemaVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_schema_version_response_of_yojson
      ~error_deserializer
end

module RemoveSchemaVersionMetadata = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_schema_version_metadata_input) =
    let input = Json_serializers.remove_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.RemoveSchemaVersionMetadata" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.remove_schema_version_metadata_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_schema_version_metadata_input) =
    let input = Json_serializers.remove_schema_version_metadata_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.RemoveSchemaVersionMetadata" ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_schema_version_metadata_response_of_yojson
      ~error_deserializer
end

module ResetJobBookmark = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_job_bookmark_request) =
    let input = Json_serializers.reset_job_bookmark_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ResetJobBookmark" ~service ~context
      ~input ~output_deserializer:Json_deserializers.reset_job_bookmark_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reset_job_bookmark_request) =
    let input = Json_serializers.reset_job_bookmark_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ResetJobBookmark"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reset_job_bookmark_response_of_yojson
      ~error_deserializer
end

module ResumeWorkflowRun = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalWorkflowStateException _ -> "com.amazonaws.glue#IllegalWorkflowStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalWorkflowStateException" ->
          `IllegalWorkflowStateException
            (Json_deserializers.illegal_workflow_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resume_workflow_run_request) =
    let input = Json_serializers.resume_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.ResumeWorkflowRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.resume_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resume_workflow_run_request) =
    let input = Json_serializers.resume_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.ResumeWorkflowRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.resume_workflow_run_response_of_yojson
      ~error_deserializer
end

module RunStatement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | `SessionBusyException _ -> "com.amazonaws.glue#SessionBusyException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _, "SessionBusyException" ->
          `SessionBusyException (Json_deserializers.session_busy_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : run_statement_request) =
    let input = Json_serializers.run_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.RunStatement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.run_statement_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : run_statement_request) =
    let input = Json_serializers.run_statement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.RunStatement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.run_statement_response_of_yojson
      ~error_deserializer
end

module SearchAssets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_assets_input) =
    let input = Json_serializers.search_assets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.SearchAssets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_assets_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_assets_input) =
    let input = Json_serializers.search_assets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.SearchAssets" ~service
      ~context ~input ~output_deserializer:Json_deserializers.search_assets_output_of_yojson
      ~error_deserializer
end

module SearchTables = struct
  let error_to_string = function
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : search_tables_request) =
    let input = Json_serializers.search_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.SearchTables" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_tables_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_tables_request) =
    let input = Json_serializers.search_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.SearchTables" ~service
      ~context ~input ~output_deserializer:Json_deserializers.search_tables_response_of_yojson
      ~error_deserializer
end

module StartBlueprintRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalBlueprintStateException _ -> "com.amazonaws.glue#IllegalBlueprintStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalBlueprintStateException" ->
          `IllegalBlueprintStateException
            (Json_deserializers.illegal_blueprint_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_blueprint_run_request) =
    let input = Json_serializers.start_blueprint_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartBlueprintRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_blueprint_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_blueprint_run_request) =
    let input = Json_serializers.start_blueprint_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartBlueprintRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_blueprint_run_response_of_yojson
      ~error_deserializer
end

module StartColumnStatisticsTaskRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ColumnStatisticsTaskRunningException _ ->
        "com.amazonaws.glue#ColumnStatisticsTaskRunningException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ColumnStatisticsTaskRunningException" ->
          `ColumnStatisticsTaskRunningException
            (Json_deserializers.column_statistics_task_running_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_column_statistics_task_run_request) =
    let input = Json_serializers.start_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartColumnStatisticsTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_column_statistics_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_column_statistics_task_run_request) =
    let input = Json_serializers.start_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartColumnStatisticsTaskRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_column_statistics_task_run_response_of_yojson
      ~error_deserializer
end

module StartColumnStatisticsTaskRunSchedule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_column_statistics_task_run_schedule_request) =
    let input =
      Json_serializers.start_column_statistics_task_run_schedule_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartColumnStatisticsTaskRunSchedule"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_column_statistics_task_run_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_column_statistics_task_run_schedule_request) =
    let input =
      Json_serializers.start_column_statistics_task_run_schedule_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartColumnStatisticsTaskRunSchedule" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_column_statistics_task_run_schedule_response_of_yojson
      ~error_deserializer
end

module StartCrawler = struct
  let error_to_string = function
    | `CrawlerRunningException _ -> "com.amazonaws.glue#CrawlerRunningException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CrawlerRunningException" ->
          `CrawlerRunningException
            (Json_deserializers.crawler_running_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_crawler_request) =
    let input = Json_serializers.start_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : start_crawler_request) =
    let input = Json_serializers.start_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_crawler_response_of_yojson
      ~error_deserializer
end

module StartCrawlerSchedule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `NoScheduleException _ -> "com.amazonaws.glue#NoScheduleException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `SchedulerRunningException _ -> "com.amazonaws.glue#SchedulerRunningException"
    | `SchedulerTransitioningException _ -> "com.amazonaws.glue#SchedulerTransitioningException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "NoScheduleException" ->
          `NoScheduleException (Json_deserializers.no_schedule_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "SchedulerRunningException" ->
          `SchedulerRunningException
            (Json_deserializers.scheduler_running_exception_of_yojson tree path)
      | _, "SchedulerTransitioningException" ->
          `SchedulerTransitioningException
            (Json_deserializers.scheduler_transitioning_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_crawler_schedule_request) =
    let input = Json_serializers.start_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartCrawlerSchedule" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_crawler_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_crawler_schedule_request) =
    let input = Json_serializers.start_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartCrawlerSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_crawler_schedule_response_of_yojson
      ~error_deserializer
end

module StartDataQualityRuleRecommendationRun = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_data_quality_rule_recommendation_run_request) =
    let input =
      Json_serializers.start_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartDataQualityRuleRecommendationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_data_quality_rule_recommendation_run_request) =
    let input =
      Json_serializers.start_data_quality_rule_recommendation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartDataQualityRuleRecommendationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_data_quality_rule_recommendation_run_response_of_yojson
      ~error_deserializer
end

module StartDataQualityRulesetEvaluationRun = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.start_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartDataQualityRulesetEvaluationRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_data_quality_ruleset_evaluation_run_request) =
    let input =
      Json_serializers.start_data_quality_ruleset_evaluation_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartDataQualityRulesetEvaluationRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_data_quality_ruleset_evaluation_run_response_of_yojson
      ~error_deserializer
end

module StartExportLabelsTaskRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_export_labels_task_run_request) =
    let input = Json_serializers.start_export_labels_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartExportLabelsTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_export_labels_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_export_labels_task_run_request) =
    let input = Json_serializers.start_export_labels_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartExportLabelsTaskRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_export_labels_task_run_response_of_yojson
      ~error_deserializer
end

module StartImportLabelsTaskRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_import_labels_task_run_request) =
    let input = Json_serializers.start_import_labels_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartImportLabelsTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_import_labels_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_import_labels_task_run_request) =
    let input = Json_serializers.start_import_labels_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartImportLabelsTaskRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_import_labels_task_run_response_of_yojson
      ~error_deserializer
end

module StartJobRun = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_job_run_request) =
    let input = Json_serializers.start_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartJobRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_job_run_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : start_job_run_request) =
    let input = Json_serializers.start_job_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartJobRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_job_run_response_of_yojson
      ~error_deserializer
end

module StartMaterializedViewRefreshTaskRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `MaterializedViewRefreshTaskRunningException _ ->
        "com.amazonaws.glue#MaterializedViewRefreshTaskRunningException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MaterializedViewRefreshTaskRunningException" ->
          `MaterializedViewRefreshTaskRunningException
            (Json_deserializers.materialized_view_refresh_task_running_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_materialized_view_refresh_task_run_request) =
    let input =
      Json_serializers.start_materialized_view_refresh_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartMaterializedViewRefreshTaskRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_materialized_view_refresh_task_run_request) =
    let input =
      Json_serializers.start_materialized_view_refresh_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartMaterializedViewRefreshTaskRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer
end

module StartMLEvaluationTaskRun = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `MLTransformNotReadyException _ -> "com.amazonaws.glue#MLTransformNotReadyException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MLTransformNotReadyException" ->
          `MLTransformNotReadyException
            (Json_deserializers.ml_transform_not_ready_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_ml_evaluation_task_run_request) =
    let input = Json_serializers.start_ml_evaluation_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartMLEvaluationTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_ml_evaluation_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_ml_evaluation_task_run_request) =
    let input = Json_serializers.start_ml_evaluation_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartMLEvaluationTaskRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_ml_evaluation_task_run_response_of_yojson
      ~error_deserializer
end

module StartMLLabelingSetGenerationTaskRun = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_ml_labeling_set_generation_task_run_request) =
    let input =
      Json_serializers.start_ml_labeling_set_generation_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartMLLabelingSetGenerationTaskRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_ml_labeling_set_generation_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_ml_labeling_set_generation_task_run_request) =
    let input =
      Json_serializers.start_ml_labeling_set_generation_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StartMLLabelingSetGenerationTaskRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.start_ml_labeling_set_generation_task_run_response_of_yojson
      ~error_deserializer
end

module StartTrigger = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_trigger_request) =
    let input = Json_serializers.start_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : start_trigger_request) =
    let input = Json_serializers.start_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_trigger_response_of_yojson
      ~error_deserializer
end

module StartWorkflowRun = struct
  let error_to_string = function
    | `ConcurrentRunsExceededException _ -> "com.amazonaws.glue#ConcurrentRunsExceededException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentRunsExceededException" ->
          `ConcurrentRunsExceededException
            (Json_deserializers.concurrent_runs_exceeded_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_workflow_run_request) =
    let input = Json_serializers.start_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StartWorkflowRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_workflow_run_request) =
    let input = Json_serializers.start_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StartWorkflowRun"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_workflow_run_response_of_yojson
      ~error_deserializer
end

module StopColumnStatisticsTaskRun = struct
  let error_to_string = function
    | `ColumnStatisticsTaskNotRunningException _ ->
        "com.amazonaws.glue#ColumnStatisticsTaskNotRunningException"
    | `ColumnStatisticsTaskStoppingException _ ->
        "com.amazonaws.glue#ColumnStatisticsTaskStoppingException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ColumnStatisticsTaskNotRunningException" ->
          `ColumnStatisticsTaskNotRunningException
            (Json_deserializers.column_statistics_task_not_running_exception_of_yojson tree path)
      | _, "ColumnStatisticsTaskStoppingException" ->
          `ColumnStatisticsTaskStoppingException
            (Json_deserializers.column_statistics_task_stopping_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_column_statistics_task_run_request) =
    let input = Json_serializers.stop_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopColumnStatisticsTaskRun" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.stop_column_statistics_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_column_statistics_task_run_request) =
    let input = Json_serializers.stop_column_statistics_task_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StopColumnStatisticsTaskRun" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_column_statistics_task_run_response_of_yojson
      ~error_deserializer
end

module StopColumnStatisticsTaskRunSchedule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_column_statistics_task_run_schedule_request) =
    let input =
      Json_serializers.stop_column_statistics_task_run_schedule_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopColumnStatisticsTaskRunSchedule"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_column_statistics_task_run_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_column_statistics_task_run_schedule_request) =
    let input =
      Json_serializers.stop_column_statistics_task_run_schedule_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StopColumnStatisticsTaskRunSchedule" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_column_statistics_task_run_schedule_response_of_yojson
      ~error_deserializer
end

module StopCrawler = struct
  let error_to_string = function
    | `CrawlerNotRunningException _ -> "com.amazonaws.glue#CrawlerNotRunningException"
    | `CrawlerStoppingException _ -> "com.amazonaws.glue#CrawlerStoppingException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CrawlerNotRunningException" ->
          `CrawlerNotRunningException
            (Json_deserializers.crawler_not_running_exception_of_yojson tree path)
      | _, "CrawlerStoppingException" ->
          `CrawlerStoppingException
            (Json_deserializers.crawler_stopping_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_crawler_request) =
    let input = Json_serializers.stop_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_crawler_request) =
    let input = Json_serializers.stop_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StopCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_crawler_response_of_yojson
      ~error_deserializer
end

module StopCrawlerSchedule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `SchedulerNotRunningException _ -> "com.amazonaws.glue#SchedulerNotRunningException"
    | `SchedulerTransitioningException _ -> "com.amazonaws.glue#SchedulerTransitioningException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "SchedulerNotRunningException" ->
          `SchedulerNotRunningException
            (Json_deserializers.scheduler_not_running_exception_of_yojson tree path)
      | _, "SchedulerTransitioningException" ->
          `SchedulerTransitioningException
            (Json_deserializers.scheduler_transitioning_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_crawler_schedule_request) =
    let input = Json_serializers.stop_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopCrawlerSchedule" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_crawler_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_crawler_schedule_request) =
    let input = Json_serializers.stop_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StopCrawlerSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_crawler_schedule_response_of_yojson
      ~error_deserializer
end

module StopMaterializedViewRefreshTaskRun = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `MaterializedViewRefreshTaskNotRunningException _ ->
        "com.amazonaws.glue#MaterializedViewRefreshTaskNotRunningException"
    | `MaterializedViewRefreshTaskStoppingException _ ->
        "com.amazonaws.glue#MaterializedViewRefreshTaskStoppingException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MaterializedViewRefreshTaskNotRunningException" ->
          `MaterializedViewRefreshTaskNotRunningException
            (Json_deserializers.materialized_view_refresh_task_not_running_exception_of_yojson tree
               path)
      | _, "MaterializedViewRefreshTaskStoppingException" ->
          `MaterializedViewRefreshTaskStoppingException
            (Json_deserializers.materialized_view_refresh_task_stopping_exception_of_yojson tree
               path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_materialized_view_refresh_task_run_request) =
    let input =
      Json_serializers.stop_materialized_view_refresh_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopMaterializedViewRefreshTaskRun"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_materialized_view_refresh_task_run_request) =
    let input =
      Json_serializers.stop_materialized_view_refresh_task_run_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.StopMaterializedViewRefreshTaskRun" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.stop_materialized_view_refresh_task_run_response_of_yojson
      ~error_deserializer
end

module StopSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `IllegalSessionStateException _ -> "com.amazonaws.glue#IllegalSessionStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "IllegalSessionStateException" ->
          `IllegalSessionStateException
            (Json_deserializers.illegal_session_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_session_request) =
    let input = Json_serializers.stop_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_session_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_session_request) =
    let input = Json_serializers.stop_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StopSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_session_response_of_yojson
      ~error_deserializer
end

module StopTrigger = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_trigger_request) =
    let input = Json_serializers.stop_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_trigger_request) =
    let input = Json_serializers.stop_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StopTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_trigger_response_of_yojson
      ~error_deserializer
end

module StopWorkflowRun = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalWorkflowStateException _ -> "com.amazonaws.glue#IllegalWorkflowStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalWorkflowStateException" ->
          `IllegalWorkflowStateException
            (Json_deserializers.illegal_workflow_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_workflow_run_request) =
    let input = Json_serializers.stop_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.StopWorkflowRun" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_workflow_run_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_workflow_run_request) =
    let input = Json_serializers.stop_workflow_run_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.StopWorkflowRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_workflow_run_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module TestConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.glue#ConflictException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_connection_request) =
    let input = Json_serializers.test_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.TestConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.test_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : test_connection_request) =
    let input = Json_serializers.test_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.TestConnection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_connection_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateAsset = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_asset_request) =
    let input = Json_serializers.update_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateAsset" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_asset_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_asset_request) =
    let input = Json_serializers.update_asset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateAsset" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_asset_response_of_yojson
      ~error_deserializer
end

module UpdateBlueprint = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IllegalBlueprintStateException _ -> "com.amazonaws.glue#IllegalBlueprintStateException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IllegalBlueprintStateException" ->
          `IllegalBlueprintStateException
            (Json_deserializers.illegal_blueprint_state_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_blueprint_request) =
    let input = Json_serializers.update_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateBlueprint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_blueprint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_blueprint_request) =
    let input = Json_serializers.update_blueprint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateBlueprint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_blueprint_response_of_yojson
      ~error_deserializer
end

module UpdateCatalog = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_catalog_request) =
    let input = Json_serializers.update_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateCatalog" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_catalog_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_catalog_request) =
    let input = Json_serializers.update_catalog_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateCatalog" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_catalog_response_of_yojson
      ~error_deserializer
end

module UpdateClassifier = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `VersionMismatchException _ -> "com.amazonaws.glue#VersionMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "VersionMismatchException" ->
          `VersionMismatchException
            (Json_deserializers.version_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_classifier_request) =
    let input = Json_serializers.update_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateClassifier" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_classifier_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_classifier_request) =
    let input = Json_serializers.update_classifier_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateClassifier"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_classifier_response_of_yojson
      ~error_deserializer
end

module UpdateColumnStatisticsForPartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_column_statistics_for_partition_request) =
    let input = Json_serializers.update_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateColumnStatisticsForPartition"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_column_statistics_for_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_column_statistics_for_partition_request) =
    let input = Json_serializers.update_column_statistics_for_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateColumnStatisticsForPartition" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_column_statistics_for_partition_response_of_yojson
      ~error_deserializer
end

module UpdateColumnStatisticsForTable = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_column_statistics_for_table_request) =
    let input = Json_serializers.update_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateColumnStatisticsForTable"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_column_statistics_for_table_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_column_statistics_for_table_request) =
    let input = Json_serializers.update_column_statistics_for_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateColumnStatisticsForTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_column_statistics_for_table_response_of_yojson
      ~error_deserializer
end

module UpdateColumnStatisticsTaskSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `VersionMismatchException _ -> "com.amazonaws.glue#VersionMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "VersionMismatchException" ->
          `VersionMismatchException
            (Json_deserializers.version_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_column_statistics_task_settings_request) =
    let input = Json_serializers.update_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateColumnStatisticsTaskSettings"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_column_statistics_task_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_column_statistics_task_settings_request) =
    let input = Json_serializers.update_column_statistics_task_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateColumnStatisticsTaskSettings" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_column_statistics_task_settings_response_of_yojson
      ~error_deserializer
end

module UpdateConnection = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateConnection" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_connection_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connection_request) =
    let input = Json_serializers.update_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateConnection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_response_of_yojson
      ~error_deserializer
end

module UpdateCrawler = struct
  let error_to_string = function
    | `CrawlerRunningException _ -> "com.amazonaws.glue#CrawlerRunningException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `VersionMismatchException _ -> "com.amazonaws.glue#VersionMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CrawlerRunningException" ->
          `CrawlerRunningException
            (Json_deserializers.crawler_running_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "VersionMismatchException" ->
          `VersionMismatchException
            (Json_deserializers.version_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_crawler_request) =
    let input = Json_serializers.update_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateCrawler" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_crawler_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_crawler_request) =
    let input = Json_serializers.update_crawler_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateCrawler" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_crawler_response_of_yojson
      ~error_deserializer
end

module UpdateCrawlerSchedule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `SchedulerTransitioningException _ -> "com.amazonaws.glue#SchedulerTransitioningException"
    | `VersionMismatchException _ -> "com.amazonaws.glue#VersionMismatchException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "SchedulerTransitioningException" ->
          `SchedulerTransitioningException
            (Json_deserializers.scheduler_transitioning_exception_of_yojson tree path)
      | _, "VersionMismatchException" ->
          `VersionMismatchException
            (Json_deserializers.version_mismatch_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_crawler_schedule_request) =
    let input = Json_serializers.update_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateCrawlerSchedule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_crawler_schedule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_crawler_schedule_request) =
    let input = Json_serializers.update_crawler_schedule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateCrawlerSchedule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_crawler_schedule_response_of_yojson
      ~error_deserializer
end

module UpdateDatabase = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_database_request) =
    let input = Json_serializers.update_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateDatabase" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_database_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_database_request) =
    let input = Json_serializers.update_database_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateDatabase" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_database_response_of_yojson
      ~error_deserializer
end

module UpdateDataQualityRuleset = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.glue#IdempotentParameterMismatchException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_data_quality_ruleset_request) =
    let input = Json_serializers.update_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateDataQualityRuleset" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_data_quality_ruleset_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_data_quality_ruleset_request) =
    let input = Json_serializers.update_data_quality_ruleset_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateDataQualityRuleset"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_data_quality_ruleset_response_of_yojson
      ~error_deserializer
end

module UpdateDevEndpoint = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_dev_endpoint_request) =
    let input = Json_serializers.update_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateDevEndpoint" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_dev_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_dev_endpoint_request) =
    let input = Json_serializers.update_dev_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateDevEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_dev_endpoint_response_of_yojson
      ~error_deserializer
end

module UpdateGlossary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_glossary_request) =
    let input = Json_serializers.update_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateGlossary" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_glossary_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_glossary_request) =
    let input = Json_serializers.update_glossary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateGlossary" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_glossary_response_of_yojson
      ~error_deserializer
end

module UpdateGlossaryTerm = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_glossary_term_request) =
    let input = Json_serializers.update_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateGlossaryTerm" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_glossary_term_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_glossary_term_request) =
    let input = Json_serializers.update_glossary_term_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateGlossaryTerm"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_glossary_term_response_of_yojson
      ~error_deserializer
end

module UpdateGlueIdentityCenterConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.update_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateGlueIdentityCenterConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_glue_identity_center_configuration_request) =
    let input =
      Json_serializers.update_glue_identity_center_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateGlueIdentityCenterConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_glue_identity_center_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateIntegrationResourceProperty = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_integration_resource_property_request) =
    let input = Json_serializers.update_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateIntegrationResourceProperty"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_integration_resource_property_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_integration_resource_property_request) =
    let input = Json_serializers.update_integration_resource_property_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateIntegrationResourceProperty" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_integration_resource_property_response_of_yojson
      ~error_deserializer
end

module UpdateIntegrationTableProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServerException _ -> "com.amazonaws.glue#InternalServerException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ResourceNotFoundException _ -> "com.amazonaws.glue#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_integration_table_properties_request) =
    let input = Json_serializers.update_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateIntegrationTableProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_integration_table_properties_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_integration_table_properties_request) =
    let input = Json_serializers.update_integration_table_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateIntegrationTableProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_integration_table_properties_response_of_yojson
      ~error_deserializer
end

module UpdateJob = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_job_request) =
    let input = Json_serializers.update_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_job_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_job_request) =
    let input = Json_serializers.update_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_job_response_of_yojson
      ~error_deserializer
end

module UpdateJobFromSourceControl = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_job_from_source_control_request) =
    let input = Json_serializers.update_job_from_source_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateJobFromSourceControl" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_job_from_source_control_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_job_from_source_control_request) =
    let input = Json_serializers.update_job_from_source_control_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateJobFromSourceControl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_job_from_source_control_response_of_yojson
      ~error_deserializer
end

module UpdateMLTransform = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ml_transform_request) =
    let input = Json_serializers.update_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateMLTransform" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_ml_transform_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_ml_transform_request) =
    let input = Json_serializers.update_ml_transform_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateMLTransform"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_ml_transform_response_of_yojson
      ~error_deserializer
end

module UpdatePartition = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_partition_request) =
    let input = Json_serializers.update_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdatePartition" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_partition_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_partition_request) =
    let input = Json_serializers.update_partition_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdatePartition" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_partition_response_of_yojson
      ~error_deserializer
end

module UpdateRegistry = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_registry_input) =
    let input = Json_serializers.update_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateRegistry" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_registry_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_registry_input) =
    let input = Json_serializers.update_registry_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateRegistry" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_registry_response_of_yojson
      ~error_deserializer
end

module UpdateSchema = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_schema_input) =
    let input = Json_serializers.update_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateSchema" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_schema_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_schema_input) =
    let input = Json_serializers.update_schema_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateSchema" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_schema_response_of_yojson
      ~error_deserializer
end

module UpdateSourceControlFromJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_source_control_from_job_request) =
    let input = Json_serializers.update_source_control_from_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateSourceControlFromJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_source_control_from_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_source_control_from_job_request) =
    let input = Json_serializers.update_source_control_from_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateSourceControlFromJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_source_control_from_job_response_of_yojson
      ~error_deserializer
end

module UpdateTable = struct
  let error_to_string = function
    | `AlreadyExistsException _ -> "com.amazonaws.glue#AlreadyExistsException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `FederationSourceException _ -> "com.amazonaws.glue#FederationSourceException"
    | `FederationSourceRetryableException _ ->
        "com.amazonaws.glue#FederationSourceRetryableException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | `ResourceNotReadyException _ -> "com.amazonaws.glue#ResourceNotReadyException"
    | `ResourceNumberLimitExceededException _ ->
        "com.amazonaws.glue#ResourceNumberLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AlreadyExistsException" ->
          `AlreadyExistsException (Json_deserializers.already_exists_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "FederationSourceException" ->
          `FederationSourceException
            (Json_deserializers.federation_source_exception_of_yojson tree path)
      | _, "FederationSourceRetryableException" ->
          `FederationSourceRetryableException
            (Json_deserializers.federation_source_retryable_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _, "ResourceNotReadyException" ->
          `ResourceNotReadyException
            (Json_deserializers.resource_not_ready_exception_of_yojson tree path)
      | _, "ResourceNumberLimitExceededException" ->
          `ResourceNumberLimitExceededException
            (Json_deserializers.resource_number_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_table_request) =
    let input = Json_serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateTable" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_table_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_table_request) =
    let input = Json_serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_table_response_of_yojson
      ~error_deserializer
end

module UpdateTableOptimizer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.glue#AccessDeniedException"
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `ThrottlingException _ -> "com.amazonaws.glue#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.glue#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_table_optimizer_request) =
    let input = Json_serializers.update_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateTableOptimizer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_table_optimizer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_table_optimizer_request) =
    let input = Json_serializers.update_table_optimizer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateTableOptimizer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_table_optimizer_response_of_yojson
      ~error_deserializer
end

module UpdateTrigger = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_trigger_request) =
    let input = Json_serializers.update_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateTrigger" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_trigger_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_trigger_request) =
    let input = Json_serializers.update_trigger_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateTrigger" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_trigger_response_of_yojson
      ~error_deserializer
end

module UpdateUsageProfile = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationNotSupportedException _ -> "com.amazonaws.glue#OperationNotSupportedException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_usage_profile_request) =
    let input = Json_serializers.update_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateUsageProfile" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_usage_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_usage_profile_request) =
    let input = Json_serializers.update_usage_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateUsageProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_usage_profile_response_of_yojson
      ~error_deserializer
end

module UpdateUserDefinedFunction = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `GlueEncryptionException _ -> "com.amazonaws.glue#GlueEncryptionException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "GlueEncryptionException" ->
          `GlueEncryptionException
            (Json_deserializers.glue_encryption_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_defined_function_request) =
    let input = Json_serializers.update_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateUserDefinedFunction" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_user_defined_function_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_user_defined_function_request) =
    let input = Json_serializers.update_user_defined_function_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSGlue.UpdateUserDefinedFunction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_user_defined_function_response_of_yojson
      ~error_deserializer
end

module UpdateWorkflow = struct
  let error_to_string = function
    | `ConcurrentModificationException _ -> "com.amazonaws.glue#ConcurrentModificationException"
    | `EntityNotFoundException _ -> "com.amazonaws.glue#EntityNotFoundException"
    | `InternalServiceException _ -> "com.amazonaws.glue#InternalServiceException"
    | `InvalidInputException _ -> "com.amazonaws.glue#InvalidInputException"
    | `OperationTimeoutException _ -> "com.amazonaws.glue#OperationTimeoutException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InternalServiceException" ->
          `InternalServiceException
            (Json_deserializers.internal_service_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OperationTimeoutException" ->
          `OperationTimeoutException
            (Json_deserializers.operation_timeout_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workflow_request) =
    let input = Json_serializers.update_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSGlue.UpdateWorkflow" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_workflow_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workflow_request) =
    let input = Json_serializers.update_workflow_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSGlue.UpdateWorkflow" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_workflow_response_of_yojson
      ~error_deserializer
end
