open Types
open Service_metadata

module BatchCheckLayerAvailability = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_check_layer_availability_request) =
    let input = Json_serializers.batch_check_layer_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchCheckLayerAvailability" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_check_layer_availability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_check_layer_availability_request) =
    let input = Json_serializers.batch_check_layer_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchCheckLayerAvailability" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_check_layer_availability_response_of_yojson
      ~error_deserializer
end

module BatchDeleteImage = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_image_request) =
    let input = Json_serializers.batch_delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchDeleteImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_image_request) =
    let input = Json_serializers.batch_delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchDeleteImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_image_response_of_yojson
      ~error_deserializer
end

module BatchGetImage = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnableToGetUpstreamImageException _ -> "com.amazonaws.ecr#UnableToGetUpstreamImageException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnableToGetUpstreamImageException" ->
          `UnableToGetUpstreamImageException
            (Json_deserializers.unable_to_get_upstream_image_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_image_request) =
    let input = Json_serializers.batch_get_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchGetImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_image_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : batch_get_image_request) =
    let input = Json_serializers.batch_get_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchGetImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_image_response_of_yojson ~error_deserializer
end

module BatchGetRepositoryScanningConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_repository_scanning_configuration_request) =
    let input =
      Json_serializers.batch_get_repository_scanning_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchGetRepositoryScanningConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_get_repository_scanning_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_repository_scanning_configuration_request)
      =
    let input =
      Json_serializers.batch_get_repository_scanning_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.BatchGetRepositoryScanningConfiguration"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_get_repository_scanning_configuration_response_of_yojson
      ~error_deserializer
end

module CompleteLayerUpload = struct
  let error_to_string = function
    | `EmptyUploadException _ -> "com.amazonaws.ecr#EmptyUploadException"
    | `InvalidLayerException _ -> "com.amazonaws.ecr#InvalidLayerException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `LayerAlreadyExistsException _ -> "com.amazonaws.ecr#LayerAlreadyExistsException"
    | `LayerPartTooSmallException _ -> "com.amazonaws.ecr#LayerPartTooSmallException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UploadNotFoundException _ -> "com.amazonaws.ecr#UploadNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EmptyUploadException" ->
          `EmptyUploadException (Json_deserializers.empty_upload_exception_of_yojson tree path)
      | _, "InvalidLayerException" ->
          `InvalidLayerException (Json_deserializers.invalid_layer_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "LayerAlreadyExistsException" ->
          `LayerAlreadyExistsException
            (Json_deserializers.layer_already_exists_exception_of_yojson tree path)
      | _, "LayerPartTooSmallException" ->
          `LayerPartTooSmallException
            (Json_deserializers.layer_part_too_small_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UploadNotFoundException" ->
          `UploadNotFoundException
            (Json_deserializers.upload_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : complete_layer_upload_request) =
    let input = Json_serializers.complete_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CompleteLayerUpload" ~service ~context
      ~input ~output_deserializer:Json_deserializers.complete_layer_upload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : complete_layer_upload_request) =
    let input = Json_serializers.complete_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CompleteLayerUpload" ~service ~context
      ~input ~output_deserializer:Json_deserializers.complete_layer_upload_response_of_yojson
      ~error_deserializer
end

module CreatePullThroughCacheRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `PullThroughCacheRuleAlreadyExistsException _ ->
        "com.amazonaws.ecr#PullThroughCacheRuleAlreadyExistsException"
    | `SecretNotFoundException _ -> "com.amazonaws.ecr#SecretNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnableToAccessSecretException _ -> "com.amazonaws.ecr#UnableToAccessSecretException"
    | `UnableToDecryptSecretValueException _ ->
        "com.amazonaws.ecr#UnableToDecryptSecretValueException"
    | `UnsupportedUpstreamRegistryException _ ->
        "com.amazonaws.ecr#UnsupportedUpstreamRegistryException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "PullThroughCacheRuleAlreadyExistsException" ->
          `PullThroughCacheRuleAlreadyExistsException
            (Json_deserializers.pull_through_cache_rule_already_exists_exception_of_yojson tree path)
      | _, "SecretNotFoundException" ->
          `SecretNotFoundException
            (Json_deserializers.secret_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnableToAccessSecretException" ->
          `UnableToAccessSecretException
            (Json_deserializers.unable_to_access_secret_exception_of_yojson tree path)
      | _, "UnableToDecryptSecretValueException" ->
          `UnableToDecryptSecretValueException
            (Json_deserializers.unable_to_decrypt_secret_value_exception_of_yojson tree path)
      | _, "UnsupportedUpstreamRegistryException" ->
          `UnsupportedUpstreamRegistryException
            (Json_deserializers.unsupported_upstream_registry_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pull_through_cache_rule_request) =
    let input = Json_serializers.create_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_pull_through_cache_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pull_through_cache_rule_request) =
    let input = Json_serializers.create_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_pull_through_cache_rule_response_of_yojson
      ~error_deserializer
end

module CreateRepository = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecr#InvalidTagParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `RepositoryAlreadyExistsException _ -> "com.amazonaws.ecr#RepositoryAlreadyExistsException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecr#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryAlreadyExistsException" ->
          `RepositoryAlreadyExistsException
            (Json_deserializers.repository_already_exists_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_request) =
    let input = Json_serializers.create_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreateRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_repository_request) =
    let input = Json_serializers.create_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreateRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_response_of_yojson
      ~error_deserializer
end

module CreateRepositoryCreationTemplate = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TemplateAlreadyExistsException _ -> "com.amazonaws.ecr#TemplateAlreadyExistsException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TemplateAlreadyExistsException" ->
          `TemplateAlreadyExistsException
            (Json_deserializers.template_already_exists_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_creation_template_request) =
    let input = Json_serializers.create_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreateRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_creation_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_repository_creation_template_request) =
    let input = Json_serializers.create_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.CreateRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_creation_template_response_of_yojson
      ~error_deserializer
end

module DeleteLifecyclePolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LifecyclePolicyNotFoundException _ -> "com.amazonaws.ecr#LifecyclePolicyNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LifecyclePolicyNotFoundException" ->
          `LifecyclePolicyNotFoundException
            (Json_deserializers.lifecycle_policy_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_lifecycle_policy_request) =
    let input = Json_serializers.delete_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteLifecyclePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_lifecycle_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_lifecycle_policy_request) =
    let input = Json_serializers.delete_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteLifecyclePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module DeletePullThroughCacheRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `PullThroughCacheRuleNotFoundException _ ->
        "com.amazonaws.ecr#PullThroughCacheRuleNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PullThroughCacheRuleNotFoundException" ->
          `PullThroughCacheRuleNotFoundException
            (Json_deserializers.pull_through_cache_rule_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pull_through_cache_rule_request) =
    let input = Json_serializers.delete_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeletePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_pull_through_cache_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pull_through_cache_rule_request) =
    let input = Json_serializers.delete_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeletePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_pull_through_cache_rule_response_of_yojson
      ~error_deserializer
end

module DeleteRegistryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RegistryPolicyNotFoundException _ -> "com.amazonaws.ecr#RegistryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RegistryPolicyNotFoundException" ->
          `RegistryPolicyNotFoundException
            (Json_deserializers.registry_policy_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_registry_policy_request) =
    let input = Json_serializers.delete_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRegistryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_registry_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_registry_policy_request) =
    let input = Json_serializers.delete_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRegistryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_registry_policy_response_of_yojson
      ~error_deserializer
end

module DeleteRepository = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `RepositoryNotEmptyException _ -> "com.amazonaws.ecr#RepositoryNotEmptyException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "RepositoryNotEmptyException" ->
          `RepositoryNotEmptyException
            (Json_deserializers.repository_not_empty_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_request) =
    let input = Json_serializers.delete_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_request) =
    let input = Json_serializers.delete_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_response_of_yojson
      ~error_deserializer
end

module DeleteRepositoryCreationTemplate = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TemplateNotFoundException _ -> "com.amazonaws.ecr#TemplateNotFoundException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TemplateNotFoundException" ->
          `TemplateNotFoundException
            (Json_deserializers.template_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_creation_template_request) =
    let input = Json_serializers.delete_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_creation_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_creation_template_request) =
    let input = Json_serializers.delete_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_creation_template_response_of_yojson
      ~error_deserializer
end

module DeleteRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `RepositoryPolicyNotFoundException _ -> "com.amazonaws.ecr#RepositoryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "RepositoryPolicyNotFoundException" ->
          `RepositoryPolicyNotFoundException
            (Json_deserializers.repository_policy_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_policy_request) =
    let input = Json_serializers.delete_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_policy_request) =
    let input = Json_serializers.delete_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_repository_policy_response_of_yojson
      ~error_deserializer
end

module DeleteSigningConfiguration = struct
  let error_to_string = function
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `SigningConfigurationNotFoundException _ ->
        "com.amazonaws.ecr#SigningConfigurationNotFoundException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "SigningConfigurationNotFoundException" ->
          `SigningConfigurationNotFoundException
            (Json_deserializers.signing_configuration_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_signing_configuration_request) =
    let input = Json_serializers.delete_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteSigningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_signing_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_signing_configuration_request) =
    let input = Json_serializers.delete_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeleteSigningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_signing_configuration_response_of_yojson
      ~error_deserializer
end

module DeregisterPullTimeUpdateExclusion = struct
  let error_to_string = function
    | `ExclusionNotFoundException _ -> "com.amazonaws.ecr#ExclusionNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExclusionNotFoundException" ->
          `ExclusionNotFoundException
            (Json_deserializers.exclusion_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_pull_time_update_exclusion_request) =
    let input = Json_serializers.deregister_pull_time_update_exclusion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeregisterPullTimeUpdateExclusion" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.deregister_pull_time_update_exclusion_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_pull_time_update_exclusion_request) =
    let input = Json_serializers.deregister_pull_time_update_exclusion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DeregisterPullTimeUpdateExclusion" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.deregister_pull_time_update_exclusion_response_of_yojson
      ~error_deserializer
end

module DescribeImageReplicationStatus = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_replication_status_request) =
    let input = Json_serializers.describe_image_replication_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageReplicationStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_replication_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_replication_status_request) =
    let input = Json_serializers.describe_image_replication_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageReplicationStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_replication_status_response_of_yojson
      ~error_deserializer
end

module DescribeImages = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_images_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_images_response_of_yojson ~error_deserializer
end

module DescribeImageScanFindings = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ScanNotFoundException _ -> "com.amazonaws.ecr#ScanNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ScanNotFoundException" ->
          `ScanNotFoundException (Json_deserializers.scan_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_scan_findings_request) =
    let input = Json_serializers.describe_image_scan_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageScanFindings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_image_scan_findings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_scan_findings_request) =
    let input = Json_serializers.describe_image_scan_findings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageScanFindings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_image_scan_findings_response_of_yojson
      ~error_deserializer
end

module DescribeImageSigningStatus = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_signing_status_request) =
    let input = Json_serializers.describe_image_signing_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageSigningStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_signing_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_signing_status_request) =
    let input = Json_serializers.describe_image_signing_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeImageSigningStatus" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_signing_status_response_of_yojson
      ~error_deserializer
end

module DescribePullThroughCacheRules = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `PullThroughCacheRuleNotFoundException _ ->
        "com.amazonaws.ecr#PullThroughCacheRuleNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PullThroughCacheRuleNotFoundException" ->
          `PullThroughCacheRuleNotFoundException
            (Json_deserializers.pull_through_cache_rule_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pull_through_cache_rules_request) =
    let input = Json_serializers.describe_pull_through_cache_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribePullThroughCacheRules" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_pull_through_cache_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pull_through_cache_rules_request) =
    let input = Json_serializers.describe_pull_through_cache_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribePullThroughCacheRules" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_pull_through_cache_rules_response_of_yojson
      ~error_deserializer
end

module DescribeRegistry = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_registry_request) =
    let input = Json_serializers.describe_registry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRegistry" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registry_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registry_request) =
    let input = Json_serializers.describe_registry_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRegistry" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registry_response_of_yojson
      ~error_deserializer
end

module DescribeRepositories = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_repositories_request) =
    let input = Json_serializers.describe_repositories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRepositories" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_repositories_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_repositories_request) =
    let input = Json_serializers.describe_repositories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRepositories" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_repositories_response_of_yojson
      ~error_deserializer
end

module DescribeRepositoryCreationTemplates = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_repository_creation_templates_request) =
    let input = Json_serializers.describe_repository_creation_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRepositoryCreationTemplates"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_repository_creation_templates_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_repository_creation_templates_request) =
    let input = Json_serializers.describe_repository_creation_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.DescribeRepositoryCreationTemplates"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_repository_creation_templates_response_of_yojson
      ~error_deserializer
end

module GetAccountSetting = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_setting_request) =
    let input = Json_serializers.get_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_setting_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_setting_request) =
    let input = Json_serializers.get_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_setting_response_of_yojson
      ~error_deserializer
end

module GetAuthorizationToken = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_authorization_token_request) =
    let input = Json_serializers.get_authorization_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetAuthorizationToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_authorization_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_authorization_token_request) =
    let input = Json_serializers.get_authorization_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetAuthorizationToken" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_authorization_token_response_of_yojson
      ~error_deserializer
end

module GetDownloadUrlForLayer = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LayerInaccessibleException _ -> "com.amazonaws.ecr#LayerInaccessibleException"
    | `LayersNotFoundException _ -> "com.amazonaws.ecr#LayersNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnableToGetUpstreamLayerException _ -> "com.amazonaws.ecr#UnableToGetUpstreamLayerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LayerInaccessibleException" ->
          `LayerInaccessibleException
            (Json_deserializers.layer_inaccessible_exception_of_yojson tree path)
      | _, "LayersNotFoundException" ->
          `LayersNotFoundException
            (Json_deserializers.layers_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnableToGetUpstreamLayerException" ->
          `UnableToGetUpstreamLayerException
            (Json_deserializers.unable_to_get_upstream_layer_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_download_url_for_layer_request) =
    let input = Json_serializers.get_download_url_for_layer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetDownloadUrlForLayer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_download_url_for_layer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_download_url_for_layer_request) =
    let input = Json_serializers.get_download_url_for_layer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetDownloadUrlForLayer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_download_url_for_layer_response_of_yojson
      ~error_deserializer
end

module GetLifecyclePolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LifecyclePolicyNotFoundException _ -> "com.amazonaws.ecr#LifecyclePolicyNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LifecyclePolicyNotFoundException" ->
          `LifecyclePolicyNotFoundException
            (Json_deserializers.lifecycle_policy_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_lifecycle_policy_request) =
    let input = Json_serializers.get_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lifecycle_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lifecycle_policy_request) =
    let input = Json_serializers.get_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module GetLifecyclePolicyPreview = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LifecyclePolicyPreviewNotFoundException _ ->
        "com.amazonaws.ecr#LifecyclePolicyPreviewNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LifecyclePolicyPreviewNotFoundException" ->
          `LifecyclePolicyPreviewNotFoundException
            (Json_deserializers.lifecycle_policy_preview_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_lifecycle_policy_preview_request) =
    let input = Json_serializers.get_lifecycle_policy_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicyPreview" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_lifecycle_policy_preview_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_lifecycle_policy_preview_request) =
    let input = Json_serializers.get_lifecycle_policy_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicyPreview" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_lifecycle_policy_preview_response_of_yojson
      ~error_deserializer
end

module GetRegistryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RegistryPolicyNotFoundException _ -> "com.amazonaws.ecr#RegistryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RegistryPolicyNotFoundException" ->
          `RegistryPolicyNotFoundException
            (Json_deserializers.registry_policy_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_registry_policy_request) =
    let input = Json_serializers.get_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRegistryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_registry_policy_request) =
    let input = Json_serializers.get_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRegistryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_policy_response_of_yojson
      ~error_deserializer
end

module GetRegistryScanningConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_registry_scanning_configuration_request) =
    let input = Json_serializers.get_registry_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRegistryScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_scanning_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_registry_scanning_configuration_request) =
    let input = Json_serializers.get_registry_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRegistryScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_scanning_configuration_response_of_yojson
      ~error_deserializer
end

module GetRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `RepositoryPolicyNotFoundException _ -> "com.amazonaws.ecr#RepositoryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "RepositoryPolicyNotFoundException" ->
          `RepositoryPolicyNotFoundException
            (Json_deserializers.repository_policy_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_policy_request) =
    let input = Json_serializers.get_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_repository_policy_request) =
    let input = Json_serializers.get_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_repository_policy_response_of_yojson
      ~error_deserializer
end

module GetSigningConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `SigningConfigurationNotFoundException _ ->
        "com.amazonaws.ecr#SigningConfigurationNotFoundException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "SigningConfigurationNotFoundException" ->
          `SigningConfigurationNotFoundException
            (Json_deserializers.signing_configuration_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_signing_configuration_request) =
    let input = Json_serializers.get_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetSigningConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_signing_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_signing_configuration_request) =
    let input = Json_serializers.get_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.GetSigningConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_signing_configuration_response_of_yojson
      ~error_deserializer
end

module InitiateLayerUpload = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : initiate_layer_upload_request) =
    let input = Json_serializers.initiate_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.InitiateLayerUpload" ~service ~context
      ~input ~output_deserializer:Json_deserializers.initiate_layer_upload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : initiate_layer_upload_request) =
    let input = Json_serializers.initiate_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.InitiateLayerUpload" ~service ~context
      ~input ~output_deserializer:Json_deserializers.initiate_layer_upload_response_of_yojson
      ~error_deserializer
end

module ListImageReferrers = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnableToListUpstreamImageReferrersException _ ->
        "com.amazonaws.ecr#UnableToListUpstreamImageReferrersException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnableToListUpstreamImageReferrersException" ->
          `UnableToListUpstreamImageReferrersException
            (Json_deserializers.unable_to_list_upstream_image_referrers_exception_of_yojson tree
               path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_image_referrers_request) =
    let input = Json_serializers.list_image_referrers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListImageReferrers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_image_referrers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_image_referrers_request) =
    let input = Json_serializers.list_image_referrers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListImageReferrers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_image_referrers_response_of_yojson
      ~error_deserializer
end

module ListImages = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_images_request) =
    let input = Json_serializers.list_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_images_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_images_request) =
    let input = Json_serializers.list_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_images_response_of_yojson ~error_deserializer
end

module ListPullTimeUpdateExclusions = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pull_time_update_exclusions_request) =
    let input = Json_serializers.list_pull_time_update_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListPullTimeUpdateExclusions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pull_time_update_exclusions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pull_time_update_exclusions_request) =
    let input = Json_serializers.list_pull_time_update_exclusions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListPullTimeUpdateExclusions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pull_time_update_exclusions_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutAccountSetting = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_account_setting_request) =
    let input = Json_serializers.put_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_account_setting_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_account_setting_request) =
    let input = Json_serializers.put_account_setting_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutAccountSetting" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_account_setting_response_of_yojson
      ~error_deserializer
end

module PutImage = struct
  let error_to_string = function
    | `ImageAlreadyExistsException _ -> "com.amazonaws.ecr#ImageAlreadyExistsException"
    | `ImageDigestDoesNotMatchException _ -> "com.amazonaws.ecr#ImageDigestDoesNotMatchException"
    | `ImageTagAlreadyExistsException _ -> "com.amazonaws.ecr#ImageTagAlreadyExistsException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `LayersNotFoundException _ -> "com.amazonaws.ecr#LayersNotFoundException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ReferencedImagesNotFoundException _ -> "com.amazonaws.ecr#ReferencedImagesNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageAlreadyExistsException" ->
          `ImageAlreadyExistsException
            (Json_deserializers.image_already_exists_exception_of_yojson tree path)
      | _, "ImageDigestDoesNotMatchException" ->
          `ImageDigestDoesNotMatchException
            (Json_deserializers.image_digest_does_not_match_exception_of_yojson tree path)
      | _, "ImageTagAlreadyExistsException" ->
          `ImageTagAlreadyExistsException
            (Json_deserializers.image_tag_already_exists_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "LayersNotFoundException" ->
          `LayersNotFoundException
            (Json_deserializers.layers_not_found_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ReferencedImagesNotFoundException" ->
          `ReferencedImagesNotFoundException
            (Json_deserializers.referenced_images_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_image_request) =
    let input = Json_serializers.put_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImage"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_image_request) =
    let input = Json_serializers.put_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_image_response_of_yojson ~error_deserializer
end

module PutImageScanningConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_image_scanning_configuration_request) =
    let input = Json_serializers.put_image_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImageScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_image_scanning_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_image_scanning_configuration_request) =
    let input = Json_serializers.put_image_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImageScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_image_scanning_configuration_response_of_yojson
      ~error_deserializer
end

module PutImageTagMutability = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_image_tag_mutability_request) =
    let input = Json_serializers.put_image_tag_mutability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImageTagMutability" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_image_tag_mutability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_image_tag_mutability_request) =
    let input = Json_serializers.put_image_tag_mutability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutImageTagMutability" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_image_tag_mutability_response_of_yojson
      ~error_deserializer
end

module PutLifecyclePolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_lifecycle_policy_request) =
    let input = Json_serializers.put_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_lifecycle_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_lifecycle_policy_request) =
    let input = Json_serializers.put_lifecycle_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutLifecyclePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_lifecycle_policy_response_of_yojson
      ~error_deserializer
end

module PutRegistryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_registry_policy_request) =
    let input = Json_serializers.put_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutRegistryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_registry_policy_request) =
    let input = Json_serializers.put_registry_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutRegistryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_policy_response_of_yojson
      ~error_deserializer
end

module PutRegistryScanningConfiguration = struct
  let error_to_string = function
    | `BlockedByOrganizationPolicyException _ ->
        "com.amazonaws.ecr#BlockedByOrganizationPolicyException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "BlockedByOrganizationPolicyException" ->
          `BlockedByOrganizationPolicyException
            (Json_deserializers.blocked_by_organization_policy_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_registry_scanning_configuration_request) =
    let input = Json_serializers.put_registry_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutRegistryScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_scanning_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_registry_scanning_configuration_request) =
    let input = Json_serializers.put_registry_scanning_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutRegistryScanningConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_scanning_configuration_response_of_yojson
      ~error_deserializer
end

module PutReplicationConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_replication_configuration_request) =
    let input = Json_serializers.put_replication_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutReplicationConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_replication_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_replication_configuration_request) =
    let input = Json_serializers.put_replication_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutReplicationConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_replication_configuration_response_of_yojson
      ~error_deserializer
end

module PutSigningConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_signing_configuration_request) =
    let input = Json_serializers.put_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutSigningConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_signing_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_signing_configuration_request) =
    let input = Json_serializers.put_signing_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.PutSigningConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_signing_configuration_response_of_yojson
      ~error_deserializer
end

module RegisterPullTimeUpdateExclusion = struct
  let error_to_string = function
    | `ExclusionAlreadyExistsException _ -> "com.amazonaws.ecr#ExclusionAlreadyExistsException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExclusionAlreadyExistsException" ->
          `ExclusionAlreadyExistsException
            (Json_deserializers.exclusion_already_exists_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_pull_time_update_exclusion_request) =
    let input = Json_serializers.register_pull_time_update_exclusion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.RegisterPullTimeUpdateExclusion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_pull_time_update_exclusion_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_pull_time_update_exclusion_request) =
    let input = Json_serializers.register_pull_time_update_exclusion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.RegisterPullTimeUpdateExclusion" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_pull_time_update_exclusion_response_of_yojson
      ~error_deserializer
end

module SetRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_repository_policy_request) =
    let input = Json_serializers.set_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.SetRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.set_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_repository_policy_request) =
    let input = Json_serializers.set_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.SetRepositoryPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.set_repository_policy_response_of_yojson
      ~error_deserializer
end

module StartImageScan = struct
  let error_to_string = function
    | `ImageArchivedException _ -> "com.amazonaws.ecr#ImageArchivedException"
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnsupportedImageTypeException _ -> "com.amazonaws.ecr#UnsupportedImageTypeException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageArchivedException" ->
          `ImageArchivedException (Json_deserializers.image_archived_exception_of_yojson tree path)
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedImageTypeException" ->
          `UnsupportedImageTypeException
            (Json_deserializers.unsupported_image_type_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_image_scan_request) =
    let input = Json_serializers.start_image_scan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.StartImageScan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_image_scan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_image_scan_request) =
    let input = Json_serializers.start_image_scan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.StartImageScan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_image_scan_response_of_yojson
      ~error_deserializer
end

module StartLifecyclePolicyPreview = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `LifecyclePolicyNotFoundException _ -> "com.amazonaws.ecr#LifecyclePolicyNotFoundException"
    | `LifecyclePolicyPreviewInProgressException _ ->
        "com.amazonaws.ecr#LifecyclePolicyPreviewInProgressException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LifecyclePolicyNotFoundException" ->
          `LifecyclePolicyNotFoundException
            (Json_deserializers.lifecycle_policy_not_found_exception_of_yojson tree path)
      | _, "LifecyclePolicyPreviewInProgressException" ->
          `LifecyclePolicyPreviewInProgressException
            (Json_deserializers.lifecycle_policy_preview_in_progress_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_lifecycle_policy_preview_request) =
    let input = Json_serializers.start_lifecycle_policy_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.StartLifecyclePolicyPreview" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_lifecycle_policy_preview_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_lifecycle_policy_preview_request) =
    let input = Json_serializers.start_lifecycle_policy_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.StartLifecyclePolicyPreview" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_lifecycle_policy_preview_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecr#InvalidTagParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecr#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecr#InvalidTagParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecr#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateImageStorageClass = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecr#ImageNotFoundException"
    | `ImageStorageClassUpdateNotSupportedException _ ->
        "com.amazonaws.ecr#ImageStorageClassUpdateNotSupportedException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ImageNotFoundException" ->
          `ImageNotFoundException (Json_deserializers.image_not_found_exception_of_yojson tree path)
      | _, "ImageStorageClassUpdateNotSupportedException" ->
          `ImageStorageClassUpdateNotSupportedException
            (Json_deserializers.image_storage_class_update_not_supported_exception_of_yojson tree
               path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_image_storage_class_request) =
    let input = Json_serializers.update_image_storage_class_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdateImageStorageClass" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_image_storage_class_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_image_storage_class_request) =
    let input = Json_serializers.update_image_storage_class_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdateImageStorageClass" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_image_storage_class_response_of_yojson
      ~error_deserializer
end

module UpdatePullThroughCacheRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `PullThroughCacheRuleNotFoundException _ ->
        "com.amazonaws.ecr#PullThroughCacheRuleNotFoundException"
    | `SecretNotFoundException _ -> "com.amazonaws.ecr#SecretNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UnableToAccessSecretException _ -> "com.amazonaws.ecr#UnableToAccessSecretException"
    | `UnableToDecryptSecretValueException _ ->
        "com.amazonaws.ecr#UnableToDecryptSecretValueException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PullThroughCacheRuleNotFoundException" ->
          `PullThroughCacheRuleNotFoundException
            (Json_deserializers.pull_through_cache_rule_not_found_exception_of_yojson tree path)
      | _, "SecretNotFoundException" ->
          `SecretNotFoundException
            (Json_deserializers.secret_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnableToAccessSecretException" ->
          `UnableToAccessSecretException
            (Json_deserializers.unable_to_access_secret_exception_of_yojson tree path)
      | _, "UnableToDecryptSecretValueException" ->
          `UnableToDecryptSecretValueException
            (Json_deserializers.unable_to_decrypt_secret_value_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pull_through_cache_rule_request) =
    let input = Json_serializers.update_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_through_cache_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pull_through_cache_rule_request) =
    let input = Json_serializers.update_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_pull_through_cache_rule_response_of_yojson
      ~error_deserializer
end

module UpdateRepositoryCreationTemplate = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `TemplateNotFoundException _ -> "com.amazonaws.ecr#TemplateNotFoundException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TemplateNotFoundException" ->
          `TemplateNotFoundException
            (Json_deserializers.template_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_repository_creation_template_request) =
    let input = Json_serializers.update_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdateRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_repository_creation_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_repository_creation_template_request) =
    let input = Json_serializers.update_repository_creation_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UpdateRepositoryCreationTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_repository_creation_template_response_of_yojson
      ~error_deserializer
end

module UploadLayerPart = struct
  let error_to_string = function
    | `InvalidLayerPartException _ -> "com.amazonaws.ecr#InvalidLayerPartException"
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `KmsException _ -> "com.amazonaws.ecr#KmsException"
    | `LimitExceededException _ -> "com.amazonaws.ecr#LimitExceededException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecr#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `UploadNotFoundException _ -> "com.amazonaws.ecr#UploadNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLayerPartException" ->
          `InvalidLayerPartException
            (Json_deserializers.invalid_layer_part_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "KmsException" -> `KmsException (Json_deserializers.kms_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UploadNotFoundException" ->
          `UploadNotFoundException
            (Json_deserializers.upload_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : upload_layer_part_request) =
    let input = Json_serializers.upload_layer_part_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UploadLayerPart" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_layer_part_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : upload_layer_part_request) =
    let input = Json_serializers.upload_layer_part_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.UploadLayerPart" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_layer_part_response_of_yojson
      ~error_deserializer
end

module ValidatePullThroughCacheRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecr#InvalidParameterException"
    | `PullThroughCacheRuleNotFoundException _ ->
        "com.amazonaws.ecr#PullThroughCacheRuleNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecr#ServerException"
    | `ValidationException _ -> "com.amazonaws.ecr#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "PullThroughCacheRuleNotFoundException" ->
          `PullThroughCacheRuleNotFoundException
            (Json_deserializers.pull_through_cache_rule_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : validate_pull_through_cache_rule_request) =
    let input = Json_serializers.validate_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ValidatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.validate_pull_through_cache_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : validate_pull_through_cache_rule_request) =
    let input = Json_serializers.validate_pull_through_cache_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AmazonEC2ContainerRegistry_V20150921.ValidatePullThroughCacheRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.validate_pull_through_cache_rule_response_of_yojson
      ~error_deserializer
end
