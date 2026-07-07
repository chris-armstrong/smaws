open Types
open Service_metadata

module BatchCheckLayerAvailability = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RegistryNotFoundException _ -> "com.amazonaws.ecrpublic#RegistryNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RegistryNotFoundException" ->
          `RegistryNotFoundException
            (Json_deserializers.registry_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_check_layer_availability_request) =
    let input = Json_serializers.batch_check_layer_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SpencerFrontendService.BatchCheckLayerAvailability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_check_layer_availability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_check_layer_availability_request) =
    let input = Json_serializers.batch_check_layer_availability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.BatchCheckLayerAvailability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_check_layer_availability_response_of_yojson
      ~error_deserializer
end

module BatchDeleteImage = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_image_request) =
    let input = Json_serializers.batch_delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.BatchDeleteImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_image_request) =
    let input = Json_serializers.batch_delete_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.BatchDeleteImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_image_response_of_yojson
      ~error_deserializer
end

module CompleteLayerUpload = struct
  let error_to_string = function
    | `EmptyUploadException _ -> "com.amazonaws.ecrpublic#EmptyUploadException"
    | `InvalidLayerException _ -> "com.amazonaws.ecrpublic#InvalidLayerException"
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `LayerAlreadyExistsException _ -> "com.amazonaws.ecrpublic#LayerAlreadyExistsException"
    | `LayerPartTooSmallException _ -> "com.amazonaws.ecrpublic#LayerPartTooSmallException"
    | `RegistryNotFoundException _ -> "com.amazonaws.ecrpublic#RegistryNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | `UploadNotFoundException _ -> "com.amazonaws.ecrpublic#UploadNotFoundException"
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
      | _, "LayerAlreadyExistsException" ->
          `LayerAlreadyExistsException
            (Json_deserializers.layer_already_exists_exception_of_yojson tree path)
      | _, "LayerPartTooSmallException" ->
          `LayerPartTooSmallException
            (Json_deserializers.layer_part_too_small_exception_of_yojson tree path)
      | _, "RegistryNotFoundException" ->
          `RegistryNotFoundException
            (Json_deserializers.registry_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _, "UploadNotFoundException" ->
          `UploadNotFoundException
            (Json_deserializers.upload_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : complete_layer_upload_request) =
    let input = Json_serializers.complete_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.CompleteLayerUpload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.complete_layer_upload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : complete_layer_upload_request) =
    let input = Json_serializers.complete_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.CompleteLayerUpload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.complete_layer_upload_response_of_yojson
      ~error_deserializer
end

module CreateRepository = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecrpublic#InvalidTagParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecrpublic#LimitExceededException"
    | `RepositoryAlreadyExistsException _ ->
        "com.amazonaws.ecrpublic#RepositoryAlreadyExistsException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecrpublic#TooManyTagsException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTagParameterException" ->
          `InvalidTagParameterException
            (Json_deserializers.invalid_tag_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RepositoryAlreadyExistsException" ->
          `RepositoryAlreadyExistsException
            (Json_deserializers.repository_already_exists_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_request) =
    let input = Json_serializers.create_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.CreateRepository"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_repository_request) =
    let input = Json_serializers.create_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.CreateRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_repository_response_of_yojson
      ~error_deserializer
end

module DeleteRepository = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotEmptyException _ -> "com.amazonaws.ecrpublic#RepositoryNotEmptyException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryNotEmptyException" ->
          `RepositoryNotEmptyException
            (Json_deserializers.repository_not_empty_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_request) =
    let input = Json_serializers.delete_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DeleteRepository"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_request) =
    let input = Json_serializers.delete_repository_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DeleteRepository" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_response_of_yojson
      ~error_deserializer
end

module DeleteRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `RepositoryPolicyNotFoundException _ ->
        "com.amazonaws.ecrpublic#RepositoryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_policy_request) =
    let input = Json_serializers.delete_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DeleteRepositoryPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_repository_policy_request) =
    let input = Json_serializers.delete_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DeleteRepositoryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_repository_policy_response_of_yojson
      ~error_deserializer
end

module DescribeImages = struct
  let error_to_string = function
    | `ImageNotFoundException _ -> "com.amazonaws.ecrpublic#ImageNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DescribeImages" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_images_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_images_request) =
    let input = Json_serializers.describe_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DescribeImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_images_response_of_yojson ~error_deserializer
end

module DescribeImageTags = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_tags_request) =
    let input = Json_serializers.describe_image_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DescribeImageTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_tags_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_tags_request) =
    let input = Json_serializers.describe_image_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DescribeImageTags" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_tags_response_of_yojson
      ~error_deserializer
end

module DescribeRegistries = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_registries_request) =
    let input = Json_serializers.describe_registries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DescribeRegistries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registries_request) =
    let input = Json_serializers.describe_registries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DescribeRegistries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registries_response_of_yojson
      ~error_deserializer
end

module DescribeRepositories = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_repositories_request) =
    let input = Json_serializers.describe_repositories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.DescribeRepositories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_repositories_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_repositories_request) =
    let input = Json_serializers.describe_repositories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.DescribeRepositories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_repositories_response_of_yojson
      ~error_deserializer
end

module GetAuthorizationToken = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_authorization_token_request) =
    let input = Json_serializers.get_authorization_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.GetAuthorizationToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_authorization_token_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_authorization_token_request) =
    let input = Json_serializers.get_authorization_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.GetAuthorizationToken" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_authorization_token_response_of_yojson
      ~error_deserializer
end

module GetRegistryCatalogData = struct
  let error_to_string = function
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_registry_catalog_data_request) =
    let input = Json_serializers.get_registry_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.GetRegistryCatalogData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_catalog_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_registry_catalog_data_request) =
    let input = Json_serializers.get_registry_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.GetRegistryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_registry_catalog_data_response_of_yojson
      ~error_deserializer
end

module GetRepositoryCatalogData = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryCatalogDataNotFoundException _ ->
        "com.amazonaws.ecrpublic#RepositoryCatalogDataNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RepositoryCatalogDataNotFoundException" ->
          `RepositoryCatalogDataNotFoundException
            (Json_deserializers.repository_catalog_data_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_catalog_data_request) =
    let input = Json_serializers.get_repository_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SpencerFrontendService.GetRepositoryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_catalog_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_repository_catalog_data_request) =
    let input = Json_serializers.get_repository_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.GetRepositoryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_catalog_data_response_of_yojson
      ~error_deserializer
end

module GetRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `RepositoryPolicyNotFoundException _ ->
        "com.amazonaws.ecrpublic#RepositoryPolicyNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_policy_request) =
    let input = Json_serializers.get_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.GetRepositoryPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_repository_policy_request) =
    let input = Json_serializers.get_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.GetRepositoryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_policy_response_of_yojson
      ~error_deserializer
end

module InitiateLayerUpload = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RegistryNotFoundException _ -> "com.amazonaws.ecrpublic#RegistryNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RegistryNotFoundException" ->
          `RegistryNotFoundException
            (Json_deserializers.registry_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : initiate_layer_upload_request) =
    let input = Json_serializers.initiate_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.InitiateLayerUpload"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.initiate_layer_upload_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : initiate_layer_upload_request) =
    let input = Json_serializers.initiate_layer_upload_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.InitiateLayerUpload" ~service ~context ~input
      ~output_deserializer:Json_deserializers.initiate_layer_upload_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutImage = struct
  let error_to_string = function
    | `ImageAlreadyExistsException _ -> "com.amazonaws.ecrpublic#ImageAlreadyExistsException"
    | `ImageDigestDoesNotMatchException _ ->
        "com.amazonaws.ecrpublic#ImageDigestDoesNotMatchException"
    | `ImageTagAlreadyExistsException _ -> "com.amazonaws.ecrpublic#ImageTagAlreadyExistsException"
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `LayersNotFoundException _ -> "com.amazonaws.ecrpublic#LayersNotFoundException"
    | `LimitExceededException _ -> "com.amazonaws.ecrpublic#LimitExceededException"
    | `ReferencedImagesNotFoundException _ ->
        "com.amazonaws.ecrpublic#ReferencedImagesNotFoundException"
    | `RegistryNotFoundException _ -> "com.amazonaws.ecrpublic#RegistryNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "LayersNotFoundException" ->
          `LayersNotFoundException
            (Json_deserializers.layers_not_found_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ReferencedImagesNotFoundException" ->
          `ReferencedImagesNotFoundException
            (Json_deserializers.referenced_images_not_found_exception_of_yojson tree path)
      | _, "RegistryNotFoundException" ->
          `RegistryNotFoundException
            (Json_deserializers.registry_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_image_request) =
    let input = Json_serializers.put_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.PutImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_image_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_image_request) =
    let input = Json_serializers.put_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SpencerFrontendService.PutImage"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_image_response_of_yojson
      ~error_deserializer
end

module PutRegistryCatalogData = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_registry_catalog_data_request) =
    let input = Json_serializers.put_registry_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.PutRegistryCatalogData"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_catalog_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_registry_catalog_data_request) =
    let input = Json_serializers.put_registry_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.PutRegistryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registry_catalog_data_response_of_yojson
      ~error_deserializer
end

module PutRepositoryCatalogData = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_repository_catalog_data_request) =
    let input = Json_serializers.put_repository_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SpencerFrontendService.PutRepositoryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_repository_catalog_data_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_repository_catalog_data_request) =
    let input = Json_serializers.put_repository_catalog_data_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.PutRepositoryCatalogData" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_repository_catalog_data_response_of_yojson
      ~error_deserializer
end

module SetRepositoryPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : set_repository_policy_request) =
    let input = Json_serializers.set_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.SetRepositoryPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_repository_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_repository_policy_request) =
    let input = Json_serializers.set_repository_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.SetRepositoryPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_repository_policy_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecrpublic#InvalidTagParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecrpublic#TooManyTagsException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `InvalidTagParameterException _ -> "com.amazonaws.ecrpublic#InvalidTagParameterException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `TooManyTagsException _ -> "com.amazonaws.ecrpublic#TooManyTagsException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
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
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UploadLayerPart = struct
  let error_to_string = function
    | `InvalidLayerPartException _ -> "com.amazonaws.ecrpublic#InvalidLayerPartException"
    | `InvalidParameterException _ -> "com.amazonaws.ecrpublic#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.ecrpublic#LimitExceededException"
    | `RegistryNotFoundException _ -> "com.amazonaws.ecrpublic#RegistryNotFoundException"
    | `RepositoryNotFoundException _ -> "com.amazonaws.ecrpublic#RepositoryNotFoundException"
    | `ServerException _ -> "com.amazonaws.ecrpublic#ServerException"
    | `UnsupportedCommandException _ -> "com.amazonaws.ecrpublic#UnsupportedCommandException"
    | `UploadNotFoundException _ -> "com.amazonaws.ecrpublic#UploadNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLayerPartException" ->
          `InvalidLayerPartException
            (Json_deserializers.invalid_layer_part_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "RegistryNotFoundException" ->
          `RegistryNotFoundException
            (Json_deserializers.registry_not_found_exception_of_yojson tree path)
      | _, "RepositoryNotFoundException" ->
          `RepositoryNotFoundException
            (Json_deserializers.repository_not_found_exception_of_yojson tree path)
      | _, "ServerException" ->
          `ServerException (Json_deserializers.server_exception_of_yojson tree path)
      | _, "UnsupportedCommandException" ->
          `UnsupportedCommandException
            (Json_deserializers.unsupported_command_exception_of_yojson tree path)
      | _, "UploadNotFoundException" ->
          `UploadNotFoundException
            (Json_deserializers.upload_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : upload_layer_part_request) =
    let input = Json_serializers.upload_layer_part_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SpencerFrontendService.UploadLayerPart"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_layer_part_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : upload_layer_part_request) =
    let input = Json_serializers.upload_layer_part_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SpencerFrontendService.UploadLayerPart" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upload_layer_part_response_of_yojson
      ~error_deserializer
end
