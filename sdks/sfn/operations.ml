open Types
module CreateActivity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ActivityAlreadyExists") ->
              `ActivityAlreadyExists
                (activity_already_exists_of_yojson tree path)
          | (_, "ActivityLimitExceeded") ->
              `ActivityLimitExceeded
                (activity_limit_exceeded_of_yojson tree path)
          | (_, "InvalidEncryptionConfiguration") ->
              `InvalidEncryptionConfiguration
                (invalid_encryption_configuration_of_yojson tree path)
          | (_, "InvalidName") ->
              `InvalidName (invalid_name_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "TooManyTags") ->
              `TooManyTags (too_many_tags_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_activity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_activity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsCreateActivity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_activity_output_of_yojson
            ~error_deserializer
  end
module CreateStateMachine =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidDefinition") ->
              `InvalidDefinition (invalid_definition_of_yojson tree path)
          | (_, "InvalidEncryptionConfiguration") ->
              `InvalidEncryptionConfiguration
                (invalid_encryption_configuration_of_yojson tree path)
          | (_, "InvalidLoggingConfiguration") ->
              `InvalidLoggingConfiguration
                (invalid_logging_configuration_of_yojson tree path)
          | (_, "InvalidName") ->
              `InvalidName (invalid_name_of_yojson tree path)
          | (_, "InvalidTracingConfiguration") ->
              `InvalidTracingConfiguration
                (invalid_tracing_configuration_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "StateMachineAlreadyExists") ->
              `StateMachineAlreadyExists
                (state_machine_already_exists_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineLimitExceeded") ->
              `StateMachineLimitExceeded
                (state_machine_limit_exceeded_of_yojson tree path)
          | (_, "StateMachineTypeNotSupported") ->
              `StateMachineTypeNotSupported
                (state_machine_type_not_supported_of_yojson tree path)
          | (_, "TooManyTags") ->
              `TooManyTags (too_many_tags_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_state_machine_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_state_machine_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsCreateStateMachine" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_state_machine_output_of_yojson
            ~error_deserializer
  end
module CreateStateMachineAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidName") ->
              `InvalidName (invalid_name_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_state_machine_alias_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsCreateStateMachineAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_state_machine_alias_output_of_yojson
            ~error_deserializer
  end
module DeleteActivity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_activity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_activity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDeleteActivity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_activity_output_of_yojson
            ~error_deserializer
  end
module DeleteStateMachine =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_state_machine_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_state_machine_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDeleteStateMachine" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_state_machine_output_of_yojson
            ~error_deserializer
  end
module DeleteStateMachineAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_state_machine_alias_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDeleteStateMachineAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_state_machine_alias_output_of_yojson
            ~error_deserializer
  end
module DeleteStateMachineVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_state_machine_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_state_machine_version_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDeleteStateMachineVersion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_state_machine_version_output_of_yojson
            ~error_deserializer
  end
module DescribeActivity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ActivityDoesNotExist") ->
              `ActivityDoesNotExist
                (activity_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_activity_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_activity_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeActivity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_activity_output_of_yojson
            ~error_deserializer
  end
module DescribeExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeExecution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_execution_output_of_yojson
            ~error_deserializer
  end
module DescribeMapRun =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_map_run_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_map_run_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeMapRun" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_map_run_output_of_yojson
            ~error_deserializer
  end
module DescribeStateMachine =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_state_machine_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_state_machine_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeStateMachine" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_state_machine_output_of_yojson
            ~error_deserializer
  end
module DescribeStateMachineAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_state_machine_alias_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeStateMachineAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_state_machine_alias_output_of_yojson
            ~error_deserializer
  end
module DescribeStateMachineForExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_state_machine_for_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_state_machine_for_execution_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsDescribeStateMachineForExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_state_machine_for_execution_output_of_yojson
            ~error_deserializer
  end
module GetActivityTask =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ActivityDoesNotExist") ->
              `ActivityDoesNotExist
                (activity_does_not_exist_of_yojson tree path)
          | (_, "ActivityWorkerLimitExceeded") ->
              `ActivityWorkerLimitExceeded
                (activity_worker_limit_exceeded_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_activity_task_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_activity_task_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsGetActivityTask" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_activity_task_output_of_yojson
            ~error_deserializer
  end
module GetExecutionHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_execution_history_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_execution_history_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsGetExecutionHistory" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_execution_history_output_of_yojson
            ~error_deserializer
  end
module ListActivities =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_activities_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_activities_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListActivities" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_activities_output_of_yojson
            ~error_deserializer
  end
module ListExecutions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | (_, "StateMachineTypeNotSupported") ->
              `StateMachineTypeNotSupported
                (state_machine_type_not_supported_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_executions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_executions_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListExecutions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_executions_output_of_yojson
            ~error_deserializer
  end
module ListMapRuns =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_map_runs_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_map_runs_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListMapRuns" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_map_runs_output_of_yojson
            ~error_deserializer
  end
module ListStateMachineAliases =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_state_machine_aliases_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_state_machine_aliases_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListStateMachineAliases" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_state_machine_aliases_output_of_yojson
            ~error_deserializer
  end
module ListStateMachineVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_state_machine_versions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_state_machine_versions_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListStateMachineVersions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_state_machine_versions_output_of_yojson
            ~error_deserializer
  end
module ListStateMachines =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_state_machines_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_state_machines_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListStateMachines" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_state_machines_output_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_output_of_yojson
            ~error_deserializer
  end
module PublishStateMachineVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : publish_state_machine_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.publish_state_machine_version_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsPublishStateMachineVersion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:publish_state_machine_version_output_of_yojson
            ~error_deserializer
  end
module RedriveExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "ExecutionLimitExceeded") ->
              `ExecutionLimitExceeded
                (execution_limit_exceeded_of_yojson tree path)
          | (_, "ExecutionNotRedrivable") ->
              `ExecutionNotRedrivable
                (execution_not_redrivable_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : redrive_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.redrive_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsRedriveExecution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:redrive_execution_output_of_yojson
            ~error_deserializer
  end
module SendTaskFailure =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "TaskDoesNotExist") ->
              `TaskDoesNotExist (task_does_not_exist_of_yojson tree path)
          | (_, "TaskTimedOut") ->
              `TaskTimedOut (task_timed_out_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_task_failure_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.send_task_failure_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsSendTaskFailure" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:send_task_failure_output_of_yojson
            ~error_deserializer
  end
module SendTaskHeartbeat =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "TaskDoesNotExist") ->
              `TaskDoesNotExist (task_does_not_exist_of_yojson tree path)
          | (_, "TaskTimedOut") ->
              `TaskTimedOut (task_timed_out_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_task_heartbeat_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.send_task_heartbeat_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsSendTaskHeartbeat" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:send_task_heartbeat_output_of_yojson
            ~error_deserializer
  end
module SendTaskSuccess =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidOutput") ->
              `InvalidOutput (invalid_output_of_yojson tree path)
          | (_, "InvalidToken") ->
              `InvalidToken (invalid_token_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "TaskDoesNotExist") ->
              `TaskDoesNotExist (task_does_not_exist_of_yojson tree path)
          | (_, "TaskTimedOut") ->
              `TaskTimedOut (task_timed_out_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : send_task_success_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.send_task_success_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsSendTaskSuccess" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:send_task_success_output_of_yojson
            ~error_deserializer
  end
module StartExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionAlreadyExists") ->
              `ExecutionAlreadyExists
                (execution_already_exists_of_yojson tree path)
          | (_, "ExecutionLimitExceeded") ->
              `ExecutionLimitExceeded
                (execution_limit_exceeded_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidExecutionInput") ->
              `InvalidExecutionInput
                (invalid_execution_input_of_yojson tree path)
          | (_, "InvalidName") ->
              `InvalidName (invalid_name_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsStartExecution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_execution_output_of_yojson
            ~error_deserializer
  end
module StartSyncExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidExecutionInput") ->
              `InvalidExecutionInput
                (invalid_execution_input_of_yojson tree path)
          | (_, "InvalidName") ->
              `InvalidName (invalid_name_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | (_, "StateMachineTypeNotSupported") ->
              `StateMachineTypeNotSupported
                (state_machine_type_not_supported_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_sync_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_sync_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsStartSyncExecution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_sync_execution_output_of_yojson
            ~error_deserializer
  end
module StopExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ExecutionDoesNotExist") ->
              `ExecutionDoesNotExist
                (execution_does_not_exist_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsInvalidStateException") ->
              `KmsInvalidStateException
                (kms_invalid_state_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_execution_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.stop_execution_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsStopExecution" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:stop_execution_output_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "TooManyTags") ->
              `TooManyTags (too_many_tags_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_output_of_yojson
            ~error_deserializer
  end
module TestState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidDefinition") ->
              `InvalidDefinition (invalid_definition_of_yojson tree path)
          | (_, "InvalidExecutionInput") ->
              `InvalidExecutionInput
                (invalid_execution_input_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : test_state_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.test_state_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsTestState" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:test_state_output_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_output_of_yojson
            ~error_deserializer
  end
module UpdateMapRun =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_map_run_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_map_run_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsUpdateMapRun" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_map_run_output_of_yojson
            ~error_deserializer
  end
module UpdateStateMachine =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "InvalidDefinition") ->
              `InvalidDefinition (invalid_definition_of_yojson tree path)
          | (_, "InvalidEncryptionConfiguration") ->
              `InvalidEncryptionConfiguration
                (invalid_encryption_configuration_of_yojson tree path)
          | (_, "InvalidLoggingConfiguration") ->
              `InvalidLoggingConfiguration
                (invalid_logging_configuration_of_yojson tree path)
          | (_, "InvalidTracingConfiguration") ->
              `InvalidTracingConfiguration
                (invalid_tracing_configuration_of_yojson tree path)
          | (_, "KmsAccessDeniedException") ->
              `KmsAccessDeniedException
                (kms_access_denied_exception_of_yojson tree path)
          | (_, "KmsThrottlingException") ->
              `KmsThrottlingException
                (kms_throttling_exception_of_yojson tree path)
          | (_, "MissingRequiredParameter") ->
              `MissingRequiredParameter
                (missing_required_parameter_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "StateMachineDoesNotExist") ->
              `StateMachineDoesNotExist
                (state_machine_does_not_exist_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_state_machine_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_state_machine_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsUpdateStateMachine" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_state_machine_output_of_yojson
            ~error_deserializer
  end
module UpdateStateMachineAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InvalidArn") ->
              `InvalidArn (invalid_arn_of_yojson tree path)
          | (_, "ResourceNotFound") ->
              `ResourceNotFound (resource_not_found_of_yojson tree path)
          | (_, "StateMachineDeleting") ->
              `StateMachineDeleting
                (state_machine_deleting_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_state_machine_alias_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsUpdateStateMachineAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_state_machine_alias_output_of_yojson
            ~error_deserializer
  end
module ValidateStateMachineDefinition =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : validate_state_machine_definition_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.validate_state_machine_definition_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSStepFunctionsValidateStateMachineDefinition"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:validate_state_machine_definition_output_of_yojson
            ~error_deserializer
  end