open Types
open Service_metadata

module CreateAccessPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : create_access_policy_request) =
    let input = Json_serializers.create_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateAccessPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_access_policy_response_of_yojson
      ~error_deserializer
end

module CreateCollection = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `OcuLimitExceededException _ -> "com.amazonaws.opensearchserverless#OcuLimitExceededException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "OcuLimitExceededException" ->
          `OcuLimitExceededException
            (Json_deserializers.ocu_limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_collection_request) =
    let input = Json_serializers.create_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_collection_response_of_yojson
      ~error_deserializer
end

module CreateSecurityConfig = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : create_security_config_request) =
    let input = Json_serializers.create_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateSecurityConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_security_config_response_of_yojson
      ~error_deserializer
end

module CreateVpcEndpoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : create_vpc_endpoint_request) =
    let input = Json_serializers.create_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateVpcEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module DeleteAccessPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_access_policy_request) =
    let input = Json_serializers.delete_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteAccessPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_access_policy_response_of_yojson
      ~error_deserializer
end

module DeleteCollection = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_collection_request) =
    let input = Json_serializers.delete_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_collection_response_of_yojson
      ~error_deserializer
end

module DeleteLifecyclePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_lifecycle_policy_request) =
    let input = Json_serializers.delete_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module DeleteSecurityConfig = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_security_config_request) =
    let input = Json_serializers.delete_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteSecurityConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_config_response_of_yojson
      ~error_deserializer
end

module DeleteSecurityPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_security_policy_request) =
    let input = Json_serializers.delete_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteSecurityPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_security_policy_response_of_yojson
      ~error_deserializer
end

module DeleteVpcEndpoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_endpoint_request) =
    let input = Json_serializers.delete_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.DeleteVpcEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module GetAccessPolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_access_policy_request) =
    let input = Json_serializers.get_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.GetAccessPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_access_policy_response_of_yojson
      ~error_deserializer
end

module GetSecurityConfig = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_security_config_request) =
    let input = Json_serializers.get_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.GetSecurityConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_security_config_response_of_yojson
      ~error_deserializer
end

module GetSecurityPolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_security_policy_request) =
    let input = Json_serializers.get_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.GetSecurityPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_security_policy_response_of_yojson
      ~error_deserializer
end

module ListAccessPolicies = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_access_policies_request) =
    let input = Json_serializers.list_access_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListAccessPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_access_policies_response_of_yojson
      ~error_deserializer
end

module ListCollections = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_collections_request) =
    let input = Json_serializers.list_collections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListCollections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_collections_response_of_yojson
      ~error_deserializer
end

module ListLifecyclePolicies = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_lifecycle_policies_request) =
    let input = Json_serializers.list_lifecycle_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListLifecyclePolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_lifecycle_policies_response_of_yojson
      ~error_deserializer
end

module ListSecurityConfigs = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_security_configs_request) =
    let input = Json_serializers.list_security_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListSecurityConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_security_configs_response_of_yojson
      ~error_deserializer
end

module ListSecurityPolicies = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_security_policies_request) =
    let input = Json_serializers.list_security_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListSecurityPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_security_policies_response_of_yojson
      ~error_deserializer
end

module ListVpcEndpoints = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vpc_endpoints_request) =
    let input = Json_serializers.list_vpc_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListVpcEndpoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_vpc_endpoints_response_of_yojson
      ~error_deserializer
end

module BatchGetCollection = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_collection_request) =
    let input = Json_serializers.batch_get_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.BatchGetCollection"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_collection_response_of_yojson
      ~error_deserializer
end

module BatchGetEffectiveLifecyclePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_effective_lifecycle_policy_request) =
    let input = Json_serializers.batch_get_effective_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OpenSearchServerless.BatchGetEffectiveLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_get_effective_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module BatchGetLifecyclePolicy = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_lifecycle_policy_request) =
    let input = Json_serializers.batch_get_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.BatchGetLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module BatchGetVpcEndpoint = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_vpc_endpoint_request) =
    let input = Json_serializers.batch_get_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.BatchGetVpcEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module CreateLifecyclePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : create_lifecycle_policy_request) =
    let input = Json_serializers.create_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module CreateSecurityPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : create_security_policy_request) =
    let input = Json_serializers.create_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.CreateSecurityPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_security_policy_response_of_yojson
      ~error_deserializer
end

module GetAccountSettings = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_settings_request) =
    let input = Json_serializers.get_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.GetAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_settings_response_of_yojson
      ~error_deserializer
end

module GetPoliciesStats = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_policies_stats_request) =
    let input = Json_serializers.get_policies_stats_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.GetPoliciesStats" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_policies_stats_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateAccessPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_access_policy_request) =
    let input = Json_serializers.update_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateAccessPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_access_policy_response_of_yojson
      ~error_deserializer
end

module UpdateAccountSettings = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_account_settings_request) =
    let input = Json_serializers.update_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_account_settings_response_of_yojson
      ~error_deserializer
end

module UpdateCollection = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_collection_request) =
    let input = Json_serializers.update_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateCollection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_collection_response_of_yojson
      ~error_deserializer
end

module UpdateLifecyclePolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : update_lifecycle_policy_request) =
    let input = Json_serializers.update_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateLifecyclePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module UpdateSecurityConfig = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_security_config_request) =
    let input = Json_serializers.update_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateSecurityConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_security_config_response_of_yojson
      ~error_deserializer
end

module UpdateSecurityPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.opensearchserverless#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.opensearchserverless#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : update_security_policy_request) =
    let input = Json_serializers.update_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateSecurityPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_security_policy_response_of_yojson
      ~error_deserializer
end

module UpdateVpcEndpoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.opensearchserverless#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.opensearchserverless#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.opensearchserverless#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vpc_endpoint_request) =
    let input = Json_serializers.update_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerless.UpdateVpcEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_vpc_endpoint_response_of_yojson
      ~error_deserializer
end
