type nonrec about_text = string [@@ocaml.doc ""]

type nonrec architecture = string [@@ocaml.doc ""]

type nonrec architecture_list = architecture list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec expiration_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec base64 = string [@@ocaml.doc ""]

type nonrec authorization_data = {
  authorization_token : base64 option;
      [@ocaml.doc
        "A base64-encoded string that contains authorization data for a public Amazon ECR \
         registry. When the string is decoded, it's presented in the format [user:password] for \
         public registry authentication using [docker login].\n"]
  expires_at : expiration_timestamp option;
      [@ocaml.doc
        "The Unix time in seconds and milliseconds when the authorization token expires. \
         Authorization tokens are valid for 12 hours.\n"]
}
[@@ocaml.doc "An authorization token data object that corresponds to a public registry.\n"]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec unsupported_command_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The action isn't supported in this Region.\n"]

type nonrec server_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "These errors are usually caused by a server-side issue.\n"]

type nonrec repository_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified repository can't be found. Check the spelling of the specified repository and \
   ensure that you're performing operations on the correct registry.\n"]

type nonrec registry_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The registry doesn't exist.\n"]

type nonrec invalid_parameter_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified parameter is invalid. Review the available parameters for the API request.\n"]

type nonrec layer_failure_reason = string [@@ocaml.doc ""]

type nonrec layer_failure_code =
  | InvalidLayerDigest [@ocaml.doc ""]
  | MissingLayerDigest [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec batched_operation_layer_digest = string [@@ocaml.doc ""]

type nonrec layer_failure = {
  layer_digest : batched_operation_layer_digest option;
      [@ocaml.doc "The layer digest that's associated with the failure.\n"]
  failure_code : layer_failure_code option;
      [@ocaml.doc "The failure code that's associated with the failure.\n"]
  failure_reason : layer_failure_reason option; [@ocaml.doc "The reason for the failure.\n"]
}
[@@ocaml.doc "An object that represents an Amazon ECR image layer failure.\n"]

type nonrec layer_failure_list = layer_failure list [@@ocaml.doc ""]

type nonrec media_type = string [@@ocaml.doc ""]

type nonrec layer_size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec layer_availability = AVAILABLE [@ocaml.doc ""] | UNAVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec layer_digest = string [@@ocaml.doc ""]

type nonrec layer = {
  layer_digest : layer_digest option; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
  layer_availability : layer_availability option;
      [@ocaml.doc "The availability status of the image layer.\n"]
  layer_size : layer_size_in_bytes option; [@ocaml.doc "The size, in bytes, of the image layer.\n"]
  media_type : media_type option;
      [@ocaml.doc
        "The media type of the layer, such as [application/vnd.docker.image.rootfs.diff.tar.gzip] \
         or [application/vnd.oci.image.layer.v1.tar+gzip].\n"]
}
[@@ocaml.doc "An object that represents an Amazon ECR image layer.\n"]

type nonrec layer_list = layer list [@@ocaml.doc ""]

type nonrec batch_check_layer_availability_response = {
  layers : layer_list option;
      [@ocaml.doc
        "A list of image layer objects that correspond to the image layer references in the request.\n"]
  failures : layer_failure_list option; [@ocaml.doc "Any failures associated with the call.\n"]
}
[@@ocaml.doc ""]

type nonrec batched_operation_layer_digest_list = batched_operation_layer_digest list
[@@ocaml.doc ""]

type nonrec repository_name = string [@@ocaml.doc ""]

type nonrec registry_id_or_alias = string [@@ocaml.doc ""]

type nonrec batch_check_layer_availability_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, associated with the public \
         registry that contains the image layers to check. If you do not specify a registry, the \
         default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that's associated with the image layers to check.\n"]
  layer_digests : batched_operation_layer_digest_list;
      [@ocaml.doc "The digests of the image layers to check.\n"]
}
[@@ocaml.doc ""]

type nonrec image_failure_reason = string [@@ocaml.doc ""]

type nonrec image_failure_code =
  | InvalidImageDigest [@ocaml.doc ""]
  | InvalidImageTag [@ocaml.doc ""]
  | ImageTagDoesNotMatchDigest [@ocaml.doc ""]
  | ImageNotFound [@ocaml.doc ""]
  | MissingDigestAndTag [@ocaml.doc ""]
  | ImageReferencedByManifestList [@ocaml.doc ""]
  | KmsError [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_tag = string [@@ocaml.doc ""]

type nonrec image_digest = string [@@ocaml.doc ""]

type nonrec image_identifier = {
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
  image_tag : image_tag option; [@ocaml.doc "The tag that's used for the image.\n"]
}
[@@ocaml.doc "An object with identifying information for an Amazon ECR image.\n"]

type nonrec image_failure = {
  image_id : image_identifier option;
      [@ocaml.doc "The image ID that's associated with the failure.\n"]
  failure_code : image_failure_code option;
      [@ocaml.doc "The code that's associated with the failure.\n"]
  failure_reason : image_failure_reason option; [@ocaml.doc "The reason for the failure.\n"]
}
[@@ocaml.doc "An object that represents an Amazon ECR image failure.\n"]

type nonrec image_failure_list = image_failure list [@@ocaml.doc ""]

type nonrec image_identifier_list = image_identifier list [@@ocaml.doc ""]

type nonrec batch_delete_image_response = {
  image_ids : image_identifier_list option; [@ocaml.doc "The image IDs of the deleted images.\n"]
  failures : image_failure_list option; [@ocaml.doc "Any failures associated with the call.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_image_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, that's associated with the \
         registry that contains the image to delete. If you do not specify a registry, the default \
         public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The repository in a public registry that contains the image to delete.\n"]
  image_ids : image_identifier_list;
      [@ocaml.doc
        "A list of image ID references that correspond to images to delete. The format of the \
         [imageIds] reference is [imageTag=tag] or [imageDigest=digest].\n"]
}
[@@ocaml.doc ""]

type nonrec upload_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The upload can't be found, or the specified upload ID isn't valid for this repository.\n"]

type nonrec layer_part_too_small_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "Layer parts must be at least 5 MiB in size.\n"]

type nonrec layer_already_exists_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The image layer already exists in the associated repository.\n"]

type nonrec invalid_layer_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The layer digest calculation performed by Amazon ECR when the image layer doesn't match the \
   digest specified.\n"]

type nonrec empty_upload_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified layer upload doesn't contain any layer parts.\n"]

type nonrec upload_id = string [@@ocaml.doc ""]

type nonrec registry_id = string [@@ocaml.doc ""]

type nonrec complete_layer_upload_response = {
  registry_id : registry_id option;
      [@ocaml.doc "The public registry ID that's associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name that's associated with the request.\n"]
  upload_id : upload_id option; [@ocaml.doc "The upload ID that's associated with the layer.\n"]
  layer_digest : layer_digest option; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
}
[@@ocaml.doc ""]

type nonrec layer_digest_list = layer_digest list [@@ocaml.doc ""]

type nonrec complete_layer_upload_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, associated with the registry where \
         layers are uploaded. If you do not specify a registry, the default public registry is \
         assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository in a public registry to associate with the image layer.\n"]
  upload_id : upload_id;
      [@ocaml.doc
        "The upload ID from a previous [InitiateLayerUpload] operation to associate with the image \
         layer.\n"]
  layer_digests : layer_digest_list; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The list of tags on the repository is over the limit. The maximum number of tags that can be \
   applied to a repository is 50.\n"]

type nonrec repository_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified repository already exists in the specified registry.\n"]

type nonrec limit_exceeded_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The operation didn't succeed because it would have exceeded a service limit for your account. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/service-quotas.html}Amazon ECR \
   Service Quotas} in the Amazon Elastic Container Registry User Guide.\n"]

type nonrec invalid_tag_parameter_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An invalid parameter has been specified. Tag keys can have a maximum character length of 128 \
   characters, and tag values can have a maximum length of 256 characters.\n"]

type nonrec marketplace_certified = bool [@@ocaml.doc ""]

type nonrec usage_text = string [@@ocaml.doc ""]

type nonrec resource_url = string [@@ocaml.doc ""]

type nonrec operating_system = string [@@ocaml.doc ""]

type nonrec operating_system_list = operating_system list [@@ocaml.doc ""]

type nonrec repository_description = string [@@ocaml.doc ""]

type nonrec repository_catalog_data = {
  description : repository_description option;
      [@ocaml.doc "The short description of the repository.\n"]
  architectures : architecture_list option;
      [@ocaml.doc
        "The architecture tags that are associated with the repository.\n\n\
        \  Only supported operating system tags appear publicly in the Amazon ECR Public Gallery. \
         For more information, see [RepositoryCatalogDataInput].\n\
        \  \n\
        \   "]
  operating_systems : operating_system_list option;
      [@ocaml.doc
        "The operating system tags that are associated with the repository.\n\n\
        \  Only supported operating system tags appear publicly in the Amazon ECR Public Gallery. \
         For more information, see [RepositoryCatalogDataInput].\n\
        \  \n\
        \   "]
  logo_url : resource_url option;
      [@ocaml.doc "The URL that contains the logo that's associated with the repository.\n"]
  about_text : about_text option;
      [@ocaml.doc
        "The longform description of the contents of the repository. This text appears in the \
         repository details on the Amazon ECR Public Gallery.\n"]
  usage_text : usage_text option;
      [@ocaml.doc
        "The longform usage details of the contents of the repository. The usage text provides \
         context for users of the repository.\n"]
  marketplace_certified : marketplace_certified option;
      [@ocaml.doc
        "Indicates whether the repository is certified by Amazon Web Services Marketplace.\n"]
}
[@@ocaml.doc
  "The catalog data for a repository. This data is publicly visible in the Amazon ECR Public \
   Gallery.\n"]

type nonrec creation_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec repository = {
  repository_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the repository. The ARN contains the \
         [arn:aws:ecr] namespace, followed by the region of the repository, Amazon Web Services \
         account ID of the repository owner, repository namespace, and repository name. For \
         example, [arn:aws:ecr:region:012345678910:repository/test].\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
  repository_uri : url option;
      [@ocaml.doc
        "The URI for the repository. You can use this URI for container image [push] and [pull] \
         operations.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the repository was created.\n"]
}
[@@ocaml.doc "An object representing a repository.\n"]

type nonrec create_repository_response = {
  repository : repository option; [@ocaml.doc "The repository that was created.\n"]
  catalog_data : repository_catalog_data option; [@ocaml.doc ""]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key option;
      [@ocaml.doc
        "One part of a key-value pair that make up a tag. A [key] is a general label that acts \
         like a category for more specific tag values.\n"]
  value : tag_value option;
      [@ocaml.doc
        "The optional part of a key-value pair that make up a tag. A [value] acts as a descriptor \
         within a tag category (key).\n"]
}
[@@ocaml.doc
  "The metadata that you apply to a resource to help you categorize and organize them. Each tag \
   consists of a key and an optional value. You define both. Tag keys can have a maximum character \
   length of 128 characters, and tag values can have a maximum length of 256 characters.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec logo_image_blob = bytes [@@ocaml.doc ""]

type nonrec repository_catalog_data_input = {
  description : repository_description option;
      [@ocaml.doc
        "A short description of the contents of the repository. This text appears in both the \
         image details and also when searching for repositories on the Amazon ECR Public Gallery.\n"]
  architectures : architecture_list option;
      [@ocaml.doc
        "The system architecture that the images in the repository are compatible with. On the \
         Amazon ECR Public Gallery, the following supported architectures appear as badges on the \
         repository and are used as search filters.\n\n\
        \  If an unsupported tag is added to your repository catalog data, it's associated with \
         the repository and can be retrieved using the API but isn't discoverable in the Amazon \
         ECR Public Gallery.\n\
        \  \n\
        \    {ul\n\
        \          {-   [ARM] \n\
        \              \n\
        \               }\n\
        \          {-   [ARM 64] \n\
        \              \n\
        \               }\n\
        \          {-   [x86] \n\
        \              \n\
        \               }\n\
        \          {-   [x86-64] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  operating_systems : operating_system_list option;
      [@ocaml.doc
        "The operating systems that the images in the repository are compatible with. On the \
         Amazon ECR Public Gallery, the following supported operating systems appear as badges on \
         the repository and are used as search filters.\n\n\
        \  If an unsupported tag is added to your repository catalog data, it's associated with \
         the repository and can be retrieved using the API but isn't discoverable in the Amazon \
         ECR Public Gallery.\n\
        \  \n\
        \    {ul\n\
        \          {-   [Linux] \n\
        \              \n\
        \               }\n\
        \          {-   [Windows] \n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  logo_image_blob : logo_image_blob option;
      [@ocaml.doc
        "The base64-encoded repository logo payload.\n\n\
        \  The repository logo is only publicly visible in the Amazon ECR Public Gallery for \
         verified accounts.\n\
        \  \n\
        \   "]
  about_text : about_text option;
      [@ocaml.doc
        "A detailed description of the contents of the repository. It's publicly visible in the \
         Amazon ECR Public Gallery. The text must be in markdown format.\n"]
  usage_text : usage_text option;
      [@ocaml.doc
        "Detailed information about how to use the contents of the repository. It's publicly \
         visible in the Amazon ECR Public Gallery. The usage text provides context, support \
         information, and additional usage details for users of the repository. The text must be \
         in markdown format.\n"]
}
[@@ocaml.doc
  "An object that contains the catalog data for a repository. This data is publicly visible in the \
   Amazon ECR Public Gallery.\n"]

type nonrec create_repository_request = {
  repository_name : repository_name;
      [@ocaml.doc
        "The name to use for the repository. This appears publicly in the Amazon ECR Public \
         Gallery. The repository name can be specified on its own (for example [nginx-web-app]) or \
         prepended with a namespace to group the repository into a category (for example \
         [project-a/nginx-web-app]).\n"]
  catalog_data : repository_catalog_data_input option;
      [@ocaml.doc
        "The details about the repository that are publicly visible in the Amazon ECR Public \
         Gallery.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The metadata that you apply to each repository to help categorize and organize your \
         repositories. Each tag consists of a key and an optional value. You define both of them. \
         Tag keys can have a maximum character length of 128 characters, and tag values can have a \
         maximum length of 256 characters.\n"]
}
[@@ocaml.doc ""]

type nonrec default_registry_alias_flag = bool [@@ocaml.doc ""]

type nonrec repository_not_empty_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified repository contains images. To delete a repository that contains images, you must \
   force the deletion with the [force] parameter.\n"]

type nonrec delete_repository_response = {
  repository : repository option; [@ocaml.doc "The repository that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec force_flag = bool [@@ocaml.doc ""]

type nonrec delete_repository_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository to delete. If you do not specify a registry, the default public \
         registry is assumed.\n"]
  repository_name : repository_name; [@ocaml.doc "The name of the repository to delete.\n"]
  force : force_flag option;
      [@ocaml.doc
        " The force option can be used to delete a repository that contains images. If the force \
         option is not used, the repository must be empty prior to deletion.\n"]
}
[@@ocaml.doc ""]

type nonrec repository_policy_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified repository and registry combination doesn't have an associated repository policy.\n"]

type nonrec repository_policy_text = string [@@ocaml.doc ""]

type nonrec delete_repository_policy_response = {
  registry_id : registry_id option;
      [@ocaml.doc "The registry ID that's associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name that's associated with the request.\n"]
  policy_text : repository_policy_text option;
      [@ocaml.doc "The JSON repository policy that was deleted from the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_policy_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository policy to delete. If you do not specify a registry, the default \
         public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that's associated with the repository policy to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec push_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec image_size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec referenced_image_detail = {
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
  image_size_in_bytes : image_size_in_bytes option;
      [@ocaml.doc
        "The size, in bytes, of the image in the repository.\n\n\
        \ If the image is a manifest list, this is the max size of all manifests in the list.\n\
        \ \n\
        \   Beginning with Docker version 1.9, the Docker client compresses image layers before \
         pushing them to a V2 Docker registry. The output of the [docker images] command shows the \
         uncompressed image size, so it might return a larger image size than the image sizes that \
         are returned by [DescribeImages].\n\
        \   \n\
        \    "]
  image_pushed_at : push_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, which the current image \
         tag was pushed to the repository at.\n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc "The media type of the image manifest.\n"]
  artifact_media_type : media_type option; [@ocaml.doc "The artifact media type of the image.\n"]
}
[@@ocaml.doc
  "An object that describes the image tag details that are returned by a [DescribeImageTags] action.\n"]

type nonrec image_tag_detail = {
  image_tag : image_tag option; [@ocaml.doc "The tag that's associated with the image.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc "The time stamp that indicates when the image tag was created.\n"]
  image_detail : referenced_image_detail option;
      [@ocaml.doc "An object that describes the details of an image.\n"]
}
[@@ocaml.doc "An object that represents the image tag details for an image.\n"]

type nonrec image_tag_detail_list = image_tag_detail list [@@ocaml.doc ""]

type nonrec describe_image_tags_response = {
  image_tag_details : image_tag_detail_list option;
      [@ocaml.doc "The image tag details for the images in the requested repository.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeImageTags] request. When the \
         results of a [DescribeImageTags] request exceed [maxResults], you can use this value to \
         retrieve the next page of results. If there are no more results to return, this value is \
         [null].\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec describe_image_tags_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository where images are described. If you do not specify a registry, the \
         default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the image tag details to describe.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value that's returned from a previous paginated [DescribeImageTags] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. If there are no more results to return, this value is [null]. If you specify \
         images with [imageIds], you can't use this option.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results that's returned by [DescribeImageTags] in \
         paginated output. When this parameter is used, [DescribeImageTags] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. You can \
         see the remaining results of the initial request by sending another [DescribeImageTags] \
         request with the returned [nextToken] value. This value can be between 1 and 1000. If \
         this parameter isn't used, then [DescribeImageTags] returns up to 100 results and a \
         [nextToken] value, if applicable. If you specify images with [imageIds], you can't use \
         this option.\n"]
}
[@@ocaml.doc ""]

type nonrec image_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The image requested doesn't exist in the specified repository.\n"]

type nonrec image_tag_list = image_tag list [@@ocaml.doc ""]

type nonrec image_detail = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry where this \
         image belongs.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository where this image belongs.\n"]
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
  image_tags : image_tag_list option;
      [@ocaml.doc "The list of tags that's associated with this image.\n"]
  image_size_in_bytes : image_size_in_bytes option;
      [@ocaml.doc
        "The size, in bytes, of the image in the repository.\n\n\
        \ If the image is a manifest list, this is the max size of all manifests in the list.\n\
        \ \n\
        \   Beginning with Docker version 1.9, the Docker client compresses image layers before \
         pushing them to a V2 Docker registry. The output of the [docker images] command shows the \
         uncompressed image size, so it might return a larger image size than the image sizes that \
         are returned by [DescribeImages].\n\
        \   \n\
        \    "]
  image_pushed_at : push_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, that the current image \
         was pushed to the repository at. \n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc "The media type of the image manifest.\n"]
  artifact_media_type : media_type option; [@ocaml.doc "The artifact media type of the image.\n"]
}
[@@ocaml.doc "An object that describes an image that's returned by a [DescribeImages] operation.\n"]

type nonrec image_detail_list = image_detail list [@@ocaml.doc ""]

type nonrec describe_images_response = {
  image_details : image_detail_list option;
      [@ocaml.doc "A list of [ImageDetail] objects that contain data about the image.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeImages] request. When the results \
         of a [DescribeImages] request exceed [maxResults], you can use this value to retrieve the \
         next page of results. If there are no more results to return, this value is [null].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_images_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository where images are described. If you do not specify a registry, the \
         default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The repository that contains the images to describe.\n"]
  image_ids : image_identifier_list option;
      [@ocaml.doc "The list of image IDs for the requested repository.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value that's returned from a previous paginated [DescribeImages] request \
         where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. If there are no more results to return, this value is [null]. If you specify \
         images with [imageIds], you can't use this option.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results that's returned by [DescribeImages] in paginated \
         output. When this parameter is used, [DescribeImages] only returns [maxResults] results \
         in a single page along with a [nextToken] response element. You can see the remaining \
         results of the initial request by sending another [DescribeImages] request with the \
         returned [nextToken] value. This value can be between 1 and 1000. If this parameter isn't \
         used, then [DescribeImages] returns up to 100 results and a [nextToken] value, if \
         applicable. If you specify images with [imageIds], you can't use this option.\n"]
}
[@@ocaml.doc ""]

type nonrec primary_registry_alias_flag = bool [@@ocaml.doc ""]

type nonrec registry_alias_status =
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | REJECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec registry_alias_name = string [@@ocaml.doc ""]

type nonrec registry_alias = {
  name : registry_alias_name; [@ocaml.doc "The name of the registry alias.\n"]
  status : registry_alias_status; [@ocaml.doc "The status of the registry alias.\n"]
  primary_registry_alias : primary_registry_alias_flag;
      [@ocaml.doc
        "Indicates whether the registry alias is the primary alias for the registry. If true, the \
         alias is the primary registry alias and is displayed in both the repository URL and the \
         image URI used in the [docker pull] commands on the Amazon ECR Public Gallery.\n\n\
        \  A registry alias that isn't the primary registry alias can be used in the repository \
         URI in a [docker pull] command.\n\
        \  \n\
        \   "]
  default_registry_alias : default_registry_alias_flag;
      [@ocaml.doc
        "Indicates whether the registry alias is the default alias for the registry. When the \
         first public repository is created, your public registry is assigned a default registry \
         alias.\n"]
}
[@@ocaml.doc
  "An object representing the aliases for a public registry. A public registry is given an alias \
   when it's created. However, a custom alias can be set using the Amazon ECR console. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html}Registries} in the {i \
   Amazon Elastic Container Registry User Guide}.\n"]

type nonrec registry_alias_list = registry_alias list [@@ocaml.doc ""]

type nonrec registry_verified = bool [@@ocaml.doc ""]

type nonrec registry = {
  registry_id : registry_id;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the registry. If you do not \
         specify a registry, the default public registry is assumed.\n"]
  registry_arn : arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the public registry.\n"]
  registry_uri : url;
      [@ocaml.doc
        "The URI of a public registry. The URI contains a universal prefix and the registry alias.\n"]
  verified : registry_verified;
      [@ocaml.doc
        "Indicates whether the account is a verified Amazon Web Services Marketplace vendor. If an \
         account is verified, each public repository receives a verified account badge on the \
         Amazon ECR Public Gallery.\n"]
  aliases : registry_alias_list;
      [@ocaml.doc "An array of objects that represents the aliases for a public registry.\n"]
}
[@@ocaml.doc "The details of a public registry.\n"]

type nonrec registry_list = registry list [@@ocaml.doc ""]

type nonrec describe_registries_response = {
  registries : registry_list;
      [@ocaml.doc "An object that contains the details for a public registry.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeRepositories] request. If the \
         results of a [DescribeRepositories] request exceed [maxResults], you can use this value \
         to retrieve the next page of results. If there are no more results, this value is [null].\n"]
}
[@@ocaml.doc ""]

type nonrec describe_registries_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value that's returned from a previous paginated [DescribeRegistries] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. If there are no more results to return, this value is [null].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results that's returned by [DescribeRegistries] in \
         paginated output. When this parameter is used, [DescribeRegistries] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [DescribeRegistries] request with the returned [nextToken] value. This value can be \
         between 1 and 1000. If this parameter isn't used, then [DescribeRegistries] returns up to \
         100 results and a [nextToken] value, if applicable.\n"]
}
[@@ocaml.doc ""]

type nonrec repository_list = repository list [@@ocaml.doc ""]

type nonrec describe_repositories_response = {
  repositories : repository_list option;
      [@ocaml.doc "A list of repository objects corresponding to valid repositories.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeRepositories] request. When the \
         results of a [DescribeRepositories] request exceed [maxResults], this value can be used \
         to retrieve the next page of results. If there are no more results to return, this value \
         is [null].\n"]
}
[@@ocaml.doc ""]

type nonrec repository_name_list = repository_name list [@@ocaml.doc ""]

type nonrec describe_repositories_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the registry that contains the \
         repositories to be described. If you do not specify a registry, the default public \
         registry is assumed.\n"]
  repository_names : repository_name_list option;
      [@ocaml.doc
        "A list of repositories to describe. If this parameter is omitted, then all repositories \
         in a registry are described.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value that's returned from a previous paginated [DescribeRepositories] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. If there are no more results to return, this value is [null]. If you specify \
         repositories with [repositoryNames], you can't use this option.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results that's returned by [DescribeRepositories] in \
         paginated output. When this parameter is used, [DescribeRepositories] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. You can \
         see the remaining results of the initial request by sending another \
         [DescribeRepositories] request with the returned [nextToken] value. This value can be \
         between 1 and 1000. If this parameter isn't used, then [DescribeRepositories] returns up \
         to 100 results and a [nextToken] value, if applicable. If you specify repositories with \
         [repositoryNames], you can't use this option.\n"]
}
[@@ocaml.doc ""]

type nonrec get_authorization_token_response = {
  authorization_data : authorization_data option;
      [@ocaml.doc "An authorization token data object that corresponds to a public registry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_authorization_token_request = unit [@@ocaml.doc ""]

type nonrec registry_display_name = string [@@ocaml.doc ""]

type nonrec registry_catalog_data = {
  display_name : registry_display_name option;
      [@ocaml.doc
        "The display name for a public registry. This appears on the Amazon ECR Public Gallery.\n\n\
        \  Only accounts that have the verified account badge can have a registry display name.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc "The metadata for a public registry.\n"]

type nonrec get_registry_catalog_data_response = {
  registry_catalog_data : registry_catalog_data;
      [@ocaml.doc "The catalog metadata for the public registry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_catalog_data_request = unit [@@ocaml.doc ""]

type nonrec repository_catalog_data_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The repository catalog data doesn't exist.\n"]

type nonrec get_repository_catalog_data_response = {
  catalog_data : repository_catalog_data option;
      [@ocaml.doc "The catalog metadata for the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec get_repository_catalog_data_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the registry that contains the \
         repositories to be described. If you do not specify a registry, the default public \
         registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to retrieve the catalog metadata for.\n"]
}
[@@ocaml.doc ""]

type nonrec get_repository_policy_response = {
  registry_id : registry_id option;
      [@ocaml.doc "The registry ID that's associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name that's associated with the request.\n"]
  policy_text : repository_policy_text option;
      [@ocaml.doc
        "The repository policy text that's associated with the repository. The policy text will be \
         in JSON format.\n"]
}
[@@ocaml.doc ""]

type nonrec get_repository_policy_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry that \
         contains the repository. If you do not specify a registry, the default public registry is \
         assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository with the policy to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec image_manifest = string [@@ocaml.doc ""]

type nonrec image = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the registry containing the \
         image.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository that's associated with the image.\n"]
  image_id : image_identifier option;
      [@ocaml.doc
        "An object that contains the image tag and image digest associated with an image.\n"]
  image_manifest : image_manifest option;
      [@ocaml.doc "The image manifest that's associated with the image.\n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc "The manifest media type of the image.\n"]
}
[@@ocaml.doc "An object that represents an Amazon ECR image.\n"]

type nonrec image_already_exists_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified image has already been pushed, and there were no changes to the manifest or image \
   tag after the last push.\n"]

type nonrec image_digest_does_not_match_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified image digest doesn't match the digest that Amazon ECR calculated for the image.\n"]

type nonrec image_tag_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified image is tagged with a tag that already exists. The repository is configured for \
   tag immutability.\n"]

type nonrec part_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec initiate_layer_upload_response = {
  upload_id : upload_id option;
      [@ocaml.doc
        "The upload ID for the layer upload. This parameter is passed to further [UploadLayerPart] \
         and [CompleteLayerUpload] operations.\n"]
  part_size : part_size option;
      [@ocaml.doc "The size, in bytes, that Amazon ECR expects future layer part uploads to be.\n"]
}
[@@ocaml.doc ""]

type nonrec initiate_layer_upload_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, that's associated with the \
         registry to which you intend to upload layers. If you do not specify a registry, the \
         default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that you want to upload layers to.\n"]
}
[@@ocaml.doc ""]

type nonrec invalid_layer_part_exception = {
  registry_id : registry_id option;
      [@ocaml.doc "The Amazon Web Services account ID that's associated with the layer part.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
  upload_id : upload_id option;
      [@ocaml.doc "The upload ID that's associated with the layer part.\n"]
  last_valid_byte_received : part_size option;
      [@ocaml.doc "The position of the last byte of the layer part.\n"]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The layer part size isn't valid, or the first byte specified isn't consecutive to the last byte \
   of a previous layer part upload.\n"]

type nonrec layer_part_blob = bytes [@@ocaml.doc ""]

type nonrec layers_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified layers can't be found, or the specified layer isn't valid for this repository.\n"]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource to list the tags for. \
         Currently, the supported resource is an Amazon ECR Public repository.\n"]
}
[@@ocaml.doc ""]

type nonrec referenced_images_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The manifest list is referencing an image that doesn't exist.\n"]

type nonrec put_image_response = {
  image : image option; [@ocaml.doc "Details of the image uploaded.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, that's associated with the public \
         registry that contains the repository where the image is put. If you do not specify a \
         registry, the default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository where the image is put.\n"]
  image_manifest : image_manifest;
      [@ocaml.doc "The image manifest that corresponds to the image to be uploaded.\n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc
        "The media type of the image manifest. If you push an image manifest that doesn't contain \
         the [mediaType] field, you must specify the [imageManifestMediaType] in the request.\n"]
  image_tag : image_tag option;
      [@ocaml.doc
        "The tag to associate with the image. This parameter is required for images that use the \
         Docker Image Manifest V2 Schema 2 or Open Container Initiative (OCI) formats.\n"]
  image_digest : image_digest option;
      [@ocaml.doc "The image digest of the image manifest that corresponds to the image.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registry_catalog_data_response = {
  registry_catalog_data : registry_catalog_data;
      [@ocaml.doc "The catalog data for the public registry.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registry_catalog_data_request = {
  display_name : registry_display_name option;
      [@ocaml.doc
        "The display name for a public registry. The display name is shown as the repository \
         author in the Amazon ECR Public Gallery.\n\n\
        \  The registry display name is only publicly visible in the Amazon ECR Public Gallery for \
         verified accounts.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec put_repository_catalog_data_response = {
  catalog_data : repository_catalog_data option;
      [@ocaml.doc "The catalog data for the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec put_repository_catalog_data_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the public registry the \
         repository is in. If you do not specify a registry, the default public registry is \
         assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to create or update the catalog data for.\n"]
  catalog_data : repository_catalog_data_input;
      [@ocaml.doc
        "An object containing the catalog data for a repository. This data is publicly visible in \
         the Amazon ECR Public Gallery.\n"]
}
[@@ocaml.doc ""]

type nonrec set_repository_policy_response = {
  registry_id : registry_id option;
      [@ocaml.doc "The registry ID that's associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name that's associated with the request.\n"]
  policy_text : repository_policy_text option;
      [@ocaml.doc "The JSON repository policy text that's applied to the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec set_repository_policy_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID that's associated with the registry that contains the \
         repository. If you do not specify a registry, the default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to receive the policy.\n"]
  policy_text : repository_policy_text;
      [@ocaml.doc
        "The JSON repository policy text to apply to the repository. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html}Amazon \
         ECR Repository Policies} in the {i Amazon Elastic Container Registry User Guide}.\n"]
  force : force_flag option;
      [@ocaml.doc
        "If the policy that you want to set on a repository policy would prevent you from setting \
         another policy in the future, you must force the [SetRepositoryPolicy] operation. This \
         prevents accidental repository lockouts.\n"]
}
[@@ocaml.doc ""]

type nonrec upload_layer_part_response = {
  registry_id : registry_id option;
      [@ocaml.doc "The registry ID that's associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name that's associated with the request.\n"]
  upload_id : upload_id option; [@ocaml.doc "The upload ID that's associated with the request.\n"]
  last_byte_received : part_size option;
      [@ocaml.doc "The integer value of the last byte that's received in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec upload_layer_part_request = {
  registry_id : registry_id_or_alias option;
      [@ocaml.doc
        "The Amazon Web Services account ID, or registry alias, that's associated with the \
         registry that you're uploading layer parts to. If you do not specify a registry, the \
         default public registry is assumed.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that you're uploading layer parts to.\n"]
  upload_id : upload_id;
      [@ocaml.doc
        "The upload ID from a previous [InitiateLayerUpload] operation to associate with the layer \
         part upload.\n"]
  part_first_byte : part_size;
      [@ocaml.doc
        "The position of the first byte of the layer part witin the overall image layer.\n"]
  part_last_byte : part_size;
      [@ocaml.doc
        "The position of the last byte of the layer part within the overall image layer.\n"]
  layer_part_blob : layer_part_blob; [@ocaml.doc "The base64-encoded layer part payload.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to delete tags from. Currently, the \
         supported resource is an Amazon ECR Public repository.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The keys of the tags to be removed.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to add tags to. Currently, the supported \
         resource is an Amazon ECR Public repository.\n"]
  tags : tag_list;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have \
         a maximum character length of 128 characters, and tag values can have a maximum length of \
         256 characters.\n"]
}
[@@ocaml.doc ""]
