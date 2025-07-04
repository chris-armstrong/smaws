open Types
module CreateAccessPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_access_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_access_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateAccessPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_access_policy_response_of_yojson
            ~error_deserializer
  end
module CreateCollection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "OcuLimitExceededException") ->
              `OcuLimitExceededException
                (ocu_limit_exceeded_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_collection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_collection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateCollection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_collection_response_of_yojson
            ~error_deserializer
  end
module CreateSecurityConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_security_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_security_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateSecurityConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_security_config_response_of_yojson
            ~error_deserializer
  end
module CreateVpcEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_vpc_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_vpc_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateVpcEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_vpc_endpoint_response_of_yojson
            ~error_deserializer
  end
module DeleteAccessPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_access_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_access_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteAccessPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_access_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteCollection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_collection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_collection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteCollection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_collection_response_of_yojson
            ~error_deserializer
  end
module DeleteLifecyclePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_lifecycle_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_lifecycle_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteLifecyclePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_lifecycle_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteSecurityConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_security_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_security_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteSecurityConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_security_config_response_of_yojson
            ~error_deserializer
  end
module DeleteSecurityPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_security_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_security_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteSecurityPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_security_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteVpcEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_vpc_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_vpc_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessDeleteVpcEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_vpc_endpoint_response_of_yojson
            ~error_deserializer
  end
module GetAccessPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_access_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_access_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessGetAccessPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_access_policy_response_of_yojson
            ~error_deserializer
  end
module GetSecurityConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_security_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_security_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessGetSecurityConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_security_config_response_of_yojson
            ~error_deserializer
  end
module GetSecurityPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_security_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_security_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessGetSecurityPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_security_policy_response_of_yojson
            ~error_deserializer
  end
module ListAccessPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_access_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_access_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListAccessPolicies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_access_policies_response_of_yojson
            ~error_deserializer
  end
module ListCollections =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_collections_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_collections_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListCollections" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_collections_response_of_yojson
            ~error_deserializer
  end
module ListLifecyclePolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_lifecycle_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_lifecycle_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListLifecyclePolicies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_lifecycle_policies_response_of_yojson
            ~error_deserializer
  end
module ListSecurityConfigs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_security_configs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_security_configs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListSecurityConfigs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_security_configs_response_of_yojson
            ~error_deserializer
  end
module ListSecurityPolicies =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_security_policies_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_security_policies_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListSecurityPolicies" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_security_policies_response_of_yojson
            ~error_deserializer
  end
module ListVpcEndpoints =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_vpc_endpoints_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_vpc_endpoints_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListVpcEndpoints" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_vpc_endpoints_response_of_yojson
            ~error_deserializer
  end
module BatchGetCollection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_collection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_collection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessBatchGetCollection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_collection_response_of_yojson
            ~error_deserializer
  end
module BatchGetEffectiveLifecyclePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : batch_get_effective_lifecycle_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_effective_lifecycle_policy_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessBatchGetEffectiveLifecyclePolicy"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_effective_lifecycle_policy_response_of_yojson
            ~error_deserializer
  end
module BatchGetLifecyclePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_lifecycle_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_lifecycle_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessBatchGetLifecyclePolicy"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_lifecycle_policy_response_of_yojson
            ~error_deserializer
  end
module BatchGetVpcEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_vpc_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_vpc_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessBatchGetVpcEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_vpc_endpoint_response_of_yojson
            ~error_deserializer
  end
module CreateLifecyclePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_lifecycle_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_lifecycle_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateLifecyclePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_lifecycle_policy_response_of_yojson
            ~error_deserializer
  end
module CreateSecurityPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_security_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_security_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessCreateSecurityPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_security_policy_response_of_yojson
            ~error_deserializer
  end
module GetAccountSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_account_settings_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessGetAccountSettings" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_account_settings_response_of_yojson
            ~error_deserializer
  end
module GetPoliciesStats =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_policies_stats_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessGetPoliciesStats" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_policies_stats_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateAccessPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_access_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_access_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateAccessPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_access_policy_response_of_yojson
            ~error_deserializer
  end
module UpdateAccountSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_account_settings_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_account_settings_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateAccountSettings" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_account_settings_response_of_yojson
            ~error_deserializer
  end
module UpdateCollection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_collection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_collection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateCollection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_collection_response_of_yojson
            ~error_deserializer
  end
module UpdateLifecyclePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_lifecycle_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_lifecycle_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateLifecyclePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_lifecycle_policy_response_of_yojson
            ~error_deserializer
  end
module UpdateSecurityConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_security_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_security_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateSecurityConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_security_config_response_of_yojson
            ~error_deserializer
  end
module UpdateSecurityPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_security_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_security_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateSecurityPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_security_policy_response_of_yojson
            ~error_deserializer
  end
module UpdateVpcEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_vpc_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_vpc_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"OpenSearchServerlessUpdateVpcEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_vpc_endpoint_response_of_yojson
            ~error_deserializer
  end