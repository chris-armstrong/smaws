open Types
module AcceptEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : accept_environment_account_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.accept_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720AcceptEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:accept_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module CancelComponentDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_component_deployment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_component_deployment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CancelComponentDeployment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_component_deployment_output_of_yojson
            ~error_deserializer
  end
module CancelEnvironmentDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_environment_deployment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_environment_deployment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CancelEnvironmentDeployment"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_environment_deployment_output_of_yojson
            ~error_deserializer
  end
module CancelServiceInstanceDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_service_instance_deployment_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_service_instance_deployment_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CancelServiceInstanceDeployment"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_service_instance_deployment_output_of_yojson
            ~error_deserializer
  end
module CancelServicePipelineDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_service_pipeline_deployment_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_service_pipeline_deployment_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CancelServicePipelineDeployment"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_service_pipeline_deployment_output_of_yojson
            ~error_deserializer
  end
module CreateComponent =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_component_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_component_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateComponent" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_component_output_of_yojson
            ~error_deserializer
  end
module CreateEnvironment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_environment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_environment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateEnvironment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_environment_output_of_yojson
            ~error_deserializer
  end
module CreateEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : create_environment_account_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module CreateEnvironmentTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_environment_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_environment_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateEnvironmentTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_environment_template_output_of_yojson
            ~error_deserializer
  end
module CreateEnvironmentTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_environment_template_version_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_environment_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateEnvironmentTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_environment_template_version_output_of_yojson
            ~error_deserializer
  end
module CreateRepository =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_repository_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_repository_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateRepository" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_repository_output_of_yojson
            ~error_deserializer
  end
module CreateService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_service_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_service_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_service_output_of_yojson
            ~error_deserializer
  end
module CreateServiceInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_service_instance_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_service_instance_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateServiceInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_service_instance_output_of_yojson
            ~error_deserializer
  end
module CreateServiceSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_service_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_service_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateServiceSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_service_sync_config_output_of_yojson
            ~error_deserializer
  end
module CreateServiceTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_service_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_service_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateServiceTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_service_template_output_of_yojson
            ~error_deserializer
  end
module CreateServiceTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_service_template_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_service_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateServiceTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_service_template_version_output_of_yojson
            ~error_deserializer
  end
module CreateTemplateSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_template_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_template_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720CreateTemplateSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_template_sync_config_output_of_yojson
            ~error_deserializer
  end
module DeleteComponent =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_component_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_component_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteComponent" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_component_output_of_yojson
            ~error_deserializer
  end
module DeleteDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_deployment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_deployment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteDeployment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_deployment_output_of_yojson
            ~error_deserializer
  end
module DeleteEnvironment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_environment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_environment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteEnvironment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_environment_output_of_yojson
            ~error_deserializer
  end
module DeleteEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_environment_account_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module DeleteEnvironmentTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_environment_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_environment_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteEnvironmentTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_environment_template_output_of_yojson
            ~error_deserializer
  end
module DeleteEnvironmentTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_environment_template_version_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_environment_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteEnvironmentTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_environment_template_version_output_of_yojson
            ~error_deserializer
  end
module DeleteRepository =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_repository_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_repository_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteRepository" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_repository_output_of_yojson
            ~error_deserializer
  end
module DeleteService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_service_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_service_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_service_output_of_yojson
            ~error_deserializer
  end
module DeleteServiceSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_service_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_service_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteServiceSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_service_sync_config_output_of_yojson
            ~error_deserializer
  end
module DeleteServiceTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_service_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_service_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteServiceTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_service_template_output_of_yojson
            ~error_deserializer
  end
module DeleteServiceTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_service_template_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_service_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteServiceTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_service_template_version_output_of_yojson
            ~error_deserializer
  end
module DeleteTemplateSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_template_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_template_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720DeleteTemplateSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_template_sync_config_output_of_yojson
            ~error_deserializer
  end
module GetAccountSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_account_settings_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetAccountSettings" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_account_settings_output_of_yojson
            ~error_deserializer
  end
module GetComponent =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_component_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_component_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetComponent" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_component_output_of_yojson
            ~error_deserializer
  end
module GetDeployment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_deployment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_deployment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetDeployment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_deployment_output_of_yojson
            ~error_deserializer
  end
module GetEnvironment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_environment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_environment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetEnvironment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_environment_output_of_yojson
            ~error_deserializer
  end
module GetEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_environment_account_connection_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module GetEnvironmentTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_environment_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_environment_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetEnvironmentTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_environment_template_output_of_yojson
            ~error_deserializer
  end
module GetEnvironmentTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_environment_template_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_environment_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetEnvironmentTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_environment_template_version_output_of_yojson
            ~error_deserializer
  end
module GetRepository =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_repository_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_repository_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetRepository" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_repository_output_of_yojson
            ~error_deserializer
  end
module GetRepositorySyncStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_repository_sync_status_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_repository_sync_status_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetRepositorySyncStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_repository_sync_status_output_of_yojson
            ~error_deserializer
  end
module GetResourcesSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resources_summary_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetResourcesSummary" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resources_summary_output_of_yojson
            ~error_deserializer
  end
module GetService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_service_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_output_of_yojson
            ~error_deserializer
  end
module GetServiceInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_instance_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_instance_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_instance_output_of_yojson
            ~error_deserializer
  end
module GetServiceInstanceSyncStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_instance_sync_status_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_instance_sync_status_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceInstanceSyncStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_instance_sync_status_output_of_yojson
            ~error_deserializer
  end
module GetServiceSyncBlockerSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_sync_blocker_summary_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_sync_blocker_summary_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceSyncBlockerSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_sync_blocker_summary_output_of_yojson
            ~error_deserializer
  end
module GetServiceSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_sync_config_output_of_yojson
            ~error_deserializer
  end
module GetServiceTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_template_output_of_yojson
            ~error_deserializer
  end
module GetServiceTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_service_template_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_service_template_version_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetServiceTemplateVersion" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_service_template_version_output_of_yojson
            ~error_deserializer
  end
module GetTemplateSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_template_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_template_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetTemplateSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_template_sync_config_output_of_yojson
            ~error_deserializer
  end
module GetTemplateSyncStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_template_sync_status_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_template_sync_status_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720GetTemplateSyncStatus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_template_sync_status_output_of_yojson
            ~error_deserializer
  end
module ListComponentOutputs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_component_outputs_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_component_outputs_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListComponentOutputs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_component_outputs_output_of_yojson
            ~error_deserializer
  end
module ListComponentProvisionedResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_component_provisioned_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_component_provisioned_resources_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListComponentProvisionedResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_component_provisioned_resources_output_of_yojson
            ~error_deserializer
  end
module ListComponents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_components_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_components_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListComponents" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_components_output_of_yojson
            ~error_deserializer
  end
module ListDeployments =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_deployments_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_deployments_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListDeployments" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_deployments_output_of_yojson
            ~error_deserializer
  end
module ListEnvironmentAccountConnections =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_environment_account_connections_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_environment_account_connections_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironmentAccountConnections"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environment_account_connections_output_of_yojson
            ~error_deserializer
  end
module ListEnvironmentOutputs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_environment_outputs_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_environment_outputs_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironmentOutputs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environment_outputs_output_of_yojson
            ~error_deserializer
  end
module ListEnvironmentProvisionedResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_environment_provisioned_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_environment_provisioned_resources_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironmentProvisionedResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environment_provisioned_resources_output_of_yojson
            ~error_deserializer
  end
module ListEnvironmentTemplateVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_environment_template_versions_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_environment_template_versions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironmentTemplateVersions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environment_template_versions_output_of_yojson
            ~error_deserializer
  end
module ListEnvironmentTemplates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_environment_templates_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_environment_templates_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironmentTemplates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environment_templates_output_of_yojson
            ~error_deserializer
  end
module ListEnvironments =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_environments_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_environments_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListEnvironments" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_environments_output_of_yojson
            ~error_deserializer
  end
module ListRepositories =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_repositories_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_repositories_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListRepositories" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_repositories_output_of_yojson
            ~error_deserializer
  end
module ListRepositorySyncDefinitions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_repository_sync_definitions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_repository_sync_definitions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListRepositorySyncDefinitions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_repository_sync_definitions_output_of_yojson
            ~error_deserializer
  end
module ListServiceInstanceOutputs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_instance_outputs_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_instance_outputs_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServiceInstanceOutputs"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_instance_outputs_output_of_yojson
            ~error_deserializer
  end
module ListServiceInstanceProvisionedResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_service_instance_provisioned_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_instance_provisioned_resources_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServiceInstanceProvisionedResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_instance_provisioned_resources_output_of_yojson
            ~error_deserializer
  end
module ListServiceInstances =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_instances_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_instances_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServiceInstances" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_instances_output_of_yojson
            ~error_deserializer
  end
module ListServicePipelineOutputs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_pipeline_outputs_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_pipeline_outputs_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServicePipelineOutputs"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_pipeline_outputs_output_of_yojson
            ~error_deserializer
  end
module ListServicePipelineProvisionedResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_service_pipeline_provisioned_resources_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_pipeline_provisioned_resources_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServicePipelineProvisionedResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_pipeline_provisioned_resources_output_of_yojson
            ~error_deserializer
  end
module ListServiceTemplateVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_template_versions_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_template_versions_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServiceTemplateVersions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_template_versions_output_of_yojson
            ~error_deserializer
  end
module ListServiceTemplates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_service_templates_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_service_templates_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServiceTemplates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_service_templates_output_of_yojson
            ~error_deserializer
  end
module ListServices =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_services_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_services_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720ListServices" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_services_output_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"AwsProton20200720ListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_output_of_yojson
            ~error_deserializer
  end
module NotifyResourceDeploymentStatusChange =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : notify_resource_deployment_status_change_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.notify_resource_deployment_status_change_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720NotifyResourceDeploymentStatusChange"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:notify_resource_deployment_status_change_output_of_yojson
            ~error_deserializer
  end
module RejectEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : reject_environment_account_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.reject_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720RejectEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:reject_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"AwsProton20200720TagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_output_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"AwsProton20200720UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_output_of_yojson
            ~error_deserializer
  end
module UpdateAccountSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_account_settings_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_account_settings_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateAccountSettings" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_account_settings_output_of_yojson
            ~error_deserializer
  end
module UpdateComponent =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_component_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_component_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateComponent" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_component_output_of_yojson
            ~error_deserializer
  end
module UpdateEnvironment =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_environment_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_environment_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateEnvironment" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_environment_output_of_yojson
            ~error_deserializer
  end
module UpdateEnvironmentAccountConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_environment_account_connection_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_environment_account_connection_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateEnvironmentAccountConnection"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_environment_account_connection_output_of_yojson
            ~error_deserializer
  end
module UpdateEnvironmentTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_environment_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_environment_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateEnvironmentTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_environment_template_output_of_yojson
            ~error_deserializer
  end
module UpdateEnvironmentTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_environment_template_version_input)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_environment_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateEnvironmentTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_environment_template_version_output_of_yojson
            ~error_deserializer
  end
module UpdateService =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceQuotaExceededException") ->
              `ServiceQuotaExceededException
                (service_quota_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_service_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateService" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_output_of_yojson
            ~error_deserializer
  end
module UpdateServiceInstance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_instance_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_instance_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServiceInstance" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_instance_output_of_yojson
            ~error_deserializer
  end
module UpdateServicePipeline =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_pipeline_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_pipeline_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServicePipeline" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_pipeline_output_of_yojson
            ~error_deserializer
  end
module UpdateServiceSyncBlocker =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_sync_blocker_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_sync_blocker_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServiceSyncBlocker" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_sync_blocker_output_of_yojson
            ~error_deserializer
  end
module UpdateServiceSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServiceSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_sync_config_output_of_yojson
            ~error_deserializer
  end
module UpdateServiceTemplate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_template_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_template_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServiceTemplate" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_template_output_of_yojson
            ~error_deserializer
  end
module UpdateServiceTemplateVersion =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_service_template_version_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_service_template_version_input_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateServiceTemplateVersion"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_service_template_version_output_of_yojson
            ~error_deserializer
  end
module UpdateTemplateSyncConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_template_sync_config_input) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_template_sync_config_input_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AwsProton20200720UpdateTemplateSyncConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_template_sync_config_output_of_yojson
            ~error_deserializer
  end