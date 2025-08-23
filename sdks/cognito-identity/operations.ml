open Types
open Service_metadata
module CreateIdentityPool =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_identity_pool_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_identity_pool_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceCreateIdentityPool"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:identity_pool_of_yojson ~error_deserializer
  end
module DeleteIdentities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_identities_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_identities_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceDeleteIdentities" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_identities_response_of_yojson
            ~error_deserializer
  end
module DeleteIdentityPool =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_identity_pool_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_identity_pool_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceDeleteIdentityPool"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_identity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceDescribeIdentity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:identity_description_of_yojson
            ~error_deserializer
  end
module DescribeIdentityPool =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_identity_pool_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_identity_pool_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceDescribeIdentityPool"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:identity_pool_of_yojson ~error_deserializer
  end
module GetCredentialsForIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExternalServiceException") ->
              `ExternalServiceException
                (external_service_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidIdentityPoolConfigurationException") ->
              `InvalidIdentityPoolConfigurationException
                (invalid_identity_pool_configuration_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_credentials_for_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_credentials_for_identity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetCredentialsForIdentity"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_credentials_for_identity_response_of_yojson
            ~error_deserializer
  end
module GetId =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExternalServiceException") ->
              `ExternalServiceException
                (external_service_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_id_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_id_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetId" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_id_response_of_yojson
            ~error_deserializer
  end
module GetIdentityPoolRoles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_identity_pool_roles_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_identity_pool_roles_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetIdentityPoolRoles"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_identity_pool_roles_response_of_yojson
            ~error_deserializer
  end
module GetOpenIdToken =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExternalServiceException") ->
              `ExternalServiceException
                (external_service_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_open_id_token_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_open_id_token_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetOpenIdToken" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_open_id_token_response_of_yojson
            ~error_deserializer
  end
module GetOpenIdTokenForDeveloperIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DeveloperUserAlreadyRegisteredException") ->
              `DeveloperUserAlreadyRegisteredException
                (developer_user_already_registered_exception_of_yojson tree
                   path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_open_id_token_for_developer_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_open_id_token_for_developer_identity_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetOpenIdTokenForDeveloperIdentity"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_open_id_token_for_developer_identity_response_of_yojson
            ~error_deserializer
  end
module GetPrincipalTagAttributeMap =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_principal_tag_attribute_map_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_principal_tag_attribute_map_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceGetPrincipalTagAttributeMap"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_principal_tag_attribute_map_response_of_yojson
            ~error_deserializer
  end
module ListIdentities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_identities_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_identities_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceListIdentities" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_identities_response_of_yojson
            ~error_deserializer
  end
module ListIdentityPools =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_identity_pools_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_identity_pools_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceListIdentityPools" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_identity_pools_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceListTagsForResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module LookupDeveloperIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : lookup_developer_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.lookup_developer_identity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceLookupDeveloperIdentity"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:lookup_developer_identity_response_of_yojson
            ~error_deserializer
  end
module MergeDeveloperIdentities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : merge_developer_identities_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.merge_developer_identities_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceMergeDeveloperIdentities"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:merge_developer_identities_response_of_yojson
            ~error_deserializer
  end
module SetIdentityPoolRoles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : set_identity_pool_roles_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.set_identity_pool_roles_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceSetIdentityPoolRoles"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module SetPrincipalTagAttributeMap =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : set_principal_tag_attribute_map_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.set_principal_tag_attribute_map_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceSetPrincipalTagAttributeMap"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:set_principal_tag_attribute_map_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UnlinkDeveloperIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unlink_developer_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.unlink_developer_identity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceUnlinkDeveloperIdentity"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UnlinkIdentity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExternalServiceException") ->
              `ExternalServiceException
                (external_service_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unlink_identity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.unlink_identity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceUnlinkIdentity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateIdentityPool =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NotAuthorizedException") ->
              `NotAuthorizedException
                (not_authorized_exception_of_yojson tree path)
          | (_, "ResourceConflictException") ->
              `ResourceConflictException
                (resource_conflict_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyRequestsException") ->
              `TooManyRequestsException
                (too_many_requests_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : identity_pool) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.identity_pool_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSCognitoIdentityServiceUpdateIdentityPool"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:identity_pool_of_yojson ~error_deserializer
  end