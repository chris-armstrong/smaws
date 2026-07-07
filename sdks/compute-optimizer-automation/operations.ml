open Types
open Service_metadata

module AssociateAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `NotManagementAccountException _ ->
        "com.amazonaws.computeoptimizerautomation#NotManagementAccountException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NotManagementAccountException" ->
          `NotManagementAccountException
            (Json_deserializers.not_management_account_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_accounts_request) =
    let input = Json_serializers.associate_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.AssociateAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_accounts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_accounts_request) =
    let input = Json_serializers.associate_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.AssociateAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_accounts_response_of_yojson
      ~error_deserializer
end

module CreateAutomationRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_automation_rule_request) =
    let input = Json_serializers.create_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.CreateAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_automation_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_automation_rule_request) =
    let input = Json_serializers.create_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.CreateAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_automation_rule_response_of_yojson
      ~error_deserializer
end

module DeleteAutomationRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_automation_rule_request) =
    let input = Json_serializers.delete_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.DeleteAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_automation_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_automation_rule_request) =
    let input = Json_serializers.delete_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.DeleteAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_automation_rule_response_of_yojson
      ~error_deserializer
end

module DisassociateAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `NotManagementAccountException _ ->
        "com.amazonaws.computeoptimizerautomation#NotManagementAccountException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NotManagementAccountException" ->
          `NotManagementAccountException
            (Json_deserializers.not_management_account_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_accounts_request) =
    let input = Json_serializers.disassociate_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.DisassociateAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_accounts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_accounts_request) =
    let input = Json_serializers.disassociate_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.DisassociateAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_accounts_response_of_yojson
      ~error_deserializer
end

module GetAutomationEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_automation_event_request) =
    let input = Json_serializers.get_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.GetAutomationEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_automation_event_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_automation_event_request) =
    let input = Json_serializers.get_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.GetAutomationEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_automation_event_response_of_yojson
      ~error_deserializer
end

module GetAutomationRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_automation_rule_request) =
    let input = Json_serializers.get_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.GetAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_automation_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_automation_rule_request) =
    let input = Json_serializers.get_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.GetAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_automation_rule_response_of_yojson
      ~error_deserializer
end

module GetEnrollmentConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_enrollment_configuration_request) =
    let input = Json_serializers.get_enrollment_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.GetEnrollmentConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_enrollment_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_enrollment_configuration_request) =
    let input = Json_serializers.get_enrollment_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.GetEnrollmentConfiguration" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_enrollment_configuration_response_of_yojson
      ~error_deserializer
end

module ListAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `NotManagementAccountException _ ->
        "com.amazonaws.computeoptimizerautomation#NotManagementAccountException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NotManagementAccountException" ->
          `NotManagementAccountException
            (Json_deserializers.not_management_account_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accounts_request) =
    let input = Json_serializers.list_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComputeOptimizerAutomationService.ListAccounts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_accounts_request) =
    let input = Json_serializers.list_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_response_of_yojson ~error_deserializer
end

module ListAutomationEventSteps = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_event_steps_request) =
    let input = Json_serializers.list_automation_event_steps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEventSteps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_automation_event_steps_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_event_steps_request) =
    let input = Json_serializers.list_automation_event_steps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEventSteps" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_automation_event_steps_response_of_yojson
      ~error_deserializer
end

module ListAutomationEventSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_event_summaries_request) =
    let input = Json_serializers.list_automation_event_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEventSummaries" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_automation_event_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_event_summaries_request) =
    let input = Json_serializers.list_automation_event_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEventSummaries" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_automation_event_summaries_response_of_yojson
      ~error_deserializer
end

module ListAutomationEvents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_events_request) =
    let input = Json_serializers.list_automation_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_automation_events_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_events_request) =
    let input = Json_serializers.list_automation_events_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationEvents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_automation_events_response_of_yojson
      ~error_deserializer
end

module ListAutomationRulePreview = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_rule_preview_request) =
    let input = Json_serializers.list_automation_rule_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRulePreview" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_automation_rule_preview_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_rule_preview_request) =
    let input = Json_serializers.list_automation_rule_preview_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRulePreview" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_automation_rule_preview_response_of_yojson
      ~error_deserializer
end

module ListAutomationRulePreviewSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_rule_preview_summaries_request) =
    let input = Json_serializers.list_automation_rule_preview_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRulePreviewSummaries" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_automation_rule_preview_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_rule_preview_summaries_request) =
    let input = Json_serializers.list_automation_rule_preview_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRulePreviewSummaries" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_automation_rule_preview_summaries_response_of_yojson
      ~error_deserializer
end

module ListAutomationRules = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_automation_rules_request) =
    let input = Json_serializers.list_automation_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_automation_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_automation_rules_request) =
    let input = Json_serializers.list_automation_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListAutomationRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_automation_rules_response_of_yojson
      ~error_deserializer
end

module ListRecommendedActionSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_recommended_action_summaries_request) =
    let input = Json_serializers.list_recommended_action_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListRecommendedActionSummaries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_recommended_action_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommended_action_summaries_request) =
    let input = Json_serializers.list_recommended_action_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListRecommendedActionSummaries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_recommended_action_summaries_response_of_yojson
      ~error_deserializer
end

module ListRecommendedActions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_recommended_actions_request) =
    let input = Json_serializers.list_recommended_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListRecommendedActions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_recommended_actions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommended_actions_request) =
    let input = Json_serializers.list_recommended_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListRecommendedActions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_recommended_actions_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RollbackAutomationEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : rollback_automation_event_request) =
    let input = Json_serializers.rollback_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.RollbackAutomationEvent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.rollback_automation_event_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rollback_automation_event_request) =
    let input = Json_serializers.rollback_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.RollbackAutomationEvent" ~service ~context
      ~input ~output_deserializer:Json_deserializers.rollback_automation_event_response_of_yojson
      ~error_deserializer
end

module StartAutomationEvent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_automation_event_request) =
    let input = Json_serializers.start_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.StartAutomationEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_automation_event_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_automation_event_request) =
    let input = Json_serializers.start_automation_event_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.StartAutomationEvent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_automation_event_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ComputeOptimizerAutomationService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAutomationRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_automation_rule_request) =
    let input = Json_serializers.update_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.UpdateAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_automation_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_automation_rule_request) =
    let input = Json_serializers.update_automation_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.UpdateAutomationRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_automation_rule_response_of_yojson
      ~error_deserializer
end

module UpdateEnrollmentConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.computeoptimizerautomation#AccessDeniedException"
    | `ForbiddenException _ -> "com.amazonaws.computeoptimizerautomation#ForbiddenException"
    | `IdempotencyTokenInUseException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotencyTokenInUseException"
    | `IdempotentParameterMismatchException _ ->
        "com.amazonaws.computeoptimizerautomation#IdempotentParameterMismatchException"
    | `InternalServerException _ ->
        "com.amazonaws.computeoptimizerautomation#InternalServerException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.computeoptimizerautomation#InvalidParameterValueException"
    | `NotManagementAccountException _ ->
        "com.amazonaws.computeoptimizerautomation#NotManagementAccountException"
    | `OptInRequiredException _ -> "com.amazonaws.computeoptimizerautomation#OptInRequiredException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.computeoptimizerautomation#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.computeoptimizerautomation#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.computeoptimizerautomation#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ForbiddenException" ->
          `ForbiddenException (Json_deserializers.forbidden_exception_of_yojson tree path)
      | _, "IdempotencyTokenInUseException" ->
          `IdempotencyTokenInUseException
            (Json_deserializers.idempotency_token_in_use_exception_of_yojson tree path)
      | _, "IdempotentParameterMismatchException" ->
          `IdempotentParameterMismatchException
            (Json_deserializers.idempotent_parameter_mismatch_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NotManagementAccountException" ->
          `NotManagementAccountException
            (Json_deserializers.not_management_account_exception_of_yojson tree path)
      | _, "OptInRequiredException" ->
          `OptInRequiredException (Json_deserializers.opt_in_required_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_enrollment_configuration_request) =
    let input = Json_serializers.update_enrollment_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"ComputeOptimizerAutomationService.UpdateEnrollmentConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_enrollment_configuration_request) =
    let input = Json_serializers.update_enrollment_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"ComputeOptimizerAutomationService.UpdateEnrollmentConfiguration" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_enrollment_configuration_response_of_yojson
      ~error_deserializer
end
