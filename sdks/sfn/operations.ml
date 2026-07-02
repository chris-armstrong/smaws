open Types
open Service_metadata

module CreateActivity = struct
  let error_to_string = function
    | `ActivityAlreadyExists _ -> "com.amazonaws.sfn#ActivityAlreadyExists"
    | `ActivityLimitExceeded _ -> "com.amazonaws.sfn#ActivityLimitExceeded"
    | `InvalidEncryptionConfiguration _ -> "com.amazonaws.sfn#InvalidEncryptionConfiguration"
    | `InvalidName _ -> "com.amazonaws.sfn#InvalidName"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `TooManyTags _ -> "com.amazonaws.sfn#TooManyTags"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActivityAlreadyExists" ->
          `ActivityAlreadyExists (Json_deserializers.activity_already_exists_of_yojson tree path)
      | _, "ActivityLimitExceeded" ->
          `ActivityLimitExceeded (Json_deserializers.activity_limit_exceeded_of_yojson tree path)
      | _, "InvalidEncryptionConfiguration" ->
          `InvalidEncryptionConfiguration
            (Json_deserializers.invalid_encryption_configuration_of_yojson tree path)
      | _, "InvalidName" -> `InvalidName (Json_deserializers.invalid_name_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "TooManyTags" -> `TooManyTags (Json_deserializers.too_many_tags_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_activity_input) =
    let input = Json_serializers.create_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.CreateActivity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_activity_output_of_yojson
      ~error_deserializer
end

module CreateStateMachine = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidDefinition _ -> "com.amazonaws.sfn#InvalidDefinition"
    | `InvalidEncryptionConfiguration _ -> "com.amazonaws.sfn#InvalidEncryptionConfiguration"
    | `InvalidLoggingConfiguration _ -> "com.amazonaws.sfn#InvalidLoggingConfiguration"
    | `InvalidName _ -> "com.amazonaws.sfn#InvalidName"
    | `InvalidTracingConfiguration _ -> "com.amazonaws.sfn#InvalidTracingConfiguration"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `StateMachineAlreadyExists _ -> "com.amazonaws.sfn#StateMachineAlreadyExists"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineLimitExceeded _ -> "com.amazonaws.sfn#StateMachineLimitExceeded"
    | `StateMachineTypeNotSupported _ -> "com.amazonaws.sfn#StateMachineTypeNotSupported"
    | `TooManyTags _ -> "com.amazonaws.sfn#TooManyTags"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidDefinition" ->
          `InvalidDefinition (Json_deserializers.invalid_definition_of_yojson tree path)
      | _, "InvalidEncryptionConfiguration" ->
          `InvalidEncryptionConfiguration
            (Json_deserializers.invalid_encryption_configuration_of_yojson tree path)
      | _, "InvalidLoggingConfiguration" ->
          `InvalidLoggingConfiguration
            (Json_deserializers.invalid_logging_configuration_of_yojson tree path)
      | _, "InvalidName" -> `InvalidName (Json_deserializers.invalid_name_of_yojson tree path)
      | _, "InvalidTracingConfiguration" ->
          `InvalidTracingConfiguration
            (Json_deserializers.invalid_tracing_configuration_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "StateMachineAlreadyExists" ->
          `StateMachineAlreadyExists
            (Json_deserializers.state_machine_already_exists_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineLimitExceeded" ->
          `StateMachineLimitExceeded
            (Json_deserializers.state_machine_limit_exceeded_of_yojson tree path)
      | _, "StateMachineTypeNotSupported" ->
          `StateMachineTypeNotSupported
            (Json_deserializers.state_machine_type_not_supported_of_yojson tree path)
      | _, "TooManyTags" -> `TooManyTags (Json_deserializers.too_many_tags_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_state_machine_input) =
    let input = Json_serializers.create_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.CreateStateMachine" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_state_machine_output_of_yojson
      ~error_deserializer
end

module CreateStateMachineAlias = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidName _ -> "com.amazonaws.sfn#InvalidName"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.sfn#ServiceQuotaExceededException"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidName" -> `InvalidName (Json_deserializers.invalid_name_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_state_machine_alias_input) =
    let input = Json_serializers.create_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.CreateStateMachineAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_state_machine_alias_output_of_yojson
      ~error_deserializer
end

module DeleteActivity = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_activity_input) =
    let input = Json_serializers.delete_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DeleteActivity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_activity_output_of_yojson
      ~error_deserializer
end

module DeleteStateMachine = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_state_machine_input) =
    let input = Json_serializers.delete_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DeleteStateMachine" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_state_machine_output_of_yojson
      ~error_deserializer
end

module DeleteStateMachineAlias = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_state_machine_alias_input) =
    let input = Json_serializers.delete_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DeleteStateMachineAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_state_machine_alias_output_of_yojson
      ~error_deserializer
end

module DeleteStateMachineVersion = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_state_machine_version_input) =
    let input = Json_serializers.delete_state_machine_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DeleteStateMachineVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_state_machine_version_output_of_yojson
      ~error_deserializer
end

module DescribeActivity = struct
  let error_to_string = function
    | `ActivityDoesNotExist _ -> "com.amazonaws.sfn#ActivityDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActivityDoesNotExist" ->
          `ActivityDoesNotExist (Json_deserializers.activity_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_activity_input) =
    let input = Json_serializers.describe_activity_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DescribeActivity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_activity_output_of_yojson
      ~error_deserializer
end

module DescribeExecution = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_execution_input) =
    let input = Json_serializers.describe_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DescribeExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_execution_output_of_yojson
      ~error_deserializer
end

module DescribeMapRun = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_map_run_input) =
    let input = Json_serializers.describe_map_run_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DescribeMapRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_map_run_output_of_yojson
      ~error_deserializer
end

module DescribeStateMachine = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_state_machine_input) =
    let input = Json_serializers.describe_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DescribeStateMachine" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_state_machine_output_of_yojson
      ~error_deserializer
end

module DescribeStateMachineAlias = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_state_machine_alias_input) =
    let input = Json_serializers.describe_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.DescribeStateMachineAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_state_machine_alias_output_of_yojson
      ~error_deserializer
end

module DescribeStateMachineForExecution = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_state_machine_for_execution_input) =
    let input = Json_serializers.describe_state_machine_for_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSStepFunctions.DescribeStateMachineForExecution" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_state_machine_for_execution_output_of_yojson
      ~error_deserializer
end

module GetActivityTask = struct
  let error_to_string = function
    | `ActivityDoesNotExist _ -> "com.amazonaws.sfn#ActivityDoesNotExist"
    | `ActivityWorkerLimitExceeded _ -> "com.amazonaws.sfn#ActivityWorkerLimitExceeded"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ActivityDoesNotExist" ->
          `ActivityDoesNotExist (Json_deserializers.activity_does_not_exist_of_yojson tree path)
      | _, "ActivityWorkerLimitExceeded" ->
          `ActivityWorkerLimitExceeded
            (Json_deserializers.activity_worker_limit_exceeded_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_activity_task_input) =
    let input = Json_serializers.get_activity_task_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.GetActivityTask" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_activity_task_output_of_yojson
      ~error_deserializer
end

module GetExecutionHistory = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_execution_history_input) =
    let input = Json_serializers.get_execution_history_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.GetExecutionHistory" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_execution_history_output_of_yojson
      ~error_deserializer
end

module ListActivities = struct
  let error_to_string = function
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_activities_input) =
    let input = Json_serializers.list_activities_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListActivities" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_activities_output_of_yojson
      ~error_deserializer
end

module ListExecutions = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | `StateMachineTypeNotSupported _ -> "com.amazonaws.sfn#StateMachineTypeNotSupported"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _, "StateMachineTypeNotSupported" ->
          `StateMachineTypeNotSupported
            (Json_deserializers.state_machine_type_not_supported_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_executions_input) =
    let input = Json_serializers.list_executions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListExecutions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_executions_output_of_yojson
      ~error_deserializer
end

module ListMapRuns = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_map_runs_input) =
    let input = Json_serializers.list_map_runs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListMapRuns" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_map_runs_output_of_yojson
      ~error_deserializer
end

module ListStateMachineAliases = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_state_machine_aliases_input) =
    let input = Json_serializers.list_state_machine_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListStateMachineAliases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_state_machine_aliases_output_of_yojson
      ~error_deserializer
end

module ListStateMachineVersions = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_state_machine_versions_input) =
    let input = Json_serializers.list_state_machine_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListStateMachineVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_state_machine_versions_output_of_yojson
      ~error_deserializer
end

module ListStateMachines = struct
  let error_to_string = function
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_state_machines_input) =
    let input = Json_serializers.list_state_machines_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListStateMachines" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_state_machines_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module PublishStateMachineVersion = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.sfn#ServiceQuotaExceededException"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : publish_state_machine_version_input) =
    let input = Json_serializers.publish_state_machine_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.PublishStateMachineVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.publish_state_machine_version_output_of_yojson
      ~error_deserializer
end

module RedriveExecution = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `ExecutionLimitExceeded _ -> "com.amazonaws.sfn#ExecutionLimitExceeded"
    | `ExecutionNotRedrivable _ -> "com.amazonaws.sfn#ExecutionNotRedrivable"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "ExecutionLimitExceeded" ->
          `ExecutionLimitExceeded (Json_deserializers.execution_limit_exceeded_of_yojson tree path)
      | _, "ExecutionNotRedrivable" ->
          `ExecutionNotRedrivable (Json_deserializers.execution_not_redrivable_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : redrive_execution_input) =
    let input = Json_serializers.redrive_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.RedriveExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.redrive_execution_output_of_yojson
      ~error_deserializer
end

module SendTaskFailure = struct
  let error_to_string = function
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `TaskDoesNotExist _ -> "com.amazonaws.sfn#TaskDoesNotExist"
    | `TaskTimedOut _ -> "com.amazonaws.sfn#TaskTimedOut"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "TaskDoesNotExist" ->
          `TaskDoesNotExist (Json_deserializers.task_does_not_exist_of_yojson tree path)
      | _, "TaskTimedOut" -> `TaskTimedOut (Json_deserializers.task_timed_out_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_task_failure_input) =
    let input = Json_serializers.send_task_failure_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.SendTaskFailure" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_task_failure_output_of_yojson
      ~error_deserializer
end

module SendTaskHeartbeat = struct
  let error_to_string = function
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `TaskDoesNotExist _ -> "com.amazonaws.sfn#TaskDoesNotExist"
    | `TaskTimedOut _ -> "com.amazonaws.sfn#TaskTimedOut"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "TaskDoesNotExist" ->
          `TaskDoesNotExist (Json_deserializers.task_does_not_exist_of_yojson tree path)
      | _, "TaskTimedOut" -> `TaskTimedOut (Json_deserializers.task_timed_out_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_task_heartbeat_input) =
    let input = Json_serializers.send_task_heartbeat_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.SendTaskHeartbeat" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_task_heartbeat_output_of_yojson
      ~error_deserializer
end

module SendTaskSuccess = struct
  let error_to_string = function
    | `InvalidOutput _ -> "com.amazonaws.sfn#InvalidOutput"
    | `InvalidToken _ -> "com.amazonaws.sfn#InvalidToken"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `TaskDoesNotExist _ -> "com.amazonaws.sfn#TaskDoesNotExist"
    | `TaskTimedOut _ -> "com.amazonaws.sfn#TaskTimedOut"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidOutput" -> `InvalidOutput (Json_deserializers.invalid_output_of_yojson tree path)
      | _, "InvalidToken" -> `InvalidToken (Json_deserializers.invalid_token_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "TaskDoesNotExist" ->
          `TaskDoesNotExist (Json_deserializers.task_does_not_exist_of_yojson tree path)
      | _, "TaskTimedOut" -> `TaskTimedOut (Json_deserializers.task_timed_out_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_task_success_input) =
    let input = Json_serializers.send_task_success_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.SendTaskSuccess" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_task_success_output_of_yojson
      ~error_deserializer
end

module StartExecution = struct
  let error_to_string = function
    | `ExecutionAlreadyExists _ -> "com.amazonaws.sfn#ExecutionAlreadyExists"
    | `ExecutionLimitExceeded _ -> "com.amazonaws.sfn#ExecutionLimitExceeded"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidExecutionInput _ -> "com.amazonaws.sfn#InvalidExecutionInput"
    | `InvalidName _ -> "com.amazonaws.sfn#InvalidName"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionAlreadyExists" ->
          `ExecutionAlreadyExists (Json_deserializers.execution_already_exists_of_yojson tree path)
      | _, "ExecutionLimitExceeded" ->
          `ExecutionLimitExceeded (Json_deserializers.execution_limit_exceeded_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidExecutionInput" ->
          `InvalidExecutionInput (Json_deserializers.invalid_execution_input_of_yojson tree path)
      | _, "InvalidName" -> `InvalidName (Json_deserializers.invalid_name_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_execution_input) =
    let input = Json_serializers.start_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.StartExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_execution_output_of_yojson
      ~error_deserializer
end

module StartSyncExecution = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidExecutionInput _ -> "com.amazonaws.sfn#InvalidExecutionInput"
    | `InvalidName _ -> "com.amazonaws.sfn#InvalidName"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | `StateMachineTypeNotSupported _ -> "com.amazonaws.sfn#StateMachineTypeNotSupported"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidExecutionInput" ->
          `InvalidExecutionInput (Json_deserializers.invalid_execution_input_of_yojson tree path)
      | _, "InvalidName" -> `InvalidName (Json_deserializers.invalid_name_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _, "StateMachineTypeNotSupported" ->
          `StateMachineTypeNotSupported
            (Json_deserializers.state_machine_type_not_supported_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_sync_execution_input) =
    let input = Json_serializers.start_sync_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.StartSyncExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_sync_execution_output_of_yojson
      ~error_deserializer
end

module StopExecution = struct
  let error_to_string = function
    | `ExecutionDoesNotExist _ -> "com.amazonaws.sfn#ExecutionDoesNotExist"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsInvalidStateException _ -> "com.amazonaws.sfn#KmsInvalidStateException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ExecutionDoesNotExist" ->
          `ExecutionDoesNotExist (Json_deserializers.execution_does_not_exist_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsInvalidStateException" ->
          `KmsInvalidStateException
            (Json_deserializers.kms_invalid_state_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_execution_input) =
    let input = Json_serializers.stop_execution_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.StopExecution" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_execution_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `TooManyTags _ -> "com.amazonaws.sfn#TooManyTags"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "TooManyTags" -> `TooManyTags (Json_deserializers.too_many_tags_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module TestState = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidDefinition _ -> "com.amazonaws.sfn#InvalidDefinition"
    | `InvalidExecutionInput _ -> "com.amazonaws.sfn#InvalidExecutionInput"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidDefinition" ->
          `InvalidDefinition (Json_deserializers.invalid_definition_of_yojson tree path)
      | _, "InvalidExecutionInput" ->
          `InvalidExecutionInput (Json_deserializers.invalid_execution_input_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_state_input) =
    let input = Json_serializers.test_state_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.TestState" ~service ~context
      ~input ~output_deserializer:Json_deserializers.test_state_output_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer
end

module UpdateMapRun = struct
  let error_to_string = function
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_map_run_input) =
    let input = Json_serializers.update_map_run_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.UpdateMapRun" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_map_run_output_of_yojson
      ~error_deserializer
end

module UpdateStateMachine = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `InvalidDefinition _ -> "com.amazonaws.sfn#InvalidDefinition"
    | `InvalidEncryptionConfiguration _ -> "com.amazonaws.sfn#InvalidEncryptionConfiguration"
    | `InvalidLoggingConfiguration _ -> "com.amazonaws.sfn#InvalidLoggingConfiguration"
    | `InvalidTracingConfiguration _ -> "com.amazonaws.sfn#InvalidTracingConfiguration"
    | `KmsAccessDeniedException _ -> "com.amazonaws.sfn#KmsAccessDeniedException"
    | `KmsThrottlingException _ -> "com.amazonaws.sfn#KmsThrottlingException"
    | `MissingRequiredParameter _ -> "com.amazonaws.sfn#MissingRequiredParameter"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.sfn#ServiceQuotaExceededException"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `StateMachineDoesNotExist _ -> "com.amazonaws.sfn#StateMachineDoesNotExist"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "InvalidDefinition" ->
          `InvalidDefinition (Json_deserializers.invalid_definition_of_yojson tree path)
      | _, "InvalidEncryptionConfiguration" ->
          `InvalidEncryptionConfiguration
            (Json_deserializers.invalid_encryption_configuration_of_yojson tree path)
      | _, "InvalidLoggingConfiguration" ->
          `InvalidLoggingConfiguration
            (Json_deserializers.invalid_logging_configuration_of_yojson tree path)
      | _, "InvalidTracingConfiguration" ->
          `InvalidTracingConfiguration
            (Json_deserializers.invalid_tracing_configuration_of_yojson tree path)
      | _, "KmsAccessDeniedException" ->
          `KmsAccessDeniedException
            (Json_deserializers.kms_access_denied_exception_of_yojson tree path)
      | _, "KmsThrottlingException" ->
          `KmsThrottlingException (Json_deserializers.kms_throttling_exception_of_yojson tree path)
      | _, "MissingRequiredParameter" ->
          `MissingRequiredParameter
            (Json_deserializers.missing_required_parameter_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "StateMachineDoesNotExist" ->
          `StateMachineDoesNotExist
            (Json_deserializers.state_machine_does_not_exist_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_state_machine_input) =
    let input = Json_serializers.update_state_machine_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.UpdateStateMachine" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_state_machine_output_of_yojson
      ~error_deserializer
end

module UpdateStateMachineAlias = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.sfn#ConflictException"
    | `InvalidArn _ -> "com.amazonaws.sfn#InvalidArn"
    | `ResourceNotFound _ -> "com.amazonaws.sfn#ResourceNotFound"
    | `StateMachineDeleting _ -> "com.amazonaws.sfn#StateMachineDeleting"
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InvalidArn" -> `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
      | _, "ResourceNotFound" ->
          `ResourceNotFound (Json_deserializers.resource_not_found_of_yojson tree path)
      | _, "StateMachineDeleting" ->
          `StateMachineDeleting (Json_deserializers.state_machine_deleting_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_state_machine_alias_input) =
    let input = Json_serializers.update_state_machine_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSStepFunctions.UpdateStateMachineAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_state_machine_alias_output_of_yojson
      ~error_deserializer
end

module ValidateStateMachineDefinition = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.sfn#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : validate_state_machine_definition_input) =
    let input = Json_serializers.validate_state_machine_definition_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSStepFunctions.ValidateStateMachineDefinition" ~service ~context ~input
      ~output_deserializer:Json_deserializers.validate_state_machine_definition_output_of_yojson
      ~error_deserializer
end
