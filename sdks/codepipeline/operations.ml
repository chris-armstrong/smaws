open Types
open Service_metadata

module CreateCustomActionType = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `InvalidTagsException _ -> "com.amazonaws.codepipeline#InvalidTagsException"
    | `LimitExceededException _ -> "com.amazonaws.codepipeline#LimitExceededException"
    | `TooManyTagsException _ -> "com.amazonaws.codepipeline#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidTagsException" ->
          `InvalidTagsException (Json_deserializers.invalid_tags_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_action_type_input) =
    let input = Json_serializers.create_custom_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.CreateCustomActionType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_action_type_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_action_type_input) =
    let input = Json_serializers.create_custom_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.CreateCustomActionType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_action_type_output_of_yojson
      ~error_deserializer
end

module CreatePipeline = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `InvalidActionDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidActionDeclarationException"
    | `InvalidBlockerDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidBlockerDeclarationException"
    | `InvalidStageDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidStageDeclarationException"
    | `InvalidStructureException _ -> "com.amazonaws.codepipeline#InvalidStructureException"
    | `InvalidTagsException _ -> "com.amazonaws.codepipeline#InvalidTagsException"
    | `LimitExceededException _ -> "com.amazonaws.codepipeline#LimitExceededException"
    | `PipelineNameInUseException _ -> "com.amazonaws.codepipeline#PipelineNameInUseException"
    | `TooManyTagsException _ -> "com.amazonaws.codepipeline#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidActionDeclarationException" ->
          `InvalidActionDeclarationException
            (Json_deserializers.invalid_action_declaration_exception_of_yojson tree path)
      | _, "InvalidBlockerDeclarationException" ->
          `InvalidBlockerDeclarationException
            (Json_deserializers.invalid_blocker_declaration_exception_of_yojson tree path)
      | _, "InvalidStageDeclarationException" ->
          `InvalidStageDeclarationException
            (Json_deserializers.invalid_stage_declaration_exception_of_yojson tree path)
      | _, "InvalidStructureException" ->
          `InvalidStructureException
            (Json_deserializers.invalid_structure_exception_of_yojson tree path)
      | _, "InvalidTagsException" ->
          `InvalidTagsException (Json_deserializers.invalid_tags_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "PipelineNameInUseException" ->
          `PipelineNameInUseException
            (Json_deserializers.pipeline_name_in_use_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_pipeline_input) =
    let input = Json_serializers.create_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.CreatePipeline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pipeline_input) =
    let input = Json_serializers.create_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.CreatePipeline" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_pipeline_output_of_yojson ~error_deserializer
end

module DeleteCustomActionType = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_action_type_input) =
    let input = Json_serializers.delete_custom_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.DeleteCustomActionType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_action_type_input) =
    let input = Json_serializers.delete_custom_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.DeleteCustomActionType" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePipeline = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pipeline_input) =
    let input = Json_serializers.delete_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.DeletePipeline" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pipeline_input) =
    let input = Json_serializers.delete_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.DeletePipeline" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWebhook = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_webhook_input) =
    let input = Json_serializers.delete_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.DeleteWebhook" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_webhook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_webhook_input) =
    let input = Json_serializers.delete_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.DeleteWebhook" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_webhook_output_of_yojson ~error_deserializer
end

module DeregisterWebhookWithThirdParty = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | `WebhookNotFoundException _ -> "com.amazonaws.codepipeline#WebhookNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _, "WebhookNotFoundException" ->
          `WebhookNotFoundException
            (Json_deserializers.webhook_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_webhook_with_third_party_input) =
    let input = Json_serializers.deregister_webhook_with_third_party_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodePipeline_20150709.DeregisterWebhookWithThirdParty" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_webhook_with_third_party_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_webhook_with_third_party_input) =
    let input = Json_serializers.deregister_webhook_with_third_party_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.DeregisterWebhookWithThirdParty" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_webhook_with_third_party_output_of_yojson
      ~error_deserializer
end

module DisableStageTransition = struct
  let error_to_string = function
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_stage_transition_input) =
    let input = Json_serializers.disable_stage_transition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.DisableStageTransition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_stage_transition_input) =
    let input = Json_serializers.disable_stage_transition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.DisableStageTransition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module EnableStageTransition = struct
  let error_to_string = function
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_stage_transition_input) =
    let input = Json_serializers.enable_stage_transition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.EnableStageTransition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_stage_transition_input) =
    let input = Json_serializers.enable_stage_transition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.EnableStageTransition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GetActionType = struct
  let error_to_string = function
    | `ActionTypeNotFoundException _ -> "com.amazonaws.codepipeline#ActionTypeNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionTypeNotFoundException" ->
          `ActionTypeNotFoundException
            (Json_deserializers.action_type_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_action_type_input) =
    let input = Json_serializers.get_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetActionType" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_action_type_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_action_type_input) =
    let input = Json_serializers.get_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetActionType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_action_type_output_of_yojson ~error_deserializer
end

module GetJobDetails = struct
  let error_to_string = function
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_job_details_input) =
    let input = Json_serializers.get_job_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetJobDetails" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_job_details_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_job_details_input) =
    let input = Json_serializers.get_job_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetJobDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_job_details_output_of_yojson ~error_deserializer
end

module GetPipeline = struct
  let error_to_string = function
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `PipelineVersionNotFoundException _ ->
        "com.amazonaws.codepipeline#PipelineVersionNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "PipelineVersionNotFoundException" ->
          `PipelineVersionNotFoundException
            (Json_deserializers.pipeline_version_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pipeline_input) =
    let input = Json_serializers.get_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetPipeline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pipeline_input) =
    let input = Json_serializers.get_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetPipeline" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_output_of_yojson ~error_deserializer
end

module GetPipelineExecution = struct
  let error_to_string = function
    | `PipelineExecutionNotFoundException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionNotFoundException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "PipelineExecutionNotFoundException" ->
          `PipelineExecutionNotFoundException
            (Json_deserializers.pipeline_execution_not_found_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pipeline_execution_input) =
    let input = Json_serializers.get_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pipeline_execution_input) =
    let input = Json_serializers.get_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetPipelineExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_execution_output_of_yojson
      ~error_deserializer
end

module GetPipelineState = struct
  let error_to_string = function
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_pipeline_state_input) =
    let input = Json_serializers.get_pipeline_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetPipelineState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_state_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_pipeline_state_input) =
    let input = Json_serializers.get_pipeline_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetPipelineState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_pipeline_state_output_of_yojson
      ~error_deserializer
end

module GetThirdPartyJobDetails = struct
  let error_to_string = function
    | `InvalidClientTokenException _ -> "com.amazonaws.codepipeline#InvalidClientTokenException"
    | `InvalidJobException _ -> "com.amazonaws.codepipeline#InvalidJobException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidClientTokenException" ->
          `InvalidClientTokenException
            (Json_deserializers.invalid_client_token_exception_of_yojson tree path)
      | _, "InvalidJobException" ->
          `InvalidJobException (Json_deserializers.invalid_job_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_third_party_job_details_input) =
    let input = Json_serializers.get_third_party_job_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.GetThirdPartyJobDetails"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_third_party_job_details_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_third_party_job_details_input) =
    let input = Json_serializers.get_third_party_job_details_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.GetThirdPartyJobDetails" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_third_party_job_details_output_of_yojson
      ~error_deserializer
end

module ListActionExecutions = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `PipelineExecutionNotFoundException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionNotFoundException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "PipelineExecutionNotFoundException" ->
          `PipelineExecutionNotFoundException
            (Json_deserializers.pipeline_execution_not_found_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_action_executions_input) =
    let input = Json_serializers.list_action_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListActionExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_action_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_action_executions_input) =
    let input = Json_serializers.list_action_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListActionExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_action_executions_output_of_yojson
      ~error_deserializer
end

module ListActionTypes = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_action_types_input) =
    let input = Json_serializers.list_action_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListActionTypes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_action_types_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_action_types_input) =
    let input = Json_serializers.list_action_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListActionTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_action_types_output_of_yojson ~error_deserializer
end

module ListDeployActionExecutionTargets = struct
  let error_to_string = function
    | `ActionExecutionNotFoundException _ ->
        "com.amazonaws.codepipeline#ActionExecutionNotFoundException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionExecutionNotFoundException" ->
          `ActionExecutionNotFoundException
            (Json_deserializers.action_execution_not_found_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deploy_action_execution_targets_input) =
    let input = Json_serializers.list_deploy_action_execution_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodePipeline_20150709.ListDeployActionExecutionTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deploy_action_execution_targets_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_deploy_action_execution_targets_input) =
    let input = Json_serializers.list_deploy_action_execution_targets_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListDeployActionExecutionTargets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_deploy_action_execution_targets_output_of_yojson
      ~error_deserializer
end

module ListPipelineExecutions = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipeline_executions_input) =
    let input = Json_serializers.list_pipeline_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListPipelineExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipeline_executions_input) =
    let input = Json_serializers.list_pipeline_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListPipelineExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipeline_executions_output_of_yojson
      ~error_deserializer
end

module ListPipelines = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_pipelines_input) =
    let input = Json_serializers.list_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListPipelines" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_pipelines_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pipelines_input) =
    let input = Json_serializers.list_pipelines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListPipelines" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pipelines_output_of_yojson ~error_deserializer
end

module ListRuleExecutions = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `PipelineExecutionNotFoundException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionNotFoundException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "PipelineExecutionNotFoundException" ->
          `PipelineExecutionNotFoundException
            (Json_deserializers.pipeline_execution_not_found_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_executions_input) =
    let input = Json_serializers.list_rule_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListRuleExecutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_executions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rule_executions_input) =
    let input = Json_serializers.list_rule_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListRuleExecutions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_executions_output_of_yojson
      ~error_deserializer
end

module ListRuleTypes = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_types_input) =
    let input = Json_serializers.list_rule_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListRuleTypes" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_rule_types_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rule_types_input) =
    let input = Json_serializers.list_rule_types_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListRuleTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_types_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidArnException _ -> "com.amazonaws.codepipeline#InvalidArnException"
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codepipeline#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module ListWebhooks = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.codepipeline#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_webhooks_input) =
    let input = Json_serializers.list_webhooks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.ListWebhooks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_webhooks_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_webhooks_input) =
    let input = Json_serializers.list_webhooks_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.ListWebhooks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_webhooks_output_of_yojson ~error_deserializer
end

module OverrideStageCondition = struct
  let error_to_string = function
    | `ConcurrentPipelineExecutionsLimitExceededException _ ->
        "com.amazonaws.codepipeline#ConcurrentPipelineExecutionsLimitExceededException"
    | `ConditionNotOverridableException _ ->
        "com.amazonaws.codepipeline#ConditionNotOverridableException"
    | `ConflictException _ -> "com.amazonaws.codepipeline#ConflictException"
    | `NotLatestPipelineExecutionException _ ->
        "com.amazonaws.codepipeline#NotLatestPipelineExecutionException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentPipelineExecutionsLimitExceededException" ->
          `ConcurrentPipelineExecutionsLimitExceededException
            (Json_deserializers.concurrent_pipeline_executions_limit_exceeded_exception_of_yojson
               tree path)
      | _, "ConditionNotOverridableException" ->
          `ConditionNotOverridableException
            (Json_deserializers.condition_not_overridable_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "NotLatestPipelineExecutionException" ->
          `NotLatestPipelineExecutionException
            (Json_deserializers.not_latest_pipeline_execution_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : override_stage_condition_input) =
    let input = Json_serializers.override_stage_condition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.OverrideStageCondition"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : override_stage_condition_input) =
    let input = Json_serializers.override_stage_condition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.OverrideStageCondition" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PollForJobs = struct
  let error_to_string = function
    | `ActionTypeNotFoundException _ -> "com.amazonaws.codepipeline#ActionTypeNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionTypeNotFoundException" ->
          `ActionTypeNotFoundException
            (Json_deserializers.action_type_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : poll_for_jobs_input) =
    let input = Json_serializers.poll_for_jobs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PollForJobs" ~service
      ~context ~input ~output_deserializer:Json_deserializers.poll_for_jobs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : poll_for_jobs_input) =
    let input = Json_serializers.poll_for_jobs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PollForJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.poll_for_jobs_output_of_yojson ~error_deserializer
end

module PollForThirdPartyJobs = struct
  let error_to_string = function
    | `ActionTypeNotFoundException _ -> "com.amazonaws.codepipeline#ActionTypeNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionTypeNotFoundException" ->
          `ActionTypeNotFoundException
            (Json_deserializers.action_type_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : poll_for_third_party_jobs_input) =
    let input = Json_serializers.poll_for_third_party_jobs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PollForThirdPartyJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.poll_for_third_party_jobs_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : poll_for_third_party_jobs_input) =
    let input = Json_serializers.poll_for_third_party_jobs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PollForThirdPartyJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.poll_for_third_party_jobs_output_of_yojson
      ~error_deserializer
end

module PutActionRevision = struct
  let error_to_string = function
    | `ActionNotFoundException _ -> "com.amazonaws.codepipeline#ActionNotFoundException"
    | `ConcurrentPipelineExecutionsLimitExceededException _ ->
        "com.amazonaws.codepipeline#ConcurrentPipelineExecutionsLimitExceededException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionNotFoundException" ->
          `ActionNotFoundException
            (Json_deserializers.action_not_found_exception_of_yojson tree path)
      | _, "ConcurrentPipelineExecutionsLimitExceededException" ->
          `ConcurrentPipelineExecutionsLimitExceededException
            (Json_deserializers.concurrent_pipeline_executions_limit_exceeded_exception_of_yojson
               tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_action_revision_input) =
    let input = Json_serializers.put_action_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PutActionRevision"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_action_revision_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_action_revision_input) =
    let input = Json_serializers.put_action_revision_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutActionRevision" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_action_revision_output_of_yojson
      ~error_deserializer
end

module PutApprovalResult = struct
  let error_to_string = function
    | `ActionNotFoundException _ -> "com.amazonaws.codepipeline#ActionNotFoundException"
    | `ApprovalAlreadyCompletedException _ ->
        "com.amazonaws.codepipeline#ApprovalAlreadyCompletedException"
    | `InvalidApprovalTokenException _ -> "com.amazonaws.codepipeline#InvalidApprovalTokenException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionNotFoundException" ->
          `ActionNotFoundException
            (Json_deserializers.action_not_found_exception_of_yojson tree path)
      | _, "ApprovalAlreadyCompletedException" ->
          `ApprovalAlreadyCompletedException
            (Json_deserializers.approval_already_completed_exception_of_yojson tree path)
      | _, "InvalidApprovalTokenException" ->
          `InvalidApprovalTokenException
            (Json_deserializers.invalid_approval_token_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_approval_result_input) =
    let input = Json_serializers.put_approval_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PutApprovalResult"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_approval_result_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_approval_result_input) =
    let input = Json_serializers.put_approval_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutApprovalResult" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_approval_result_output_of_yojson
      ~error_deserializer
end

module PutJobFailureResult = struct
  let error_to_string = function
    | `InvalidJobStateException _ -> "com.amazonaws.codepipeline#InvalidJobStateException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidJobStateException" ->
          `InvalidJobStateException
            (Json_deserializers.invalid_job_state_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_job_failure_result_input) =
    let input = Json_serializers.put_job_failure_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PutJobFailureResult"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_job_failure_result_input) =
    let input = Json_serializers.put_job_failure_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutJobFailureResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutJobSuccessResult = struct
  let error_to_string = function
    | `InvalidJobStateException _ -> "com.amazonaws.codepipeline#InvalidJobStateException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `OutputVariablesSizeExceededException _ ->
        "com.amazonaws.codepipeline#OutputVariablesSizeExceededException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidJobStateException" ->
          `InvalidJobStateException
            (Json_deserializers.invalid_job_state_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "OutputVariablesSizeExceededException" ->
          `OutputVariablesSizeExceededException
            (Json_deserializers.output_variables_size_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_job_success_result_input) =
    let input = Json_serializers.put_job_success_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PutJobSuccessResult"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_job_success_result_input) =
    let input = Json_serializers.put_job_success_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutJobSuccessResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutThirdPartyJobFailureResult = struct
  let error_to_string = function
    | `InvalidClientTokenException _ -> "com.amazonaws.codepipeline#InvalidClientTokenException"
    | `InvalidJobStateException _ -> "com.amazonaws.codepipeline#InvalidJobStateException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidClientTokenException" ->
          `InvalidClientTokenException
            (Json_deserializers.invalid_client_token_exception_of_yojson tree path)
      | _, "InvalidJobStateException" ->
          `InvalidJobStateException
            (Json_deserializers.invalid_job_state_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_third_party_job_failure_result_input) =
    let input = Json_serializers.put_third_party_job_failure_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodePipeline_20150709.PutThirdPartyJobFailureResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_third_party_job_failure_result_input) =
    let input = Json_serializers.put_third_party_job_failure_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutThirdPartyJobFailureResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutThirdPartyJobSuccessResult = struct
  let error_to_string = function
    | `InvalidClientTokenException _ -> "com.amazonaws.codepipeline#InvalidClientTokenException"
    | `InvalidJobStateException _ -> "com.amazonaws.codepipeline#InvalidJobStateException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidClientTokenException" ->
          `InvalidClientTokenException
            (Json_deserializers.invalid_client_token_exception_of_yojson tree path)
      | _, "InvalidJobStateException" ->
          `InvalidJobStateException
            (Json_deserializers.invalid_job_state_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_third_party_job_success_result_input) =
    let input = Json_serializers.put_third_party_job_success_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodePipeline_20150709.PutThirdPartyJobSuccessResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_third_party_job_success_result_input) =
    let input = Json_serializers.put_third_party_job_success_result_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.PutThirdPartyJobSuccessResult" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutWebhook = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `InvalidTagsException _ -> "com.amazonaws.codepipeline#InvalidTagsException"
    | `InvalidWebhookAuthenticationParametersException _ ->
        "com.amazonaws.codepipeline#InvalidWebhookAuthenticationParametersException"
    | `InvalidWebhookFilterPatternException _ ->
        "com.amazonaws.codepipeline#InvalidWebhookFilterPatternException"
    | `LimitExceededException _ -> "com.amazonaws.codepipeline#LimitExceededException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.codepipeline#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidTagsException" ->
          `InvalidTagsException (Json_deserializers.invalid_tags_exception_of_yojson tree path)
      | _, "InvalidWebhookAuthenticationParametersException" ->
          `InvalidWebhookAuthenticationParametersException
            (Json_deserializers.invalid_webhook_authentication_parameters_exception_of_yojson tree
               path)
      | _, "InvalidWebhookFilterPatternException" ->
          `InvalidWebhookFilterPatternException
            (Json_deserializers.invalid_webhook_filter_pattern_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_webhook_input) =
    let input = Json_serializers.put_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.PutWebhook" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_webhook_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_webhook_input) =
    let input = Json_serializers.put_webhook_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"CodePipeline_20150709.PutWebhook"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_webhook_output_of_yojson
      ~error_deserializer
end

module RegisterWebhookWithThirdParty = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | `WebhookNotFoundException _ -> "com.amazonaws.codepipeline#WebhookNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _, "WebhookNotFoundException" ->
          `WebhookNotFoundException
            (Json_deserializers.webhook_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_webhook_with_third_party_input) =
    let input = Json_serializers.register_webhook_with_third_party_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"CodePipeline_20150709.RegisterWebhookWithThirdParty" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_webhook_with_third_party_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_webhook_with_third_party_input) =
    let input = Json_serializers.register_webhook_with_third_party_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.RegisterWebhookWithThirdParty" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_webhook_with_third_party_output_of_yojson
      ~error_deserializer
end

module RetryStageExecution = struct
  let error_to_string = function
    | `ConcurrentPipelineExecutionsLimitExceededException _ ->
        "com.amazonaws.codepipeline#ConcurrentPipelineExecutionsLimitExceededException"
    | `ConflictException _ -> "com.amazonaws.codepipeline#ConflictException"
    | `NotLatestPipelineExecutionException _ ->
        "com.amazonaws.codepipeline#NotLatestPipelineExecutionException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `StageNotRetryableException _ -> "com.amazonaws.codepipeline#StageNotRetryableException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentPipelineExecutionsLimitExceededException" ->
          `ConcurrentPipelineExecutionsLimitExceededException
            (Json_deserializers.concurrent_pipeline_executions_limit_exceeded_exception_of_yojson
               tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "NotLatestPipelineExecutionException" ->
          `NotLatestPipelineExecutionException
            (Json_deserializers.not_latest_pipeline_execution_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "StageNotRetryableException" ->
          `StageNotRetryableException
            (Json_deserializers.stage_not_retryable_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : retry_stage_execution_input) =
    let input = Json_serializers.retry_stage_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.RetryStageExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.retry_stage_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : retry_stage_execution_input) =
    let input = Json_serializers.retry_stage_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.RetryStageExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.retry_stage_execution_output_of_yojson
      ~error_deserializer
end

module RollbackStage = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.codepipeline#ConflictException"
    | `PipelineExecutionNotFoundException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionNotFoundException"
    | `PipelineExecutionOutdatedException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionOutdatedException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `StageNotFoundException _ -> "com.amazonaws.codepipeline#StageNotFoundException"
    | `UnableToRollbackStageException _ ->
        "com.amazonaws.codepipeline#UnableToRollbackStageException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "PipelineExecutionNotFoundException" ->
          `PipelineExecutionNotFoundException
            (Json_deserializers.pipeline_execution_not_found_exception_of_yojson tree path)
      | _, "PipelineExecutionOutdatedException" ->
          `PipelineExecutionOutdatedException
            (Json_deserializers.pipeline_execution_outdated_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "StageNotFoundException" ->
          `StageNotFoundException (Json_deserializers.stage_not_found_exception_of_yojson tree path)
      | _, "UnableToRollbackStageException" ->
          `UnableToRollbackStageException
            (Json_deserializers.unable_to_rollback_stage_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : rollback_stage_input) =
    let input = Json_serializers.rollback_stage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.RollbackStage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.rollback_stage_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rollback_stage_input) =
    let input = Json_serializers.rollback_stage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.RollbackStage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.rollback_stage_output_of_yojson ~error_deserializer
end

module StartPipelineExecution = struct
  let error_to_string = function
    | `ConcurrentPipelineExecutionsLimitExceededException _ ->
        "com.amazonaws.codepipeline#ConcurrentPipelineExecutionsLimitExceededException"
    | `ConflictException _ -> "com.amazonaws.codepipeline#ConflictException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentPipelineExecutionsLimitExceededException" ->
          `ConcurrentPipelineExecutionsLimitExceededException
            (Json_deserializers.concurrent_pipeline_executions_limit_exceeded_exception_of_yojson
               tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_pipeline_execution_input) =
    let input = Json_serializers.start_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.StartPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_pipeline_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_pipeline_execution_input) =
    let input = Json_serializers.start_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.StartPipelineExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_pipeline_execution_output_of_yojson
      ~error_deserializer
end

module StopPipelineExecution = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.codepipeline#ConflictException"
    | `DuplicatedStopRequestException _ ->
        "com.amazonaws.codepipeline#DuplicatedStopRequestException"
    | `PipelineExecutionNotStoppableException _ ->
        "com.amazonaws.codepipeline#PipelineExecutionNotStoppableException"
    | `PipelineNotFoundException _ -> "com.amazonaws.codepipeline#PipelineNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DuplicatedStopRequestException" ->
          `DuplicatedStopRequestException
            (Json_deserializers.duplicated_stop_request_exception_of_yojson tree path)
      | _, "PipelineExecutionNotStoppableException" ->
          `PipelineExecutionNotStoppableException
            (Json_deserializers.pipeline_execution_not_stoppable_exception_of_yojson tree path)
      | _, "PipelineNotFoundException" ->
          `PipelineNotFoundException
            (Json_deserializers.pipeline_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_pipeline_execution_input) =
    let input = Json_serializers.stop_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.StopPipelineExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_pipeline_execution_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_pipeline_execution_input) =
    let input = Json_serializers.stop_pipeline_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.StopPipelineExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_pipeline_execution_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.codepipeline#InvalidArnException"
    | `InvalidTagsException _ -> "com.amazonaws.codepipeline#InvalidTagsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codepipeline#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.codepipeline#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidTagsException" ->
          `InvalidTagsException (Json_deserializers.invalid_tags_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConcurrentModificationException _ ->
        "com.amazonaws.codepipeline#ConcurrentModificationException"
    | `InvalidArnException _ -> "com.amazonaws.codepipeline#InvalidArnException"
    | `InvalidTagsException _ -> "com.amazonaws.codepipeline#InvalidTagsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.codepipeline#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidArnException" ->
          `InvalidArnException (Json_deserializers.invalid_arn_exception_of_yojson tree path)
      | _, "InvalidTagsException" ->
          `InvalidTagsException (Json_deserializers.invalid_tags_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateActionType = struct
  let error_to_string = function
    | `ActionTypeNotFoundException _ -> "com.amazonaws.codepipeline#ActionTypeNotFoundException"
    | `RequestFailedException _ -> "com.amazonaws.codepipeline#RequestFailedException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActionTypeNotFoundException" ->
          `ActionTypeNotFoundException
            (Json_deserializers.action_type_not_found_exception_of_yojson tree path)
      | _, "RequestFailedException" ->
          `RequestFailedException (Json_deserializers.request_failed_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_action_type_input) =
    let input = Json_serializers.update_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.UpdateActionType"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_action_type_input) =
    let input = Json_serializers.update_action_type_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.UpdateActionType" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdatePipeline = struct
  let error_to_string = function
    | `InvalidActionDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidActionDeclarationException"
    | `InvalidBlockerDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidBlockerDeclarationException"
    | `InvalidStageDeclarationException _ ->
        "com.amazonaws.codepipeline#InvalidStageDeclarationException"
    | `InvalidStructureException _ -> "com.amazonaws.codepipeline#InvalidStructureException"
    | `LimitExceededException _ -> "com.amazonaws.codepipeline#LimitExceededException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidActionDeclarationException" ->
          `InvalidActionDeclarationException
            (Json_deserializers.invalid_action_declaration_exception_of_yojson tree path)
      | _, "InvalidBlockerDeclarationException" ->
          `InvalidBlockerDeclarationException
            (Json_deserializers.invalid_blocker_declaration_exception_of_yojson tree path)
      | _, "InvalidStageDeclarationException" ->
          `InvalidStageDeclarationException
            (Json_deserializers.invalid_stage_declaration_exception_of_yojson tree path)
      | _, "InvalidStructureException" ->
          `InvalidStructureException
            (Json_deserializers.invalid_structure_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_pipeline_input) =
    let input = Json_serializers.update_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.UpdatePipeline" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_pipeline_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pipeline_input) =
    let input = Json_serializers.update_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.UpdatePipeline" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_pipeline_output_of_yojson ~error_deserializer
end

module AcknowledgeThirdPartyJob = struct
  let error_to_string = function
    | `InvalidClientTokenException _ -> "com.amazonaws.codepipeline#InvalidClientTokenException"
    | `InvalidNonceException _ -> "com.amazonaws.codepipeline#InvalidNonceException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidClientTokenException" ->
          `InvalidClientTokenException
            (Json_deserializers.invalid_client_token_exception_of_yojson tree path)
      | _, "InvalidNonceException" ->
          `InvalidNonceException (Json_deserializers.invalid_nonce_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : acknowledge_third_party_job_input) =
    let input = Json_serializers.acknowledge_third_party_job_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.AcknowledgeThirdPartyJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.acknowledge_third_party_job_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : acknowledge_third_party_job_input) =
    let input = Json_serializers.acknowledge_third_party_job_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.AcknowledgeThirdPartyJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.acknowledge_third_party_job_output_of_yojson
      ~error_deserializer
end

module AcknowledgeJob = struct
  let error_to_string = function
    | `InvalidNonceException _ -> "com.amazonaws.codepipeline#InvalidNonceException"
    | `JobNotFoundException _ -> "com.amazonaws.codepipeline#JobNotFoundException"
    | `ValidationException _ -> "com.amazonaws.codepipeline#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNonceException" ->
          `InvalidNonceException (Json_deserializers.invalid_nonce_exception_of_yojson tree path)
      | _, "JobNotFoundException" ->
          `JobNotFoundException (Json_deserializers.job_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : acknowledge_job_input) =
    let input = Json_serializers.acknowledge_job_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"CodePipeline_20150709.AcknowledgeJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.acknowledge_job_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : acknowledge_job_input) =
    let input = Json_serializers.acknowledge_job_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"CodePipeline_20150709.AcknowledgeJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.acknowledge_job_output_of_yojson ~error_deserializer
end
