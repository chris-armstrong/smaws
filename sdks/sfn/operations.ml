open Types
open Service_metadata
module CreateActivity =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ActivityAlreadyExists") ->
            `ActivityAlreadyExists
              (Json_deserializers.activity_already_exists_of_yojson tree path)
        | (_, "ActivityLimitExceeded") ->
            `ActivityLimitExceeded
              (Json_deserializers.activity_limit_exceeded_of_yojson tree path)
        | (_, "InvalidEncryptionConfiguration") ->
            `InvalidEncryptionConfiguration
              (Json_deserializers.invalid_encryption_configuration_of_yojson
                 tree path)
        | (_, "InvalidName") ->
            `InvalidName
              (Json_deserializers.invalid_name_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "TooManyTags") ->
            `TooManyTags
              (Json_deserializers.too_many_tags_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_activity_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.create_activity_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsCreateActivity" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_activity_output_of_yojson
          ~error_deserializer
  end
module CreateStateMachine =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidDefinition") ->
            `InvalidDefinition
              (Json_deserializers.invalid_definition_of_yojson tree path)
        | (_, "InvalidEncryptionConfiguration") ->
            `InvalidEncryptionConfiguration
              (Json_deserializers.invalid_encryption_configuration_of_yojson
                 tree path)
        | (_, "InvalidLoggingConfiguration") ->
            `InvalidLoggingConfiguration
              (Json_deserializers.invalid_logging_configuration_of_yojson
                 tree path)
        | (_, "InvalidName") ->
            `InvalidName
              (Json_deserializers.invalid_name_of_yojson tree path)
        | (_, "InvalidTracingConfiguration") ->
            `InvalidTracingConfiguration
              (Json_deserializers.invalid_tracing_configuration_of_yojson
                 tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "StateMachineAlreadyExists") ->
            `StateMachineAlreadyExists
              (Json_deserializers.state_machine_already_exists_of_yojson tree
                 path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineLimitExceeded") ->
            `StateMachineLimitExceeded
              (Json_deserializers.state_machine_limit_exceeded_of_yojson tree
                 path)
        | (_, "StateMachineTypeNotSupported") ->
            `StateMachineTypeNotSupported
              (Json_deserializers.state_machine_type_not_supported_of_yojson
                 tree path)
        | (_, "TooManyTags") ->
            `TooManyTags
              (Json_deserializers.too_many_tags_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_state_machine_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.create_state_machine_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsCreateStateMachine" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_state_machine_output_of_yojson
          ~error_deserializer
  end
module CreateStateMachineAlias =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidName") ->
            `InvalidName
              (Json_deserializers.invalid_name_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "ServiceQuotaExceededException") ->
            `ServiceQuotaExceededException
              (Json_deserializers.service_quota_exceeded_exception_of_yojson
                 tree path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : create_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.create_state_machine_alias_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsCreateStateMachineAlias" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.create_state_machine_alias_output_of_yojson
          ~error_deserializer
  end
module DeleteActivity =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_activity_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.delete_activity_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDeleteActivity" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_activity_output_of_yojson
          ~error_deserializer
  end
module DeleteStateMachine =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_state_machine_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_state_machine_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDeleteStateMachine" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_state_machine_output_of_yojson
          ~error_deserializer
  end
module DeleteStateMachineAlias =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_state_machine_alias_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDeleteStateMachineAlias" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_state_machine_alias_output_of_yojson
          ~error_deserializer
  end
module DeleteStateMachineVersion =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_state_machine_version_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_state_machine_version_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDeleteStateMachineVersion" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_state_machine_version_output_of_yojson
          ~error_deserializer
  end
module DescribeActivity =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ActivityDoesNotExist") ->
            `ActivityDoesNotExist
              (Json_deserializers.activity_does_not_exist_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_activity_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_activity_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeActivity" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_activity_output_of_yojson
          ~error_deserializer
  end
module DescribeExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_execution_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_execution_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_execution_output_of_yojson
          ~error_deserializer
  end
module DescribeMapRun =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_map_run_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.describe_map_run_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeMapRun" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_map_run_output_of_yojson
          ~error_deserializer
  end
module DescribeStateMachine =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_state_machine_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_state_machine_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeStateMachine" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_state_machine_output_of_yojson
          ~error_deserializer
  end
module DescribeStateMachineAlias =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_state_machine_alias_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeStateMachineAlias" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_state_machine_alias_output_of_yojson
          ~error_deserializer
  end
module DescribeStateMachineForExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_state_machine_for_execution_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_state_machine_for_execution_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsDescribeStateMachineForExecution"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_state_machine_for_execution_output_of_yojson
          ~error_deserializer
  end
module GetActivityTask =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ActivityDoesNotExist") ->
            `ActivityDoesNotExist
              (Json_deserializers.activity_does_not_exist_of_yojson tree path)
        | (_, "ActivityWorkerLimitExceeded") ->
            `ActivityWorkerLimitExceeded
              (Json_deserializers.activity_worker_limit_exceeded_of_yojson
                 tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_activity_task_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_activity_task_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsGetActivityTask" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_activity_task_output_of_yojson
          ~error_deserializer
  end
module GetExecutionHistory =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_execution_history_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_execution_history_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsGetExecutionHistory" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_execution_history_output_of_yojson
          ~error_deserializer
  end
module ListActivities =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_activities_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_activities_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListActivities" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_activities_output_of_yojson
          ~error_deserializer
  end
module ListExecutions =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | (_, "StateMachineTypeNotSupported") ->
            `StateMachineTypeNotSupported
              (Json_deserializers.state_machine_type_not_supported_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_executions_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_executions_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListExecutions" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_executions_output_of_yojson
          ~error_deserializer
  end
module ListMapRuns =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_map_runs_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.list_map_runs_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListMapRuns" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_map_runs_output_of_yojson
          ~error_deserializer
  end
module ListStateMachineAliases =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_state_machine_aliases_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_state_machine_aliases_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListStateMachineAliases" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_state_machine_aliases_output_of_yojson
          ~error_deserializer
  end
module ListStateMachineVersions =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_state_machine_versions_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_state_machine_versions_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListStateMachineVersions" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_state_machine_versions_output_of_yojson
          ~error_deserializer
  end
module ListStateMachines =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_state_machines_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_state_machines_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListStateMachines" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_state_machines_output_of_yojson
          ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_tags_for_resource_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_tags_for_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsListTagsForResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
          ~error_deserializer
  end
module PublishStateMachineVersion =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ServiceQuotaExceededException") ->
            `ServiceQuotaExceededException
              (Json_deserializers.service_quota_exceeded_exception_of_yojson
                 tree path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : publish_state_machine_version_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.publish_state_machine_version_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsPublishStateMachineVersion" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.publish_state_machine_version_output_of_yojson
          ~error_deserializer
  end
module RedriveExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "ExecutionLimitExceeded") ->
            `ExecutionLimitExceeded
              (Json_deserializers.execution_limit_exceeded_of_yojson tree
                 path)
        | (_, "ExecutionNotRedrivable") ->
            `ExecutionNotRedrivable
              (Json_deserializers.execution_not_redrivable_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : redrive_execution_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.redrive_execution_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsRedriveExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.redrive_execution_output_of_yojson
          ~error_deserializer
  end
module SendTaskFailure =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "TaskDoesNotExist") ->
            `TaskDoesNotExist
              (Json_deserializers.task_does_not_exist_of_yojson tree path)
        | (_, "TaskTimedOut") ->
            `TaskTimedOut
              (Json_deserializers.task_timed_out_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : send_task_failure_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.send_task_failure_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsSendTaskFailure" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.send_task_failure_output_of_yojson
          ~error_deserializer
  end
module SendTaskHeartbeat =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "TaskDoesNotExist") ->
            `TaskDoesNotExist
              (Json_deserializers.task_does_not_exist_of_yojson tree path)
        | (_, "TaskTimedOut") ->
            `TaskTimedOut
              (Json_deserializers.task_timed_out_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : send_task_heartbeat_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.send_task_heartbeat_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsSendTaskHeartbeat" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.send_task_heartbeat_output_of_yojson
          ~error_deserializer
  end
module SendTaskSuccess =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidOutput") ->
            `InvalidOutput
              (Json_deserializers.invalid_output_of_yojson tree path)
        | (_, "InvalidToken") ->
            `InvalidToken
              (Json_deserializers.invalid_token_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "TaskDoesNotExist") ->
            `TaskDoesNotExist
              (Json_deserializers.task_does_not_exist_of_yojson tree path)
        | (_, "TaskTimedOut") ->
            `TaskTimedOut
              (Json_deserializers.task_timed_out_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : send_task_success_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.send_task_success_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsSendTaskSuccess" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.send_task_success_output_of_yojson
          ~error_deserializer
  end
module StartExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionAlreadyExists") ->
            `ExecutionAlreadyExists
              (Json_deserializers.execution_already_exists_of_yojson tree
                 path)
        | (_, "ExecutionLimitExceeded") ->
            `ExecutionLimitExceeded
              (Json_deserializers.execution_limit_exceeded_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidExecutionInput") ->
            `InvalidExecutionInput
              (Json_deserializers.invalid_execution_input_of_yojson tree path)
        | (_, "InvalidName") ->
            `InvalidName
              (Json_deserializers.invalid_name_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_execution_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.start_execution_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsStartExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_execution_output_of_yojson
          ~error_deserializer
  end
module StartSyncExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidExecutionInput") ->
            `InvalidExecutionInput
              (Json_deserializers.invalid_execution_input_of_yojson tree path)
        | (_, "InvalidName") ->
            `InvalidName
              (Json_deserializers.invalid_name_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | (_, "StateMachineTypeNotSupported") ->
            `StateMachineTypeNotSupported
              (Json_deserializers.state_machine_type_not_supported_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_sync_execution_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_sync_execution_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsStartSyncExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_sync_execution_output_of_yojson
          ~error_deserializer
  end
module StopExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ExecutionDoesNotExist") ->
            `ExecutionDoesNotExist
              (Json_deserializers.execution_does_not_exist_of_yojson tree
                 path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsInvalidStateException") ->
            `KmsInvalidStateException
              (Json_deserializers.kms_invalid_state_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : stop_execution_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.stop_execution_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsStopExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.stop_execution_output_of_yojson
          ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "TooManyTags") ->
            `TooManyTags
              (Json_deserializers.too_many_tags_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : tag_resource_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.tag_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsTagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
          ~error_deserializer
  end
module TestState =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidDefinition") ->
            `InvalidDefinition
              (Json_deserializers.invalid_definition_of_yojson tree path)
        | (_, "InvalidExecutionInput") ->
            `InvalidExecutionInput
              (Json_deserializers.invalid_execution_input_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : test_state_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.test_state_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsTestState" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.test_state_output_of_yojson
          ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : untag_resource_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.untag_resource_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsUntagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
          ~error_deserializer
  end
module UpdateMapRun =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_map_run_input) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.update_map_run_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsUpdateMapRun" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_map_run_output_of_yojson
          ~error_deserializer
  end
module UpdateStateMachine =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "InvalidDefinition") ->
            `InvalidDefinition
              (Json_deserializers.invalid_definition_of_yojson tree path)
        | (_, "InvalidEncryptionConfiguration") ->
            `InvalidEncryptionConfiguration
              (Json_deserializers.invalid_encryption_configuration_of_yojson
                 tree path)
        | (_, "InvalidLoggingConfiguration") ->
            `InvalidLoggingConfiguration
              (Json_deserializers.invalid_logging_configuration_of_yojson
                 tree path)
        | (_, "InvalidTracingConfiguration") ->
            `InvalidTracingConfiguration
              (Json_deserializers.invalid_tracing_configuration_of_yojson
                 tree path)
        | (_, "KmsAccessDeniedException") ->
            `KmsAccessDeniedException
              (Json_deserializers.kms_access_denied_exception_of_yojson tree
                 path)
        | (_, "KmsThrottlingException") ->
            `KmsThrottlingException
              (Json_deserializers.kms_throttling_exception_of_yojson tree
                 path)
        | (_, "MissingRequiredParameter") ->
            `MissingRequiredParameter
              (Json_deserializers.missing_required_parameter_of_yojson tree
                 path)
        | (_, "ServiceQuotaExceededException") ->
            `ServiceQuotaExceededException
              (Json_deserializers.service_quota_exceeded_exception_of_yojson
                 tree path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "StateMachineDoesNotExist") ->
            `StateMachineDoesNotExist
              (Json_deserializers.state_machine_does_not_exist_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_state_machine_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_state_machine_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsUpdateStateMachine" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_state_machine_output_of_yojson
          ~error_deserializer
  end
module UpdateStateMachineAlias =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InvalidArn") ->
            `InvalidArn (Json_deserializers.invalid_arn_of_yojson tree path)
        | (_, "ResourceNotFound") ->
            `ResourceNotFound
              (Json_deserializers.resource_not_found_of_yojson tree path)
        | (_, "StateMachineDeleting") ->
            `StateMachineDeleting
              (Json_deserializers.state_machine_deleting_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : update_state_machine_alias_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.update_state_machine_alias_input_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsUpdateStateMachineAlias" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.update_state_machine_alias_output_of_yojson
          ~error_deserializer
  end
module ValidateStateMachineDefinition =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : validate_state_machine_definition_input) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.validate_state_machine_definition_input_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"AWSStepFunctionsValidateStateMachineDefinition"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.validate_state_machine_definition_output_of_yojson
          ~error_deserializer
  end