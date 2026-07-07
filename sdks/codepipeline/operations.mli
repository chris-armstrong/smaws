open Types

module AcknowledgeJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNonceException of invalid_nonce_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_job_input ->
    ( acknowledge_job_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_job_input ->
    ( acknowledge_job_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a specified job and whether that job has been received by the job \
   worker. Used for custom actions only.\n"]

module AcknowledgeThirdPartyJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidNonceException of invalid_nonce_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_third_party_job_input ->
    ( acknowledge_third_party_job_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_third_party_job_input ->
    ( acknowledge_third_party_job_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms a job worker has received the specified job. Used for partner actions only.\n"]

module CreateCustomActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidTagsException of invalid_tags_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_action_type_input ->
    ( create_custom_action_type_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_action_type_input ->
    ( create_custom_action_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom action that can be used in all pipelines associated with the Amazon Web \
   Services account. Only used for custom actions.\n"]

module CreatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidActionDeclarationException of invalid_action_declaration_exception
    | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
    | `InvalidStageDeclarationException of invalid_stage_declaration_exception
    | `InvalidStructureException of invalid_structure_exception
    | `InvalidTagsException of invalid_tags_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PipelineNameInUseException of pipeline_name_in_use_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNameInUseException of pipeline_name_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNameInUseException of pipeline_name_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a pipeline.\n\n\
  \  In the pipeline structure, you must include either [artifactStore] or [artifactStores] in \
   your pipeline, but you cannot use both. If you create a cross-region action in your pipeline, \
   you must use [artifactStores].\n\
  \  \n\
  \   "]

module DeleteCustomActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Marks a custom action as deleted. [PollForJobs] for the custom action fails after the action is \
   marked for deletion. Used for custom actions only.\n\n\
  \  To re-create a custom action after it has been deleted you must use a string in the version \
   field that has never been used before. This string can be an incremented version number, for \
   example. To restore a deleted custom action, use a JSON file that is identical to the deleted \
   action, including the original string in the version field.\n\
  \  \n\
  \   "]

module DeletePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified pipeline.\n"]

module DeleteWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously created webhook by name. Deleting the webhook stops CodePipeline from \
   starting a pipeline every time an external event occurs. The API returns successfully when \
   trying to delete a webhook that is already deleted. If a deleted webhook is re-created by \
   calling PutWebhook with the same name, it will have a different URL.\n"]

module DeregisterWebhookWithThirdParty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ValidationException of validation_exception
    | `WebhookNotFoundException of webhook_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_webhook_with_third_party_input ->
    ( deregister_webhook_with_third_party_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_webhook_with_third_party_input ->
    ( deregister_webhook_with_third_party_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the connection between the webhook that was created by CodePipeline and the external \
   tool with events to be detected. Currently supported only for webhooks that target an action \
   type of GitHub.\n"]

module DisableStageTransition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Prevents artifacts in a pipeline from transitioning to the next stage in the pipeline.\n"]

module EnableStageTransition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables artifacts in a pipeline to transition to a stage in a pipeline.\n"]

module GetActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_action_type_input ->
    ( get_action_type_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_action_type_input ->
    ( get_action_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an action type created for an external provider, where the action is \
   to be used by customers of the external provider. The action can be created with any supported \
   integration model.\n"]

module GetJobDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_details_input ->
    ( get_job_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_details_input ->
    ( get_job_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a job. Used for custom actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module GetPipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_input ->
    ( get_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_input ->
    ( get_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the metadata, structure, stages, and actions of a pipeline. Can be used to return the \
   entire structure of a pipeline in JSON format, which can then be modified and used to update \
   the pipeline structure with [UpdatePipeline].\n"]

module GetPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_execution_input ->
    ( get_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_execution_input ->
    ( get_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an execution of a pipeline, including details about artifacts, the \
   pipeline execution ID, and the name, version, and status of the pipeline.\n"]

module GetPipelineState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_state_input ->
    ( get_pipeline_state_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_state_input ->
    ( get_pipeline_state_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the state of a pipeline, including the stages and actions.\n\n\
  \  Values returned in the [revisionId] and [revisionUrl] fields indicate the source revision \
   information, such as the commit ID, for the current state.\n\
  \  \n\
  \   "]

module GetThirdPartyJobDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobException of invalid_job_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_third_party_job_details_input ->
    ( get_third_party_job_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobException of invalid_job_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_third_party_job_details_input ->
    ( get_third_party_job_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobException of invalid_job_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests the details of a job for a third party action. Used for partner actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module ListActionExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_action_executions_input ->
    ( list_action_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_action_executions_input ->
    ( list_action_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the action executions that have occurred in a pipeline.\n"]

module ListActionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_action_types_input ->
    ( list_action_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_action_types_input ->
    ( list_action_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a summary of all CodePipeline action types associated with your account.\n"]

module ListDeployActionExecutionTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionExecutionNotFoundException of action_execution_not_found_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deploy_action_execution_targets_input ->
    ( list_deploy_action_execution_targets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionExecutionNotFoundException of action_execution_not_found_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deploy_action_execution_targets_input ->
    ( list_deploy_action_execution_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionExecutionNotFoundException of action_execution_not_found_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the targets for the deploy action.\n"]

module ListPipelineExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_input ->
    ( list_pipeline_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_input ->
    ( list_pipeline_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a summary of the most recent executions for a pipeline.\n\n\
  \  When applying the filter for pipeline executions that have succeeded in the stage, the \
   operation returns all executions in the current pipeline version beginning on February 1, 2024.\n\
  \  \n\
  \   "]

module ListPipelines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a summary of all of the pipelines associated with your account.\n"]

module ListRuleExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_executions_input ->
    ( list_rule_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_executions_input ->
    ( list_rule_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the rule executions that have occurred in a pipeline configured for conditions with rules.\n"]

module ListRuleTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_types_input ->
    ( list_rule_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_types_input ->
    ( list_rule_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the rules for the condition. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.For more information about rules, see the \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
   rule reference}.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the set of key-value pairs (metadata) that are used to manage the resource.\n"]

module ListWebhooks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_webhooks_input ->
    ( list_webhooks_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_webhooks_input ->
    ( list_webhooks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a listing of all the webhooks in this Amazon Web Services Region for this account. The \
   output lists all webhooks and includes the webhook URL and ARN and the configuration for each \
   webhook.\n\n\
  \  If a secret token was provided, it will be redacted in the response.\n\
  \  \n\
  \   "]

module OverrideStageCondition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConditionNotOverridableException of condition_not_overridable_exception
    | `ConflictException of conflict_exception
    | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    override_stage_condition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConditionNotOverridableException of condition_not_overridable_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    override_stage_condition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConditionNotOverridableException of condition_not_overridable_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to override a stage condition. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.\n"]

module PollForJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    poll_for_jobs_input ->
    ( poll_for_jobs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    poll_for_jobs_input ->
    ( poll_for_jobs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about any jobs for CodePipeline to act on. [PollForJobs] is valid only for \
   action types with \"Custom\" in the owner field. If the action type contains [AWS] or \
   [ThirdParty] in the owner field, the [PollForJobs] action returns an error.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module PollForThirdPartyJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    poll_for_third_party_jobs_input ->
    ( poll_for_third_party_jobs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    poll_for_third_party_jobs_input ->
    ( poll_for_third_party_jobs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Determines whether there are any third party jobs for a job worker to act on. Used for partner \
   actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts.\n\
  \  \n\
  \   "]

module PutActionRevision : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionNotFoundException of action_not_found_exception
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_action_revision_input ->
    ( put_action_revision_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_action_revision_input ->
    ( put_action_revision_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information to CodePipeline about new revisions to a source.\n"]

module PutApprovalResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionNotFoundException of action_not_found_exception
    | `ApprovalAlreadyCompletedException of approval_already_completed_exception
    | `InvalidApprovalTokenException of invalid_approval_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_approval_result_input ->
    ( put_approval_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ApprovalAlreadyCompletedException of approval_already_completed_exception
      | `InvalidApprovalTokenException of invalid_approval_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_approval_result_input ->
    ( put_approval_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ApprovalAlreadyCompletedException of approval_already_completed_exception
      | `InvalidApprovalTokenException of invalid_approval_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the response to a manual approval request to CodePipeline. Valid responses include \
   Approved and Rejected.\n"]

module PutJobFailureResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the failure of a job as returned to the pipeline by a job worker. Used for custom \
   actions only.\n"]

module PutJobSuccessResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the success of a job as returned to the pipeline by a job worker. Used for custom \
   actions only.\n"]

module PutThirdPartyJobFailureResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the failure of a third party job as returned to the pipeline by a job worker. Used \
   for partner actions only.\n"]

module PutThirdPartyJobSuccessResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the success of a third party job as returned to the pipeline by a job worker. Used \
   for partner actions only.\n"]

module PutWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidTagsException of invalid_tags_exception
    | `InvalidWebhookAuthenticationParametersException of
      invalid_webhook_authentication_parameters_exception
    | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_webhook_input ->
    ( put_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `InvalidWebhookAuthenticationParametersException of
        invalid_webhook_authentication_parameters_exception
      | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_webhook_input ->
    ( put_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `InvalidWebhookAuthenticationParametersException of
        invalid_webhook_authentication_parameters_exception
      | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines a webhook and returns a unique webhook URL generated by CodePipeline. This URL can be \
   supplied to third party source hosting providers to call every time there's a code change. When \
   CodePipeline receives a POST request on this URL, the pipeline defined in the webhook is \
   started as long as the POST request satisfied the authentication and filtering requirements \
   supplied when defining the webhook. RegisterWebhookWithThirdParty and \
   DeregisterWebhookWithThirdParty APIs can be used to automatically configure supported third \
   parties to call the generated webhook URL.\n\n\
  \  When creating CodePipeline webhooks, do not use your own credentials or reuse the same secret \
   token across multiple webhooks. For optimal security, generate a unique secret token for each \
   webhook you create. The secret token is an arbitrary string that you provide, which GitHub uses \
   to compute and sign the webhook payloads sent to CodePipeline, for protecting the integrity and \
   authenticity of the webhook payloads. Using your own credentials or reusing the same token \
   across multiple webhooks can lead to security vulnerabilities.\n\
  \  \n\
  \     If a secret token was provided, it will be redacted in the response.\n\
  \     \n\
  \      "]

module RegisterWebhookWithThirdParty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ValidationException of validation_exception
    | `WebhookNotFoundException of webhook_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_webhook_with_third_party_input ->
    ( register_webhook_with_third_party_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_webhook_with_third_party_input ->
    ( register_webhook_with_third_party_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures a connection between the webhook that was created and the external tool with events \
   to be detected.\n"]

module RetryStageExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConflictException of conflict_exception
    | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `StageNotRetryableException of stage_not_retryable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retry_stage_execution_input ->
    ( retry_stage_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `StageNotRetryableException of stage_not_retryable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retry_stage_execution_input ->
    ( retry_stage_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `StageNotRetryableException of stage_not_retryable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can retry a stage that has failed without having to run a pipeline again from the \
   beginning. You do this by either retrying the failed actions in a stage or by retrying all \
   actions in the stage starting from the first action in the stage. When you retry the failed \
   actions in a stage, all actions that are still in progress continue working, and failed actions \
   are triggered again. When you retry a failed stage from the first action in the stage, the \
   stage cannot have any actions in progress. Before a stage can be retried, it must either have \
   all actions failed or some actions failed and some succeeded.\n"]

module RollbackStage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `UnableToRollbackStageException of unable_to_rollback_stage_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_stage_input ->
    ( rollback_stage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `UnableToRollbackStageException of unable_to_rollback_stage_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_stage_input ->
    ( rollback_stage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `UnableToRollbackStageException of unable_to_rollback_stage_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rolls back a stage execution.\n"]

module StartPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConflictException of conflict_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_input ->
    ( start_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_input ->
    ( start_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified pipeline. Specifically, it begins processing the latest commit to the \
   source location specified as part of the pipeline.\n"]

module StopPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DuplicatedStopRequestException of duplicated_stop_request_exception
    | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_input ->
    ( stop_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DuplicatedStopRequestException of duplicated_stop_request_exception
      | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_input ->
    ( stop_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DuplicatedStopRequestException of duplicated_stop_request_exception
      | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops the specified pipeline execution. You choose to either stop the pipeline execution by \
   completing in-progress actions without starting subsequent actions, or by abandoning \
   in-progress actions. While completing or abandoning in-progress actions, the pipeline execution \
   is in a [Stopping] state. After all in-progress actions are completed or abandoned, the \
   pipeline execution is in a [Stopped] state.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsException of invalid_tags_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds to or modifies the tags of the given resource. Tags are metadata that can be used to \
   manage a resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsException of invalid_tags_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `RequestFailedException of request_failed_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `RequestFailedException of request_failed_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `RequestFailedException of request_failed_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an action type that was created with any supported integration model, where the action \
   type is to be used by customers of the action type provider. Use a JSON file with the action \
   definition and [UpdateActionType] to provide the full structure.\n"]

module UpdatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidActionDeclarationException of invalid_action_declaration_exception
    | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
    | `InvalidStageDeclarationException of invalid_stage_declaration_exception
    | `InvalidStructureException of invalid_structure_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_input ->
    ( update_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_input ->
    ( update_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a specified pipeline with edits or changes to its structure. Use a JSON file with the \
   pipeline structure and [UpdatePipeline] to provide the full structure of the pipeline. Updating \
   the pipeline increases the version number of the pipeline by 1.\n"]
