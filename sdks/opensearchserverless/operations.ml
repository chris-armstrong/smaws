open Types
open Service_metadata

module CreateAccessPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateAccessPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_access_policy_response_of_yojson
      ~error_deserializer
end

module CreateCollection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateCollection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_collection_response_of_yojson
      ~error_deserializer
end

module CreateSecurityConfig = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateSecurityConfig"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_security_config_response_of_yojson
      ~error_deserializer
end

module CreateVpcEndpoint = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateVpcEndpoint" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module DeleteAccessPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteAccessPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_access_policy_response_of_yojson
      ~error_deserializer
end

module DeleteCollection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteCollection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_collection_response_of_yojson
      ~error_deserializer
end

module DeleteLifecyclePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteLifecyclePolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module DeleteSecurityConfig = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteSecurityConfig"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_security_config_response_of_yojson
      ~error_deserializer
end

module DeleteSecurityPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteSecurityPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_security_policy_response_of_yojson
      ~error_deserializer
end

module DeleteVpcEndpoint = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessDeleteVpcEndpoint" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module GetAccessPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessGetAccessPolicy" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_access_policy_response_of_yojson
      ~error_deserializer
end

module GetSecurityConfig = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessGetSecurityConfig" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_security_config_response_of_yojson
      ~error_deserializer
end

module GetSecurityPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessGetSecurityPolicy" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_security_policy_response_of_yojson
      ~error_deserializer
end

module ListAccessPolicies = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_access_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListAccessPolicies"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_access_policies_response_of_yojson
      ~error_deserializer
end

module ListCollections = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_collections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListCollections" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_collections_response_of_yojson
      ~error_deserializer
end

module ListLifecyclePolicies = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_lifecycle_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListLifecyclePolicies"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_lifecycle_policies_response_of_yojson
      ~error_deserializer
end

module ListSecurityConfigs = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_security_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListSecurityConfigs"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_security_configs_response_of_yojson
      ~error_deserializer
end

module ListSecurityPolicies = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_security_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListSecurityPolicies"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_security_policies_response_of_yojson
      ~error_deserializer
end

module ListVpcEndpoints = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_vpc_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListVpcEndpoints" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_vpc_endpoints_response_of_yojson
      ~error_deserializer
end

module BatchGetCollection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.batch_get_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessBatchGetCollection"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.batch_get_collection_response_of_yojson
      ~error_deserializer
end

module BatchGetEffectiveLifecyclePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.batch_get_effective_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"OpenSearchServerlessBatchGetEffectiveLifecyclePolicy" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.batch_get_effective_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module BatchGetLifecyclePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.batch_get_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessBatchGetLifecyclePolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.batch_get_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module BatchGetVpcEndpoint = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.batch_get_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessBatchGetVpcEndpoint"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.batch_get_vpc_endpoint_response_of_yojson
      ~error_deserializer
end

module CreateLifecyclePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateLifecyclePolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module CreateSecurityPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessCreateSecurityPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_security_policy_response_of_yojson
      ~error_deserializer
end

module GetAccountSettings = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessGetAccountSettings"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_account_settings_response_of_yojson
      ~error_deserializer
end

module GetPoliciesStats = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_policies_stats_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessGetPoliciesStats" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_policies_stats_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessTagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUntagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAccessPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_access_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateAccessPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_access_policy_response_of_yojson
      ~error_deserializer
end

module UpdateAccountSettings = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_account_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateAccountSettings"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_account_settings_response_of_yojson
      ~error_deserializer
end

module UpdateCollection = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_collection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateCollection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_collection_response_of_yojson
      ~error_deserializer
end

module UpdateLifecyclePolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateLifecyclePolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module UpdateSecurityConfig = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_security_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateSecurityConfig"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_security_config_response_of_yojson
      ~error_deserializer
end

module UpdateSecurityPolicy = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_security_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateSecurityPolicy"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_security_policy_response_of_yojson
      ~error_deserializer
end

module UpdateVpcEndpoint = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_vpc_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"OpenSearchServerlessUpdateVpcEndpoint" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_vpc_endpoint_response_of_yojson
      ~error_deserializer
end
