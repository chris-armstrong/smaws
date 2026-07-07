(** Secrets Manager client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_errors_entry :
  ?error_message:error_message -> ?check_name:name_type -> unit -> validation_errors_entry

val make_validate_resource_policy_response :
  ?validation_errors:validation_errors_type ->
  ?policy_validation_passed:boolean_type ->
  unit ->
  validate_resource_policy_response

val make_validate_resource_policy_request :
  ?secret_id:secret_id_type ->
  resource_policy:non_empty_resource_policy_type ->
  unit ->
  validate_resource_policy_request

val make_update_secret_version_stage_response :
  ?name:secret_name_type -> ?ar_n:secret_arn_type -> unit -> update_secret_version_stage_response

val make_update_secret_version_stage_request :
  ?move_to_version_id:secret_version_id_type ->
  ?remove_from_version_id:secret_version_id_type ->
  version_stage:secret_version_stage_type ->
  secret_id:secret_id_type ->
  unit ->
  update_secret_version_stage_request

val make_update_secret_response :
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  update_secret_response

val make_update_secret_request :
  ?type_:medea_type_type ->
  ?secret_string:secret_string_type ->
  ?secret_binary:secret_binary_type ->
  ?kms_key_id:kms_key_id_type ->
  ?description:description_type ->
  ?client_request_token:client_request_token_type ->
  secret_id:secret_id_type ->
  unit ->
  update_secret_request

val make_untag_resource_request :
  tag_keys:tag_key_list_type -> secret_id:secret_id_type -> unit -> untag_resource_request

val make_tag : ?value:tag_value_type -> ?key:tag_key_type -> unit -> tag

val make_tag_resource_request :
  tags:tag_list_type -> secret_id:secret_id_type -> unit -> tag_resource_request

val make_stop_replication_to_replica_response :
  ?ar_n:secret_arn_type -> unit -> stop_replication_to_replica_response

val make_stop_replication_to_replica_request :
  secret_id:secret_id_type -> unit -> stop_replication_to_replica_request

val make_rotate_secret_response :
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  rotate_secret_response

val make_rotation_rules_type :
  ?schedule_expression:schedule_expression_type ->
  ?duration:duration_type ->
  ?automatically_after_days:automatically_rotate_after_days_type ->
  unit ->
  rotation_rules_type

val make_external_secret_rotation_metadata_item :
  ?value:external_secret_rotation_metadata_item_value_type ->
  ?key:external_secret_rotation_metadata_item_key_type ->
  unit ->
  external_secret_rotation_metadata_item

val make_rotate_secret_request :
  ?rotate_immediately:boolean_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?rotation_rules:rotation_rules_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?client_request_token:client_request_token_type ->
  secret_id:secret_id_type ->
  unit ->
  rotate_secret_request

val make_restore_secret_response :
  ?name:secret_name_type -> ?ar_n:secret_arn_type -> unit -> restore_secret_response

val make_restore_secret_request : secret_id:secret_id_type -> unit -> restore_secret_request

val make_replication_status_type :
  ?last_accessed_date:last_accessed_date_type ->
  ?status_message:status_message_type ->
  ?status:status_type ->
  ?kms_key_id:kms_key_id_type ->
  ?region:region_type ->
  unit ->
  replication_status_type

val make_replicate_secret_to_regions_response :
  ?replication_status:replication_status_list_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  replicate_secret_to_regions_response

val make_replica_region_type :
  ?kms_key_id:kms_key_id_type -> ?region:region_type -> unit -> replica_region_type

val make_replicate_secret_to_regions_request :
  ?force_overwrite_replica_secret:boolean_type ->
  add_replica_regions:add_replica_region_list_type ->
  secret_id:secret_id_type ->
  unit ->
  replicate_secret_to_regions_request

val make_remove_regions_from_replication_response :
  ?replication_status:replication_status_list_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  remove_regions_from_replication_response

val make_remove_regions_from_replication_request :
  remove_replica_regions:remove_replica_region_list_type ->
  secret_id:secret_id_type ->
  unit ->
  remove_regions_from_replication_request

val make_put_secret_value_response :
  ?version_stages:secret_version_stages_type ->
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  put_secret_value_response

val make_put_secret_value_request :
  ?rotation_token:rotation_token_type ->
  ?version_stages:secret_version_stages_type ->
  ?secret_string:secret_string_type ->
  ?secret_binary:secret_binary_type ->
  ?client_request_token:client_request_token_type ->
  secret_id:secret_id_type ->
  unit ->
  put_secret_value_request

val make_put_resource_policy_response :
  ?name:name_type -> ?ar_n:secret_arn_type -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?block_public_policy:boolean_type ->
  resource_policy:non_empty_resource_policy_type ->
  secret_id:secret_id_type ->
  unit ->
  put_resource_policy_request

val make_secret_versions_list_entry :
  ?kms_key_ids:kms_key_id_list_type ->
  ?created_date:created_date_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?version_stages:secret_version_stages_type ->
  ?version_id:secret_version_id_type ->
  unit ->
  secret_versions_list_entry

val make_list_secret_version_ids_response :
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  ?next_token:next_token_type ->
  ?versions:secret_versions_list_type ->
  unit ->
  list_secret_version_ids_response

val make_list_secret_version_ids_request :
  ?include_deprecated:boolean_type ->
  ?next_token:next_token_type ->
  ?max_results:max_results_type ->
  secret_id:secret_id_type ->
  unit ->
  list_secret_version_ids_request

val make_secret_list_entry :
  ?primary_region:region_type ->
  ?created_date:timestamp_type ->
  ?owning_service:owning_service_type ->
  ?secret_versions_to_stages:secret_versions_to_stages_map_type ->
  ?tags:tag_list_type ->
  ?next_rotation_date:next_rotation_date_type ->
  ?deleted_date:deleted_date_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?last_changed_date:last_changed_date_type ->
  ?last_rotated_date:last_rotated_date_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?rotation_rules:rotation_rules_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?rotation_enabled:rotation_enabled_type ->
  ?kms_key_id:kms_key_id_type ->
  ?description:description_type ->
  ?type_:medea_type_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  secret_list_entry

val make_list_secrets_response :
  ?next_token:next_token_type -> ?secret_list:secret_list_type -> unit -> list_secrets_response

val make_filter :
  ?values:filter_values_string_list -> ?key:filter_name_string_type -> unit -> filter

val make_list_secrets_request :
  ?sort_by:sort_by_type ->
  ?sort_order:sort_order_type ->
  ?filters:filters_list_type ->
  ?next_token:next_token_type ->
  ?max_results:max_results_type ->
  ?include_planned_deletion:boolean_type ->
  unit ->
  list_secrets_request

val make_get_secret_value_response :
  ?created_date:created_date_type ->
  ?version_stages:secret_version_stages_type ->
  ?secret_string:secret_string_type ->
  ?secret_binary:secret_binary_type ->
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  get_secret_value_response

val make_get_secret_value_request :
  ?version_stage:secret_version_stage_type ->
  ?version_id:secret_version_id_type ->
  secret_id:secret_id_type ->
  unit ->
  get_secret_value_request

val make_get_resource_policy_response :
  ?resource_policy:non_empty_resource_policy_type ->
  ?name:name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  get_resource_policy_response

val make_get_resource_policy_request :
  secret_id:secret_id_type -> unit -> get_resource_policy_request

val make_get_random_password_response :
  ?random_password:random_password_type -> unit -> get_random_password_response

val make_get_random_password_request :
  ?require_each_included_type:require_each_included_type_type ->
  ?include_space:include_space_type ->
  ?exclude_lowercase:exclude_lowercase_type ->
  ?exclude_uppercase:exclude_uppercase_type ->
  ?exclude_punctuation:exclude_punctuation_type ->
  ?exclude_numbers:exclude_numbers_type ->
  ?exclude_characters:exclude_characters_type ->
  ?password_length:password_length_type ->
  unit ->
  get_random_password_request

val make_describe_secret_response :
  ?replication_status:replication_status_list_type ->
  ?primary_region:region_type ->
  ?created_date:timestamp_type ->
  ?owning_service:owning_service_type ->
  ?version_ids_to_stages:secret_versions_to_stages_map_type ->
  ?tags:tag_list_type ->
  ?next_rotation_date:next_rotation_date_type ->
  ?deleted_date:deleted_date_type ->
  ?last_accessed_date:last_accessed_date_type ->
  ?last_changed_date:last_changed_date_type ->
  ?last_rotated_date:last_rotated_date_type ->
  ?external_secret_rotation_role_arn:role_arn_type ->
  ?external_secret_rotation_metadata:external_secret_rotation_metadata_type ->
  ?rotation_rules:rotation_rules_type ->
  ?rotation_lambda_ar_n:rotation_lambda_arn_type ->
  ?rotation_enabled:rotation_enabled_type ->
  ?kms_key_id:kms_key_id_type ->
  ?description:description_type ->
  ?type_:medea_type_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  describe_secret_response

val make_describe_secret_request : secret_id:secret_id_type -> unit -> describe_secret_request

val make_delete_secret_response :
  ?deletion_date:deletion_date_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  delete_secret_response

val make_delete_secret_request :
  ?force_delete_without_recovery:boolean_type ->
  ?recovery_window_in_days:recovery_window_in_days_type ->
  secret_id:secret_id_type ->
  unit ->
  delete_secret_request

val make_delete_resource_policy_response :
  ?name:name_type -> ?ar_n:secret_arn_type -> unit -> delete_resource_policy_response

val make_delete_resource_policy_request :
  secret_id:secret_id_type -> unit -> delete_resource_policy_request

val make_create_secret_response :
  ?replication_status:replication_status_list_type ->
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  create_secret_response

val make_create_secret_request :
  ?type_:medea_type_type ->
  ?force_overwrite_replica_secret:boolean_type ->
  ?add_replica_regions:add_replica_region_list_type ->
  ?tags:tag_list_type ->
  ?secret_string:secret_string_type ->
  ?secret_binary:secret_binary_type ->
  ?kms_key_id:kms_key_id_type ->
  ?description:description_type ->
  ?client_request_token:client_request_token_type ->
  name:name_type ->
  unit ->
  create_secret_request

val make_cancel_rotate_secret_response :
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  cancel_rotate_secret_response

val make_cancel_rotate_secret_request :
  secret_id:secret_id_type -> unit -> cancel_rotate_secret_request

val make_secret_value_entry :
  ?created_date:created_date_type ->
  ?version_stages:secret_version_stages_type ->
  ?secret_string:secret_string_type ->
  ?secret_binary:secret_binary_type ->
  ?version_id:secret_version_id_type ->
  ?name:secret_name_type ->
  ?ar_n:secret_arn_type ->
  unit ->
  secret_value_entry

val make_api_error_type :
  ?message:error_message ->
  ?error_code:error_code ->
  ?secret_id:secret_id_type ->
  unit ->
  api_error_type

val make_batch_get_secret_value_response :
  ?errors:api_error_list_type ->
  ?next_token:next_token_type ->
  ?secret_values:secret_values_type ->
  unit ->
  batch_get_secret_value_response

val make_batch_get_secret_value_request :
  ?next_token:next_token_type ->
  ?max_results:max_results_batch_type ->
  ?filters:filters_list_type ->
  ?secret_id_list:secret_id_list_type ->
  unit ->
  batch_get_secret_value_request
(** {1:operations Operations} *)

module BatchGetSecretValue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DecryptionFailure of decryption_failure
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_secret_value_request ->
    ( batch_get_secret_value_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_secret_value_request ->
    ( batch_get_secret_value_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the contents of the encrypted fields [SecretString] or [SecretBinary] for up to 20 \
   secrets. To retrieve a single secret, call [GetSecretValue]. \n\n\
  \ To choose which secrets to retrieve, you can specify a list of secrets by name or ARN, or you \
   can use filters. If Secrets Manager encounters errors such as [AccessDeniedException] while \
   attempting to retrieve any of the secrets, you can see the errors in [Errors] in the response.\n\
  \ \n\
  \  Secrets Manager generates CloudTrail [GetSecretValue] log entries for each secret you request \
   when you call this action. Do not include sensitive information in request parameters because \
   it might be logged. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \  \n\
  \    {b Required permissions: } [secretsmanager:BatchGetSecretValue], and you must have \
   [secretsmanager:GetSecretValue] for each secret. If you use filters, you must also have \
   [secretsmanager:ListSecrets]. If the secrets are encrypted using customer-managed keys instead \
   of the Amazon Web Services managed key [aws/secretsmanager], then you also need [kms:Decrypt] \
   permissions for the keys. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \   "]

module CancelRotateSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_rotate_secret_request ->
    ( cancel_rotate_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_rotate_secret_request ->
    ( cancel_rotate_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Turns off automatic rotation, and if a rotation is currently in progress, cancels the rotation.\n\n\
  \ If you cancel a rotation in progress, it can leave the [VersionStage] labels in an unexpected \
   state. You might need to remove the staging label [AWSPENDING] from the partially created \
   version. You also need to determine whether to roll back to the previous version of the secret \
   by moving the staging label [AWSCURRENT] to the version that has [AWSPENDING]. To determine \
   which version has a specific staging label, call [ListSecretVersionIds]. Then use \
   [UpdateSecretVersionStage] to change staging labels. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotate-secrets_how.html}How \
   rotation works}.\n\
  \ \n\
  \  To turn on automatic rotation again, call [RotateSecret].\n\
  \  \n\
  \   Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \   \n\
  \     {b Required permissions: } [secretsmanager:CancelRotateSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \    "]

module CreateSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DecryptionFailure of decryption_failure
    | `EncryptionFailure of encryption_failure
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_secret_request ->
    ( create_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_secret_request ->
    ( create_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new secret. A {i secret} can be a password, a set of credentials such as a user name \
   and password, an OAuth token, or other secret information that you store in an encrypted form \
   in Secrets Manager. The secret also includes the connection information to access a database or \
   other service, which Secrets Manager doesn't encrypt. A secret in Secrets Manager consists of \
   both the protected secret data and the important information needed to manage the secret.\n\n\
  \ For secrets that use {i managed rotation}, you need to create the secret through the managing \
   service. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html}Secrets \
   Manager secrets managed by other Amazon Web Services services}. \n\
  \ \n\
  \  For information about creating a secret in the console, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_create-basic-secret.html}Create \
   a secret}.\n\
  \  \n\
  \   To create a secret, you can provide the secret value to be encrypted in either the \
   [SecretString] parameter or the [SecretBinary] parameter, but not both. If you include \
   [SecretString] or [SecretBinary] then Secrets Manager creates an initial secret version and \
   automatically attaches the staging label [AWSCURRENT] to it.\n\
  \   \n\
  \    For database credentials you want to rotate, for Secrets Manager to be able to rotate the \
   secret, you must make sure the JSON you store in the [SecretString] matches the \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_secret_json_structure.html}JSON \
   structure of a database secret}.\n\
  \    \n\
  \     If you don't specify an KMS encryption key, Secrets Manager uses the Amazon Web Services \
   managed key [aws/secretsmanager]. If this key doesn't already exist in your account, then \
   Secrets Manager creates it for you automatically. All users and roles in the Amazon Web \
   Services account automatically have access to use [aws/secretsmanager]. Creating \
   [aws/secretsmanager] can result in a one-time significant delay in returning the result.\n\
  \     \n\
  \      If the secret is in a different Amazon Web Services account from the credentials calling \
   the API, then you can't use [aws/secretsmanager] to encrypt the secret, and you must create and \
   use a customer managed KMS key. \n\
  \      \n\
  \       Secrets Manager generates a CloudTrail log entry when you call this action. Do not \
   include sensitive information in request parameters except [SecretBinary] or [SecretString] \
   because it might be logged. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \       \n\
  \         {b Required permissions: } [secretsmanager:CreateSecret]. If you include tags in the \
   secret, you also need [secretsmanager:TagResource]. To add replica Regions, you must also have \
   [secretsmanager:ReplicateSecretToRegions]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \        \n\
  \         To encrypt the secret with a KMS key other than [aws/secretsmanager], you need \
   [kms:GenerateDataKey] and [kms:Decrypt] permission to the key. \n\
  \         \n\
  \           When you enter commands in a command shell, there is a risk of the command history \
   being accessed or utilities having access to your command parameters. This is a concern if the \
   command includes the value of a secret. Learn how to \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/security_cli-exposure-risks.html}Mitigate \
   the risks of using command-line tools to store Secrets Manager secrets}.\n\
  \           \n\
  \            "]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the resource-based permission policy attached to the secret. To attach a policy to a \
   secret, use [PutResourcePolicy].\n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:DeleteResourcePolicy]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module DeleteSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_secret_request ->
    ( delete_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_secret_request ->
    ( delete_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a secret and all of its versions. You can specify a recovery window during which you \
   can restore the secret. The minimum recovery window is 7 days. The default recovery window is \
   30 days. Secrets Manager attaches a [DeletionDate] stamp to the secret that specifies the end \
   of the recovery window. At the end of the recovery window, Secrets Manager deletes the secret \
   permanently.\n\n\
  \ You can't delete a primary secret that is replicated to other Regions. You must first delete \
   the replicas using [RemoveRegionsFromReplication], and then delete the primary secret. When you \
   delete a replica, it is deleted immediately.\n\
  \ \n\
  \  You can't directly delete a version of a secret. Instead, you remove all staging labels from \
   the version using [UpdateSecretVersionStage]. This marks the version as deprecated, and then \
   Secrets Manager can automatically delete the version in the background.\n\
  \  \n\
  \   To determine whether an application still uses a secret, you can create an Amazon CloudWatch \
   alarm to alert you to any attempts to access a secret during the recovery window. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/monitoring_cloudwatch_deleted-secrets.html} \
   Monitor secrets scheduled for deletion}.\n\
  \   \n\
  \    Secrets Manager performs the permanent secret deletion at the end of the waiting period as \
   a background task with low priority. There is no guarantee of a specific time after the \
   recovery window for the permanent delete to occur.\n\
  \    \n\
  \     At any time before recovery window ends, you can use [RestoreSecret] to remove the \
   [DeletionDate] and cancel the deletion of the secret.\n\
  \     \n\
  \      When a secret is scheduled for deletion, you cannot retrieve the secret value. You must \
   first cancel the deletion with [RestoreSecret] and then you can retrieve the secret.\n\
  \      \n\
  \       Secrets Manager generates a CloudTrail log entry when you call this action. Do not \
   include sensitive information in request parameters because it might be logged. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \       \n\
  \         {b Required permissions: } [secretsmanager:DeleteSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \        "]

module DescribeSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_secret_request ->
    ( describe_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_secret_request ->
    ( describe_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details of a secret. It does not include the encrypted secret value. Secrets \
   Manager only returns fields that have a value in the response. \n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:DescribeSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module GetRandomPassword : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_random_password_request ->
    ( get_random_password_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_random_password_request ->
    ( get_random_password_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a random password. We recommend that you specify the maximum length and include every \
   character type that the system you are generating a password for can support. By default, \
   Secrets Manager uses uppercase and lowercase letters, numbers, and the following characters in \
   passwords: [!\\\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~] \n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:GetRandomPassword]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module GetResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policy_request ->
    ( get_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the JSON text of the resource-based policy document attached to the secret. For more \
   information about permissions policies attached to a secret, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-policies.html}Permissions \
   policies attached to a secret}.\n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:GetResourcePolicy]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module GetSecretValue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DecryptionFailure of decryption_failure
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_secret_value_request ->
    ( get_secret_value_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_secret_value_request ->
    ( get_secret_value_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the contents of the encrypted fields [SecretString] or [SecretBinary] from the \
   specified version of a secret, whichever contains content.\n\n\
  \ To retrieve the values for a group of secrets, call [BatchGetSecretValue].\n\
  \ \n\
  \  We recommend that you cache your secret values by using client-side caching. Caching secrets \
   improves speed and reduces your costs. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieving-secrets.html}Cache \
   secrets for your applications}.\n\
  \  \n\
  \   To retrieve the previous version of a secret, use [VersionStage] and specify AWSPREVIOUS. To \
   revert to the previous version of a secret, call \
   {{:https://docs.aws.amazon.com/cli/latest/reference/secretsmanager/update-secret-version-stage.html}UpdateSecretVersionStage}.\n\
  \   \n\
  \    Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \    \n\
  \      {b Required permissions: } [secretsmanager:GetSecretValue]. If the secret is encrypted \
   using a customer-managed key instead of the Amazon Web Services managed key \
   [aws/secretsmanager], then you also need [kms:Decrypt] permissions for that key. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \     "]

module ListSecrets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_secrets_request ->
    ( list_secrets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_secrets_request ->
    ( list_secrets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the secrets that are stored by Secrets Manager in the Amazon Web Services account, not \
   including secrets that are marked for deletion. To see secrets marked for deletion, use the \
   Secrets Manager console.\n\n\
  \ All Secrets Manager operations are eventually consistent. ListSecrets might not reflect \
   changes from the last five minutes. You can get more recent information for a specific secret \
   by calling [DescribeSecret].\n\
  \ \n\
  \  To list the versions of a secret, use [ListSecretVersionIds].\n\
  \  \n\
  \   To retrieve the values for the secrets, call [BatchGetSecretValue] or [GetSecretValue].\n\
  \   \n\
  \    For information about finding secrets in the console, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/manage_search-secret.html}Find \
   secrets in Secrets Manager}.\n\
  \    \n\
  \     Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \     \n\
  \       {b Required permissions: } [secretsmanager:ListSecrets]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \      "]

module ListSecretVersionIds : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `InvalidParameterException of invalid_parameter_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_secret_version_ids_request ->
    ( list_secret_version_ids_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_secret_version_ids_request ->
    ( list_secret_version_ids_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterException of invalid_parameter_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the versions of a secret. Secrets Manager uses staging labels to indicate the different \
   versions of a secret. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version} \
   Secrets Manager concepts: Versions}.\n\n\
  \ To list the secrets in the account, use [ListSecrets].\n\
  \ \n\
  \  Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \  \n\
  \    {b Required permissions: } [secretsmanager:ListSecretVersionIds]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \   "]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PublicPolicyException of public_policy_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PublicPolicyException of public_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PublicPolicyException of public_policy_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a resource-based permission policy to a secret. A resource-based policy is optional. \
   For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control for Secrets Manager} \n\n\
  \ For information about attaching a policy in the console, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access_resource-based-policies.html}Attach \
   a permissions policy to a secret}.\n\
  \ \n\
  \  Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \  \n\
  \    {b Required permissions: } [secretsmanager:PutResourcePolicy]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \   "]

module PutSecretValue : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DecryptionFailure of decryption_failure
    | `EncryptionFailure of encryption_failure
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_secret_value_request ->
    ( put_secret_value_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_secret_value_request ->
    ( put_secret_value_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new version of your secret by creating a new encrypted value and attaching it to the \
   secret. version can contain a new [SecretString] value or a new [SecretBinary] value. \n\n\
  \ Do not call [PutSecretValue] at a sustained rate of more than once every 10 minutes. When you \
   update the secret value, Secrets Manager creates a new version of the secret. Secrets Manager \
   keeps 100 of the most recent versions, but it keeps {i all} secret versions created in the last \
   24 hours. If you call [PutSecretValue] more than once every 10 minutes, you will create more \
   versions than Secrets Manager removes, and you will reach the quota for secret versions.\n\
  \ \n\
  \  You can specify the staging labels to attach to the new version in [VersionStages]. If you \
   don't include [VersionStages], then Secrets Manager automatically moves the staging label \
   [AWSCURRENT] to this version. If this operation creates the first version for the secret, then \
   Secrets Manager automatically attaches the staging label [AWSCURRENT] to it. If this operation \
   moves the staging label [AWSCURRENT] from another version to this version, then Secrets Manager \
   also automatically moves the staging label [AWSPREVIOUS] to the version that [AWSCURRENT] was \
   removed from.\n\
  \  \n\
  \   This operation is idempotent. If you call this operation with a [ClientRequestToken] that \
   matches an existing version's VersionId, and you specify the same secret data, the operation \
   succeeds but does nothing. However, if the secret data is different, then the operation fails \
   because you can't modify an existing version; you can only create new ones.\n\
  \   \n\
  \    Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters except [SecretBinary], [SecretString], or \
   [RotationToken] because it might be logged. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \    \n\
  \      {b Required permissions: } [secretsmanager:PutSecretValue]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \     \n\
  \       When you enter commands in a command shell, there is a risk of the command history being \
   accessed or utilities having access to your command parameters. This is a concern if the \
   command includes the value of a secret. Learn how to \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/security_cli-exposure-risks.html}Mitigate \
   the risks of using command-line tools to store Secrets Manager secrets}.\n\
  \       \n\
  \        "]

module RemoveRegionsFromReplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_regions_from_replication_request ->
    ( remove_regions_from_replication_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_regions_from_replication_request ->
    ( remove_regions_from_replication_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a secret that is replicated to other Regions, deletes the secret replicas from the Regions \
   you specify.\n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:RemoveRegionsFromReplication]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module ReplicateSecretToRegions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    replicate_secret_to_regions_request ->
    ( replicate_secret_to_regions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    replicate_secret_to_regions_request ->
    ( replicate_secret_to_regions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replicates the secret to a new Regions. See \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/create-manage-multi-region-secrets.html}Multi-Region \
   secrets}.\n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:ReplicateSecretToRegions]. If the primary secret \
   is encrypted with a KMS key other than [aws/secretsmanager], you also need [kms:Decrypt] \
   permission to the key. To encrypt the replicated secret with a KMS key other than \
   [aws/secretsmanager], you need [kms:GenerateDataKey] and [kms:Encrypt] to the key. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module RestoreSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    restore_secret_request ->
    ( restore_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    restore_secret_request ->
    ( restore_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels the scheduled deletion of a secret by removing the [DeletedDate] time stamp. You can \
   access a secret again after it has been restored.\n\n\
  \ Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \ \n\
  \   {b Required permissions: } [secretsmanager:RestoreSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \  "]

module RotateSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rotate_secret_request ->
    ( rotate_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rotate_secret_request ->
    ( rotate_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures and starts the asynchronous process of rotating the secret. For information about \
   rotation, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html}Rotate \
   secrets} in the {i Secrets Manager User Guide}. If you include the configuration parameters, \
   the operation sets the values for the secret and then immediately starts a rotation. If you \
   don't include the configuration parameters, the operation starts a rotation with the values \
   already stored in the secret. \n\n\
  \ When rotation is successful, the [AWSPENDING] staging label might be attached to the same \
   version as the [AWSCURRENT] version, or it might not be attached to any version. If the \
   [AWSPENDING] staging label is present but not attached to the same version as [AWSCURRENT], \
   then any later invocation of [RotateSecret] assumes that a previous rotation request is still \
   in progress and returns an error. When rotation is unsuccessful, the [AWSPENDING] staging label \
   might be attached to an empty secret version. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/troubleshoot_rotation.html}Troubleshoot \
   rotation} in the {i Secrets Manager User Guide}.\n\
  \ \n\
  \  Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \  \n\
  \    {b Required permissions: } [secretsmanager:RotateSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. You also need [lambda:InvokeFunction] permissions on \
   the rotation function. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions-function.html} \
   Permissions for rotation}.\n\
  \   "]

module StopReplicationToReplica : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_to_replica_request ->
    ( stop_replication_to_replica_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_replication_to_replica_request ->
    ( stop_replication_to_replica_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the link between the replica secret and the primary secret and promotes the replica to \
   a primary secret in the replica Region.\n\n\
  \ You must call this operation from the Region in which you want to promote the replica to a \
   primary secret.\n\
  \ \n\
  \  Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \  \n\
  \    {b Required permissions: } [secretsmanager:StopReplicationToReplica]. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches tags to a secret. Tags consist of a key name and a value. Tags are part of the \
   secret's metadata. They are not associated with specific versions of the secret. This operation \
   appends tags to the existing list of tags.\n\n\
  \ For tag quotas and naming restrictions, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/arg.html#taged-reference-quotas}Service quotas \
   for Tagging} in the {i Amazon Web Services General Reference guide}.\n\
  \ \n\
  \   If you use tags as part of your security strategy, then adding or removing a tag can change \
   permissions. If successfully completing this operation would result in you losing your \
   permissions for this secret, then the operation is blocked and returns an Access Denied error.\n\
  \   \n\
  \     Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \     \n\
  \       {b Required permissions: } [secretsmanager:TagResource]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \      "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes specific tags from a secret.\n\n\
  \ This operation is idempotent. If a requested tag is not attached to the secret, no error is \
   returned and the secret metadata is unchanged.\n\
  \ \n\
  \   If you use tags as part of your security strategy, then removing a tag can change \
   permissions. If successfully completing this operation would result in you losing your \
   permissions for this secret, then the operation is blocked and returns an Access Denied error.\n\
  \   \n\
  \     Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \     \n\
  \       {b Required permissions: } [secretsmanager:UntagResource]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \      "]

module UpdateSecret : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DecryptionFailure of decryption_failure
    | `EncryptionFailure of encryption_failure
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `PreconditionNotMetException of precondition_not_met_exception
    | `ResourceExistsException of resource_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_secret_request ->
    ( update_secret_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_secret_request ->
    ( update_secret_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DecryptionFailure of decryption_failure
      | `EncryptionFailure of encryption_failure
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `PreconditionNotMetException of precondition_not_met_exception
      | `ResourceExistsException of resource_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the details of a secret, including metadata and the secret value. To change the secret \
   value, you can also use [PutSecretValue].\n\n\
  \ To change the rotation configuration of a secret, use [RotateSecret] instead.\n\
  \ \n\
  \  To change a secret so that it is managed by another service, you need to recreate the secret \
   in that service. See \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/service-linked-secrets.html}Secrets \
   Manager secrets managed by other Amazon Web Services services}.\n\
  \  \n\
  \   We recommend you avoid calling [UpdateSecret] at a sustained rate of more than once every 10 \
   minutes. When you call [UpdateSecret] to update the secret value, Secrets Manager creates a new \
   version of the secret. Secrets Manager removes outdated versions when there are more than 100, \
   but it does not remove versions created less than 24 hours ago. If you update the secret value \
   more than once every 10 minutes, you create more versions than Secrets Manager removes, and you \
   will reach the quota for secret versions.\n\
  \   \n\
  \    If you include [SecretString] or [SecretBinary] to create a new secret version, Secrets \
   Manager automatically moves the staging label [AWSCURRENT] to the new version. Then it attaches \
   the label [AWSPREVIOUS] to the version that [AWSCURRENT] was removed from.\n\
  \    \n\
  \     If you call this operation with a [ClientRequestToken] that matches an existing version's \
   [VersionId], the operation results in an error. You can't modify an existing version, you can \
   only create a new version. To remove a version, remove all staging labels from it. See \
   [UpdateSecretVersionStage].\n\
  \     \n\
  \      Secrets Manager generates a CloudTrail log entry when you call this action. Do not \
   include sensitive information in request parameters except [SecretBinary] or [SecretString] \
   because it might be logged. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \      \n\
  \        {b Required permissions: } [secretsmanager:UpdateSecret]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. If you use a customer managed key, you must also have \
   [kms:GenerateDataKey], [kms:Encrypt], and [kms:Decrypt] permissions on the key. If you change \
   the KMS key and you don't have [kms:Encrypt] permission to the new key, Secrets Manager does \
   not re-encrypt existing secret versions with the new key. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/security-encryption.html} Secret \
   encryption and decryption}.\n\
  \       \n\
  \         When you enter commands in a command shell, there is a risk of the command history \
   being accessed or utilities having access to your command parameters. This is a concern if the \
   command includes the value of a secret. Learn how to \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/security_cli-exposure-risks.html}Mitigate \
   the risks of using command-line tools to store Secrets Manager secrets}.\n\
  \         \n\
  \          "]

module UpdateSecretVersionStage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_secret_version_stage_request ->
    ( update_secret_version_stage_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_secret_version_stage_request ->
    ( update_secret_version_stage_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the staging labels attached to a version of a secret. Secrets Manager uses staging \
   labels to track a version as it progresses through the secret rotation process. Each staging \
   label can be attached to only one version at a time. To add a staging label to a version when \
   it is already attached to another version, Secrets Manager first removes it from the other \
   version first and then attaches it to this one. For more information about versions and staging \
   labels, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/getting-started.html#term_version}Concepts: \
   Version}. \n\n\
  \ The staging labels that you specify in the [VersionStage] parameter are added to the existing \
   list of staging labels for the version. \n\
  \ \n\
  \  You can move the [AWSCURRENT] staging label to this version by including it in this call.\n\
  \  \n\
  \    Whenever you move [AWSCURRENT], Secrets Manager automatically moves the label [AWSPREVIOUS] \
   to the version that [AWSCURRENT] was removed from.\n\
  \    \n\
  \      If this action results in the last label being removed from a version, then the version \
   is considered to be 'deprecated' and can be deleted by Secrets Manager.\n\
  \      \n\
  \       Secrets Manager generates a CloudTrail log entry when you call this action. Do not \
   include sensitive information in request parameters because it might be logged. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \       \n\
  \         {b Required permissions: } [secretsmanager:UpdateSecretVersionStage]. For more \
   information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \        "]

(** {1:Serialization and Deserialization} *)
module ValidateResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServiceError of internal_service_error
    | `InvalidParameterException of invalid_parameter_exception
    | `InvalidRequestException of invalid_request_exception
    | `MalformedPolicyDocumentException of malformed_policy_document_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_resource_policy_request ->
    ( validate_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_resource_policy_request ->
    ( validate_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServiceError of internal_service_error
      | `InvalidParameterException of invalid_parameter_exception
      | `InvalidRequestException of invalid_request_exception
      | `MalformedPolicyDocumentException of malformed_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates that a resource policy does not grant a wide range of principals access to your \
   secret. A resource-based policy is optional for secrets.\n\n\
  \ The API performs three checks when validating the policy:\n\
  \ \n\
  \  {ul\n\
  \        {-  Sends a call to \
   {{:https://aws.amazon.com/blogs/security/protect-sensitive-data-in-the-cloud-with-automated-reasoning-zelkova/}Zelkova}, \
   an automated reasoning engine, to ensure your resource policy does not allow broad access to \
   your secret, for example policies that use a wildcard for the principal.\n\
  \            \n\
  \             }\n\
  \        {-  Checks for correct syntax in a policy.\n\
  \            \n\
  \             }\n\
  \        {-  Verifies the policy does not lock out a caller.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   Secrets Manager generates a CloudTrail log entry when you call this action. Do not include \
   sensitive information in request parameters because it might be logged. For more information, \
   see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/retrieve-ct-entries.html}Logging \
   Secrets Manager events with CloudTrail}.\n\
  \   \n\
  \     {b Required permissions: } [secretsmanager:ValidateResourcePolicy] and \
   [secretsmanager:PutResourcePolicy]. For more information, see \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/reference_iam-permissions.html#reference_iam-permissions_actions} \
   IAM policy actions for Secrets Manager} and \
   {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/auth-and-access.html}Authentication \
   and access control in Secrets Manager}. \n\
  \    "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
