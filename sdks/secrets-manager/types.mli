type nonrec error_message = string [@@ocaml.doc ""]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec secret_id_type = string [@@ocaml.doc ""]

type nonrec api_error_type = {
  secret_id : secret_id_type option; [@ocaml.doc "The ARN or name of the secret.\n"]
  error_code : error_code option;
      [@ocaml.doc
        "The error Secrets Manager encountered while retrieving an individual secret as part of \
         [BatchGetSecretValue], for example \
         [ResourceNotFoundException],[InvalidParameterException], [InvalidRequestException], \
         [DecryptionFailure], or [AccessDeniedException].\n"]
  message : error_message option; [@ocaml.doc "A message describing the error.\n"]
}
[@@ocaml.doc
  "The error Secrets Manager encountered while retrieving an individual secret as part of \
   [BatchGetSecretValue].\n"]

type nonrec api_error_list_type = api_error_type list [@@ocaml.doc ""]

type nonrec kms_key_id_type = string [@@ocaml.doc ""]

type nonrec region_type = string [@@ocaml.doc ""]

type nonrec replica_region_type = {
  region : region_type option;
      [@ocaml.doc
        "A Region code. For a list of Region codes, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/rande.html#regional-endpoints}Name and \
         code of Regions}.\n"]
  kms_key_id : kms_key_id_type option;
      [@ocaml.doc
        "The ARN, key ID, or alias of the KMS key to encrypt the secret. If you don't include this \
         field, Secrets Manager uses [aws/secretsmanager].\n"]
}
[@@ocaml.doc "A custom type that specifies a [Region] and the [KmsKeyId] for a replica secret.\n"]

type nonrec add_replica_region_list_type = replica_region_type list [@@ocaml.doc ""]

type nonrec automatically_rotate_after_days_type = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec resource_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "Secrets Manager can't find the resource that you asked for.\n"]

type nonrec invalid_request_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "A parameter value is not valid for the current state of the resource.\n\n\
  \ Possible causes:\n\
  \ \n\
  \  {ul\n\
  \        {-  The secret is scheduled for deletion.\n\
  \            \n\
  \             }\n\
  \        {-  You tried to enable rotation on a secret that doesn't already have a Lambda \
   function ARN configured and you didn't include such an ARN as a parameter in this call. \n\
  \            \n\
  \             }\n\
  \        {-  The secret is managed by another service, and you must use that service to update \
   it. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html}Secrets \
   managed by other Amazon Web Services services}.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec invalid_parameter_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The parameter name or value is invalid.\n"]

type nonrec invalid_next_token_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The [NextToken] value is invalid.\n"]

type nonrec internal_service_error = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "An error occurred on the server side.\n"]

type nonrec decryption_failure = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Secrets Manager can't decrypt the protected secret text using the provided KMS key. \n"]

type nonrec next_token_type = string [@@ocaml.doc ""]

type nonrec created_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec secret_version_stage_type = string [@@ocaml.doc ""]

type nonrec secret_version_stages_type = secret_version_stage_type list [@@ocaml.doc ""]

type nonrec secret_string_type = string [@@ocaml.doc ""]

type nonrec secret_binary_type = bytes [@@ocaml.doc ""]

type nonrec secret_version_id_type = string [@@ocaml.doc ""]

type nonrec secret_name_type = string [@@ocaml.doc ""]

type nonrec secret_arn_type = string [@@ocaml.doc ""]

type nonrec secret_value_entry = {
  ar_n : secret_arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The friendly name of the secret. \n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc "The unique version identifier of this version of the secret.\n"]
  secret_binary : secret_binary_type option;
      [@ocaml.doc
        "The decrypted secret value, if the secret value was originally provided as binary data in \
         the form of a byte array. The parameter represents the binary data as a \
         {{:https://tools.ietf.org/html/rfc4648#section-4}base64-encoded} string.\n"]
  secret_string : secret_string_type option;
      [@ocaml.doc
        "The decrypted secret value, if the secret value was originally provided as a string or \
         through the Secrets Manager console.\n"]
  version_stages : secret_version_stages_type option;
      [@ocaml.doc
        "A list of all of the staging labels currently attached to this version of the secret.\n"]
  created_date : created_date_type option; [@ocaml.doc "The date the secret was created.\n"]
}
[@@ocaml.doc "A structure that contains the secret value and other details for a secret.\n"]

type nonrec secret_values_type = secret_value_entry list [@@ocaml.doc ""]

type nonrec batch_get_secret_value_response = {
  secret_values : secret_values_type option; [@ocaml.doc "A list of secret values.\n"]
  next_token : next_token_type option;
      [@ocaml.doc
        "Secrets Manager includes this value if there's more output available than what is \
         included in the current response. This can occur even when the response includes no \
         values at all, such as when you ask for a filtered view of a long list. To get the next \
         results, call [BatchGetSecretValue] again with this value.\n"]
  errors : api_error_list_type option;
      [@ocaml.doc
        "A list of errors Secrets Manager encountered while attempting to retrieve individual \
         secrets.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_batch_type = int [@@ocaml.doc ""]

type nonrec filter_value_string_type = string [@@ocaml.doc ""]

type nonrec filter_values_string_list = filter_value_string_type list [@@ocaml.doc ""]

type nonrec filter_name_string_type =
  | Description [@ocaml.doc ""]
  | Name [@ocaml.doc ""]
  | Tag_key [@ocaml.doc ""]
  | Tag_value [@ocaml.doc ""]
  | Primary_region [@ocaml.doc ""]
  | Owning_service [@ocaml.doc ""]
  | All [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter = {
  key : filter_name_string_type option;
      [@ocaml.doc
        "The following are keys you can use:\n\n\
        \ {ul\n\
        \       {-   {b description}: Prefix match, not case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b name}: Prefix match, case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b tag-key}: Prefix match, case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b tag-value}: Prefix match, case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b primary-region}: Prefix match, case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b owning-service}: Prefix match, case-sensitive.\n\
        \           \n\
        \            }\n\
        \       {-   {b all}: Breaks the filter value string into words and then searches all \
         attributes for matches. Not case-sensitive.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  values : filter_values_string_list option;
      [@ocaml.doc
        "The keyword to filter for.\n\n\
        \ You can prefix your search value with an exclamation mark ([!]) in order to perform \
         negation filters. \n\
        \ "]
}
[@@ocaml.doc
  "Allows you to add filters when you use the search function in Secrets Manager. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html}Find \
   secrets in Secrets Manager}.\n"]

type nonrec filters_list_type = filter list [@@ocaml.doc ""]

type nonrec secret_id_list_type = secret_id_type list [@@ocaml.doc ""]

type nonrec batch_get_secret_value_request = {
  secret_id_list : secret_id_list_type option;
      [@ocaml.doc
        "The ARN or names of the secrets to retrieve. You must include [Filters] or \
         [SecretIdList], but not both.\n"]
  filters : filters_list_type option;
      [@ocaml.doc
        "The filters to choose which secrets to retrieve. You must include [Filters] or \
         [SecretIdList], but not both.\n"]
  max_results : max_results_batch_type option;
      [@ocaml.doc
        "The number of results to include in the response.\n\n\
        \ If there are more results available, in the response, Secrets Manager includes \
         [NextToken]. To get the next results, call [BatchGetSecretValue] again with the value \
         from [NextToken]. To use this parameter, you must also use the [Filters] parameter.\n\
        \ "]
  next_token : next_token_type option;
      [@ocaml.doc
        "A token that indicates where the output should continue from, if a previous call did not \
         show all results. To get the next results, call [BatchGetSecretValue] again with this \
         value.\n"]
}
[@@ocaml.doc ""]

type nonrec boolean_type = bool [@@ocaml.doc ""]

type nonrec cancel_rotate_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc
        "The unique identifier of the version of the secret created during the rotation. This \
         version might not be complete, and should be evaluated for possible deletion. We \
         recommend that you remove the [VersionStage] value [AWSPENDING] from this version so that \
         Secrets Manager can delete it. Failing to clean up a cancelled rotation can block you \
         from starting future rotations.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_rotate_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec client_request_token_type = string [@@ocaml.doc ""]

type nonrec resource_exists_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A resource with the ID you requested already exists.\n"]

type nonrec precondition_not_met_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request failed because you did not complete all the prerequisite steps.\n"]

type nonrec malformed_policy_document_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The resource policy has syntax errors.\n"]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The request failed because it would exceed one of the Secrets Manager quotas.\n"]

type nonrec encryption_failure = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Secrets Manager can't encrypt the protected secret text using the provided KMS key. Check that \
   the KMS key is available, enabled, and not in an invalid state. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/key-state.html}Key state: Effect on \
   your KMS key}.\n"]

type nonrec last_accessed_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec status_message_type = string [@@ocaml.doc ""]

type nonrec status_type =
  | InSync [@ocaml.doc ""]
  | Failed [@ocaml.doc ""]
  | InProgress [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec replication_status_type = {
  region : region_type option; [@ocaml.doc "The Region where replication occurs.\n"]
  kms_key_id : kms_key_id_type option; [@ocaml.doc "Can be an [ARN], [Key ID], or [Alias]. \n"]
  status : status_type option;
      [@ocaml.doc "The status can be [InProgress], [Failed], or [InSync].\n"]
  status_message : status_message_type option;
      [@ocaml.doc
        "Status message such as \"{i Secret with this name already exists in this region}\".\n"]
  last_accessed_date : last_accessed_date_type option;
      [@ocaml.doc
        "The date that the secret was last accessed in the Region. This field is omitted if the \
         secret has never been retrieved in the Region.\n"]
}
[@@ocaml.doc
  "A replication object consisting of a [RegionReplicationStatus] object and includes a Region, \
   KMSKeyId, status, and status message.\n"]

type nonrec replication_status_list_type = replication_status_type list [@@ocaml.doc ""]

type nonrec create_secret_response = {
  ar_n : secret_arn_type option;
      [@ocaml.doc
        "The ARN of the new secret. The ARN includes the name of the secret followed by six random \
         characters. This ensures that if you create a new secret with the same name as a deleted \
         secret, then users with access to the old secret don't get access to the new secret \
         because the ARNs are different.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the new secret.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc "The unique identifier associated with the version of the new secret.\n"]
  replication_status : replication_status_list_type option;
      [@ocaml.doc
        "A list of the replicas of this secret and their status:\n\n\
        \ {ul\n\
        \       {-   [Failed], which indicates that the replica was not created.\n\
        \           \n\
        \            }\n\
        \       {-   [InProgress], which indicates that Secrets Manager is in the process of \
         creating the replica.\n\
        \           \n\
        \            }\n\
        \       {-   [InSync], which indicates that the replica was created.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec medea_type_type = string [@@ocaml.doc ""]

type nonrec tag_value_type = string [@@ocaml.doc ""]

type nonrec tag_key_type = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key_type option; [@ocaml.doc "The key identifier, or name, of the tag.\n"]
  value : tag_value_type option;
      [@ocaml.doc "The string value associated with the key of the tag.\n"]
}
[@@ocaml.doc "A structure that contains information about a tag.\n"]

type nonrec tag_list_type = tag list [@@ocaml.doc ""]

type nonrec description_type = string [@@ocaml.doc ""]

type nonrec name_type = string [@@ocaml.doc ""]

type nonrec create_secret_request = {
  name : name_type;
      [@ocaml.doc
        "The name of the new secret.\n\n\
        \ The secret name can contain ASCII letters, numbers, and the following characters: \
         /_+=.\\@-\n\
        \ \n\
        \  Do not end your secret name with a hyphen followed by six characters. If you do so, you \
         risk confusion and unexpected results when searching for a secret by partial ARN. Secrets \
         Manager automatically adds a hyphen and six random characters after the secret name at \
         the end of the ARN.\n\
        \  "]
  client_request_token : client_request_token_type option;
      [@ocaml.doc
        "If you include [SecretString] or [SecretBinary], then Secrets Manager creates an initial \
         version for the secret, and this parameter specifies the unique identifier for the new \
         version. \n\n\
        \  If you use the Amazon Web Services CLI or one of the Amazon Web Services SDKs to call \
         this operation, then you can leave this parameter empty. The CLI or SDK generates a \
         random UUID for you and includes it as the value for this parameter in the request. \n\
        \  \n\
        \    If you generate a raw HTTP request to the Secrets Manager service endpoint, then you \
         must generate a [ClientRequestToken] and include it in the request.\n\
        \    \n\
        \     This value helps ensure idempotency. Secrets Manager uses this value to prevent the \
         accidental creation of duplicate versions if there are failures and retries during a \
         rotation. We recommend that you generate a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID-type} value to ensure \
         uniqueness of your versions within the specified secret. \n\
        \     \n\
        \      {ul\n\
        \            {-  If the [ClientRequestToken] value isn't already associated with a version \
         of the secret then a new version of the secret is created. \n\
        \                \n\
        \                 }\n\
        \            {-  If a version with this value already exists and the version \
         [SecretString] and [SecretBinary] values are the same as those in the request, then the \
         request is ignored.\n\
        \                \n\
        \                 }\n\
        \            {-  If a version with this value already exists and that version's \
         [SecretString] and [SecretBinary] values are different from those in the request, then \
         the request fails because you cannot modify an existing version. Instead, use \
         [PutSecretValue] to create a new version.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   This value becomes the [VersionId] of the new version.\n\
        \   "]
  description : description_type option; [@ocaml.doc "The description of the secret.\n"]
  kms_key_id : kms_key_id_type option;
      [@ocaml.doc
        "The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt the secret \
         value in the secret. An alias is always prefixed by [alias/], for example \
         [alias/aws/secretsmanager]. For more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html}About \
         aliases}.\n\n\
        \ To use a KMS key in a different account, use the key ARN or the alias ARN.\n\
        \ \n\
        \  If you don't specify this value, then Secrets Manager uses the key \
         [aws/secretsmanager]. If that key doesn't yet exist, then Secrets Manager creates it for \
         you automatically the first time it encrypts the secret value.\n\
        \  \n\
        \   If the secret is in a different Amazon Web Services account from the credentials \
         calling the API, then you can't use [aws/secretsmanager] to encrypt the secret, and you \
         must create and use a customer managed KMS key. \n\
        \   "]
  secret_binary : secret_binary_type option;
      [@ocaml.doc
        "The binary data to encrypt and store in the new version of the secret. We recommend that \
         you store your binary data in a file and then pass the contents of the file as a \
         parameter.\n\n\
        \ Either [SecretString] or [SecretBinary] must have a value, but not both.\n\
        \ \n\
        \  This parameter is not available in the Secrets Manager console.\n\
        \  \n\
        \   Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \   "]
  secret_string : secret_string_type option;
      [@ocaml.doc
        "The text data to encrypt and store in this new version of the secret. We recommend you \
         use a JSON structure of key/value pairs for your secret value.\n\n\
        \ Either [SecretString] or [SecretBinary] must have a value, but not both.\n\
        \ \n\
        \  If you create a secret by using the Secrets Manager console then Secrets Manager puts \
         the protected secret text in only the [SecretString] parameter. The Secrets Manager \
         console stores the information as a JSON structure of key/value pairs that a Lambda \
         rotation function can parse.\n\
        \  \n\
        \   Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \   "]
  tags : tag_list_type option;
      [@ocaml.doc
        "A list of tags to attach to the secret. Each tag is a key and value pair of strings in a \
         JSON text string, for example:\n\n\
        \  \
         [\\[{\"Key\":\"CostCenter\",\"Value\":\"12345\"},{\"Key\":\"environment\",\"Value\":\"production\"}\\]] \n\
        \ \n\
        \  Secrets Manager tag key names are case sensitive. A tag with the key \"ABC\" is a \
         different tag from one with key \"abc\".\n\
        \  \n\
        \   If you check tags in permissions policies as part of your security strategy, then \
         adding or removing a tag can change permissions. If the completion of this operation \
         would result in you losing your permissions for this secret, then Secrets Manager blocks \
         the operation and returns an [Access Denied] error. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#tag-secrets-abac}Control \
         access to secrets using tags} and \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html#auth-and-access_tags2}Limit \
         access to identities with tags that match secrets' tags}.\n\
        \   \n\
        \    For information about how to format a JSON parameter for the various command line \
         tool environments, see \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-using-param.html#cli-using-param-json}Using \
         JSON for Parameters}. If your command-line tool or SDK requires quotation marks around \
         the parameter, you should use single quotes to avoid confusion with the double quotes \
         required in the JSON text.\n\
        \    \n\
        \     For tag quotas and naming restrictions, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas}Service \
         quotas for Tagging} in the {i Amazon Web Services General Reference guide}.\n\
        \     "]
  add_replica_regions : add_replica_region_list_type option;
      [@ocaml.doc "A list of Regions and KMS keys to replicate secrets.\n"]
  force_overwrite_replica_secret : boolean_type option;
      [@ocaml.doc
        "Specifies whether to overwrite a secret with the same name in the destination Region. By \
         default, secrets aren't overwritten.\n"]
  type_ : medea_type_type option;
      [@ocaml.doc
        "The exact string that identifies the partner that holds the external secret. For more \
         information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html}Using \
         Secrets Manager managed external secrets}.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_response = {
  ar_n : secret_arn_type option;
      [@ocaml.doc "The ARN of the secret that the resource-based policy was deleted for.\n"]
  name : name_type option;
      [@ocaml.doc "The name of the secret that the resource-based policy was deleted for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to delete the attached resource-based policy for.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec deletion_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec delete_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
  deletion_date : deletion_date_type option;
      [@ocaml.doc
        "The date and time after which this secret Secrets Manager can permanently delete this \
         secret, and it can no longer be restored. This value is the date and time of the delete \
         request plus the number of days in [RecoveryWindowInDays].\n"]
}
[@@ocaml.doc ""]

type nonrec recovery_window_in_days_type = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec delete_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to delete.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  recovery_window_in_days : recovery_window_in_days_type option;
      [@ocaml.doc
        "The number of days from 7 to 30 that Secrets Manager waits before permanently deleting \
         the secret. You can't use both this parameter and [ForceDeleteWithoutRecovery] in the \
         same call. If you don't use either, then by default Secrets Manager uses a 30 day \
         recovery window.\n"]
  force_delete_without_recovery : boolean_type option;
      [@ocaml.doc
        "Specifies whether to delete the secret without any recovery window. You can't use both \
         this parameter and [RecoveryWindowInDays] in the same call. If you don't use either, then \
         by default Secrets Manager uses a 30 day recovery window.\n\n\
        \ Secrets Manager performs the actual deletion with an asynchronous background process, so \
         there might be a short delay before the secret is permanently deleted. If you delete a \
         secret and then immediately create a secret with the same name, use appropriate back off \
         and retry logic.\n\
        \ \n\
        \  If you forcibly delete an already deleted or nonexistent secret, the operation does not \
         return [ResourceNotFoundException].\n\
        \  \n\
        \    Use this parameter with caution. This parameter causes the operation to skip the \
         normal recovery window before the permanent deletion that Secrets Manager would normally \
         impose with the [RecoveryWindowInDays] parameter. If you delete a secret with the \
         [ForceDeleteWithoutRecovery] parameter, then you have no opportunity to recover the \
         secret. You lose the secret permanently.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc ""]

type nonrec deleted_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec timestamp_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec owning_service_type = string [@@ocaml.doc ""]

type nonrec secret_versions_to_stages_map_type =
  (secret_version_id_type * secret_version_stages_type) list
[@@ocaml.doc ""]

type nonrec next_rotation_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_changed_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec last_rotated_date_type = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec role_arn_type = string [@@ocaml.doc ""]

type nonrec external_secret_rotation_metadata_item_value_type = string [@@ocaml.doc ""]

type nonrec external_secret_rotation_metadata_item_key_type = string [@@ocaml.doc ""]

type nonrec external_secret_rotation_metadata_item = {
  key : external_secret_rotation_metadata_item_key_type option;
      [@ocaml.doc "The key that identifies the item.\n"]
  value : external_secret_rotation_metadata_item_value_type option;
      [@ocaml.doc "The value of the specified item.\n"]
}
[@@ocaml.doc
  "The metadata needed to successfully rotate a managed external secret. A list of key value pairs \
   in JSON format specified by the partner. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
   external secret partners}.\n"]

type nonrec external_secret_rotation_metadata_type = external_secret_rotation_metadata_item list
[@@ocaml.doc ""]

type nonrec schedule_expression_type = string [@@ocaml.doc ""]

type nonrec duration_type = string [@@ocaml.doc ""]

type nonrec rotation_rules_type = {
  automatically_after_days : automatically_rotate_after_days_type option;
      [@ocaml.doc
        "The number of days between rotations of the secret. You can use this value to check that \
         your secret meets your compliance guidelines for how often secrets must be rotated. If \
         you use this field to set the rotation schedule, Secrets Manager calculates the next \
         rotation date based on the previous rotation. Manually updating the secret value by \
         calling [PutSecretValue] or [UpdateSecret] is considered a valid rotation.\n\n\
        \ In [DescribeSecret] and [ListSecrets], this value is calculated from the rotation \
         schedule after every successful rotation. In [RotateSecret], you can set the rotation \
         schedule in [RotationRules] with [AutomaticallyAfterDays] or [ScheduleExpression], but \
         not both. To set a rotation schedule in hours, use [ScheduleExpression].\n\
        \ "]
  duration : duration_type option;
      [@ocaml.doc
        "The length of the rotation window in hours, for example [3h] for a three hour window. \
         Secrets Manager rotates your secret at any time during this window. The window must not \
         extend into the next rotation window or the next UTC day. The window starts according to \
         the [ScheduleExpression]. If you don't specify a [Duration], for a [ScheduleExpression] \
         in hours, the window automatically closes after one hour. For a [ScheduleExpression] in \
         days, the window automatically closes at the end of the UTC day. For more information, \
         including examples, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_schedule.html}Schedule \
         expressions in Secrets Manager rotation} in the {i Secrets Manager Users Guide}.\n"]
  schedule_expression : schedule_expression_type option;
      [@ocaml.doc
        "A [cron()] or [rate()] expression that defines the schedule for rotating your secret. \
         Secrets Manager rotation schedules use UTC time zone. Secrets Manager rotates your secret \
         any time during a rotation window.\n\n\
        \ Secrets Manager [rate()] expressions represent the interval in hours or days that you \
         want to rotate your secret, for example [rate(12 hours)] or [rate(10\n\
        \                days)]. You can rotate a secret as often as every four hours. If you use \
         a [rate()] expression, the rotation window starts at midnight. For a rate in hours, the \
         default rotation window closes after one hour. For a rate in days, the default rotation \
         window closes at the end of the day. You can set the [Duration] to change the rotation \
         window. The rotation window must not extend into the next UTC day or into the next \
         rotation window.\n\
        \ \n\
        \  You can use a [cron()] expression to create a rotation schedule that is more detailed \
         than a rotation interval. For more information, including examples, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_schedule.html}Schedule \
         expressions in Secrets Manager rotation} in the {i Secrets Manager Users Guide}. For a \
         cron expression that represents a schedule in hours, the default rotation window closes \
         after one hour. For a cron expression that represents a schedule in days, the default \
         rotation window closes at the end of the day. You can set the [Duration] to change the \
         rotation window. The rotation window must not extend into the next UTC day or into the \
         next rotation window.\n\
        \  "]
}
[@@ocaml.doc "A structure that defines the rotation configuration for the secret.\n"]

type nonrec rotation_lambda_arn_type = string [@@ocaml.doc ""]

type nonrec rotation_enabled_type = bool [@@ocaml.doc ""]

type nonrec describe_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
  type_ : medea_type_type option;
      [@ocaml.doc
        "The exact string that identifies the partner that holds the external secret. For more \
         information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html}Using \
         Secrets Manager managed external secrets}.\n"]
  description : description_type option; [@ocaml.doc "The description of the secret.\n"]
  kms_key_id : kms_key_id_type option;
      [@ocaml.doc
        "The key ID or alias ARN of the KMS key that Secrets Manager uses to encrypt the secret \
         value. If the secret is encrypted with the Amazon Web Services managed key \
         [aws/secretsmanager], this field is omitted. Secrets created using the console use an KMS \
         key ID.\n"]
  rotation_enabled : rotation_enabled_type option;
      [@ocaml.doc
        "Specifies whether automatic rotation is turned on for this secret. If the secret has \
         never been configured for rotation, Secrets Manager returns null.\n\n\
        \ To turn on rotation, use [RotateSecret]. To turn off rotation, use [CancelRotateSecret].\n\
        \ "]
  rotation_lambda_ar_n : rotation_lambda_arn_type option;
      [@ocaml.doc
        "The ARN of the Lambda function that Secrets Manager invokes to rotate the secret. \n"]
  rotation_rules : rotation_rules_type option;
      [@ocaml.doc
        "The rotation schedule and Lambda function for this secret. If the secret previously had \
         rotation turned on, but it is now turned off, this field shows the previous rotation \
         schedule and rotation function. If the secret never had rotation turned on, this field is \
         omitted.\n"]
  external_secret_rotation_metadata : external_secret_rotation_metadata_type option;
      [@ocaml.doc
        "The metadata needed to successfully rotate a managed external secret. A list of key value \
         pairs in JSON format specified by the partner. For more information about the required \
         information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
         external secrets partners}.\n"]
  external_secret_rotation_role_arn : role_arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret \
         held by a third-party partner. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-security.html}Security \
         and permissions}.\n"]
  last_rotated_date : last_rotated_date_type option;
      [@ocaml.doc
        "The last date and time that Secrets Manager rotated the secret. If the secret isn't \
         configured for rotation or rotation has been disabled, Secrets Manager returns null.\n"]
  last_changed_date : last_changed_date_type option;
      [@ocaml.doc "The last date and time that this secret was modified in any way.\n"]
  last_accessed_date : last_accessed_date_type option;
      [@ocaml.doc
        "The date that the secret was last accessed in the Region. This field is omitted if the \
         secret has never been retrieved in the Region.\n"]
  deleted_date : deleted_date_type option;
      [@ocaml.doc
        "The date the secret is scheduled for deletion. If it is not scheduled for deletion, this \
         field is omitted. When you delete a secret, Secrets Manager requires a recovery window of \
         at least 7 days before deleting the secret. Some time after the deleted date, Secrets \
         Manager deletes the secret, including all of its versions.\n\n\
        \ If a secret is scheduled for deletion, then its details, including the encrypted secret \
         value, is not accessible. To cancel a scheduled deletion and restore access to the \
         secret, use [RestoreSecret].\n\
        \ "]
  next_rotation_date : next_rotation_date_type option;
      [@ocaml.doc
        "The next rotation is scheduled to occur on or before this date. If the secret isn't \
         configured for rotation or rotation has been disabled, Secrets Manager returns null. If \
         rotation fails, Secrets Manager retries the entire rotation process multiple times. If \
         rotation is unsuccessful, this date may be in the past.\n\n\
        \ This date represents the latest date that rotation will occur, but it is not an \
         approximate rotation date. In some cases, for example if you turn off automatic rotation \
         and then turn it back on, the next rotation may occur much sooner than this date.\n\
        \ "]
  tags : tag_list_type option;
      [@ocaml.doc
        "The list of tags attached to the secret. To add tags to a secret, use [TagResource]. To \
         remove tags, use [UntagResource].\n"]
  version_ids_to_stages : secret_versions_to_stages_map_type option;
      [@ocaml.doc
        "A list of the versions of the secret that have staging labels attached. Versions that \
         don't have staging labels are considered deprecated and Secrets Manager can delete them.\n\n\
        \ Secrets Manager uses staging labels to indicate the status of a secret version during \
         rotation. The three staging labels for rotation are: \n\
        \ \n\
        \  {ul\n\
        \        {-   [AWSCURRENT], which indicates the current version of the secret.\n\
        \            \n\
        \             }\n\
        \        {-   [AWSPENDING], which indicates the version of the secret that contains new \
         secret information that will become the next current version when rotation finishes.\n\
        \            \n\
        \             During rotation, Secrets Manager creates an [AWSPENDING] version ID before \
         creating the new secret version. To check if a secret version exists, call \
         [GetSecretValue].\n\
        \             \n\
        \              }\n\
        \        {-   [AWSPREVIOUS], which indicates the previous current version of the secret. \
         You can use this as the {i last known good} version.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   For more information about rotation and staging labels, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html}How \
         rotation works}.\n\
        \   "]
  owning_service : owning_service_type option;
      [@ocaml.doc
        "The ID of the service that created this secret. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html}Secrets \
         managed by other Amazon Web Services services}.\n"]
  created_date : timestamp_type option; [@ocaml.doc "The date the secret was created.\n"]
  primary_region : region_type option;
      [@ocaml.doc
        "The Region the secret is in. If a secret is replicated to other Regions, the replicas are \
         listed in [ReplicationStatus]. \n"]
  replication_status : replication_status_list_type option;
      [@ocaml.doc
        "A list of the replicas of this secret and their status: \n\n\
        \ {ul\n\
        \       {-   [Failed], which indicates that the replica was not created.\n\
        \           \n\
        \            }\n\
        \       {-   [InProgress], which indicates that Secrets Manager is in the process of \
         creating the replica.\n\
        \           \n\
        \            }\n\
        \       {-   [InSync], which indicates that the replica was created.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec describe_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret. \n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec exclude_characters_type = string [@@ocaml.doc ""]

type nonrec exclude_lowercase_type = bool [@@ocaml.doc ""]

type nonrec exclude_numbers_type = bool [@@ocaml.doc ""]

type nonrec exclude_punctuation_type = bool [@@ocaml.doc ""]

type nonrec exclude_uppercase_type = bool [@@ocaml.doc ""]

type nonrec random_password_type = string [@@ocaml.doc ""]

type nonrec get_random_password_response = {
  random_password : random_password_type option; [@ocaml.doc "A string with the password.\n"]
}
[@@ocaml.doc ""]

type nonrec require_each_included_type_type = bool [@@ocaml.doc ""]

type nonrec include_space_type = bool [@@ocaml.doc ""]

type nonrec password_length_type = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec get_random_password_request = {
  password_length : password_length_type option;
      [@ocaml.doc
        "The length of the password. If you don't include this parameter, the default length is 32 \
         characters.\n"]
  exclude_characters : exclude_characters_type option;
      [@ocaml.doc "A string of the characters that you don't want in the password.\n"]
  exclude_numbers : exclude_numbers_type option;
      [@ocaml.doc
        "Specifies whether to exclude numbers from the password. If you don't include this switch, \
         the password can contain numbers.\n"]
  exclude_punctuation : exclude_punctuation_type option;
      [@ocaml.doc
        "Specifies whether to exclude the following punctuation characters from the password: [! \
         \" # $ % & ' ( ) * + , - . / : ; < = > ? @ \\[ \\ \\] ^ _ ` { | }\n\
        \                ~]. If you don't include this switch, the password can contain punctuation.\n"]
  exclude_uppercase : exclude_uppercase_type option;
      [@ocaml.doc
        "Specifies whether to exclude uppercase letters from the password. If you don't include \
         this switch, the password can contain uppercase letters.\n"]
  exclude_lowercase : exclude_lowercase_type option;
      [@ocaml.doc
        "Specifies whether to exclude lowercase letters from the password. If you don't include \
         this switch, the password can contain lowercase letters.\n"]
  include_space : include_space_type option;
      [@ocaml.doc
        "Specifies whether to include the space character. If you include this switch, the \
         password can contain space characters.\n"]
  require_each_included_type : require_each_included_type_type option;
      [@ocaml.doc
        "Specifies whether to include at least one upper and lowercase letter, one number, and one \
         punctuation. If you don't include this switch, the password contains at least one of \
         every character type.\n"]
}
[@@ocaml.doc ""]

type nonrec non_empty_resource_policy_type = string [@@ocaml.doc ""]

type nonrec get_resource_policy_response = {
  ar_n : secret_arn_type option;
      [@ocaml.doc "The ARN of the secret that the resource-based policy was retrieved for.\n"]
  name : name_type option;
      [@ocaml.doc "The name of the secret that the resource-based policy was retrieved for.\n"]
  resource_policy : non_empty_resource_policy_type option;
      [@ocaml.doc
        "A JSON-formatted string that contains the permissions policy attached to the secret. For \
         more information about permissions policies, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
         and access control for Secrets Manager}.\n"]
}
[@@ocaml.doc ""]

type nonrec get_resource_policy_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to retrieve the attached resource-based policy for.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec get_secret_value_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The friendly name of the secret.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc "The unique identifier of this version of the secret.\n"]
  secret_binary : secret_binary_type option;
      [@ocaml.doc
        "The decrypted secret value, if the secret value was originally provided as binary data in \
         the form of a byte array. When you retrieve a [SecretBinary] using the HTTP API, the \
         Python SDK, or the Amazon Web Services CLI, the value is Base64-encoded. Otherwise, it is \
         not encoded.\n\n\
        \ If the secret was created by using the Secrets Manager console, or if the secret value \
         was originally provided as a string, then this field is omitted. The secret value appears \
         in [SecretString] instead.\n\
        \ \n\
        \  Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \  "]
  secret_string : secret_string_type option;
      [@ocaml.doc
        "The decrypted secret value, if the secret value was originally provided as a string or \
         through the Secrets Manager console.\n\n\
        \ If this secret was created by using the console, then Secrets Manager stores the \
         information as a JSON structure of key/value pairs. \n\
        \ \n\
        \  Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \  "]
  version_stages : secret_version_stages_type option;
      [@ocaml.doc
        "A list of all of the staging labels currently attached to this version of the secret.\n"]
  created_date : created_date_type option;
      [@ocaml.doc
        "The date and time that this version of the secret was created. If you don't specify which \
         version in [VersionId] or [VersionStage], then Secrets Manager uses the [AWSCURRENT] \
         version.\n"]
}
[@@ocaml.doc ""]

type nonrec get_secret_value_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to retrieve. To retrieve a secret from another account, you \
         must use an ARN.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  version_id : secret_version_id_type option;
      [@ocaml.doc
        "The unique identifier of the version of the secret to retrieve. If you include both this \
         parameter and [VersionStage], the two parameters must refer to the same secret version. \
         If you don't specify either a [VersionStage] or [VersionId], then Secrets Manager returns \
         the [AWSCURRENT] version.\n\n\
        \ This value is typically a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID-type} value with 32 \
         hexadecimal digits.\n\
        \ "]
  version_stage : secret_version_stage_type option;
      [@ocaml.doc
        "The staging label of the version of the secret to retrieve. \n\n\
        \ Secrets Manager uses staging labels to keep track of different versions during the \
         rotation process. If you include both this parameter and [VersionId], the two parameters \
         must refer to the same secret version. If you don't specify either a [VersionStage] or \
         [VersionId], Secrets Manager returns the [AWSCURRENT] version.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec kms_key_id_list_type = kms_key_id_type list [@@ocaml.doc ""]

type nonrec secret_versions_list_entry = {
  version_id : secret_version_id_type option;
      [@ocaml.doc "The unique version identifier of this version of the secret.\n"]
  version_stages : secret_version_stages_type option;
      [@ocaml.doc
        "An array of staging labels that are currently associated with this version of the secret.\n"]
  last_accessed_date : last_accessed_date_type option;
      [@ocaml.doc
        "The date that this version of the secret was last accessed. Note that the resolution of \
         this field is at the date level and does not include the time.\n"]
  created_date : created_date_type option;
      [@ocaml.doc "The date and time this version of the secret was created.\n"]
  kms_key_ids : kms_key_id_list_type option;
      [@ocaml.doc "The KMS keys used to encrypt the secret version.\n"]
}
[@@ocaml.doc "A structure that contains information about one version of a secret.\n"]

type nonrec secret_versions_list_type = secret_versions_list_entry list [@@ocaml.doc ""]

type nonrec list_secret_version_ids_response = {
  versions : secret_versions_list_type option;
      [@ocaml.doc "A list of the versions of the secret.\n"]
  next_token : next_token_type option;
      [@ocaml.doc
        "Secrets Manager includes this value if there's more output available than what is \
         included in the current response. This can occur even when the response includes no \
         values at all, such as when you ask for a filtered view of a long list. To get the next \
         results, call [ListSecretVersionIds] again with this value. \n"]
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results_type = int [@@ocaml.doc ""]

type nonrec list_secret_version_ids_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret whose versions you want to list.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  max_results : max_results_type option;
      [@ocaml.doc
        "The number of results to include in the response.\n\n\
        \ If there are more results available, in the response, Secrets Manager includes \
         [NextToken]. To get the next results, call [ListSecretVersionIds] again with the value \
         from [NextToken]. \n\
        \ "]
  next_token : next_token_type option;
      [@ocaml.doc
        "A token that indicates where the output should continue from, if a previous call did not \
         show all results. To get the next results, call [ListSecretVersionIds] again with this \
         value.\n"]
  include_deprecated : boolean_type option;
      [@ocaml.doc
        "Specifies whether to include versions of secrets that don't have any staging labels \
         attached to them. Versions without staging labels are considered deprecated and are \
         subject to deletion by Secrets Manager. By default, versions without staging labels \
         aren't included.\n"]
}
[@@ocaml.doc ""]

type nonrec secret_list_entry = {
  ar_n : secret_arn_type option; [@ocaml.doc "The Amazon Resource Name (ARN) of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The friendly name of the secret. \n"]
  type_ : medea_type_type option;
      [@ocaml.doc
        "The exact string that identifies the third-party partner that holds the external secret. \
         For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
         external secret partners}.\n"]
  description : description_type option;
      [@ocaml.doc "The user-provided description of the secret.\n"]
  kms_key_id : kms_key_id_type option;
      [@ocaml.doc
        "The ARN of the KMS key that Secrets Manager uses to encrypt the secret value. If the \
         secret is encrypted with the Amazon Web Services managed key [aws/secretsmanager], this \
         field is omitted.\n"]
  rotation_enabled : rotation_enabled_type option;
      [@ocaml.doc "Indicates whether automatic, scheduled rotation is enabled for this secret.\n"]
  rotation_lambda_ar_n : rotation_lambda_arn_type option;
      [@ocaml.doc
        "The ARN of an Amazon Web Services Lambda function invoked by Secrets Manager to rotate \
         and expire the secret either automatically per the schedule or manually by a call to \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_RotateSecret.html} \
         [RotateSecret] }.\n"]
  rotation_rules : rotation_rules_type option;
      [@ocaml.doc "A structure that defines the rotation configuration for the secret.\n"]
  external_secret_rotation_metadata : external_secret_rotation_metadata_type option;
      [@ocaml.doc
        "The metadata needed to successfully rotate a managed external secret. A list of key value \
         pairs in JSON format specified by the partner. For more information about the required \
         information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
         external secrets partners}.\n"]
  external_secret_rotation_role_arn : role_arn_type option;
      [@ocaml.doc
        "The role that Secrets Manager assumes to call APIs required to perform the rotation. For \
         more information about the required information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
         external secrets partners}.\n"]
  last_rotated_date : last_rotated_date_type option;
      [@ocaml.doc
        "The most recent date and time that the Secrets Manager rotation process was successfully \
         completed. This value is null if the secret hasn't ever rotated.\n"]
  last_changed_date : last_changed_date_type option;
      [@ocaml.doc "The last date and time that this secret was modified in any way.\n"]
  last_accessed_date : last_accessed_date_type option;
      [@ocaml.doc
        "The date that the secret was last accessed in the Region. This field is omitted if the \
         secret has never been retrieved in the Region.\n"]
  deleted_date : deleted_date_type option;
      [@ocaml.doc
        "The date and time the deletion of the secret occurred. Not present on active secrets. The \
         secret can be recovered until the number of days in the recovery window has passed, as \
         specified in the [RecoveryWindowInDays] parameter of the \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_DeleteSecret.html} \
         [DeleteSecret] } operation.\n"]
  next_rotation_date : next_rotation_date_type option;
      [@ocaml.doc
        "The next rotation is scheduled to occur on or before this date. If the secret isn't \
         configured for rotation or rotation has been disabled, Secrets Manager returns null.\n"]
  tags : tag_list_type option;
      [@ocaml.doc
        "The list of user-defined tags associated with the secret. To add tags to a secret, use \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_TagResource.html} \
         [TagResource] }. To remove tags, use \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_UntagResource.html} \
         [UntagResource] }.\n"]
  secret_versions_to_stages : secret_versions_to_stages_map_type option;
      [@ocaml.doc
        "A list of all of the currently assigned [SecretVersionStage] staging labels and the \
         [SecretVersionId] attached to each one. Staging labels are used to keep track of the \
         different versions during the rotation process.\n\n\
        \  A version that does not have any [SecretVersionStage] is considered deprecated and \
         subject to deletion. Such versions are not included in this list.\n\
        \  \n\
        \   "]
  owning_service : owning_service_type option;
      [@ocaml.doc "Returns the name of the service that created the secret.\n"]
  created_date : timestamp_type option;
      [@ocaml.doc "The date and time when a secret was created.\n"]
  primary_region : region_type option;
      [@ocaml.doc "The Region where Secrets Manager originated the secret.\n"]
}
[@@ocaml.doc
  "A structure that contains the details about a secret. It does not include the encrypted \
   [SecretString] and [SecretBinary] values. To get those values, use \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html}GetSecretValue} \
   .\n"]

type nonrec secret_list_type = secret_list_entry list [@@ocaml.doc ""]

type nonrec list_secrets_response = {
  secret_list : secret_list_type option; [@ocaml.doc "A list of the secrets in the account.\n"]
  next_token : next_token_type option;
      [@ocaml.doc
        "Secrets Manager includes this value if there's more output available than what is \
         included in the current response. This can occur even when the response includes no \
         values at all, such as when you ask for a filtered view of a long list. To get the next \
         results, call [ListSecrets] again with this value.\n"]
}
[@@ocaml.doc ""]

type nonrec sort_by_type =
  | Created_date [@ocaml.doc ""]
  | Last_accessed_date [@ocaml.doc ""]
  | Last_changed_date [@ocaml.doc ""]
  | Name [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec sort_order_type = Asc [@ocaml.doc ""] | Desc [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec list_secrets_request = {
  include_planned_deletion : boolean_type option;
      [@ocaml.doc
        "Specifies whether to include secrets scheduled for deletion. By default, secrets \
         scheduled for deletion aren't included.\n"]
  max_results : max_results_type option;
      [@ocaml.doc
        "The number of results to include in the response.\n\n\
        \ If there are more results available, in the response, Secrets Manager includes \
         [NextToken]. To get the next results, call [ListSecrets] again with the value from \
         [NextToken].\n\
        \ "]
  next_token : next_token_type option;
      [@ocaml.doc
        "A token that indicates where the output should continue from, if a previous call did not \
         show all results. To get the next results, call [ListSecrets] again with this value.\n"]
  filters : filters_list_type option; [@ocaml.doc "The filters to apply to the list of secrets.\n"]
  sort_order : sort_order_type option; [@ocaml.doc "Secrets are listed by [CreatedDate]. \n"]
  sort_by : sort_by_type option;
      [@ocaml.doc "If not specified, secrets are listed by [CreatedDate].\n"]
}
[@@ocaml.doc ""]

type nonrec public_policy_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The [BlockPublicPolicy] parameter is set to true, and the resource policy did not prevent broad \
   access to the secret.\n"]

type nonrec put_resource_policy_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : name_type option; [@ocaml.doc "The name of the secret.\n"]
}
[@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to attach the resource-based policy.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  resource_policy : non_empty_resource_policy_type;
      [@ocaml.doc
        "A JSON-formatted string for an Amazon Web Services resource-based policy. For example \
         policies, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html}Permissions \
         policy examples}.\n"]
  block_public_policy : boolean_type option;
      [@ocaml.doc
        "Specifies whether to block resource-based policies that allow broad access to the secret, \
         for example those that use a wildcard for the principal. By default, public policies \
         aren't blocked.\n\n\
        \  Resource policy validation and the BlockPublicPolicy parameter help protect your \
         resources by preventing public access from being granted through the resource policies \
         that are directly attached to your secrets. In addition to using these features, \
         carefully inspect the following policies to confirm that they do not grant public access:\n\
        \  \n\
        \   {ul\n\
        \         {-  Identity-based policies attached to associated Amazon Web Services \
         principals (for example, IAM roles)\n\
        \             \n\
        \              }\n\
        \         {-  Resource-based policies attached to associated Amazon Web Services resources \
         (for example, Key Management Service (KMS) keys)\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   To review permissions to your secrets, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/determine-acccess_examine-iam-policies.html}Determine \
         who has permissions to your secrets}.\n\
        \   \n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec put_secret_value_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc "The unique identifier of the version of the secret.\n"]
  version_stages : secret_version_stages_type option;
      [@ocaml.doc
        "The list of staging labels that are currently attached to this version of the secret. \
         Secrets Manager uses staging labels to track a version as it progresses through the \
         secret rotation process.\n"]
}
[@@ocaml.doc ""]

type nonrec rotation_token_type = string [@@ocaml.doc ""]

type nonrec put_secret_value_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to add a new version to.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ \n\
        \  If the secret doesn't already exist, use [CreateSecret] instead.\n\
        \  "]
  client_request_token : client_request_token_type option;
      [@ocaml.doc
        "A unique identifier for the new version of the secret. \n\n\
        \  If you use the Amazon Web Services CLI or one of the Amazon Web Services SDKs to call \
         this operation, then you can leave this parameter empty. The CLI or SDK generates a \
         random UUID for you and includes it as the value for this parameter in the request. \n\
        \  \n\
        \    If you generate a raw HTTP request to the Secrets Manager service endpoint, then you \
         must generate a [ClientRequestToken] and include it in the request.\n\
        \    \n\
        \     This value helps ensure idempotency. Secrets Manager uses this value to prevent the \
         accidental creation of duplicate versions if there are failures and retries during a \
         rotation. We recommend that you generate a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID-type} value to ensure \
         uniqueness of your versions within the specified secret. \n\
        \     \n\
        \      {ul\n\
        \            {-  If the [ClientRequestToken] value isn't already associated with a version \
         of the secret then a new version of the secret is created. \n\
        \                \n\
        \                 }\n\
        \            {-  If a version with this value already exists and that version's \
         [SecretString] or [SecretBinary] values are the same as those in the request then the \
         request is ignored. The operation is idempotent. \n\
        \                \n\
        \                 }\n\
        \            {-  If a version with this value already exists and the version of the \
         [SecretString] and [SecretBinary] values are different from those in the request, then \
         the request fails because you can't modify a secret version. You can only create new \
         versions to store new secret values.\n\
        \                \n\
        \                 }\n\
        \            }\n\
        \   This value becomes the [VersionId] of the new version.\n\
        \   "]
  secret_binary : secret_binary_type option;
      [@ocaml.doc
        "The binary data to encrypt and store in the new version of the secret. To use this \
         parameter in the command-line tools, we recommend that you store your binary data in a \
         file and then pass the contents of the file as a parameter. \n\n\
        \ You must include [SecretBinary] or [SecretString], but not both.\n\
        \ \n\
        \  You can't access this value from the Secrets Manager console.\n\
        \  \n\
        \   Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \   "]
  secret_string : secret_string_type option;
      [@ocaml.doc
        "The text to encrypt and store in the new version of the secret. \n\n\
        \ You must include [SecretBinary] or [SecretString], but not both.\n\
        \ \n\
        \  We recommend you create the secret string as JSON key/value pairs, as shown in the \
         example.\n\
        \  \n\
        \   Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \   "]
  version_stages : secret_version_stages_type option;
      [@ocaml.doc
        "A list of staging labels to attach to this version of the secret. Secrets Manager uses \
         staging labels to track versions of a secret through the rotation process.\n\n\
        \ If you specify a staging label that's already associated with a different version of the \
         same secret, then Secrets Manager removes the label from the other version and attaches \
         it to this version. If you specify [AWSCURRENT], and it is already attached to another \
         version, then Secrets Manager also moves the staging label [AWSPREVIOUS] to the version \
         that [AWSCURRENT] was removed from.\n\
        \ \n\
        \  If you don't include [VersionStages], then Secrets Manager automatically moves the \
         staging label [AWSCURRENT] to this version.\n\
        \  "]
  rotation_token : rotation_token_type option;
      [@ocaml.doc
        "A unique identifier that indicates the source of the request. Required for secret \
         rotations using an IAM assumed role or cross-account rotation, in which you rotate a \
         secret in one account by using a Lambda rotation function in another account. In both \
         cases, the rotation function assumes an IAM role to call Secrets Manager, and then \
         Secrets Manager validates the identity using the token. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html}How \
         rotation works} and \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_lambda}Rotation \
         by Lambda functions}.\n\n\
        \ Sensitive: This field contains sensitive information, so the service does not include it \
         in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec remove_regions_from_replication_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the primary secret.\n"]
  replication_status : replication_status_list_type option;
      [@ocaml.doc "The status of replicas for this secret after you remove Regions.\n"]
}
[@@ocaml.doc ""]

type nonrec remove_replica_region_list_type = region_type list [@@ocaml.doc ""]

type nonrec remove_regions_from_replication_request = {
  secret_id : secret_id_type; [@ocaml.doc "The ARN or name of the secret.\n"]
  remove_replica_regions : remove_replica_region_list_type;
      [@ocaml.doc "The Regions of the replicas to remove.\n"]
}
[@@ocaml.doc ""]

type nonrec replicate_secret_to_regions_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the primary secret.\n"]
  replication_status : replication_status_list_type option;
      [@ocaml.doc "The status of replication.\n"]
}
[@@ocaml.doc ""]

type nonrec replicate_secret_to_regions_request = {
  secret_id : secret_id_type; [@ocaml.doc "The ARN or name of the secret to replicate.\n"]
  add_replica_regions : add_replica_region_list_type;
      [@ocaml.doc "A list of Regions in which to replicate the secret.\n"]
  force_overwrite_replica_secret : boolean_type option;
      [@ocaml.doc
        "Specifies whether to overwrite a secret with the same name in the destination Region. By \
         default, secrets aren't overwritten.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret that was restored.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret that was restored.\n"]
}
[@@ocaml.doc ""]

type nonrec restore_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to restore.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec rotate_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc "The ID of the new version of the secret.\n"]
}
[@@ocaml.doc ""]

type nonrec rotate_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret to rotate.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  client_request_token : client_request_token_type option;
      [@ocaml.doc
        "A unique identifier for the new version of the secret. You only need to specify this \
         value if you implement your own retry logic and you want to ensure that Secrets Manager \
         doesn't attempt to create a secret version twice.\n\n\
        \  If you use the Amazon Web Services CLI or one of the Amazon Web Services SDKs to call \
         this operation, then you can leave this parameter empty. The CLI or SDK generates a \
         random UUID for you and includes it as the value for this parameter in the request. \n\
        \  \n\
        \    If you generate a raw HTTP request to the Secrets Manager service endpoint, then you \
         must generate a [ClientRequestToken] and include it in the request.\n\
        \    \n\
        \     This value helps ensure idempotency. Secrets Manager uses this value to prevent the \
         accidental creation of duplicate versions if there are failures and retries during a \
         rotation. We recommend that you generate a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID-type} value to ensure \
         uniqueness of your versions within the specified secret. \n\
        \     "]
  rotation_lambda_ar_n : rotation_lambda_arn_type option;
      [@ocaml.doc
        "For secrets that use a Lambda rotation function to rotate, the ARN of the Lambda rotation \
         function. \n\n\
        \ For secrets that use {i managed rotation}, omit this field. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_managed.html}Managed \
         rotation} in the {i Secrets Manager User Guide}.\n\
        \ "]
  rotation_rules : rotation_rules_type option;
      [@ocaml.doc
        "A structure that defines the rotation configuration for this secret.\n\n\
        \  When changing an existing rotation schedule and setting [RotateImmediately] to [false]:\n\
        \  \n\
        \   {ul\n\
        \         {-  If using [AutomaticallyAfterDays] or a [ScheduleExpression] with [rate()], \
         the previously scheduled rotation might still occur.\n\
        \             \n\
        \              }\n\
        \         {-  To prevent unintended rotations, use a [ScheduleExpression] with [cron()] \
         for granular control over rotation windows.\n\
        \             \n\
        \              }\n\
        \         }\n\
        \   "]
  external_secret_rotation_metadata : external_secret_rotation_metadata_type option;
      [@ocaml.doc
        "The metadata needed to successfully rotate a managed external secret. A list of key value \
         pairs in JSON format specified by the partner. For more information about the required \
         information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/managed-external-secrets.html}Using \
         Secrets Manager managed external secrets} \n"]
  external_secret_rotation_role_arn : role_arn_type option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that allows Secrets Manager to rotate a secret \
         held by a third-party partner. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-security.html}Security \
         and permissions}.\n"]
  rotate_immediately : boolean_type option;
      [@ocaml.doc
        "Specifies whether to rotate the secret immediately or wait until the next scheduled \
         rotation window. The rotation schedule is defined in \
         [RotateSecretRequest$RotationRules].\n\n\
        \ The default for [RotateImmediately] is [true]. If you don't specify this value, Secrets \
         Manager rotates the secret immediately.\n\
        \ \n\
        \  If you set [RotateImmediately] to [false], Secrets Manager tests the rotation \
         configuration by running the \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html} \
         [testSecret] step} of the Lambda rotation function. This test creates an [AWSPENDING] \
         version of the secret and then removes it.\n\
        \  \n\
        \   When changing an existing rotation schedule and setting [RotateImmediately] to [false]:\n\
        \   \n\
        \    {ul\n\
        \          {-  If using [AutomaticallyAfterDays] or a [ScheduleExpression] with [rate()], \
         the previously scheduled rotation might still occur.\n\
        \              \n\
        \               }\n\
        \          {-  To prevent unintended rotations, use a [ScheduleExpression] with [cron()] \
         for granular control over rotation windows.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \   Rotation is an asynchronous process. For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html}How \
         rotation works}.\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec stop_replication_to_replica_response = {
  ar_n : secret_arn_type option;
      [@ocaml.doc
        "The ARN of the promoted secret. The ARN is the same as the original primary secret except \
         the Region is changed.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_replication_to_replica_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The name of the secret or the replica ARN. The replica ARN is the same as the original \
         primary secret ARN expect the Region is changed to the replica Region. \n"]
}
[@@ocaml.doc ""]

type nonrec tag_key_list_type = tag_key_type list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The identifier for the secret to attach tags to. You can specify either the Amazon \
         Resource Name (ARN) or the friendly name of the secret.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  tags : tag_list_type;
      [@ocaml.doc
        "The tags to attach to the secret as a JSON text string argument. Each element in the list \
         consists of a [Key] and a [Value].\n\n\
        \ For storing multiple values, we recommend that you use a JSON text string argument and \
         specify key/value pairs. For more information, see \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html}Specifying \
         parameter values for the Amazon Web Services CLI} in the Amazon Web Services CLI User \
         Guide.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  tag_keys : tag_key_list_type;
      [@ocaml.doc
        "A list of tag key names to remove from the secret. You don't specify the value. Both the \
         key and its associated value are removed.\n\n\
        \ This parameter requires a JSON text string argument.\n\
        \ \n\
        \  For storing multiple values, we recommend that you use a JSON text string argument and \
         specify key/value pairs. For more information, see \
         {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters.html}Specifying \
         parameter values for the Amazon Web Services CLI} in the Amazon Web Services CLI User \
         Guide.\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec update_secret_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret that was updated.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret that was updated.\n"]
  version_id : secret_version_id_type option;
      [@ocaml.doc
        "If Secrets Manager created a new version of the secret during this operation, then \
         [VersionId] contains the unique identifier of the new version.\n"]
}
[@@ocaml.doc ""]

type nonrec update_secret_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or name of the secret.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  client_request_token : client_request_token_type option;
      [@ocaml.doc
        "If you include [SecretString] or [SecretBinary], then Secrets Manager creates a new \
         version for the secret, and this parameter specifies the unique identifier for the new \
         version.\n\n\
        \  If you use the Amazon Web Services CLI or one of the Amazon Web Services SDKs to call \
         this operation, then you can leave this parameter empty. The CLI or SDK generates a \
         random UUID for you and includes it as the value for this parameter in the request. \n\
        \  \n\
        \    If you generate a raw HTTP request to the Secrets Manager service endpoint, then you \
         must generate a [ClientRequestToken] and include it in the request.\n\
        \    \n\
        \     This value helps ensure idempotency. Secrets Manager uses this value to prevent the \
         accidental creation of duplicate versions if there are failures and retries during a \
         rotation. We recommend that you generate a \
         {{:https://wikipedia.org/wiki/Universally_unique_identifier}UUID-type} value to ensure \
         uniqueness of your versions within the specified secret. \n\
        \     "]
  description : description_type option; [@ocaml.doc "The description of the secret.\n"]
  kms_key_id : kms_key_id_type option;
      [@ocaml.doc
        "The ARN, key ID, or alias of the KMS key that Secrets Manager uses to encrypt new secret \
         versions as well as any existing versions with the staging labels [AWSCURRENT], \
         [AWSPENDING], or [AWSPREVIOUS]. If you don't have [kms:Encrypt] permission to the new \
         key, Secrets Manager does not re-encrypt existing secret versions with the new key. For \
         more information about versions and staging labels, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version}Concepts: \
         Version}.\n\n\
        \ A key alias is always prefixed by [alias/], for example [alias/aws/secretsmanager]. For \
         more information, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/alias-about.html}About aliases}.\n\
        \ \n\
        \  If you set this to an empty string, Secrets Manager uses the Amazon Web Services \
         managed key [aws/secretsmanager]. If this key doesn't already exist in your account, then \
         Secrets Manager creates it for you automatically. All users and roles in the Amazon Web \
         Services account automatically have access to use [aws/secretsmanager]. Creating \
         [aws/secretsmanager] can result in a one-time significant delay in returning the result. \n\
        \  \n\
        \    You can only use the Amazon Web Services managed key [aws/secretsmanager] if you call \
         this operation using credentials from the same Amazon Web Services account that owns the \
         secret. If the secret is in a different account, then you must use a customer managed key \
         and provide the ARN of that KMS key in this field. The user making the call must have \
         permissions to both the secret and the KMS key in their respective accounts.\n\
        \    \n\
        \     "]
  secret_binary : secret_binary_type option;
      [@ocaml.doc
        "The binary data to encrypt and store in the new version of the secret. We recommend that \
         you store your binary data in a file and then pass the contents of the file as a \
         parameter. \n\n\
        \ Either [SecretBinary] or [SecretString] must have a value, but not both.\n\
        \ \n\
        \  You can't access this parameter in the Secrets Manager console.\n\
        \  \n\
        \   Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \   "]
  secret_string : secret_string_type option;
      [@ocaml.doc
        "The text data to encrypt and store in the new version of the secret. We recommend you use \
         a JSON structure of key/value pairs for your secret value. \n\n\
        \ Either [SecretBinary] or [SecretString] must have a value, but not both. \n\
        \ \n\
        \  Sensitive: This field contains sensitive information, so the service does not include \
         it in CloudTrail log entries. If you create your own log entries, you must also avoid \
         logging the information in this field.\n\
        \  "]
  type_ : medea_type_type option;
      [@ocaml.doc
        "The exact string that identifies the third-party partner that holds the external secret. \
         For more information, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/mes-partners.html}Managed \
         external secret partners}.\n"]
}
[@@ocaml.doc ""]

type nonrec update_secret_version_stage_response = {
  ar_n : secret_arn_type option; [@ocaml.doc "The ARN of the secret that was updated.\n"]
  name : secret_name_type option; [@ocaml.doc "The name of the secret that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_secret_version_stage_request = {
  secret_id : secret_id_type;
      [@ocaml.doc
        "The ARN or the name of the secret with the version and staging labelsto modify.\n\n\
        \ For an ARN, we recommend that you specify a complete ARN rather than a partial ARN. See \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot.html#ARN_secretnamehyphen}Finding \
         a secret from a partial ARN}.\n\
        \ "]
  version_stage : secret_version_stage_type;
      [@ocaml.doc "The staging label to add to this version.\n"]
  remove_from_version_id : secret_version_id_type option;
      [@ocaml.doc
        "The ID of the version that the staging label is to be removed from. If the staging label \
         you are trying to attach to one version is already attached to a different version, then \
         you must include this parameter and specify the version that the label is to be removed \
         from. If the label is attached and you either do not specify this parameter, or the \
         version ID does not match, then the operation fails.\n"]
  move_to_version_id : secret_version_id_type option;
      [@ocaml.doc
        "The ID of the version to add the staging label to. To remove a label from a version, then \
         do not specify this parameter.\n\n\
        \ If the staging label is already attached to a different version of the secret, then you \
         must also specify the [RemoveFromVersionId] parameter. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec validation_errors_entry = {
  check_name : name_type option; [@ocaml.doc "Checks the name of the policy.\n"]
  error_message : error_message option;
      [@ocaml.doc
        "Displays error messages if validation encounters problems during validation of the \
         resource policy.\n"]
}
[@@ocaml.doc "Displays errors that occurred during validation of the resource policy.\n"]

type nonrec validation_errors_type = validation_errors_entry list [@@ocaml.doc ""]

type nonrec validate_resource_policy_response = {
  policy_validation_passed : boolean_type option;
      [@ocaml.doc "True if your policy passes validation, otherwise false.\n"]
  validation_errors : validation_errors_type option;
      [@ocaml.doc "Validation errors if your policy didn't pass validation.\n"]
}
[@@ocaml.doc ""]

type nonrec validate_resource_policy_request = {
  secret_id : secret_id_type option;
      [@ocaml.doc
        "The ARN or name of the secret with the resource-based policy you want to validate.\n"]
  resource_policy : non_empty_resource_policy_type;
      [@ocaml.doc
        "A JSON-formatted string that contains an Amazon Web Services resource-based policy. The \
         policy in the string identifies who can access or manage this secret and its versions. \
         For example policies, see \
         {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_examples.html}Permissions \
         policy examples}.\n"]
}
[@@ocaml.doc ""]
