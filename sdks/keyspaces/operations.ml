open Types
open Service_metadata

module CreateKeyspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_keyspace_request) =
    let input = Json_serializers.create_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.CreateKeyspace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_keyspace_response_of_yojson
      ~error_deserializer
end

module CreateTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_table_request) =
    let input = Json_serializers.create_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.CreateTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_table_response_of_yojson
      ~error_deserializer
end

module CreateType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_type_request) =
    let input = Json_serializers.create_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.CreateType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_type_response_of_yojson
      ~error_deserializer
end

module DeleteKeyspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_keyspace_request) =
    let input = Json_serializers.delete_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.DeleteKeyspace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_keyspace_response_of_yojson
      ~error_deserializer
end

module DeleteTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_table_request) =
    let input = Json_serializers.delete_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.DeleteTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_table_response_of_yojson
      ~error_deserializer
end

module DeleteType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_type_request) =
    let input = Json_serializers.delete_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.DeleteType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_type_response_of_yojson
      ~error_deserializer
end

module GetKeyspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_keyspace_request) =
    let input = Json_serializers.get_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.GetKeyspace" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_keyspace_response_of_yojson
      ~error_deserializer
end

module GetTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_request) =
    let input = Json_serializers.get_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.GetTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_table_response_of_yojson
      ~error_deserializer
end

module GetTableAutoScalingSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_table_auto_scaling_settings_request) =
    let input = Json_serializers.get_table_auto_scaling_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.GetTableAutoScalingSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_table_auto_scaling_settings_response_of_yojson
      ~error_deserializer
end

module GetType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_type_request) =
    let input = Json_serializers.get_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.GetType" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_type_response_of_yojson ~error_deserializer
end

module ListKeyspaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_keyspaces_request) =
    let input = Json_serializers.list_keyspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.ListKeyspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_keyspaces_response_of_yojson
      ~error_deserializer
end

module ListTables = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tables_request) =
    let input = Json_serializers.list_tables_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.ListTables" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tables_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_types_request) =
    let input = Json_serializers.list_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.ListTypes" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_types_response_of_yojson
      ~error_deserializer
end

module RestoreTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_table_request) =
    let input = Json_serializers.restore_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.RestoreTable" ~service
      ~context ~input ~output_deserializer:Json_deserializers.restore_table_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateKeyspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_keyspace_request) =
    let input = Json_serializers.update_keyspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.UpdateKeyspace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_keyspace_response_of_yojson
      ~error_deserializer
end

module UpdateTable = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.keyspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.keyspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.keyspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.keyspaces#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.keyspaces#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.keyspaces#ValidationException"
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
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_table_request) =
    let input = Json_serializers.update_table_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"KeyspacesService.UpdateTable" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_table_response_of_yojson
      ~error_deserializer
end
