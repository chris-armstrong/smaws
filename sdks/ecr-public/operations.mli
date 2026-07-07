open Types

module BatchCheckLayerAvailability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RegistryNotFoundException of registry_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_check_layer_availability_request ->
    ( batch_check_layer_availability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_check_layer_availability_request ->
    ( batch_check_layer_availability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Checks the availability of one or more image layers that are within a repository in a public \
   registry. When an image is pushed to a repository, each image layer is checked to verify if it \
   has been uploaded before. If it has been uploaded, then the image layer is skipped.\n\n\
  \  This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \  \n\
  \   "]

module BatchDeleteImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_image_request ->
    ( batch_delete_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_image_request ->
    ( batch_delete_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a list of specified images that are within a repository in a public registry. Images \
   are specified with either an [imageTag] or [imageDigest].\n\n\
  \ You can remove a tag from an image by specifying the image's tag in your request. When you \
   remove the last tag from an image, the image is deleted from your repository.\n\
  \ \n\
  \  You can completely delete an image (and all of its tags) by specifying the digest of the \
   image in your request.\n\
  \  "]

module CompleteLayerUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EmptyUploadException of empty_upload_exception
    | `InvalidLayerException of invalid_layer_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LayerAlreadyExistsException of layer_already_exists_exception
    | `LayerPartTooSmallException of layer_part_too_small_exception
    | `RegistryNotFoundException of registry_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception
    | `UploadNotFoundException of upload_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    complete_layer_upload_request ->
    ( complete_layer_upload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EmptyUploadException of empty_upload_exception
      | `InvalidLayerException of invalid_layer_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LayerAlreadyExistsException of layer_already_exists_exception
      | `LayerPartTooSmallException of layer_part_too_small_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception
      | `UploadNotFoundException of upload_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    complete_layer_upload_request ->
    ( complete_layer_upload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EmptyUploadException of empty_upload_exception
      | `InvalidLayerException of invalid_layer_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LayerAlreadyExistsException of layer_already_exists_exception
      | `LayerPartTooSmallException of layer_part_too_small_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception
      | `UploadNotFoundException of upload_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Informs Amazon ECR that the image layer upload is complete for a specified public registry, \
   repository name, and upload ID. You can optionally provide a [sha256] digest of the image layer \
   for data validation purposes.\n\n\
  \ When an image is pushed, the CompleteLayerUpload API is called once for each new image layer \
   to verify that the upload is complete.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module CreateRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RepositoryAlreadyExistsException of repository_already_exists_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_repository_request ->
    ( create_repository_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryAlreadyExistsException of repository_already_exists_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_repository_request ->
    ( create_repository_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RepositoryAlreadyExistsException of repository_already_exists_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a repository in a public registry. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html}Amazon ECR \
   repositories} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module DeleteRepository : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotEmptyException of repository_not_empty_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_request ->
    ( delete_repository_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotEmptyException of repository_not_empty_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_request ->
    ( delete_repository_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotEmptyException of repository_not_empty_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a repository in a public registry. If the repository contains images, you must either \
   manually delete all images in the repository or use the [force] option. This option deletes all \
   images on your behalf before deleting the repository.\n"]

module DeleteRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_policy_request ->
    ( delete_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_repository_policy_request ->
    ( delete_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the repository policy that's associated with the specified repository.\n"]

module DescribeImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageNotFoundException of image_not_found_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageNotFoundException of image_not_found_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns metadata that's related to the images in a repository in a public registry.\n\n\
  \  Beginning with Docker version 1.9, the Docker client compresses image layers before pushing \
   them to a V2 Docker registry. The output of the [docker images] command shows the uncompressed \
   image size. Therefore, it might return a larger image size than the image sizes that are \
   returned by [DescribeImages].\n\
  \  \n\
  \   "]

module DescribeImageTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_tags_request ->
    ( describe_image_tags_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_tags_request ->
    ( describe_image_tags_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the image tag details for a repository in a public registry.\n"]

module DescribeRegistries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_registries_request ->
    ( describe_registries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_registries_request ->
    ( describe_registries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns details for a public registry.\n"]

module DescribeRepositories : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_repositories_request ->
    ( describe_repositories_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_repositories_request ->
    ( describe_repositories_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes repositories that are in a public registry.\n"]

module GetAuthorizationToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_authorization_token_request ->
    ( get_authorization_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_authorization_token_request ->
    ( get_authorization_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves an authorization token. An authorization token represents your IAM authentication \
   credentials. You can use it to access any Amazon ECR registry that your IAM principal has \
   access to. The authorization token is valid for 12 hours. This API requires the \
   [ecr-public:GetAuthorizationToken] and [sts:GetServiceBearerToken] permissions.\n"]

module GetRegistryCatalogData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_registry_catalog_data_request ->
    ( get_registry_catalog_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_registry_catalog_data_request ->
    ( get_registry_catalog_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves catalog metadata for a public registry.\n"]

module GetRepositoryCatalogData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryCatalogDataNotFoundException of repository_catalog_data_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_catalog_data_request ->
    ( get_repository_catalog_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryCatalogDataNotFoundException of repository_catalog_data_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_catalog_data_request ->
    ( get_repository_catalog_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryCatalogDataNotFoundException of repository_catalog_data_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve catalog metadata for a repository in a public registry. This metadata is displayed \
   publicly in the Amazon ECR Public Gallery.\n"]

module GetRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_repository_policy_request ->
    ( get_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_repository_policy_request ->
    ( get_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `RepositoryPolicyNotFoundException of repository_policy_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the repository policy for the specified repository.\n"]

module InitiateLayerUpload : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RegistryNotFoundException of registry_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    initiate_layer_upload_request ->
    ( initiate_layer_upload_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    initiate_layer_upload_request ->
    ( initiate_layer_upload_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Notifies Amazon ECR that you intend to upload an image layer.\n\n\
  \ When an image is pushed, the InitiateLayerUpload API is called once for each image layer that \
   hasn't already been uploaded. Whether an image layer uploads is determined by the \
   BatchCheckLayerAvailability API action.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List the tags for an Amazon ECR Public resource.\n"]

module PutImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ImageAlreadyExistsException of image_already_exists_exception
    | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
    | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LayersNotFoundException of layers_not_found_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
    | `RegistryNotFoundException of registry_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_image_request ->
    ( put_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageAlreadyExistsException of image_already_exists_exception
      | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
      | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_image_request ->
    ( put_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ImageAlreadyExistsException of image_already_exists_exception
      | `ImageDigestDoesNotMatchException of image_digest_does_not_match_exception
      | `ImageTagAlreadyExistsException of image_tag_already_exists_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LayersNotFoundException of layers_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ReferencedImagesNotFoundException of referenced_images_not_found_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates the image manifest and tags that are associated with an image.\n\n\
  \ When an image is pushed and all new image layers have been uploaded, the PutImage API is \
   called once to create or update the image manifest and the tags that are associated with the \
   image.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]

module PutRegistryCatalogData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_registry_catalog_data_request ->
    ( put_registry_catalog_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_registry_catalog_data_request ->
    ( put_registry_catalog_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Create or update the catalog data for a public registry.\n"]

module PutRepositoryCatalogData : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_repository_catalog_data_request ->
    ( put_repository_catalog_data_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_repository_catalog_data_request ->
    ( put_repository_catalog_data_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates or updates the catalog data for a repository in a public registry.\n"]

module SetRepositoryPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_repository_policy_request ->
    ( set_repository_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_repository_policy_request ->
    ( set_repository_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Applies a repository policy to the specified public repository to control access permissions. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html}Amazon ECR \
   Repository Policies} in the {i Amazon Elastic Container Registry User Guide}.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [resourceArn]. If existing tags \
   on a resource aren't specified in the request parameters, they aren't changed. When a resource \
   is deleted, the tags associated with that resource are also deleted.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidTagParameterException of invalid_tag_parameter_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedCommandException of unsupported_command_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidTagParameterException of invalid_tag_parameter_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedCommandException of unsupported_command_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes specified tags from a resource.\n"]

module UploadLayerPart : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidLayerPartException of invalid_layer_part_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `LimitExceededException of limit_exceeded_exception
    | `RegistryNotFoundException of registry_not_found_exception
    | `RepositoryNotFoundException of repository_not_found_exception
    | `ServerException of server_exception
    | `UnsupportedCommandException of unsupported_command_exception
    | `UploadNotFoundException of upload_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    upload_layer_part_request ->
    ( upload_layer_part_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLayerPartException of invalid_layer_part_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception
      | `UploadNotFoundException of upload_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    upload_layer_part_request ->
    ( upload_layer_part_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLayerPartException of invalid_layer_part_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `LimitExceededException of limit_exceeded_exception
      | `RegistryNotFoundException of registry_not_found_exception
      | `RepositoryNotFoundException of repository_not_found_exception
      | `ServerException of server_exception
      | `UnsupportedCommandException of unsupported_command_exception
      | `UploadNotFoundException of upload_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Uploads an image layer part to Amazon ECR.\n\n\
  \ When an image is pushed, each new image layer is uploaded in parts. The maximum size of each \
   image layer part can be 20971520 bytes (about 20MB). The UploadLayerPart API is called once for \
   each new image layer part.\n\
  \ \n\
  \   This operation is used by the Amazon ECR proxy and is not generally used by customers for \
   pulling and pushing images. In most cases, you should use the [docker] CLI to pull, tag, and \
   push images.\n\
  \   \n\
  \    "]
