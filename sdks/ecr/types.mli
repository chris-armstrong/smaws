type nonrec arch = string [@@ocaml.doc ""]

type nonrec epoch = int [@@ocaml.doc ""]

type nonrec file_path = string [@@ocaml.doc ""]

type nonrec vulnerable_package_name = string [@@ocaml.doc ""]

type nonrec package_manager = string [@@ocaml.doc ""]

type nonrec release = string [@@ocaml.doc ""]

type nonrec source_layer_hash = string [@@ocaml.doc ""]

type nonrec version = string [@@ocaml.doc ""]

type nonrec fixed_in_version = string [@@ocaml.doc ""]

type nonrec vulnerable_package = {
  fixed_in_version : fixed_in_version option;
      [@ocaml.doc "The version of the package that contains the vulnerability fix.\n"]
  version : version option; [@ocaml.doc "The version of the vulnerable package.\n"]
  source_layer_hash : source_layer_hash option;
      [@ocaml.doc "The source layer hash of the vulnerable package.\n"]
  release : release option; [@ocaml.doc "The release of the vulnerable package.\n"]
  package_manager : package_manager option;
      [@ocaml.doc "The package manager of the vulnerable package.\n"]
  name : vulnerable_package_name option; [@ocaml.doc "The name of the vulnerable package.\n"]
  file_path : file_path option; [@ocaml.doc "The file path of the vulnerable package.\n"]
  epoch : epoch option; [@ocaml.doc "The epoch of the vulnerable package.\n"]
  arch : arch option; [@ocaml.doc "The architecture of the vulnerable package.\n"]
}
[@@ocaml.doc "Information on the vulnerable package identified by a finding.\n"]

type nonrec vulnerable_packages_list = vulnerable_package list [@@ocaml.doc ""]

type nonrec vulnerability_source_update_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec vulnerability_id = string [@@ocaml.doc ""]

type nonrec exception_message = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "There was an exception validating this request.\n"]

type nonrec pull_through_cache_rule_repository_prefix = string [@@ocaml.doc ""]

type nonrec registry_id = string [@@ocaml.doc ""]

type nonrec url = string [@@ocaml.doc ""]

type nonrec credential_arn = string [@@ocaml.doc ""]

type nonrec custom_role_arn = string [@@ocaml.doc ""]

type nonrec is_ptc_rule_valid = bool [@@ocaml.doc ""]

type nonrec ptc_validate_failure = string [@@ocaml.doc ""]

type nonrec validate_pull_through_cache_rule_response = {
  failure : ptc_validate_failure option;
      [@ocaml.doc
        "The reason the validation failed. For more details about possible causes and how to \
         address them, see \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/pull-through-cache.html}Using \
         pull through cache rules} in the {i Amazon Elastic Container Registry User Guide}.\n"]
  is_valid : is_ptc_rule_valid option;
      [@ocaml.doc
        "Whether or not the pull through cache rule was validated. If [true], Amazon ECR was able \
         to reach the upstream registry and authentication was successful. If [false], there was \
         an issue and validation failed. The [failure] reason indicates the cause.\n"]
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The upstream repository prefix associated with the pull through cache rule.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc "The ARN of the IAM role associated with the pull through cache rule.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         associated with the pull through cache rule.\n"]
  upstream_registry_url : url option;
      [@ocaml.doc "The upstream registry URL associated with the pull through cache rule.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The Amazon ECR repository prefix associated with the pull through cache rule.\n"]
}
[@@ocaml.doc ""]

type nonrec validate_pull_through_cache_rule_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The registry ID associated with the pull through cache rule. If you do not specify a \
         registry, the default registry is assumed.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix;
      [@ocaml.doc "The repository name prefix associated with the pull through cache rule.\n"]
}
[@@ocaml.doc ""]

type nonrec server_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc "These errors are usually caused by a server-side issue.\n"]

type nonrec pull_through_cache_rule_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The pull through cache rule was not found. Specify a valid pull through cache rule and try again.\n"]

type nonrec invalid_parameter_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified parameter is invalid. Review the available parameters for the API request.\n"]

type nonrec upstream_registry =
  | Chainguard [@ocaml.doc ""]
  | GitLabContainerRegistry [@ocaml.doc ""]
  | AzureContainerRegistry [@ocaml.doc ""]
  | GitHubContainerRegistry [@ocaml.doc ""]
  | DockerHub [@ocaml.doc ""]
  | K8s [@ocaml.doc ""]
  | Quay [@ocaml.doc ""]
  | EcrPublic [@ocaml.doc ""]
  | Ecr [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec upload_not_found_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The upload could not be found, or the specified upload ID is not valid for this repository.\n"]

type nonrec repository_name = string [@@ocaml.doc ""]

type nonrec upload_id = string [@@ocaml.doc ""]

type nonrec part_size = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec upload_layer_part_response = {
  last_byte_received : part_size option;
      [@ocaml.doc "The integer value of the last byte received in the request.\n"]
  upload_id : upload_id option; [@ocaml.doc "The upload ID associated with the request.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec layer_part_blob = bytes [@@ocaml.doc ""]

type nonrec upload_layer_part_request = {
  layer_part_blob : layer_part_blob; [@ocaml.doc "The base64-encoded layer part payload.\n"]
  part_last_byte : part_size;
      [@ocaml.doc
        "The position of the last byte of the layer part within the overall image layer.\n"]
  part_first_byte : part_size;
      [@ocaml.doc
        "The position of the first byte of the layer part witin the overall image layer.\n"]
  upload_id : upload_id;
      [@ocaml.doc
        "The upload ID from a previous [InitiateLayerUpload] operation to associate with the layer \
         part upload.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to which you are uploading layer parts.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to which you are \
         uploading layer parts. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec repository_not_found_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified repository could not be found. Check the spelling of the specified repository and \
   ensure that you are performing operations on the correct registry.\n"]

type nonrec limit_exceeded_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The operation did not succeed because it would have exceeded a service limit for your account. \
   For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/service-quotas.html}Amazon ECR \
   service quotas} in the Amazon Elastic Container Registry User Guide.\n"]

type nonrec kms_error = string [@@ocaml.doc ""]

type nonrec kms_exception = {
  kms_error : kms_error option; [@ocaml.doc "The error code returned by KMS.\n"]
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The operation failed due to a KMS exception.\n"]

type nonrec invalid_layer_part_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
  last_valid_byte_received : part_size option;
      [@ocaml.doc
        "The last valid byte received from the layer part upload that is associated with the \
         exception.\n"]
  upload_id : upload_id option; [@ocaml.doc "The upload ID associated with the exception.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the exception.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the exception.\n"]
}
[@@ocaml.doc
  "The layer part size is not valid, or the first byte specified is not consecutive to the last \
   byte of a previous layer part upload.\n"]

type nonrec updated_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec prefix = string [@@ocaml.doc ""]

type nonrec repository_template_description = string [@@ocaml.doc ""]

type nonrec encryption_type =
  | KMS_DSSE [@ocaml.doc ""]
  | KMS [@ocaml.doc ""]
  | AES256 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec kms_key_for_repository_creation_template = string [@@ocaml.doc ""]

type nonrec encryption_configuration_for_repository_creation_template = {
  kms_key : kms_key_for_repository_creation_template option;
      [@ocaml.doc
        "If you use the [KMS] encryption type, specify the KMS key to use for encryption. The full \
         ARN of the KMS key must be specified. The key must exist in the same Region as the \
         repository. If no key is specified, the default Amazon Web Services managed KMS key for \
         Amazon ECR will be used.\n"]
  encryption_type : encryption_type;
      [@ocaml.doc
        "The encryption type to use.\n\n\
        \ If you use the [KMS] encryption type, the contents of the repository will be encrypted \
         using server-side encryption with Key Management Service key stored in KMS. When you use \
         KMS to encrypt your data, you can either use the default Amazon Web Services managed KMS \
         key for Amazon ECR, or specify your own KMS key, which you already created. For more \
         information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html}Protecting \
         data using server-side encryption with an KMS key stored in Key Management Service \
         (SSE-KMS)} in the {i Amazon Simple Storage Service Console Developer Guide}.\n\
        \ \n\
        \  If you use the [AES256] encryption type, Amazon ECR uses server-side encryption with \
         Amazon S3-managed encryption keys which encrypts the images in the repository using an \
         AES256 encryption algorithm. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html}Protecting \
         data using server-side encryption with Amazon S3-managed encryption keys (SSE-S3)} in the \
         {i Amazon Simple Storage Service Console Developer Guide}.\n\
        \  "]
}
[@@ocaml.doc "The encryption configuration to associate with the repository creation template.\n"]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "A [value] acts as a descriptor within a tag category (key).\n"]
  key : tag_key;
      [@ocaml.doc
        "One part of a key-value pair that make up a tag. A [key] is a general label that acts \
         like a category for more specific tag values.\n"]
}
[@@ocaml.doc
  "The metadata to apply to a resource to help you categorize and organize them. Each tag consists \
   of a key and a value, both of which you define. Tag keys can have a maximum character length of \
   128 characters, and tag values can have a maximum length of 256 characters.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec image_tag_mutability =
  | MUTABLE_WITH_EXCLUSION [@ocaml.doc ""]
  | IMMUTABLE_WITH_EXCLUSION [@ocaml.doc ""]
  | IMMUTABLE [@ocaml.doc ""]
  | MUTABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_tag_mutability_exclusion_filter_type = WILDCARD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec image_tag_mutability_exclusion_filter_value = string [@@ocaml.doc ""]

type nonrec image_tag_mutability_exclusion_filter = {
  filter : image_tag_mutability_exclusion_filter_value;
      [@ocaml.doc
        "The filter value used to match image tags for exclusion from mutability settings.\n"]
  filter_type : image_tag_mutability_exclusion_filter_type;
      [@ocaml.doc
        "The type of filter to apply for excluding image tags from mutability settings.\n"]
}
[@@ocaml.doc
  "A filter that specifies which image tags should be excluded from the repository's image tag \
   mutability setting.\n"]

type nonrec image_tag_mutability_exclusion_filters = image_tag_mutability_exclusion_filter list
[@@ocaml.doc ""]

type nonrec repository_policy_text = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_text_for_repository_creation_template = string [@@ocaml.doc ""]

type nonrec rct_applied_for =
  | CREATE_ON_PUSH [@ocaml.doc ""]
  | PULL_THROUGH_CACHE [@ocaml.doc ""]
  | REPLICATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec rct_applied_for_list = rct_applied_for list [@@ocaml.doc ""]

type nonrec date = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec repository_creation_template = {
  updated_at : date option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the repository creation template was \
         last updated.\n"]
  created_at : date option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the repository creation template was \
         created.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc
        "The ARN of the role to be assumed by Amazon ECR. Amazon ECR will assume your supplied \
         role when the customRoleArn is specified. When this field isn't specified, Amazon ECR \
         will use the service-linked role for the repository creation template.\n"]
  applied_for : rct_applied_for_list option;
      [@ocaml.doc
        "A list of enumerable Strings representing the repository creation scenarios that this \
         template will apply towards. The supported scenarios are PULL_THROUGH_CACHE, REPLICATION, \
         and CREATE_ON_PUSH\n"]
  lifecycle_policy : lifecycle_policy_text_for_repository_creation_template option;
      [@ocaml.doc "The lifecycle policy to use for repositories created using the template.\n"]
  repository_policy : repository_policy_text option;
      [@ocaml.doc
        "The repository policy to apply to repositories created using the template. A repository \
         policy is a permissions policy associated with a repository to control access \
         permissions. \n"]
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags are excluded from the repository creation \
         template's image tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc
        "The tag mutability setting for the repository. If this parameter is omitted, the default \
         setting of [MUTABLE] will be used which will allow image tags to be overwritten. If \
         [IMMUTABLE] is specified, all image tags within the repository will be immutable which \
         will prevent them from being overwritten.\n"]
  resource_tags : tag_list option;
      [@ocaml.doc
        "The metadata to apply to the repository to help you categorize and organize. Each tag \
         consists of a key and an optional value, both of which you define. Tag keys can have a \
         maximum character length of 128 characters, and tag values can have a maximum length of \
         256 characters.\n"]
  encryption_configuration : encryption_configuration_for_repository_creation_template option;
      [@ocaml.doc
        "The encryption configuration associated with the repository creation template.\n"]
  description : repository_template_description option;
      [@ocaml.doc "The description associated with the repository creation template.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The repository namespace prefix associated with the repository creation template.\n"]
}
[@@ocaml.doc "The details of the repository creation template associated with the request.\n"]

type nonrec update_repository_creation_template_response = {
  repository_creation_template : repository_creation_template option;
      [@ocaml.doc "The details of the repository creation template associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec update_repository_creation_template_request = {
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc
        "The ARN of the role to be assumed by Amazon ECR. This role must be in the same account as \
         the registry that you are configuring. Amazon ECR will assume your supplied role when the \
         customRoleArn is specified. When this field isn't specified, Amazon ECR will use the \
         service-linked role for the repository creation template.\n"]
  applied_for : rct_applied_for_list option;
      [@ocaml.doc
        "Updates the list of enumerable strings representing the Amazon ECR repository creation \
         scenarios that this template will apply towards. The supported scenarios are \
         [PULL_THROUGH_CACHE], [REPLICATION], and [CREATE_ON_PUSH] \n"]
  lifecycle_policy : lifecycle_policy_text_for_repository_creation_template option;
      [@ocaml.doc
        "Updates the lifecycle policy associated with the specified repository creation template.\n"]
  repository_policy : repository_policy_text option;
      [@ocaml.doc
        "Updates the repository policy created using the template. A repository policy is a \
         permissions policy associated with a repository to control access permissions. \n"]
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags should be excluded from the repository \
         creation template's image tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc
        "Updates the tag mutability setting for the repository. If this parameter is omitted, the \
         default setting of [MUTABLE] will be used which will allow image tags to be overwritten. \
         If [IMMUTABLE] is specified, all image tags within the repository will be immutable which \
         will prevent them from being overwritten.\n"]
  resource_tags : tag_list option;
      [@ocaml.doc
        "The metadata to apply to the repository to help you categorize and organize. Each tag \
         consists of a key and an optional value, both of which you define. Tag keys can have a \
         maximum character length of 128 characters, and tag values can have a maximum length of \
         256 characters.\n"]
  encryption_configuration : encryption_configuration_for_repository_creation_template option;
      [@ocaml.doc ""]
  description : repository_template_description option;
      [@ocaml.doc "A description for the repository creation template.\n"]
  prefix : prefix;
      [@ocaml.doc
        "The repository namespace prefix that matches an existing repository creation template in \
         the registry. All repositories created using this namespace prefix will have the settings \
         defined in this template applied. For example, a prefix of [prod] would apply to all \
         repositories beginning with [prod/]. This includes a repository named [prod/team1] as \
         well as a repository named [prod/repository1].\n\n\
        \ To apply a template to all repositories in your registry that don't have an associated \
         creation template, you can use [ROOT] as the prefix.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec template_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified repository creation template can't be found. Verify the registry ID and prefix \
   and try again.\n"]

type nonrec update_pull_through_cache_rule_response = {
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The upstream repository prefix associated with the pull through cache rule.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc "The ARN of the IAM role associated with the pull through cache rule.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         associated with the pull through cache rule.\n"]
  updated_at : updated_timestamp option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the pull through cache rule was updated.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The Amazon ECR repository prefix associated with the pull through cache rule.\n"]
}
[@@ocaml.doc ""]

type nonrec update_pull_through_cache_rule_request = {
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to authenticate to \
         the ECR upstream registry. This role must be in the same account as the registry that you \
         are configuring.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that \
         identifies the credentials to authenticate to the upstream registry.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix;
      [@ocaml.doc
        "The repository name prefix to use when caching images from the source registry.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry associated with the pull \
         through cache rule. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec unable_to_decrypt_secret_value_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The secret is accessible but is unable to be decrypted. Verify the resource permisisons and try \
   again.\n"]

type nonrec unable_to_access_secret_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The secret is unable to be accessed. Verify the resource permissions for the secret and try \
   again.\n"]

type nonrec secret_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The ARN of the secret specified in the pull through cache rule was not found. Update the pull \
   through cache rule with a valid secret ARN and try again.\n"]

type nonrec image_digest = string [@@ocaml.doc ""]

type nonrec image_tag = string [@@ocaml.doc ""]

type nonrec image_identifier = {
  image_tag : image_tag option; [@ocaml.doc "The tag used for the image.\n"]
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
}
[@@ocaml.doc "An object with identifying information for an image in an Amazon ECR repository.\n"]

type nonrec image_status =
  | ACTIVATING [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_image_storage_class_response = {
  image_status : image_status option;
      [@ocaml.doc
        "The current status of the image after the call to UpdateImageStorageClass is complete. \
         Valid values are [ACTIVE], [ARCHIVED], and [ACTIVATING].\n"]
  image_id : image_identifier option; [@ocaml.doc ""]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec target_storage_class = ARCHIVE [@ocaml.doc ""] | STANDARD [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_image_storage_class_request = {
  target_storage_class : target_storage_class;
      [@ocaml.doc "The target storage class for the image.\n"]
  image_id : image_identifier; [@ocaml.doc ""]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the image to transition.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the image \
         to transition. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec image_storage_class_update_not_supported_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested image storage class update is not supported.\n"]

type nonrec image_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The image requested does not exist in the specified repository.\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The keys of the tags to be removed.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource from which to remove tags. Currently, the \
         only supported resource is an Amazon ECR repository.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The list of tags on the repository is over the limit. The maximum number of tags that can be \
   applied to a repository is 50.\n"]

type nonrec invalid_tag_parameter_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "An invalid parameter has been specified. Tag keys can have a maximum character length of 128 \
   characters, and tag values can have a maximum length of 256 characters.\n"]

type nonrec unsupported_upstream_registry_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified upstream registry isn't supported.\n"]

type nonrec unsupported_image_type_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The image is of a type that cannot be scanned.\n"]

type nonrec unable_to_list_upstream_image_referrers_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The referrer or referrers were unable to be listed using the pull through cache rule. This is \
   usually caused because of an issue with the Secrets Manager secret containing the credentials \
   for the upstream registry.\n"]

type nonrec unable_to_get_upstream_layer_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "There was an issue getting the upstream layer matching the pull through cache rule.\n"]

type nonrec unable_to_get_upstream_image_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The image or images were unable to be pulled using the pull through cache rule. This is usually \
   caused because of an issue with the Secrets Manager secret containing the credentials for the \
   upstream registry.\n"]

type nonrec type_ = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_target_storage_class = ARCHIVE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec image_count = int [@@ocaml.doc ""]

type nonrec transitioning_image_total_count = {
  image_total_count : image_count option;
      [@ocaml.doc "The total number of images transitioning to the storage class.\n"]
  target_storage_class : lifecycle_policy_target_storage_class option;
      [@ocaml.doc "The target storage class.\n"]
}
[@@ocaml.doc "The total count of images transitioning to a storage class.\n"]

type nonrec transitioning_image_total_counts = transitioning_image_total_count list [@@ocaml.doc ""]

type nonrec title = string [@@ocaml.doc ""]

type nonrec template_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The repository creation template already exists. Specify a unique prefix and try again.\n"]

type nonrec tags = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_status = ANY [@ocaml.doc ""] | UNTAGGED [@ocaml.doc ""] | TAGGED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have \
         a maximum character length of 128 characters, and tag values can have a maximum length of \
         256 characters.\n"]
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the the resource to which to add tags. Currently, the \
         only supported resource is an Amazon ECR repository.\n"]
}
[@@ocaml.doc ""]

type nonrec subject_identifier = {
  image_digest : image_digest; [@ocaml.doc "The digest of the image.\n"]
}
[@@ocaml.doc "An object that identifies an image subject.\n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec status = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_text = string [@@ocaml.doc ""]

type nonrec lifecycle_policy_preview_status =
  | FAILED [@ocaml.doc ""]
  | EXPIRED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_lifecycle_policy_preview_response = {
  status : lifecycle_policy_preview_status option;
      [@ocaml.doc "The status of the lifecycle policy preview request.\n"]
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc "The JSON repository policy text.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec start_lifecycle_policy_preview_request = {
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc
        "The policy to be evaluated against. If you do not specify a policy, the current policy \
         for the repository is used.\n"]
  repository_name : repository_name; [@ocaml.doc "The name of the repository to be evaluated.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_policy_preview_in_progress_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The previous lifecycle policy preview request has not completed. Wait and try again.\n"]

type nonrec lifecycle_policy_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The lifecycle policy could not be found, and no policy is set to the repository.\n"]

type nonrec scan_status =
  | IMAGE_ARCHIVED [@ocaml.doc ""]
  | LIMIT_EXCEEDED [@ocaml.doc ""]
  | FINDINGS_UNAVAILABLE [@ocaml.doc ""]
  | SCAN_ELIGIBILITY_EXPIRED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | UNSUPPORTED_IMAGE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scan_status_description = string [@@ocaml.doc ""]

type nonrec image_scan_status = {
  description : scan_status_description option;
      [@ocaml.doc "The description of the image scan status.\n"]
  status : scan_status option; [@ocaml.doc "The current state of an image scan.\n"]
}
[@@ocaml.doc "The current status of an image scan.\n"]

type nonrec start_image_scan_response = {
  image_scan_status : image_scan_status option; [@ocaml.doc "The current state of the scan.\n"]
  image_id : image_identifier option; [@ocaml.doc ""]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec start_image_scan_request = {
  image_id : image_identifier; [@ocaml.doc ""]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the images to scan.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to start an image scan request. If you do not specify a registry, the \
         default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec image_archived_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified image is archived and cannot be scanned.\n"]

type nonrec source = string [@@ocaml.doc ""]

type nonrec signing_status_failure_reason = string [@@ocaml.doc ""]

type nonrec signing_status_failure_code = string [@@ocaml.doc ""]

type nonrec signing_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc
  "The image signing status. Possible values include [IN_PROGRESS], [COMPLETE], and [FAILED].\n"]

type nonrec signing_profile_arn = string [@@ocaml.doc ""]

type nonrec signing_repository_filter_value = string [@@ocaml.doc ""]

type nonrec signing_repository_filter_type = WILDCARD_MATCH [@ocaml.doc ""]
[@@ocaml.doc
  "The type of filter to use when determining which repositories should have their images \
   automatically signed.\n"]

type nonrec signing_repository_filter = {
  filter_type : signing_repository_filter_type;
      [@ocaml.doc
        "The type of filter to apply. Currently, only [WILDCARD_MATCH] is supported, which uses \
         wildcard patterns to match repository names.\n"]
  filter : signing_repository_filter_value;
      [@ocaml.doc
        "The filter value used to match repository names. When using [WILDCARD_MATCH], the [*] \
         character matches any sequence of characters.\n\n\
        \ Examples:\n\
        \ \n\
        \  {ul\n\
        \        {-   [myapp/*] - Matches all repositories starting with [myapp/] \n\
        \            \n\
        \             }\n\
        \        {-   [*/production] - Matches all repositories ending with [/production] \n\
        \            \n\
        \             }\n\
        \        {-   [*prod*] - Matches all repositories containing [prod] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "A repository filter used to determine which repositories have their images automatically signed \
   on push. Each filter consists of a filter type and filter value.\n"]

type nonrec signing_repository_filter_list = signing_repository_filter list [@@ocaml.doc ""]

type nonrec signing_rule = {
  repository_filters : signing_repository_filter_list option;
      [@ocaml.doc
        "A list of repository filters that determine which repositories have their images signed \
         on push. If no filters are specified, all images pushed to the registry are signed using \
         the rule's signing profile. Maximum of 100 filters per rule.\n"]
  signing_profile_arn : signing_profile_arn;
      [@ocaml.doc
        "The ARN of the Amazon Web Services Signer signing profile to use for signing images that \
         match this rule. For more information about signing profiles, see \
         {{:https://docs.aws.amazon.com/signer/latest/developerguide/signing-profiles.html}Signing \
         profiles} in the {i Amazon Web Services Signer Developer Guide}.\n"]
}
[@@ocaml.doc
  "A signing rule that specifies a signing profile and optional repository filters. When an image \
   is pushed to a matching repository, a signing job is created using the specified profile.\n"]

type nonrec signing_rule_list = signing_rule list [@@ocaml.doc ""]

type nonrec signing_configuration_not_found_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified signing configuration was not found. This occurs when attempting to retrieve or \
   delete a signing configuration that does not exist.\n"]

type nonrec signing_configuration = {
  rules : signing_rule_list;
      [@ocaml.doc
        "A list of signing rules. Each rule defines a signing profile and optional repository \
         filters that determine which images are automatically signed. Maximum of 10 rules.\n"]
}
[@@ocaml.doc
  "The signing configuration for a registry, which specifies rules for automatically signing \
   images when pushed.\n"]

type nonrec severity_count = int [@@ocaml.doc ""]

type nonrec severity = string [@@ocaml.doc ""]

type nonrec set_repository_policy_response = {
  policy_text : repository_policy_text option;
      [@ocaml.doc "The JSON repository policy text applied to the repository.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec force_flag = bool [@@ocaml.doc ""]

type nonrec set_repository_policy_request = {
  force : force_flag option;
      [@ocaml.doc
        "If the policy you are attempting to set on a repository policy would prevent you from \
         setting another policy in the future, you must force the [SetRepositoryPolicy] operation. \
         This is intended to prevent accidental repository lock outs.\n"]
  policy_text : repository_policy_text;
      [@ocaml.doc
        "The JSON repository policy text to apply to the repository. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html}Amazon \
         ECR repository policies} in the {i Amazon Elastic Container Registry User Guide}.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to receive the policy.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec scoring_vector = string [@@ocaml.doc ""]

type nonrec metric = string [@@ocaml.doc ""]

type nonrec reason = string [@@ocaml.doc ""]

type nonrec cvss_score_adjustment = {
  reason : reason option; [@ocaml.doc "The reason the CVSS score has been adjustment.\n"]
  metric : metric option; [@ocaml.doc "The metric used to adjust the CVSS score.\n"]
}
[@@ocaml.doc "Details on adjustments Amazon Inspector made to the CVSS score for a finding.\n"]

type nonrec cvss_score_adjustment_list = cvss_score_adjustment list [@@ocaml.doc ""]

type nonrec score = float [@@ocaml.doc ""]

type nonrec cvss_score_details = {
  version : version option; [@ocaml.doc "The CVSS version used in scoring.\n"]
  scoring_vector : scoring_vector option; [@ocaml.doc "The vector for the CVSS score.\n"]
  score_source : source option; [@ocaml.doc "The source for the CVSS score.\n"]
  score : score option; [@ocaml.doc "The CVSS score.\n"]
  adjustments : cvss_score_adjustment_list option;
      [@ocaml.doc
        "An object that contains details about adjustment Amazon Inspector made to the CVSS score.\n"]
}
[@@ocaml.doc "Information about the CVSS score.\n"]

type nonrec score_details = {
  cvss : cvss_score_details option;
      [@ocaml.doc "An object that contains details about the CVSS score given to a finding.\n"]
}
[@@ocaml.doc "Information about the Amazon Inspector score given to a finding.\n"]

type nonrec scanning_repository_filter_value = string [@@ocaml.doc ""]

type nonrec scanning_repository_filter_type = WILDCARD [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scanning_repository_filter = {
  filter_type : scanning_repository_filter_type;
      [@ocaml.doc "The type associated with the filter.\n"]
  filter : scanning_repository_filter_value; [@ocaml.doc "The filter to use when scanning.\n"]
}
[@@ocaml.doc
  "The details of a scanning repository filter. For more information on how to use filters, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html#image-scanning-filters}Using \
   filters} in the {i Amazon Elastic Container Registry User Guide}.\n"]

type nonrec scanning_repository_filter_list = scanning_repository_filter list [@@ocaml.doc ""]

type nonrec scanning_configuration_repository_name_list = repository_name list [@@ocaml.doc ""]

type nonrec scanning_configuration_failure_reason = string [@@ocaml.doc ""]

type nonrec scanning_configuration_failure_code = REPOSITORY_NOT_FOUND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec scan_type = ENHANCED [@ocaml.doc ""] | BASIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scan_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec scan_on_push_flag = bool [@@ocaml.doc ""]

type nonrec scan_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified image scan could not be found. Ensure that image scanning is enabled on the \
   repository and try again.\n"]

type nonrec scan_frequency =
  | MANUAL [@ocaml.doc ""]
  | CONTINUOUS_SCAN [@ocaml.doc ""]
  | SCAN_ON_PUSH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec author = string [@@ocaml.doc ""]

type nonrec image_tags_list = image_tag list [@@ocaml.doc ""]

type nonrec platform = string [@@ocaml.doc ""]

type nonrec in_use_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec aws_ecr_container_image_details = {
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository the Amazon ECR container image resides in.\n"]
  registry : registry_id option;
      [@ocaml.doc "The registry the Amazon ECR container image belongs to.\n"]
  in_use_count : in_use_count option;
      [@ocaml.doc "The number of Amazon ECS or Amazon EKS clusters currently running the image.\n"]
  last_in_use_at : date option;
      [@ocaml.doc "The most recent date and time a cluster was running the image.\n"]
  pushed_at : date option;
      [@ocaml.doc "The date and time the Amazon ECR container image was pushed.\n"]
  platform : platform option; [@ocaml.doc "The platform of the Amazon ECR container image.\n"]
  image_tags : image_tags_list option;
      [@ocaml.doc "The image tags attached to the Amazon ECR container image.\n"]
  image_hash : image_digest option;
      [@ocaml.doc "The image hash of the Amazon ECR container image.\n"]
  author : author option; [@ocaml.doc "The image author of the Amazon ECR container image.\n"]
  architecture : arch option; [@ocaml.doc "The architecture of the Amazon ECR container image.\n"]
}
[@@ocaml.doc "The image details of the Amazon ECR container image.\n"]

type nonrec resource_details = {
  aws_ecr_container_image : aws_ecr_container_image_details option;
      [@ocaml.doc
        "An object that contains details about the Amazon ECR container image involved in the \
         finding.\n"]
}
[@@ocaml.doc "Contains details about the resource involved in the finding.\n"]

type nonrec resource_id = string [@@ocaml.doc ""]

type nonrec resource = {
  type_ : type_ option; [@ocaml.doc "The type of resource.\n"]
  tags : tags option; [@ocaml.doc "The tags attached to the resource.\n"]
  id : resource_id option; [@ocaml.doc "The ID of the resource.\n"]
  details : resource_details option;
      [@ocaml.doc "An object that contains details about the resource involved in a finding.\n"]
}
[@@ocaml.doc "Details about the resource involved in a finding.\n"]

type nonrec resource_list = resource list [@@ocaml.doc ""]

type nonrec repository_scanning_configuration = {
  applied_scan_filters : scanning_repository_filter_list option;
      [@ocaml.doc "The scan filters applied to the repository.\n"]
  scan_frequency : scan_frequency option; [@ocaml.doc "The scan frequency for the repository.\n"]
  scan_on_push : scan_on_push_flag option;
      [@ocaml.doc "Whether or not scan on push is configured for the repository.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
  repository_arn : arn option; [@ocaml.doc "The ARN of the repository.\n"]
}
[@@ocaml.doc "The details of the scanning configuration for a repository.\n"]

type nonrec repository_scanning_configuration_list = repository_scanning_configuration list
[@@ocaml.doc ""]

type nonrec repository_scanning_configuration_failure = {
  failure_reason : scanning_configuration_failure_reason option;
      [@ocaml.doc "The reason for the failure.\n"]
  failure_code : scanning_configuration_failure_code option; [@ocaml.doc "The failure code.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
}
[@@ocaml.doc
  "The details about any failures associated with the scanning configuration of a repository.\n"]

type nonrec repository_scanning_configuration_failure_list =
  repository_scanning_configuration_failure list
[@@ocaml.doc ""]

type nonrec repository_policy_not_found_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified repository and registry combination does not have an associated repository policy.\n"]

type nonrec repository_not_empty_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified repository contains images. To delete a repository that contains images, you must \
   force the deletion with the [force] parameter.\n"]

type nonrec repository_name_list = repository_name list [@@ocaml.doc ""]

type nonrec creation_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec image_scanning_configuration = {
  scan_on_push : scan_on_push_flag option;
      [@ocaml.doc
        "The setting that determines whether images are scanned after being pushed to a \
         repository. If set to [true], images will be scanned after being pushed. If this \
         parameter is not specified, it will default to [false] and images will not be scanned \
         unless a scan is manually started with the \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_StartImageScan.html}API_StartImageScan} \
         API.\n"]
}
[@@ocaml.doc "The image scanning configuration for a repository.\n"]

type nonrec kms_key = string [@@ocaml.doc ""]

type nonrec encryption_configuration = {
  kms_key : kms_key option;
      [@ocaml.doc
        "If you use the [KMS] encryption type, specify the KMS key to use for encryption. The \
         alias, key ID, or full ARN of the KMS key can be specified. The key must exist in the \
         same Region as the repository. If no key is specified, the default Amazon Web Services \
         managed KMS key for Amazon ECR will be used.\n"]
  encryption_type : encryption_type;
      [@ocaml.doc
        "The encryption type to use.\n\n\
        \ If you use the [KMS] encryption type, the contents of the repository will be encrypted \
         using server-side encryption with Key Management Service key stored in KMS. When you use \
         KMS to encrypt your data, you can either use the default Amazon Web Services managed KMS \
         key for Amazon ECR, or specify your own KMS key, which you already created.\n\
        \ \n\
        \  If you use the [KMS_DSSE] encryption type, the contents of the repository will be \
         encrypted with two layers of encryption using server-side encryption with the KMS \
         Management Service key stored in KMS. Similar to the [KMS] encryption type, you can \
         either use the default Amazon Web Services managed KMS key for Amazon ECR, or specify \
         your own KMS key, which you've already created. \n\
        \  \n\
        \   If you use the [AES256] encryption type, Amazon ECR uses server-side encryption with \
         Amazon S3-managed encryption keys which encrypts the images in the repository using an \
         AES256 encryption algorithm.\n\
        \   \n\
        \    For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/encryption-at-rest.html}Amazon \
         ECR encryption at rest} in the {i Amazon Elastic Container Registry User Guide}.\n\
        \    "]
}
[@@ocaml.doc
  "The encryption configuration for the repository. This determines how the contents of your \
   repository are encrypted at rest.\n\n\
  \ By default, when no encryption configuration is set or the [AES256] encryption type is used, \
   Amazon ECR uses server-side encryption with Amazon S3-managed encryption keys which encrypts \
   your data at rest using an AES256 encryption algorithm. This does not require any action on \
   your part.\n\
  \ \n\
  \  For more control over the encryption of the contents of your repository, you can use \
   server-side encryption with Key Management Service key stored in Key Management Service (KMS) \
   to encrypt your images. For more information, see \
   {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/encryption-at-rest.html}Amazon ECR \
   encryption at rest} in the {i Amazon Elastic Container Registry User Guide}.\n\
  \  "]

type nonrec repository = {
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration for the repository. This determines how the contents of your \
         repository are encrypted at rest.\n"]
  image_scanning_configuration : image_scanning_configuration option; [@ocaml.doc ""]
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags are excluded from the repository's image \
         tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc "The tag mutability setting for the repository.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the repository was created.\n"]
  repository_uri : url option;
      [@ocaml.doc
        "The URI for the repository. You can use this URI for container image [push] and [pull] \
         operations.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository.\n"]
  repository_arn : arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the repository. The ARN contains the \
         [arn:aws:ecr] namespace, followed by the region of the repository, Amazon Web Services \
         account ID of the repository owner, repository namespace, and repository name. For \
         example, [arn:aws:ecr:region:012345678910:repository-namespace/repository-name].\n"]
}
[@@ocaml.doc "An object representing a repository.\n"]

type nonrec repository_list = repository list [@@ocaml.doc ""]

type nonrec repository_filter_value = string [@@ocaml.doc ""]

type nonrec repository_filter_type = PREFIX_MATCH [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec repository_filter = {
  filter_type : repository_filter_type;
      [@ocaml.doc
        "The repository filter type. The only supported value is [PREFIX_MATCH], which is a \
         repository name prefix specified with the [filter] parameter.\n"]
  filter : repository_filter_value;
      [@ocaml.doc
        "The repository filter details. When the [PREFIX_MATCH] filter type is specified, this \
         value is required and should be the repository name prefix to configure replication for.\n"]
}
[@@ocaml.doc
  "The filter settings used with image replication. Specifying a repository filter to a \
   replication rule provides a method for controlling which repositories in a private registry are \
   replicated. If no filters are added, the contents of all repositories are replicated.\n"]

type nonrec repository_filter_list = repository_filter list [@@ocaml.doc ""]

type nonrec repository_creation_template_list = repository_creation_template list [@@ocaml.doc ""]

type nonrec repository_already_exists_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc "The specified repository already exists in the specified registry.\n"]

type nonrec replication_status =
  | FAILED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec region = string [@@ocaml.doc ""]

type nonrec replication_destination = {
  registry_id : registry_id;
      [@ocaml.doc
        "The Amazon Web Services account ID of the Amazon ECR private registry to replicate to. \
         When configuring cross-Region replication within your own registry, specify your own \
         account ID.\n"]
  region : region; [@ocaml.doc "The Region to replicate to.\n"]
}
[@@ocaml.doc "An array of objects representing the destination for a replication rule.\n"]

type nonrec replication_destination_list = replication_destination list [@@ocaml.doc ""]

type nonrec replication_rule = {
  repository_filters : repository_filter_list option;
      [@ocaml.doc
        "An array of objects representing the filters for a replication rule. Specifying a \
         repository filter for a replication rule provides a method for controlling which \
         repositories in a private registry are replicated.\n"]
  destinations : replication_destination_list;
      [@ocaml.doc "An array of objects representing the destination for a replication rule.\n"]
}
[@@ocaml.doc
  "An array of objects representing the replication destinations and repository filters for a \
   replication configuration.\n"]

type nonrec replication_rule_list = replication_rule list [@@ocaml.doc ""]

type nonrec replication_error = string [@@ocaml.doc ""]

type nonrec replication_configuration = {
  rules : replication_rule_list;
      [@ocaml.doc
        "An array of objects representing the replication destinations and repository filters for \
         a replication configuration.\n"]
}
[@@ocaml.doc "The replication configuration for a registry.\n"]

type nonrec recommendation_text = string [@@ocaml.doc ""]

type nonrec recommendation = {
  text : recommendation_text option;
      [@ocaml.doc "The recommended course of action to remediate the finding.\n"]
  url : url option; [@ocaml.doc "The URL address to the CVE remediation recommendations.\n"]
}
[@@ocaml.doc "Details about the recommended course of action to remediate the finding.\n"]

type nonrec remediation = {
  recommendation : recommendation option;
      [@ocaml.doc
        "An object that contains information about the recommended course of action to remediate \
         the finding.\n"]
}
[@@ocaml.doc "Information on how to remediate a finding.\n"]

type nonrec related_vulnerability = string [@@ocaml.doc ""]

type nonrec related_vulnerabilities_list = related_vulnerability list [@@ocaml.doc ""]

type nonrec registry_scanning_rule = {
  repository_filters : scanning_repository_filter_list;
      [@ocaml.doc
        "The repository filters associated with the scanning configuration for a private registry.\n"]
  scan_frequency : scan_frequency;
      [@ocaml.doc
        "The frequency that scans are performed at for a private registry. When the [ENHANCED] \
         scan type is specified, the supported scan frequencies are [CONTINUOUS_SCAN] and \
         [SCAN_ON_PUSH]. When the [BASIC] scan type is specified, the [SCAN_ON_PUSH] scan \
         frequency is supported. If scan on push is not specified, then the [MANUAL] scan \
         frequency is set by default.\n"]
}
[@@ocaml.doc "The details of a scanning rule for a private registry.\n"]

type nonrec registry_scanning_rule_list = registry_scanning_rule list [@@ocaml.doc ""]

type nonrec registry_scanning_configuration = {
  rules : registry_scanning_rule_list option;
      [@ocaml.doc "The scanning rules associated with the registry.\n"]
  scan_type : scan_type option; [@ocaml.doc "The type of scanning configured for the registry.\n"]
}
[@@ocaml.doc "The scanning configuration for a private registry.\n"]

type nonrec registry_policy_text = string [@@ocaml.doc ""]

type nonrec registry_policy_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The registry doesn't have an associated registry policy.\n"]

type nonrec principal_arn = string [@@ocaml.doc ""]

type nonrec register_pull_time_update_exclusion_response = {
  created_at : creation_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, when the exclusion was \
         created.\n"]
  principal_arn : principal_arn option;
      [@ocaml.doc
        "The ARN of the IAM principal that was added to the pull time update exclusion list.\n"]
}
[@@ocaml.doc ""]

type nonrec register_pull_time_update_exclusion_request = {
  principal_arn : principal_arn;
      [@ocaml.doc
        "The ARN of the IAM principal to exclude from having image pull times recorded.\n"]
}
[@@ocaml.doc ""]

type nonrec exclusion_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified pull time update exclusion already exists for the registry.\n"]

type nonrec referenced_images_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "The manifest list is referencing an image that does not exist.\n"]

type nonrec reference_urls_list = url list [@@ocaml.doc ""]

type nonrec recorded_pull_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec put_signing_configuration_response = {
  signing_configuration : signing_configuration option;
      [@ocaml.doc "The registry's updated signing configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec put_signing_configuration_request = {
  signing_configuration : signing_configuration;
      [@ocaml.doc "The signing configuration to assign to the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec put_replication_configuration_response = {
  replication_configuration : replication_configuration option;
      [@ocaml.doc "The contents of the replication configuration for the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec put_replication_configuration_request = {
  replication_configuration : replication_configuration;
      [@ocaml.doc "An object representing the replication configuration for a registry.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registry_scanning_configuration_response = {
  registry_scanning_configuration : registry_scanning_configuration option;
      [@ocaml.doc "The scanning configuration for your registry.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registry_scanning_configuration_request = {
  rules : registry_scanning_rule_list option;
      [@ocaml.doc
        "The scanning rules to use for the registry. A scanning rule is used to determine which \
         repository filters are used and at what frequency scanning will occur.\n"]
  scan_type : scan_type option;
      [@ocaml.doc
        "The scanning type to set for the registry.\n\n\
        \ When a registry scanning configuration is not defined, by default the [BASIC] scan type \
         is used. When basic scanning is used, you may specify filters to determine which \
         individual repositories, or all repositories, are scanned when new images are pushed to \
         those repositories. Alternatively, you can do manual scans of images with basic scanning.\n\
        \ \n\
        \  When the [ENHANCED] scan type is set, Amazon Inspector provides automated vulnerability \
         scanning. You may choose between continuous scanning or scan on push and you may specify \
         filters to determine which individual repositories, or all repositories, are scanned.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec blocked_by_organization_policy_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The operation did not succeed because the account is managed by a organization policy.\n"]

type nonrec put_registry_policy_response = {
  policy_text : registry_policy_text option;
      [@ocaml.doc "The JSON policy text for your registry.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_registry_policy_request = {
  policy_text : registry_policy_text;
      [@ocaml.doc
        "The JSON policy text to apply to your registry. The policy text follows the same format \
         as IAM policy text. For more information, see \
         {{:https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html}Registry \
         permissions} in the {i Amazon Elastic Container Registry User Guide}.\n"]
}
[@@ocaml.doc ""]

type nonrec put_lifecycle_policy_response = {
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc "The JSON repository policy text.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_lifecycle_policy_request = {
  lifecycle_policy_text : lifecycle_policy_text;
      [@ocaml.doc "The JSON repository policy text to apply to the repository.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to receive the policy.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do\226\128\168 not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_tag_mutability_response = {
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "The list of filters that specify which image tags are excluded from the repository's \
         image tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc "The image tag mutability setting for the repository.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_tag_mutability_request = {
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags should be excluded from the image tag \
         mutability setting being applied.\n"]
  image_tag_mutability : image_tag_mutability;
      [@ocaml.doc
        "The tag mutability setting for the repository. If [MUTABLE] is specified, image tags can \
         be overwritten. If [IMMUTABLE] is specified, all image tags within the repository will be \
         immutable which will prevent them from being overwritten.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository in which to update the image tag mutability settings.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to update the image tag mutability settings. If you do not specify a \
         registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_scanning_configuration_response = {
  image_scanning_configuration : image_scanning_configuration option;
      [@ocaml.doc "The image scanning configuration setting for the repository.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_scanning_configuration_request = {
  image_scanning_configuration : image_scanning_configuration;
      [@ocaml.doc
        "The image scanning configuration for the repository. This setting determines whether \
         images are scanned for known vulnerabilities after being pushed to the repository.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository in which to update the image scanning configuration setting.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to update the image scanning configuration setting. If you do not \
         specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec image_manifest = string [@@ocaml.doc ""]

type nonrec media_type = string [@@ocaml.doc ""]

type nonrec image = {
  image_manifest_media_type : media_type option;
      [@ocaml.doc "The manifest media type of the image.\n"]
  image_manifest : image_manifest option;
      [@ocaml.doc "The image manifest associated with the image.\n"]
  image_id : image_identifier option;
      [@ocaml.doc "An object containing the image tag and image digest associated with an image.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository associated with the image.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry containing the image.\n"]
}
[@@ocaml.doc "An object representing an Amazon ECR image.\n"]

type nonrec put_image_response = {
  image : image option; [@ocaml.doc "Details of the image uploaded.\n"]
}
[@@ocaml.doc ""]

type nonrec put_image_request = {
  image_digest : image_digest option;
      [@ocaml.doc "The image digest of the image manifest corresponding to the image.\n"]
  image_tag : image_tag option;
      [@ocaml.doc "The tag to associate with the image. This parameter is optional.\n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc
        "The media type of the image manifest. If you push an image manifest that does not contain \
         the [mediaType] field, you must specify the [imageManifestMediaType] in the request.\n"]
  image_manifest : image_manifest;
      [@ocaml.doc "The image manifest corresponding to the image to be uploaded.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository in which to put the image.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to put the image. If you do not specify a registry, the default \
         registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec layers_not_found_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified layers could not be found, or the specified layer is not valid for this repository.\n"]

type nonrec image_tag_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified image is tagged with a tag that already exists. The repository is configured for \
   tag immutability.\n"]

type nonrec image_digest_does_not_match_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified image digest does not match the digest that Amazon ECR calculated for the image.\n"]

type nonrec image_already_exists_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified image has already been pushed, and there were no changes to the manifest or image \
   tag after the last push.\n"]

type nonrec account_setting_name = string [@@ocaml.doc ""]

type nonrec account_setting_value = string [@@ocaml.doc ""]

type nonrec put_account_setting_response = {
  value : account_setting_value option;
      [@ocaml.doc "Retrieves the value of the specified account setting.\n"]
  name : account_setting_name option; [@ocaml.doc "Retrieves the name of the account setting.\n"]
}
[@@ocaml.doc ""]

type nonrec put_account_setting_request = {
  value : account_setting_value;
      [@ocaml.doc
        "Setting value that is specified. Valid value for basic scan type: [AWS_NATIVE]. Valid \
         values for registry policy scope: [V2]. Valid values for blob mounting: [ENABLED] or \
         [DISABLED].\n"]
  name : account_setting_name;
      [@ocaml.doc
        "The name of the account setting, such as [BASIC_SCAN_TYPE_VERSION], \
         [REGISTRY_POLICY_SCOPE], or [BLOB_MOUNTING].\n"]
}
[@@ocaml.doc ""]

type nonrec push_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec pull_time_update_exclusion_list = principal_arn list [@@ocaml.doc ""]

type nonrec pull_through_cache_rule_repository_prefix_list =
  pull_through_cache_rule_repository_prefix list
[@@ocaml.doc ""]

type nonrec pull_through_cache_rule = {
  updated_at : updated_timestamp option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the pull through cache rule was last \
         updated.\n"]
  upstream_registry : upstream_registry option;
      [@ocaml.doc
        "The name of the upstream source registry associated with the pull through cache rule.\n"]
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The upstream repository prefix associated with the pull through cache rule.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc "The ARN of the IAM role associated with the pull through cache rule.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The ARN of the Secrets Manager secret associated with the pull through cache rule.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry the pull through cache \
         rule is associated with.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc "The date and time the pull through cache was created.\n"]
  upstream_registry_url : url option;
      [@ocaml.doc "The upstream registry URL associated with the pull through cache rule.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The Amazon ECR repository prefix associated with the pull through cache rule.\n"]
}
[@@ocaml.doc "The details of a pull through cache rule.\n"]

type nonrec pull_through_cache_rule_list = pull_through_cache_rule list [@@ocaml.doc ""]

type nonrec pull_through_cache_rule_already_exists_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A pull through cache rule with these settings already exists for the private registry.\n"]

type nonrec proxy_endpoint = string [@@ocaml.doc ""]

type nonrec prefix_list = prefix list [@@ocaml.doc ""]

type nonrec base_score = float [@@ocaml.doc ""]

type nonrec cvss_score = {
  version : version option; [@ocaml.doc "The version of CVSS used for the score.\n"]
  source : source option; [@ocaml.doc "The source of the CVSS score.\n"]
  scoring_vector : scoring_vector option; [@ocaml.doc "The vector string of the CVSS score.\n"]
  base_score : base_score option; [@ocaml.doc "The base CVSS score used for the finding.\n"]
}
[@@ocaml.doc "The CVSS score for a finding.\n"]

type nonrec cvss_score_list = cvss_score list [@@ocaml.doc ""]

type nonrec package_vulnerability_details = {
  vulnerable_packages : vulnerable_packages_list option;
      [@ocaml.doc "The packages impacted by this vulnerability.\n"]
  vulnerability_id : vulnerability_id option; [@ocaml.doc "The ID given to this vulnerability.\n"]
  vendor_updated_at : date option;
      [@ocaml.doc
        "The date and time the vendor last updated this vulnerability in their database.\n"]
  vendor_severity : severity option;
      [@ocaml.doc "The severity the vendor has given to this vulnerability type.\n"]
  vendor_created_at : date option;
      [@ocaml.doc
        "The date and time that this vulnerability was first added to the vendor's database.\n"]
  source_url : url option; [@ocaml.doc "A URL to the source of the vulnerability information.\n"]
  source : source option; [@ocaml.doc "The source of the vulnerability information.\n"]
  related_vulnerabilities : related_vulnerabilities_list option;
      [@ocaml.doc "One or more vulnerabilities related to the one identified in this finding.\n"]
  reference_urls : reference_urls_list option;
      [@ocaml.doc "One or more URLs that contain details about this vulnerability type.\n"]
  cvss : cvss_score_list option;
      [@ocaml.doc "An object that contains details about the CVSS score of a finding.\n"]
}
[@@ocaml.doc "Information about a package vulnerability finding.\n"]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec media_type_list = media_type list [@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that identifies the resource for which to list the tags. \
         Currently, the only supported resource is an Amazon ECR repository.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pull_time_update_exclusions_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListPullTimeUpdateExclusions] request. When \
         the results of a [ListPullTimeUpdateExclusions] request exceed [maxResults], this value \
         can be used to retrieve the next page of results. This value is [null] when there are no \
         more results to return.\n"]
  pull_time_update_exclusions : pull_time_update_exclusion_list option;
      [@ocaml.doc
        "The list of IAM principal ARNs that are excluded from having their image pull times \
         recorded.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pull_time_update_exclusions_request = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [ListPullTimeUpdateExclusions] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. This value is [null] when there are no more results to return.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of pull time update exclusion results returned by \
         [ListPullTimeUpdateExclusions] in paginated output. When this parameter is used, \
         [ListPullTimeUpdateExclusions] only returns [maxResults] results in a single page along \
         with a [nextToken] response element. The remaining results of the initial request can be \
         seen by sending another [ListPullTimeUpdateExclusions] request with the returned \
         [nextToken] value. This value can be between 1 and 1000. If this parameter is not used, \
         then [ListPullTimeUpdateExclusions] returns up to 100 results and a [nextToken] value, if \
         applicable.\n"]
}
[@@ocaml.doc ""]

type nonrec image_identifier_list = image_identifier list [@@ocaml.doc ""]

type nonrec list_images_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListImages] request. When the results of a \
         [ListImages] request exceed [maxResults], this value can be used to retrieve the next \
         page of results. This value is [null] when there are no more results to return.\n"]
  image_ids : image_identifier_list option;
      [@ocaml.doc "The list of image IDs for the requested repository.\n"]
}
[@@ocaml.doc ""]

type nonrec image_status_filter =
  | ANY [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_images_filter = {
  image_status : image_status_filter option;
      [@ocaml.doc
        "The image status with which to filter your [ListImages] results. Valid values are \
         [ACTIVE], [ARCHIVED], and [ACTIVATING]. If not specified, only images with [ACTIVE] \
         status are returned.\n"]
  tag_status : tag_status option;
      [@ocaml.doc "The tag status with which to filter your [ListImages] results.\n"]
}
[@@ocaml.doc "An object representing a filter on a [ListImages] operation.\n"]

type nonrec list_images_request = {
  filter : list_images_filter option;
      [@ocaml.doc "The filter key and value with which to filter your [ListImages] results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of image results returned by [ListImages] in paginated output. When \
         this parameter is used, [ListImages] only returns [maxResults] results in a single page \
         along with a [nextToken] response element. The remaining results of the initial request \
         can be seen by sending another [ListImages] request with the returned [nextToken] value. \
         This value can be between 1 and 1000. If this parameter is not used, then [ListImages] \
         returns up to 100 results and a [nextToken] value, if applicable.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [ListImages] request where \
         [maxResults] was used and the results exceeded the value of that parameter. Pagination \
         continues from the end of the previous results that returned the [nextToken] value. This \
         value is [null] when there are no more results to return.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  repository_name : repository_name; [@ocaml.doc "The repository with image IDs to be listed.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to list images. If you do not specify a registry, the default \
         registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec artifact_type = string [@@ocaml.doc ""]

type nonrec image_size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec annotations = (string_ * string_) list [@@ocaml.doc ""]

type nonrec artifact_status =
  | ACTIVATING [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_referrer = {
  artifact_status : artifact_status option;
      [@ocaml.doc
        "The status of the artifact. Valid values are [ACTIVE], [ARCHIVED], or [ACTIVATING].\n"]
  annotations : annotations option;
      [@ocaml.doc "A map of annotations associated with the artifact.\n"]
  size : image_size_in_bytes; [@ocaml.doc "The size, in bytes, of the artifact.\n"]
  artifact_type : artifact_type option; [@ocaml.doc "A string identifying the type of artifact.\n"]
  media_type : media_type; [@ocaml.doc "The media type of the artifact manifest.\n"]
  digest : image_digest; [@ocaml.doc "The digest of the artifact manifest.\n"]
}
[@@ocaml.doc "An object representing an artifact associated with a subject image.\n"]

type nonrec image_referrer_list = image_referrer list [@@ocaml.doc ""]

type nonrec list_image_referrers_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [ListImageReferrers] request. When the \
         results of a [ListImageReferrers] request exceed [maxResults], this value can be used to \
         retrieve the next page of results. This value is [null] when there are no more results to \
         return.\n"]
  referrers : image_referrer_list option;
      [@ocaml.doc "The list of artifacts associated with the subject image.\n"]
}
[@@ocaml.doc ""]

type nonrec artifact_type_list = artifact_type list [@@ocaml.doc ""]

type nonrec artifact_status_filter =
  | ANY [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | ARCHIVED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_image_referrers_filter = {
  artifact_status : artifact_status_filter option;
      [@ocaml.doc
        "The artifact status with which to filter your [ListImageReferrers] results. Valid values \
         are [ACTIVE], [ARCHIVED], [ACTIVATING], or [ANY]. If not specified, only artifacts with \
         [ACTIVE] status are returned.\n"]
  artifact_types : artifact_type_list option;
      [@ocaml.doc "The artifact types with which to filter your [ListImageReferrers] results.\n"]
}
[@@ocaml.doc "An object representing a filter on a [ListImageReferrers] operation.\n"]

type nonrec fifty_max_results = int [@@ocaml.doc ""]

type nonrec list_image_referrers_request = {
  max_results : fifty_max_results option;
      [@ocaml.doc
        "The maximum number of image referrer results returned by [ListImageReferrers] in \
         paginated output. When this parameter is used, [ListImageReferrers] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [ListImageReferrers] request with the returned [nextToken] value. This value can be \
         between 1 and 50. If this parameter is not used, then [ListImageReferrers] returns up to \
         20 results and a [nextToken] value, if applicable.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [ListImageReferrers] request \
         where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. This value is [null] when there are no more results to return.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  filter : list_image_referrers_filter option;
      [@ocaml.doc
        "The filter key and value with which to filter your [ListImageReferrers] results. If no \
         filter is specified, only artifacts with [ACTIVE] status are returned.\n"]
  subject_id : subject_identifier;
      [@ocaml.doc
        "An object containing the image digest of the subject image for which to retrieve \
         associated artifacts.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the subject image.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to list image referrers. If you do not specify a registry, the \
         default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec lifecycle_preview_max_results = int [@@ocaml.doc ""]

type nonrec lifecycle_policy_storage_class = STANDARD [@ocaml.doc ""] | ARCHIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lifecycle_policy_rule_priority = int [@@ocaml.doc ""]

type nonrec image_action_type = TRANSITION [@ocaml.doc ""] | EXPIRE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec lifecycle_policy_rule_action = {
  target_storage_class : lifecycle_policy_target_storage_class option;
      [@ocaml.doc
        "The target storage class for the action. This is only present when the [type] is \
         [TRANSITION.] \n"]
  type_ : image_action_type option; [@ocaml.doc "The type of action to be taken.\n"]
}
[@@ocaml.doc "The type of action to be taken.\n"]

type nonrec lifecycle_policy_preview_summary = {
  transitioning_image_total_counts : transitioning_image_total_counts option;
      [@ocaml.doc
        "The total count of images that will be transitioned to each storage class. This field is \
         only present if at least one image will be transitoned in the summary.\n"]
  expiring_image_total_count : image_count option; [@ocaml.doc "The number of expiring images.\n"]
}
[@@ocaml.doc "The summary of the lifecycle policy preview request.\n"]

type nonrec image_tag_list = image_tag list [@@ocaml.doc ""]

type nonrec lifecycle_policy_preview_result = {
  storage_class : lifecycle_policy_storage_class option;
      [@ocaml.doc "The storage class of the image.\n"]
  applied_rule_priority : lifecycle_policy_rule_priority option;
      [@ocaml.doc "The priority of the applied rule.\n"]
  action : lifecycle_policy_rule_action option; [@ocaml.doc "The type of action to be taken.\n"]
  image_pushed_at : push_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, at which the current \
         image was pushed to the repository.\n"]
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
  image_tags : image_tag_list option; [@ocaml.doc "The list of tags associated with this image.\n"]
}
[@@ocaml.doc "The result of the lifecycle policy preview.\n"]

type nonrec lifecycle_policy_preview_result_list = lifecycle_policy_preview_result list
[@@ocaml.doc ""]

type nonrec lifecycle_policy_preview_not_found_exception = {
  message : exception_message option; [@ocaml.doc ""]
}
[@@ocaml.doc "There is no dry run for this repository.\n"]

type nonrec lifecycle_policy_preview_filter = {
  tag_status : tag_status option; [@ocaml.doc "The tag status of the image.\n"]
}
[@@ocaml.doc "The filter for the lifecycle policy preview.\n"]

type nonrec layer_size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec layer_part_too_small_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc "Layer parts must be at least 5 MiB in size.\n"]

type nonrec layer_digest = string [@@ocaml.doc ""]

type nonrec layer_availability =
  | ARCHIVED [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
  | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec layer = {
  media_type : media_type option;
      [@ocaml.doc
        "The media type of the layer, such as [application/vnd.docker.image.rootfs.diff.tar.gzip] \
         or [application/vnd.oci.image.layer.v1.tar+gzip].\n"]
  layer_size : layer_size_in_bytes option; [@ocaml.doc "The size, in bytes, of the image layer.\n"]
  layer_availability : layer_availability option;
      [@ocaml.doc "The availability status of the image layer.\n"]
  layer_digest : layer_digest option; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
}
[@@ocaml.doc "An object representing an Amazon ECR image layer.\n"]

type nonrec layer_list = layer list [@@ocaml.doc ""]

type nonrec layer_inaccessible_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The specified layer is not available because it is not associated with an image. Unassociated \
   image layers may be cleaned up at any time.\n"]

type nonrec layer_failure_reason = string [@@ocaml.doc ""]

type nonrec batched_operation_layer_digest = string [@@ocaml.doc ""]

type nonrec layer_failure_code =
  | MissingLayerDigest [@ocaml.doc ""]
  | InvalidLayerDigest [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec layer_failure = {
  failure_reason : layer_failure_reason option; [@ocaml.doc "The reason for the failure.\n"]
  failure_code : layer_failure_code option;
      [@ocaml.doc "The failure code associated with the failure.\n"]
  layer_digest : batched_operation_layer_digest option;
      [@ocaml.doc "The layer digest associated with the failure.\n"]
}
[@@ocaml.doc "An object representing an Amazon ECR image layer failure.\n"]

type nonrec layer_failure_list = layer_failure list [@@ocaml.doc ""]

type nonrec layer_digest_list = layer_digest list [@@ocaml.doc ""]

type nonrec layer_already_exists_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc "The image layer already exists in the associated repository.\n"]

type nonrec last_archived_at_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_activated_at_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec invalid_layer_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc
  "The layer digest calculation performed by Amazon ECR upon receipt of the image layer does not \
   match the digest specified.\n"]

type nonrec initiate_layer_upload_response = {
  part_size : part_size option;
      [@ocaml.doc "The size, in bytes, that Amazon ECR expects future layer part uploads to be.\n"]
  upload_id : upload_id option;
      [@ocaml.doc
        "The upload ID for the layer upload. This parameter is passed to further [UploadLayerPart] \
         and [CompleteLayerUpload] operations.\n"]
}
[@@ocaml.doc ""]

type nonrec initiate_layer_upload_request = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to which you intend to upload layers.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to which you intend to \
         upload layers. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec image_signing_status = {
  status : signing_status option;
      [@ocaml.doc
        "The image's signing status. Possible values are:\n\n\
        \ {ul\n\
        \       {-   [IN_PROGRESS] - Signing is currently in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE] - The signature was successfully generated.\n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] - Signing failed. See [failureCode] and [failureReason] for details.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  failure_reason : signing_status_failure_reason option;
      [@ocaml.doc
        "A description of why signing the image failed. This field is only present if [status] is \
         [FAILED].\n"]
  failure_code : signing_status_failure_code option;
      [@ocaml.doc "The failure code, which is only present if [status] is [FAILED].\n"]
  signing_profile_arn : signing_profile_arn option;
      [@ocaml.doc
        "The ARN of the Amazon Web Services Signer signing profile used to sign the image.\n"]
}
[@@ocaml.doc "The signing status for an image. Each status corresponds to a signing profile.\n"]

type nonrec image_signing_status_list = image_signing_status list [@@ocaml.doc ""]

type nonrec finding_severity =
  | UNDEFINED [@ocaml.doc ""]
  | CRITICAL [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | INFORMATIONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec finding_severity_counts = (finding_severity * severity_count) list [@@ocaml.doc ""]

type nonrec image_scan_findings_summary = {
  finding_severity_counts : finding_severity_counts option;
      [@ocaml.doc "The image vulnerability counts, sorted by severity.\n"]
  vulnerability_source_updated_at : vulnerability_source_update_timestamp option;
      [@ocaml.doc "The time when the vulnerability data was last scanned.\n"]
  image_scan_completed_at : scan_timestamp option;
      [@ocaml.doc "The time of the last completed image scan.\n"]
}
[@@ocaml.doc "A summary of the last completed image scan.\n"]

type nonrec finding_name = string [@@ocaml.doc ""]

type nonrec finding_description = string [@@ocaml.doc ""]

type nonrec attribute_key = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute = {
  value : attribute_value option; [@ocaml.doc "The value assigned to the attribute key.\n"]
  key : attribute_key; [@ocaml.doc "The attribute key.\n"]
}
[@@ocaml.doc "This data type is used in the [ImageScanFinding] data type.\n"]

type nonrec attribute_list = attribute list [@@ocaml.doc ""]

type nonrec image_scan_finding = {
  attributes : attribute_list option;
      [@ocaml.doc "A collection of attributes of the host from which the finding is generated.\n"]
  severity : finding_severity option; [@ocaml.doc "The finding severity.\n"]
  uri : url option;
      [@ocaml.doc "A link containing additional details about the security vulnerability.\n"]
  description : finding_description option; [@ocaml.doc "The description of the finding.\n"]
  name : finding_name option;
      [@ocaml.doc "The name associated with the finding, usually a CVE number.\n"]
}
[@@ocaml.doc "Contains information about an image scan finding.\n"]

type nonrec image_scan_finding_list = image_scan_finding list [@@ocaml.doc ""]

type nonrec finding_arn = string [@@ocaml.doc ""]

type nonrec fix_available = string [@@ocaml.doc ""]

type nonrec exploit_available = string [@@ocaml.doc ""]

type nonrec enhanced_image_scan_finding = {
  exploit_available : exploit_available option;
      [@ocaml.doc "If a finding discovered in your environment has an exploit available.\n"]
  fix_available : fix_available option;
      [@ocaml.doc
        "Details on whether a fix is available through a version update. This value can be [YES], \
         [NO], or [PARTIAL]. A [PARTIAL] fix means that some, but not all, of the packages \
         identified in the finding have fixes available through updated versions.\n"]
  updated_at : date option; [@ocaml.doc "The date and time the finding was last updated at.\n"]
  type_ : type_ option; [@ocaml.doc "The type of the finding.\n"]
  title : title option; [@ocaml.doc "The title of the finding.\n"]
  status : status option; [@ocaml.doc "The status of the finding.\n"]
  severity : severity option; [@ocaml.doc "The severity of the finding.\n"]
  score_details : score_details option;
      [@ocaml.doc "An object that contains details of the Amazon Inspector score.\n"]
  score : score option; [@ocaml.doc "The Amazon Inspector score given to the finding.\n"]
  resources : resource_list option;
      [@ocaml.doc "Contains information on the resources involved in a finding.\n"]
  remediation : remediation option;
      [@ocaml.doc "An object that contains the details about how to remediate a finding.\n"]
  package_vulnerability_details : package_vulnerability_details option;
      [@ocaml.doc "An object that contains the details of a package vulnerability finding.\n"]
  last_observed_at : date option;
      [@ocaml.doc "The date and time that the finding was last observed.\n"]
  first_observed_at : date option;
      [@ocaml.doc "The date and time that the finding was first observed.\n"]
  finding_arn : finding_arn option;
      [@ocaml.doc "The Amazon Resource Number (ARN) of the finding.\n"]
  description : finding_description option; [@ocaml.doc "The description of the finding.\n"]
  aws_account_id : registry_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the image.\n"]
}
[@@ocaml.doc
  "The details of an enhanced image scan. This is returned when enhanced scanning is enabled for \
   your private registry.\n"]

type nonrec enhanced_image_scan_finding_list = enhanced_image_scan_finding list [@@ocaml.doc ""]

type nonrec image_scan_findings = {
  enhanced_findings : enhanced_image_scan_finding_list option;
      [@ocaml.doc "Details about the enhanced scan findings from Amazon Inspector.\n"]
  findings : image_scan_finding_list option; [@ocaml.doc "The findings from the image scan.\n"]
  finding_severity_counts : finding_severity_counts option;
      [@ocaml.doc "The image vulnerability counts, sorted by severity.\n"]
  vulnerability_source_updated_at : vulnerability_source_update_timestamp option;
      [@ocaml.doc "The time when the vulnerability data was last scanned.\n"]
  image_scan_completed_at : scan_timestamp option;
      [@ocaml.doc "The time of the last completed image scan.\n"]
}
[@@ocaml.doc "The details of an image scan.\n"]

type nonrec image_replication_status = {
  failure_code : replication_error option;
      [@ocaml.doc "The failure code for a replication that has failed.\n"]
  status : replication_status option; [@ocaml.doc "The image replication status.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to which the image belongs.\n"]
  region : region option; [@ocaml.doc "The destination Region for the image replication.\n"]
}
[@@ocaml.doc "The status of the replication process for an image.\n"]

type nonrec image_replication_status_list = image_replication_status list [@@ocaml.doc ""]

type nonrec image_list = image list [@@ocaml.doc ""]

type nonrec image_failure_reason = string [@@ocaml.doc ""]

type nonrec image_failure_code =
  | ImageInaccessible [@ocaml.doc ""]
  | UpstreamUnavailable [@ocaml.doc ""]
  | UpstreamTooManyRequests [@ocaml.doc ""]
  | UpstreamAccessDenied [@ocaml.doc ""]
  | KmsError [@ocaml.doc ""]
  | ImageReferencedByManifestList [@ocaml.doc ""]
  | MissingDigestAndTag [@ocaml.doc ""]
  | ImageNotFound [@ocaml.doc ""]
  | ImageTagDoesNotMatchDigest [@ocaml.doc ""]
  | InvalidImageTag [@ocaml.doc ""]
  | InvalidImageDigest [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec image_failure = {
  failure_reason : image_failure_reason option; [@ocaml.doc "The reason for the failure.\n"]
  failure_code : image_failure_code option; [@ocaml.doc "The code associated with the failure.\n"]
  image_id : image_identifier option; [@ocaml.doc "The image ID associated with the failure.\n"]
}
[@@ocaml.doc "An object representing an Amazon ECR image failure.\n"]

type nonrec image_failure_list = image_failure list [@@ocaml.doc ""]

type nonrec image_detail = {
  last_activated_at : last_activated_at_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, when the image was last \
         restored from Amazon ECR archive to Amazon ECR standard.\n"]
  last_archived_at : last_archived_at_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, when the image was last \
         transitioned to Amazon ECR archive.\n"]
  image_status : image_status option; [@ocaml.doc "The current status of the image.\n"]
  subject_manifest_digest : image_digest option;
      [@ocaml.doc "The digest of the subject manifest for images that are referrers.\n"]
  last_recorded_pull_time : recorded_pull_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, when Amazon ECR recorded \
         the last image pull.\n\n\
        \  Amazon ECR refreshes the last image pull timestamp at least once every 24 hours. For \
         example, if you pull an image once a day then the [lastRecordedPullTime] timestamp will \
         indicate the exact time that the image was last pulled. However, if you pull an image \
         once an hour, because Amazon ECR refreshes the [lastRecordedPullTime] timestamp at least \
         once every 24 hours, the result may not be the exact time that the image was last pulled.\n\
        \  \n\
        \   "]
  artifact_media_type : media_type option; [@ocaml.doc "The artifact media type of the image.\n"]
  image_manifest_media_type : media_type option;
      [@ocaml.doc "The media type of the image manifest.\n"]
  image_scan_findings_summary : image_scan_findings_summary option;
      [@ocaml.doc "A summary of the last completed image scan.\n"]
  image_scan_status : image_scan_status option; [@ocaml.doc "The current state of the scan.\n"]
  image_pushed_at : push_timestamp option;
      [@ocaml.doc
        "The date and time, expressed in standard JavaScript date format, at which the current \
         image was pushed to the repository. \n"]
  image_size_in_bytes : image_size_in_bytes option;
      [@ocaml.doc
        "The size, in bytes, of the image in the repository.\n\n\
        \ If the image is a manifest list, this will be the max size of all manifests in the list.\n\
        \ \n\
        \   Starting with Docker version 1.9, the Docker client compresses image layers before \
         pushing them to a V2 Docker registry. The output of the [docker images] command shows the \
         uncompressed image size. Therefore, Docker might return a larger image than the image \
         shown in the Amazon Web Services Management Console.\n\
        \   \n\
        \    "]
  image_tags : image_tag_list option; [@ocaml.doc "The list of tags associated with this image.\n"]
  image_digest : image_digest option; [@ocaml.doc "The [sha256] digest of the image manifest.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The name of the repository to which this image belongs.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to which this image \
         belongs.\n"]
}
[@@ocaml.doc "An object that describes an image returned by a [DescribeImages] operation.\n"]

type nonrec image_detail_list = image_detail list [@@ocaml.doc ""]

type nonrec get_signing_configuration_response = {
  signing_configuration : signing_configuration option;
      [@ocaml.doc "The registry's signing configuration.\n"]
  registry_id : registry_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec get_signing_configuration_request = unit [@@ocaml.doc ""]

type nonrec get_repository_policy_response = {
  policy_text : repository_policy_text option;
      [@ocaml.doc "The JSON repository policy text associated with the repository.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_repository_policy_request = {
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository with the policy to retrieve.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_scanning_configuration_response = {
  scanning_configuration : registry_scanning_configuration option;
      [@ocaml.doc "The scanning configuration for the registry.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_scanning_configuration_request = unit [@@ocaml.doc ""]

type nonrec get_registry_policy_response = {
  policy_text : registry_policy_text option;
      [@ocaml.doc "The JSON text of the permissions policy for a registry.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_registry_policy_request = unit [@@ocaml.doc ""]

type nonrec evaluation_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec get_lifecycle_policy_response = {
  last_evaluated_at : evaluation_timestamp option;
      [@ocaml.doc "The time stamp of the last time that the lifecycle policy was run.\n"]
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc "The JSON lifecycle policy text.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lifecycle_policy_request = {
  repository_name : repository_name; [@ocaml.doc "The name of the repository.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lifecycle_policy_preview_response = {
  summary : lifecycle_policy_preview_summary option;
      [@ocaml.doc "The list of images that is returned as a result of the action.\n"]
  preview_results : lifecycle_policy_preview_result_list option;
      [@ocaml.doc "The results of the lifecycle policy preview request.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [GetLifecyclePolicyPreview] request. When \
         the results of a [GetLifecyclePolicyPreview] request exceed [maxResults], this value can \
         be used to retrieve the next page of results. This value is [null] when there are no more \
         results to return.\n"]
  status : lifecycle_policy_preview_status option;
      [@ocaml.doc "The status of the lifecycle policy preview request.\n"]
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc "The JSON lifecycle policy text.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lifecycle_policy_preview_request = {
  filter : lifecycle_policy_preview_filter option;
      [@ocaml.doc
        "An optional parameter that filters results based on image tag status and all tags, if \
         tagged.\n"]
  max_results : lifecycle_preview_max_results option;
      [@ocaml.doc
        "The maximum number of repository results returned by [GetLifecyclePolicyPreviewRequest] \
         in\226\128\168 paginated output. When this parameter is used, \
         [GetLifecyclePolicyPreviewRequest] only returns\226\128\168 [maxResults] results in a \
         single page along with a [nextToken]\226\128\168 response element. The remaining results \
         of the initial request can be seen by sending\226\128\168 another \
         [GetLifecyclePolicyPreviewRequest] request with the returned [nextToken]\226\128\168 \
         value. This value can be between 1 and 100. If this\226\128\168 parameter is not used, \
         then [GetLifecyclePolicyPreviewRequest] returns up to\226\128\168100 results and a \
         [nextToken] value, if\226\128\168 applicable. This option cannot be used when you specify \
         images with [imageIds].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated\226\128\168 \
         [GetLifecyclePolicyPreviewRequest] request where [maxResults] was used and \
         the\226\128\168 results exceeded the value of that parameter. Pagination continues from \
         the end of the\226\128\168 previous results that returned the [nextToken] value. This \
         value is\226\128\168 [null] when there are no more results to return. This option cannot \
         be used when you specify images with [imageIds].\n"]
  image_ids : image_identifier_list option; [@ocaml.doc "The list of imageIDs to be included.\n"]
  repository_name : repository_name; [@ocaml.doc "The name of the repository.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_download_url_for_layer_response = {
  layer_digest : layer_digest option; [@ocaml.doc "The digest of the image layer to download.\n"]
  download_url : url option;
      [@ocaml.doc "The pre-signed Amazon S3 download URL for the requested layer.\n"]
}
[@@ocaml.doc ""]

type nonrec get_download_url_for_layer_request = {
  layer_digest : layer_digest; [@ocaml.doc "The digest of the image layer to download.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that is associated with the image layer to download.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the image \
         layer to download. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec base64 = string [@@ocaml.doc ""]

type nonrec expiration_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec authorization_data = {
  proxy_endpoint : proxy_endpoint option;
      [@ocaml.doc
        "The registry URL to use for this authorization token in a [docker login] command. The \
         Amazon ECR registry URL format is [https://aws_account_id.dkr.ecr.region.amazonaws.com]. \
         For example, [https://012345678910.dkr.ecr.us-east-1.amazonaws.com].. \n"]
  expires_at : expiration_timestamp option;
      [@ocaml.doc
        "The Unix time in seconds and milliseconds when the authorization token expires. \
         Authorization tokens are valid for 12 hours.\n"]
  authorization_token : base64 option;
      [@ocaml.doc
        "A base64-encoded string that contains authorization data for the specified Amazon ECR \
         registry. When the string is decoded, it is presented in the format [user:password] for \
         private registry authentication using [docker\n\
        \                login].\n"]
}
[@@ocaml.doc "An object representing authorization data for an Amazon ECR registry.\n"]

type nonrec authorization_data_list = authorization_data list [@@ocaml.doc ""]

type nonrec get_authorization_token_response = {
  authorization_data : authorization_data_list option;
      [@ocaml.doc
        "A list of authorization token data objects that correspond to the [registryIds] values in \
         the request.\n\n\
        \  The size of the authorization token returned by Amazon ECR is not fixed. We recommend \
         that you don't make assumptions about the maximum size.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_authorization_token_registry_id_list = registry_id list [@@ocaml.doc ""]

type nonrec get_authorization_token_request = {
  registry_ids : get_authorization_token_registry_id_list option;
      [@ocaml.doc
        "A list of Amazon Web Services account IDs that are associated with the registries for \
         which to get AuthorizationData objects. If you do not specify a registry, the default \
         registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_setting_response = {
  value : account_setting_name option;
      [@ocaml.doc
        "The setting value for the setting name. Valid value for basic scan type: [AWS_NATIVE]. \
         Valid values for registry policy scope: [V2]. Valid values for blob mounting: [ENABLED] \
         or [DISABLED].\n"]
  name : account_setting_name option; [@ocaml.doc "Retrieves the name of the account setting.\n"]
}
[@@ocaml.doc ""]

type nonrec get_account_setting_request = {
  name : account_setting_name;
      [@ocaml.doc
        "The name of the account setting, such as [BASIC_SCAN_TYPE_VERSION], \
         [REGISTRY_POLICY_SCOPE], or [BLOB_MOUNTING].\n"]
}
[@@ocaml.doc ""]

type nonrec exclusion_not_found_exception = { message : exception_message option [@ocaml.doc ""] }
[@@ocaml.doc "The specified pull time update exclusion was not found.\n"]

type nonrec empty_upload_exception = {
  message : exception_message option;
      [@ocaml.doc "The error message associated with the exception.\n"]
}
[@@ocaml.doc "The specified layer upload does not contain any layer parts.\n"]

type nonrec describe_repository_creation_templates_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeRepositoryCreationTemplates] \
         request. When the results of a [DescribeRepositoryCreationTemplates] request exceed \
         [maxResults], this value can be used to retrieve the next page of results. This value is \
         [null] when there are no more results to return.\n"]
  repository_creation_templates : repository_creation_template_list option;
      [@ocaml.doc "The details of the repository creation templates.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_repository_creation_templates_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results returned by \
         [DescribeRepositoryCreationTemplatesRequest] in paginated output. When this parameter is \
         used, [DescribeRepositoryCreationTemplatesRequest] only returns [maxResults] results in a \
         single page along with a [nextToken] response element. The remaining results of the \
         initial request can be seen by sending another \
         [DescribeRepositoryCreationTemplatesRequest] request with the returned [nextToken] value. \
         This value can be between 1 and 1000. If this parameter is not used, then \
         [DescribeRepositoryCreationTemplatesRequest] returns up to 100 results and a [nextToken] \
         value, if applicable.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated \
         [DescribeRepositoryCreationTemplates] request where [maxResults] was used and the results \
         exceeded the value of that parameter. Pagination continues from the end of the previous \
         results that returned the [nextToken] value. This value is [null] when there are no more \
         results to return.\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  prefixes : prefix_list option;
      [@ocaml.doc
        "The repository namespace prefixes associated with the repository creation templates to \
         describe. If this value is not specified, all repository creation templates are returned.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_repositories_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeRepositories] request. When the \
         results of a [DescribeRepositories] request exceed [maxResults], this value can be used \
         to retrieve the next page of results. This value is [null] when there are no more results \
         to return.\n"]
  repositories : repository_list option;
      [@ocaml.doc "A list of repository objects corresponding to valid repositories.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_repositories_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results returned by [DescribeRepositories] in paginated \
         output. When this parameter is used, [DescribeRepositories] only returns [maxResults] \
         results in a single page along with a [nextToken] response element. The remaining results \
         of the initial request can be seen by sending another [DescribeRepositories] request with \
         the returned [nextToken] value. This value can be between 1 and 1000. If this parameter \
         is not used, then [DescribeRepositories] returns up to 100 results and a [nextToken] \
         value, if applicable. This option cannot be used when you specify repositories with \
         [repositoryNames].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [DescribeRepositories] request \
         where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. This value is [null] when there are no more results to return. This option cannot \
         be used when you specify repositories with [repositoryNames].\n\n\
        \  This token should be treated as an opaque identifier that is only used to retrieve the \
         next items in a list and not for other programmatic purposes.\n\
        \  \n\
        \   "]
  repository_names : repository_name_list option;
      [@ocaml.doc
        "A list of repositories to describe. If this parameter is omitted, then all repositories \
         in a registry are described.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repositories to be described. If you do not specify a registry, the default registry is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_registry_response = {
  replication_configuration : replication_configuration option;
      [@ocaml.doc "The replication configuration for the registry.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_registry_request = unit [@@ocaml.doc ""]

type nonrec describe_pull_through_cache_rules_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribePullThroughCacheRulesRequest] \
         request. When the results of a [DescribePullThroughCacheRulesRequest] request exceed \
         [maxResults], this value can be used to retrieve the next page of results. This value is \
         null when there are no more results to return.\n"]
  pull_through_cache_rules : pull_through_cache_rule_list option;
      [@ocaml.doc "The details of the pull through cache rules.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_pull_through_cache_rules_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of pull through cache rules returned by \
         [DescribePullThroughCacheRulesRequest] in paginated output. When this parameter is used, \
         [DescribePullThroughCacheRulesRequest] only returns [maxResults] results in a single page \
         along with a [nextToken] response element. The remaining results of the initial request \
         can be seen by sending another [DescribePullThroughCacheRulesRequest] request with the \
         returned [nextToken] value. This value can be between 1 and 1000. If this parameter is \
         not used, then [DescribePullThroughCacheRulesRequest] returns up to 100 results and a \
         [nextToken] value, if applicable.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated \
         [DescribePullThroughCacheRulesRequest] request where [maxResults] was used and the \
         results exceeded the value of that parameter. Pagination continues from the end of the \
         previous results that returned the [nextToken] value. This value is null when there are \
         no more results to return.\n"]
  ecr_repository_prefixes : pull_through_cache_rule_repository_prefix_list option;
      [@ocaml.doc
        "The Amazon ECR repository prefixes associated with the pull through cache rules to \
         return. If no repository prefix value is specified, all pull through cache rules are \
         returned.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to return the pull \
         through cache rules for. If you do not specify a registry, the default registry is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_images_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeImages] request. When the results \
         of a [DescribeImages] request exceed [maxResults], this value can be used to retrieve the \
         next page of results. This value is [null] when there are no more results to return.\n"]
  image_details : image_detail_list option;
      [@ocaml.doc "A list of [ImageDetail] objects that contain data about the image.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_images_filter = {
  image_status : image_status_filter option;
      [@ocaml.doc
        "The image status with which to filter your [DescribeImages] results. Valid values are \
         [ACTIVE], [ARCHIVED], and [ACTIVATING]. If not specified, only images with [ACTIVE] \
         status are returned.\n"]
  tag_status : tag_status option;
      [@ocaml.doc
        "The tag status with which to filter your [DescribeImages] results. You can filter results \
         based on whether they are [TAGGED] or [UNTAGGED].\n"]
}
[@@ocaml.doc "An object representing a filter on a [DescribeImages] operation.\n"]

type nonrec describe_images_request = {
  filter : describe_images_filter option;
      [@ocaml.doc "The filter key and value with which to filter your [DescribeImages] results.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of repository results returned by [DescribeImages] in paginated \
         output. When this parameter is used, [DescribeImages] only returns [maxResults] results \
         in a single page along with a [nextToken] response element. The remaining results of the \
         initial request can be seen by sending another [DescribeImages] request with the returned \
         [nextToken] value. This value can be between 1 and 1000. If this parameter is not used, \
         then [DescribeImages] returns up to 100 results and a [nextToken] value, if applicable. \
         This option cannot be used when you specify images with [imageIds].\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [DescribeImages] request where \
         [maxResults] was used and the results exceeded the value of that parameter. Pagination \
         continues from the end of the previous results that returned the [nextToken] value. This \
         value is [null] when there are no more results to return. This option cannot be used when \
         you specify images with [imageIds].\n"]
  image_ids : image_identifier_list option;
      [@ocaml.doc "The list of image IDs for the requested repository.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The repository that contains the images to describe.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to describe images. If you do not specify a registry, the default \
         registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_signing_status_response = {
  signing_statuses : image_signing_status_list option;
      [@ocaml.doc
        "A list of signing statuses for the specified image. Each status corresponds to a signing \
         profile.\n"]
  registry_id : registry_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the registry.\n"]
  image_id : image_identifier option;
      [@ocaml.doc "An object with identifying information for the image.\n"]
  repository_name : repository_name option; [@ocaml.doc "The name of the repository.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_signing_status_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
  image_id : image_identifier;
      [@ocaml.doc "An object containing identifying information for an image.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that contains the image.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_scan_findings_response = {
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value to include in a future [DescribeImageScanFindings] request. When \
         the results of a [DescribeImageScanFindings] request exceed [maxResults], this value can \
         be used to retrieve the next page of results. This value is null when there are no more \
         results to return.\n"]
  image_scan_findings : image_scan_findings option;
      [@ocaml.doc "The information contained in the image scan findings.\n"]
  image_scan_status : image_scan_status option; [@ocaml.doc "The current state of the scan.\n"]
  image_id : image_identifier option; [@ocaml.doc ""]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_scan_findings_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of image scan results returned by [DescribeImageScanFindings] in \
         paginated output. When this parameter is used, [DescribeImageScanFindings] only returns \
         [maxResults] results in a single page along with a [nextToken] response element. The \
         remaining results of the initial request can be seen by sending another \
         [DescribeImageScanFindings] request with the returned [nextToken] value. This value can \
         be between 1 and 1000. If this parameter is not used, then [DescribeImageScanFindings] \
         returns up to 100 results and a [nextToken] value, if applicable.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "The [nextToken] value returned from a previous paginated [DescribeImageScanFindings] \
         request where [maxResults] was used and the results exceeded the value of that parameter. \
         Pagination continues from the end of the previous results that returned the [nextToken] \
         value. This value is null when there are no more results to return.\n"]
  image_id : image_identifier; [@ocaml.doc ""]
  repository_name : repository_name;
      [@ocaml.doc "The repository for the image for which to describe the scan findings.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository in which to describe the image scan findings for. If you do not specify a \
         registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_replication_status_response = {
  replication_statuses : image_replication_status_list option;
      [@ocaml.doc "The replication status details for the images in the specified repository.\n"]
  image_id : image_identifier option; [@ocaml.doc ""]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_image_replication_status_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry. If you do not specify a \
         registry, the default registry is assumed.\n"]
  image_id : image_identifier; [@ocaml.doc ""]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that the image is in.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_pull_time_update_exclusion_response = {
  principal_arn : principal_arn option;
      [@ocaml.doc
        "The ARN of the IAM principal that was removed from the pull time update exclusion list.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_pull_time_update_exclusion_request = {
  principal_arn : principal_arn;
      [@ocaml.doc
        "The ARN of the IAM principal to remove from the pull time update exclusion list.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_signing_configuration_response = {
  signing_configuration : signing_configuration option;
      [@ocaml.doc "The registry's deleted signing configuration.\n"]
  registry_id : registry_id option;
      [@ocaml.doc "The Amazon Web Services account ID associated with the registry.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_signing_configuration_request = unit [@@ocaml.doc ""]

type nonrec delete_repository_response = {
  repository : repository option; [@ocaml.doc "The repository that was deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_request = {
  force : force_flag option;
      [@ocaml.doc
        "If true, deleting the repository force deletes the contents of the repository. If false, \
         the repository must be empty before attempting to delete it.\n"]
  repository_name : repository_name; [@ocaml.doc "The name of the repository to delete.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository to delete. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_policy_response = {
  policy_text : repository_policy_text option;
      [@ocaml.doc "The JSON repository policy that was deleted from the repository.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_policy_request = {
  repository_name : repository_name;
      [@ocaml.doc
        "The name of the repository that is associated with the repository policy to delete.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository policy to delete. If you do not specify a registry, the default registry is \
         assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_creation_template_response = {
  repository_creation_template : repository_creation_template option;
      [@ocaml.doc "The details of the repository creation template that was deleted.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_repository_creation_template_request = {
  prefix : prefix;
      [@ocaml.doc
        "The repository namespace prefix associated with the repository creation template.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registry_policy_response = {
  policy_text : registry_policy_text option;
      [@ocaml.doc "The contents of the registry permissions policy that was deleted.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_registry_policy_request = unit [@@ocaml.doc ""]

type nonrec delete_pull_through_cache_rule_response = {
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The upstream repository prefix associated with the pull through cache rule.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc "The ARN of the IAM role associated with the pull through cache rule.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         associated with the pull through cache rule.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc "The timestamp associated with the pull through cache rule.\n"]
  upstream_registry_url : url option;
      [@ocaml.doc "The upstream registry URL associated with the pull through cache rule.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The Amazon ECR repository prefix associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_pull_through_cache_rule_request = {
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the pull \
         through cache rule. If you do not specify a registry, the default registry is assumed.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix;
      [@ocaml.doc
        "The Amazon ECR repository prefix associated with the pull through cache rule to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_response = {
  last_evaluated_at : evaluation_timestamp option;
      [@ocaml.doc "The time stamp of the last time that the lifecycle policy was run.\n"]
  lifecycle_policy_text : lifecycle_policy_text option;
      [@ocaml.doc "The JSON lifecycle policy text.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_request = {
  repository_name : repository_name; [@ocaml.doc "The name of the repository.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the \
         repository. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_repository_response = {
  repository : repository option; [@ocaml.doc "The repository that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_repository_request = {
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration for the repository. This determines how the contents of your \
         repository are encrypted at rest.\n"]
  image_scanning_configuration : image_scanning_configuration option;
      [@ocaml.doc
        " The [imageScanningConfiguration] parameter is being deprecated, in favor of specifying \
         the image scanning configuration at the registry level. For more information, see \
         [PutRegistryScanningConfiguration].\n\
        \ \n\
        \   The image scanning configuration for the repository. This determines whether images \
         are scanned for known vulnerabilities after being pushed to the repository.\n\
        \   "]
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags should be excluded from the repository's \
         image tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc
        "The tag mutability setting for the repository. If this parameter is omitted, the default \
         setting of [MUTABLE] will be used which will allow image tags to be overwritten. If \
         [IMMUTABLE] is specified, all image tags within the repository will be immutable which \
         will prevent them from being overwritten.\n"]
  tags : tag_list option;
      [@ocaml.doc
        "The metadata that you apply to the repository to help you categorize and organize them. \
         Each tag consists of a key and an optional value, both of which you define. Tag keys can \
         have a maximum character length of 128 characters, and tag values can have a maximum \
         length of 256 characters.\n"]
  repository_name : repository_name;
      [@ocaml.doc
        "The name to use for the repository. The repository name may be specified on its own (such \
         as [nginx-web-app]) or it can be prepended with a namespace to group the repository into \
         a category (such as [project-a/nginx-web-app]).\n\n\
        \ The repository name must start with a letter and can only contain lowercase letters, \
         numbers, hyphens, underscores, and forward slashes.\n\
        \ "]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to create the repository. \
         If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec create_repository_creation_template_response = {
  repository_creation_template : repository_creation_template option;
      [@ocaml.doc "The details of the repository creation template associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec create_repository_creation_template_request = {
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc
        "The ARN of the role to be assumed by Amazon ECR. This role must be in the same account as \
         the registry that you are configuring. Amazon ECR will assume your supplied role when the \
         customRoleArn is specified. When this field isn't specified, Amazon ECR will use the \
         service-linked role for the repository creation template.\n"]
  applied_for : rct_applied_for_list;
      [@ocaml.doc
        "A list of enumerable strings representing the Amazon ECR repository creation scenarios \
         that this template will apply towards. The supported scenarios are [PULL_THROUGH_CACHE], \
         [REPLICATION], and [CREATE_ON_PUSH] \n"]
  lifecycle_policy : lifecycle_policy_text_for_repository_creation_template option;
      [@ocaml.doc "The lifecycle policy to use for repositories created using the template.\n"]
  repository_policy : repository_policy_text option;
      [@ocaml.doc
        "The repository policy to apply to repositories created using the template. A repository \
         policy is a permissions policy associated with a repository to control access \
         permissions. \n"]
  image_tag_mutability_exclusion_filters : image_tag_mutability_exclusion_filters option;
      [@ocaml.doc
        "A list of filters that specify which image tags should be excluded from the repository \
         creation template's image tag mutability setting.\n"]
  image_tag_mutability : image_tag_mutability option;
      [@ocaml.doc
        "The tag mutability setting for the repository. If this parameter is omitted, the default \
         setting of [MUTABLE] will be used which will allow image tags to be overwritten. If \
         [IMMUTABLE] is specified, all image tags within the repository will be immutable which \
         will prevent them from being overwritten.\n"]
  resource_tags : tag_list option;
      [@ocaml.doc
        "The metadata to apply to the repository to help you categorize and organize. Each tag \
         consists of a key and an optional value, both of which you define. Tag keys can have a \
         maximum character length of 128 characters, and tag values can have a maximum length of \
         256 characters.\n"]
  encryption_configuration : encryption_configuration_for_repository_creation_template option;
      [@ocaml.doc
        "The encryption configuration to use for repositories created using the template.\n"]
  description : repository_template_description option;
      [@ocaml.doc "A description for the repository creation template.\n"]
  prefix : prefix;
      [@ocaml.doc
        "The repository namespace prefix to associate with the template. All repositories created \
         using this namespace prefix will have the settings defined in this template applied. For \
         example, a prefix of [prod] would apply to all repositories beginning with [prod/]. \
         Similarly, a prefix of [prod/team] would apply to all repositories beginning with \
         [prod/team/].\n\n\
        \ To apply a template to all repositories in your registry that don't have an associated \
         creation template, you can use [ROOT] as the prefix.\n\
        \ \n\
        \   There is always an assumed [/] applied to the end of the prefix. If you specify \
         [ecr-public] as the prefix, Amazon ECR treats that as [ecr-public/]. When using a pull \
         through cache rule, the repository prefix you specify during rule creation is what you \
         should specify as your repository creation template prefix as well.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec create_pull_through_cache_rule_response = {
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The upstream repository prefix associated with the pull through cache rule.\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc "The ARN of the IAM role associated with the pull through cache rule.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret \
         associated with the pull through cache rule.\n"]
  upstream_registry : upstream_registry option;
      [@ocaml.doc
        "The name of the upstream registry associated with the pull through cache rule.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
  created_at : creation_timestamp option;
      [@ocaml.doc
        "The date and time, in JavaScript date format, when the pull through cache rule was created.\n"]
  upstream_registry_url : url option;
      [@ocaml.doc "The upstream registry URL associated with the pull through cache rule.\n"]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc "The Amazon ECR repository prefix associated with the pull through cache rule.\n"]
}
[@@ocaml.doc ""]

type nonrec create_pull_through_cache_rule_request = {
  upstream_repository_prefix : pull_through_cache_rule_repository_prefix option;
      [@ocaml.doc
        "The repository name prefix of the upstream registry to match with the upstream repository \
         name. When this field isn't specified, Amazon ECR will use the [ROOT].\n"]
  custom_role_arn : custom_role_arn option;
      [@ocaml.doc
        "Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to authenticate to \
         the ECR upstream registry. This role must be in the same account as the registry that you \
         are configuring.\n"]
  credential_arn : credential_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that \
         identifies the credentials to authenticate to the upstream registry.\n"]
  upstream_registry : upstream_registry option; [@ocaml.doc "The name of the upstream registry.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to create the pull \
         through cache rule for. If you do not specify a registry, the default registry is assumed.\n"]
  upstream_registry_url : url;
      [@ocaml.doc
        "The registry URL of the upstream public registry to use as the source for the pull \
         through cache rule. The following is the syntax to use for each supported upstream \
         registry.\n\n\
        \ {ul\n\
        \       {-  Amazon ECR ([ecr]) \226\128\147 \n\
        \           {[\n\
        \           .dkr.ecr..amazonaws.com\n\
        \           ]}\n\
        \            \n\
        \           \n\
        \            }\n\
        \       {-  Amazon ECR Public ([ecr-public]) \226\128\147 [public.ecr.aws] \n\
        \           \n\
        \            }\n\
        \       {-  Docker Hub ([docker-hub]) \226\128\147 [registry-1.docker.io] \n\
        \           \n\
        \            }\n\
        \       {-  GitHub Container Registry ([github-container-registry]) \226\128\147 [ghcr.io] \n\
        \           \n\
        \            }\n\
        \       {-  GitLab Container Registry ([gitlab-container-registry]) \226\128\147 \
         [registry.gitlab.com] \n\
        \           \n\
        \            }\n\
        \       {-  Kubernetes ([k8s]) \226\128\147 [registry.k8s.io] \n\
        \           \n\
        \            }\n\
        \       {-  Microsoft Azure Container Registry ([azure-container-registry]) \226\128\147 \n\
        \           {[\n\
        \           .azurecr.io\n\
        \           ]}\n\
        \            \n\
        \           \n\
        \            }\n\
        \       {-  Quay ([quay]) \226\128\147 [quay.io] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ecr_repository_prefix : pull_through_cache_rule_repository_prefix;
      [@ocaml.doc
        "The repository name prefix to use when caching images from the source registry.\n\n\
        \  There is always an assumed [/] applied to the end of the prefix. If you specify \
         [ecr-public] as the prefix, Amazon ECR treats that as [ecr-public/].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec complete_layer_upload_response = {
  layer_digest : layer_digest option; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
  upload_id : upload_id option; [@ocaml.doc "The upload ID associated with the layer.\n"]
  repository_name : repository_name option;
      [@ocaml.doc "The repository name associated with the request.\n"]
  registry_id : registry_id option; [@ocaml.doc "The registry ID associated with the request.\n"]
}
[@@ocaml.doc ""]

type nonrec complete_layer_upload_request = {
  layer_digests : layer_digest_list; [@ocaml.doc "The [sha256] digest of the image layer.\n"]
  upload_id : upload_id;
      [@ocaml.doc
        "The upload ID from a previous [InitiateLayerUpload] operation to associate with the image \
         layer.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository to associate with the image layer.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry to which to upload \
         layers. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec batched_operation_layer_digest_list = batched_operation_layer_digest list
[@@ocaml.doc ""]

type nonrec batch_get_repository_scanning_configuration_response = {
  failures : repository_scanning_configuration_failure_list option;
      [@ocaml.doc "Any failures associated with the call.\n"]
  scanning_configurations : repository_scanning_configuration_list option;
      [@ocaml.doc "The scanning configuration for the requested repositories.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_repository_scanning_configuration_request = {
  repository_names : scanning_configuration_repository_name_list;
      [@ocaml.doc "One or more repository names to get the scanning configuration for.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_image_response = {
  failures : image_failure_list option; [@ocaml.doc "Any failures associated with the call.\n"]
  images : image_list option;
      [@ocaml.doc "A list of image objects corresponding to the image references in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_get_image_request = {
  accepted_media_types : media_type_list option;
      [@ocaml.doc
        "The accepted media types for the request.\n\n\
        \ Valid values: [application/vnd.docker.distribution.manifest.v1+json] | \
         [application/vnd.docker.distribution.manifest.v2+json] | \
         [application/vnd.oci.image.manifest.v1+json] \n\
        \ "]
  image_ids : image_identifier_list;
      [@ocaml.doc
        "A list of image ID references that correspond to images to describe. The format of the \
         [imageIds] reference is [imageTag=tag] or [imageDigest=digest].\n"]
  repository_name : repository_name;
      [@ocaml.doc "The repository that contains the images to describe.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the images \
         to describe. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_image_response = {
  failures : image_failure_list option; [@ocaml.doc "Any failures associated with the call.\n"]
  image_ids : image_identifier_list option; [@ocaml.doc "The image IDs of the deleted images.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_delete_image_request = {
  image_ids : image_identifier_list;
      [@ocaml.doc
        "A list of image ID references that correspond to images to delete. The format of the \
         [imageIds] reference is [imageTag=tag] or [imageDigest=digest].\n"]
  repository_name : repository_name;
      [@ocaml.doc "The repository that contains the image to delete.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the image \
         to delete. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc
  "Deletes specified images within a specified repository. Images are specified with either the \
   [imageTag] or [imageDigest].\n"]

type nonrec batch_check_layer_availability_response = {
  failures : layer_failure_list option; [@ocaml.doc "Any failures associated with the call.\n"]
  layers : layer_list option;
      [@ocaml.doc
        "A list of image layer objects corresponding to the image layer references in the request.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_check_layer_availability_request = {
  layer_digests : batched_operation_layer_digest_list;
      [@ocaml.doc "The digests of the image layers to check.\n"]
  repository_name : repository_name;
      [@ocaml.doc "The name of the repository that is associated with the image layers to check.\n"]
  registry_id : registry_id option;
      [@ocaml.doc
        "The Amazon Web Services account ID associated with the registry that contains the image \
         layers to check. If you do not specify a registry, the default registry is assumed.\n"]
}
[@@ocaml.doc ""]
