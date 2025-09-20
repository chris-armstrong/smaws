open Types
open Service_metadata

module AcceptEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_environment_account_connection_input) =
    let input = Json_serializers.accept_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.AcceptEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module CancelComponentDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_component_deployment_input) =
    let input = Json_serializers.cancel_component_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CancelComponentDeployment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_component_deployment_output_of_yojson
      ~error_deserializer
end

module CancelEnvironmentDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_environment_deployment_input) =
    let input = Json_serializers.cancel_environment_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CancelEnvironmentDeployment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_environment_deployment_output_of_yojson
      ~error_deserializer
end

module CancelServiceInstanceDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_service_instance_deployment_input) =
    let input = Json_serializers.cancel_service_instance_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.CancelServiceInstanceDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_service_instance_deployment_output_of_yojson
      ~error_deserializer
end

module CancelServicePipelineDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_service_pipeline_deployment_input) =
    let input = Json_serializers.cancel_service_pipeline_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.CancelServicePipelineDeployment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_service_pipeline_deployment_output_of_yojson
      ~error_deserializer
end

module CreateComponent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_component_input) =
    let input = Json_serializers.create_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateComponent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_component_output_of_yojson
      ~error_deserializer
end

module CreateEnvironment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_input) =
    let input = Json_serializers.create_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateEnvironment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_environment_output_of_yojson
      ~error_deserializer
end

module CreateEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_account_connection_input) =
    let input = Json_serializers.create_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.CreateEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module CreateEnvironmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_template_input) =
    let input = Json_serializers.create_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateEnvironmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_template_output_of_yojson
      ~error_deserializer
end

module CreateEnvironmentTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_environment_template_version_input) =
    let input = Json_serializers.create_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.CreateEnvironmentTemplateVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_environment_template_version_output_of_yojson
      ~error_deserializer
end

module CreateRepository = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_repository_input) =
    let input = Json_serializers.create_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_repository_output_of_yojson
      ~error_deserializer
end

module CreateService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_input) =
    let input = Json_serializers.create_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateService" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_service_output_of_yojson
      ~error_deserializer
end

module CreateServiceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_instance_input) =
    let input = Json_serializers.create_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateServiceInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_instance_output_of_yojson
      ~error_deserializer
end

module CreateServiceSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_sync_config_input) =
    let input = Json_serializers.create_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateServiceSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_sync_config_output_of_yojson
      ~error_deserializer
end

module CreateServiceTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_template_input) =
    let input = Json_serializers.create_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateServiceTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_template_output_of_yojson
      ~error_deserializer
end

module CreateServiceTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_template_version_input) =
    let input = Json_serializers.create_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateServiceTemplateVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_template_version_output_of_yojson
      ~error_deserializer
end

module CreateTemplateSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_template_sync_config_input) =
    let input = Json_serializers.create_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.CreateTemplateSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_template_sync_config_output_of_yojson
      ~error_deserializer
end

module DeleteComponent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_component_input) =
    let input = Json_serializers.delete_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteComponent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_component_output_of_yojson
      ~error_deserializer
end

module DeleteDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_deployment_input) =
    let input = Json_serializers.delete_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteDeployment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_deployment_output_of_yojson
      ~error_deserializer
end

module DeleteEnvironment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_input) =
    let input = Json_serializers.delete_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteEnvironment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_environment_output_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_account_connection_input) =
    let input = Json_serializers.delete_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.DeleteEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_template_input) =
    let input = Json_serializers.delete_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteEnvironmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_template_output_of_yojson
      ~error_deserializer
end

module DeleteEnvironmentTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_environment_template_version_input) =
    let input = Json_serializers.delete_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.DeleteEnvironmentTemplateVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_environment_template_version_output_of_yojson
      ~error_deserializer
end

module DeleteRepository = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_repository_input) =
    let input = Json_serializers.delete_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_repository_output_of_yojson
      ~error_deserializer
end

module DeleteService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_input) =
    let input = Json_serializers.delete_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteService" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_service_output_of_yojson
      ~error_deserializer
end

module DeleteServiceSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_sync_config_input) =
    let input = Json_serializers.delete_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteServiceSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_sync_config_output_of_yojson
      ~error_deserializer
end

module DeleteServiceTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_template_input) =
    let input = Json_serializers.delete_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteServiceTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_template_output_of_yojson
      ~error_deserializer
end

module DeleteServiceTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_template_version_input) =
    let input = Json_serializers.delete_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteServiceTemplateVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_template_version_output_of_yojson
      ~error_deserializer
end

module DeleteTemplateSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_template_sync_config_input) =
    let input = Json_serializers.delete_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.DeleteTemplateSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_template_sync_config_output_of_yojson
      ~error_deserializer
end

module GetAccountSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_settings_input) =
    let input = Json_serializers.get_account_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetAccountSettings" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_account_settings_output_of_yojson
      ~error_deserializer
end

module GetComponent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_component_input) =
    let input = Json_serializers.get_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetComponent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_component_output_of_yojson
      ~error_deserializer
end

module GetDeployment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_deployment_input) =
    let input = Json_serializers.get_deployment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetDeployment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_deployment_output_of_yojson
      ~error_deserializer
end

module GetEnvironment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_input) =
    let input = Json_serializers.get_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetEnvironment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_environment_output_of_yojson
      ~error_deserializer
end

module GetEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_account_connection_input) =
    let input = Json_serializers.get_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.GetEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module GetEnvironmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_template_input) =
    let input = Json_serializers.get_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetEnvironmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_template_output_of_yojson
      ~error_deserializer
end

module GetEnvironmentTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_environment_template_version_input) =
    let input = Json_serializers.get_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.GetEnvironmentTemplateVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_environment_template_version_output_of_yojson
      ~error_deserializer
end

module GetRepository = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_input) =
    let input = Json_serializers.get_repository_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetRepository" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_repository_output_of_yojson
      ~error_deserializer
end

module GetRepositorySyncStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_repository_sync_status_input) =
    let input = Json_serializers.get_repository_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetRepositorySyncStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_repository_sync_status_output_of_yojson
      ~error_deserializer
end

module GetResourcesSummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resources_summary_input) =
    let input = Json_serializers.get_resources_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetResourcesSummary" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resources_summary_output_of_yojson
      ~error_deserializer
end

module GetService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_input) =
    let input = Json_serializers.get_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetService" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_service_output_of_yojson
      ~error_deserializer
end

module GetServiceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_instance_input) =
    let input = Json_serializers.get_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_service_instance_output_of_yojson
      ~error_deserializer
end

module GetServiceInstanceSyncStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_instance_sync_status_input) =
    let input = Json_serializers.get_service_instance_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceInstanceSyncStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_instance_sync_status_output_of_yojson
      ~error_deserializer
end

module GetServiceSyncBlockerSummary = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_sync_blocker_summary_input) =
    let input = Json_serializers.get_service_sync_blocker_summary_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceSyncBlockerSummary"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_sync_blocker_summary_output_of_yojson
      ~error_deserializer
end

module GetServiceSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_sync_config_input) =
    let input = Json_serializers.get_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_sync_config_output_of_yojson
      ~error_deserializer
end

module GetServiceTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_template_input) =
    let input = Json_serializers.get_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceTemplate" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_service_template_output_of_yojson
      ~error_deserializer
end

module GetServiceTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_template_version_input) =
    let input = Json_serializers.get_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetServiceTemplateVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_template_version_output_of_yojson
      ~error_deserializer
end

module GetTemplateSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_template_sync_config_input) =
    let input = Json_serializers.get_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetTemplateSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_template_sync_config_output_of_yojson
      ~error_deserializer
end

module GetTemplateSyncStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_template_sync_status_input) =
    let input = Json_serializers.get_template_sync_status_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.GetTemplateSyncStatus"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_template_sync_status_output_of_yojson
      ~error_deserializer
end

module ListComponentOutputs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_component_outputs_input) =
    let input = Json_serializers.list_component_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListComponentOutputs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_component_outputs_output_of_yojson
      ~error_deserializer
end

module ListComponentProvisionedResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_component_provisioned_resources_input) =
    let input = Json_serializers.list_component_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListComponentProvisionedResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_component_provisioned_resources_output_of_yojson
      ~error_deserializer
end

module ListComponents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_components_input) =
    let input = Json_serializers.list_components_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListComponents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_components_output_of_yojson
      ~error_deserializer
end

module ListDeployments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_deployments_input) =
    let input = Json_serializers.list_deployments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListDeployments" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_deployments_output_of_yojson
      ~error_deserializer
end

module ListEnvironmentAccountConnections = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_account_connections_input) =
    let input = Json_serializers.list_environment_account_connections_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListEnvironmentAccountConnections" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_account_connections_output_of_yojson
      ~error_deserializer
end

module ListEnvironmentOutputs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_outputs_input) =
    let input = Json_serializers.list_environment_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListEnvironmentOutputs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_outputs_output_of_yojson
      ~error_deserializer
end

module ListEnvironmentProvisionedResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_provisioned_resources_input) =
    let input = Json_serializers.list_environment_provisioned_resources_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListEnvironmentProvisionedResources" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_environment_provisioned_resources_output_of_yojson
      ~error_deserializer
end

module ListEnvironmentTemplateVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_template_versions_input) =
    let input = Json_serializers.list_environment_template_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListEnvironmentTemplateVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_template_versions_output_of_yojson
      ~error_deserializer
end

module ListEnvironmentTemplates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environment_templates_input) =
    let input = Json_serializers.list_environment_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListEnvironmentTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_environment_templates_output_of_yojson
      ~error_deserializer
end

module ListEnvironments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_environments_input) =
    let input = Json_serializers.list_environments_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListEnvironments" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_environments_output_of_yojson
      ~error_deserializer
end

module ListRepositories = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repositories_input) =
    let input = Json_serializers.list_repositories_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListRepositories" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_repositories_output_of_yojson
      ~error_deserializer
end

module ListRepositorySyncDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_repository_sync_definitions_input) =
    let input = Json_serializers.list_repository_sync_definitions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListRepositorySyncDefinitions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_repository_sync_definitions_output_of_yojson
      ~error_deserializer
end

module ListServiceInstanceOutputs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_instance_outputs_input) =
    let input = Json_serializers.list_service_instance_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServiceInstanceOutputs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_instance_outputs_output_of_yojson
      ~error_deserializer
end

module ListServiceInstanceProvisionedResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_instance_provisioned_resources_input) =
    let input =
      Json_serializers.list_service_instance_provisioned_resources_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListServiceInstanceProvisionedResources" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_service_instance_provisioned_resources_output_of_yojson
      ~error_deserializer
end

module ListServiceInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_instances_input) =
    let input = Json_serializers.list_service_instances_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServiceInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_instances_output_of_yojson
      ~error_deserializer
end

module ListServicePipelineOutputs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_pipeline_outputs_input) =
    let input = Json_serializers.list_service_pipeline_outputs_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServicePipelineOutputs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_pipeline_outputs_output_of_yojson
      ~error_deserializer
end

module ListServicePipelineProvisionedResources = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_pipeline_provisioned_resources_input) =
    let input =
      Json_serializers.list_service_pipeline_provisioned_resources_input_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.ListServicePipelineProvisionedResources" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_service_pipeline_provisioned_resources_output_of_yojson
      ~error_deserializer
end

module ListServiceTemplateVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_template_versions_input) =
    let input = Json_serializers.list_service_template_versions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServiceTemplateVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_template_versions_output_of_yojson
      ~error_deserializer
end

module ListServiceTemplates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_service_templates_input) =
    let input = Json_serializers.list_service_templates_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServiceTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_service_templates_output_of_yojson
      ~error_deserializer
end

module ListServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_input) =
    let input = Json_serializers.list_services_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListServices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_services_output_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module NotifyResourceDeploymentStatusChange = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_resource_deployment_status_change_input) =
    let input = Json_serializers.notify_resource_deployment_status_change_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.NotifyResourceDeploymentStatusChange" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.notify_resource_deployment_status_change_output_of_yojson
      ~error_deserializer
end

module RejectEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_environment_account_connection_input) =
    let input = Json_serializers.reject_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.RejectEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson
      ~error_deserializer
end

module UpdateAccountSettings = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_account_settings_input) =
    let input = Json_serializers.update_account_settings_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateAccountSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_account_settings_output_of_yojson
      ~error_deserializer
end

module UpdateComponent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_component_input) =
    let input = Json_serializers.update_component_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateComponent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_component_output_of_yojson
      ~error_deserializer
end

module UpdateEnvironment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_input) =
    let input = Json_serializers.update_environment_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateEnvironment" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_environment_output_of_yojson
      ~error_deserializer
end

module UpdateEnvironmentAccountConnection = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_account_connection_input) =
    let input = Json_serializers.update_environment_account_connection_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.UpdateEnvironmentAccountConnection" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_account_connection_output_of_yojson
      ~error_deserializer
end

module UpdateEnvironmentTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_template_input) =
    let input = Json_serializers.update_environment_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateEnvironmentTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_template_output_of_yojson
      ~error_deserializer
end

module UpdateEnvironmentTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_environment_template_version_input) =
    let input = Json_serializers.update_environment_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AwsProton20200720.UpdateEnvironmentTemplateVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_environment_template_version_output_of_yojson
      ~error_deserializer
end

module UpdateService = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.proton#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_input) =
    let input = Json_serializers.update_service_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateService" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_service_output_of_yojson
      ~error_deserializer
end

module UpdateServiceInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_instance_input) =
    let input = Json_serializers.update_service_instance_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServiceInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_instance_output_of_yojson
      ~error_deserializer
end

module UpdateServicePipeline = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_pipeline_input) =
    let input = Json_serializers.update_service_pipeline_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServicePipeline"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_pipeline_output_of_yojson
      ~error_deserializer
end

module UpdateServiceSyncBlocker = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_sync_blocker_input) =
    let input = Json_serializers.update_service_sync_blocker_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServiceSyncBlocker"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_sync_blocker_output_of_yojson
      ~error_deserializer
end

module UpdateServiceSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_sync_config_input) =
    let input = Json_serializers.update_service_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServiceSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_sync_config_output_of_yojson
      ~error_deserializer
end

module UpdateServiceTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_template_input) =
    let input = Json_serializers.update_service_template_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServiceTemplate"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_template_output_of_yojson
      ~error_deserializer
end

module UpdateServiceTemplateVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_template_version_input) =
    let input = Json_serializers.update_service_template_version_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateServiceTemplateVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_template_version_output_of_yojson
      ~error_deserializer
end

module UpdateTemplateSyncConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.proton#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.proton#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.proton#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.proton#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.proton#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.proton#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_template_sync_config_input) =
    let input = Json_serializers.update_template_sync_config_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AwsProton20200720.UpdateTemplateSyncConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_template_sync_config_output_of_yojson
      ~error_deserializer
end
