open Types
open Service_metadata

module AcceptHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccessDeniedForDependencyException _ ->
        "com.amazonaws.organizations#AccessDeniedForDependencyException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `HandshakeAlreadyInStateException _ ->
        "com.amazonaws.organizations#HandshakeAlreadyInStateException"
    | `HandshakeConstraintViolationException _ ->
        "com.amazonaws.organizations#HandshakeConstraintViolationException"
    | `HandshakeNotFoundException _ -> "com.amazonaws.organizations#HandshakeNotFoundException"
    | `InvalidHandshakeTransitionException _ ->
        "com.amazonaws.organizations#InvalidHandshakeTransitionException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `MasterCannotLeaveOrganizationException _ ->
        "com.amazonaws.organizations#MasterCannotLeaveOrganizationException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccessDeniedForDependencyException" ->
          `AccessDeniedForDependencyException
            (Json_deserializers.access_denied_for_dependency_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "HandshakeAlreadyInStateException" ->
          `HandshakeAlreadyInStateException
            (Json_deserializers.handshake_already_in_state_exception_of_yojson tree path)
      | _, "HandshakeConstraintViolationException" ->
          `HandshakeConstraintViolationException
            (Json_deserializers.handshake_constraint_violation_exception_of_yojson tree path)
      | _, "HandshakeNotFoundException" ->
          `HandshakeNotFoundException
            (Json_deserializers.handshake_not_found_exception_of_yojson tree path)
      | _, "InvalidHandshakeTransitionException" ->
          `InvalidHandshakeTransitionException
            (Json_deserializers.invalid_handshake_transition_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MasterCannotLeaveOrganizationException" ->
          `MasterCannotLeaveOrganizationException
            (Json_deserializers.master_cannot_leave_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_handshake_request) =
    let input = Json_serializers.accept_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.AcceptHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_handshake_request) =
    let input = Json_serializers.accept_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.AcceptHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_handshake_response_of_yojson
      ~error_deserializer
end

module AttachPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicatePolicyAttachmentException _ ->
        "com.amazonaws.organizations#DuplicatePolicyAttachmentException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyChangesInProgressException _ ->
        "com.amazonaws.organizations#PolicyChangesInProgressException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `PolicyTypeNotEnabledException _ ->
        "com.amazonaws.organizations#PolicyTypeNotEnabledException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicatePolicyAttachmentException" ->
          `DuplicatePolicyAttachmentException
            (Json_deserializers.duplicate_policy_attachment_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyChangesInProgressException" ->
          `PolicyChangesInProgressException
            (Json_deserializers.policy_changes_in_progress_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "PolicyTypeNotEnabledException" ->
          `PolicyTypeNotEnabledException
            (Json_deserializers.policy_type_not_enabled_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : attach_policy_request) =
    let input = Json_serializers.attach_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.AttachPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : attach_policy_request) =
    let input = Json_serializers.attach_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.AttachPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CancelHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `HandshakeAlreadyInStateException _ ->
        "com.amazonaws.organizations#HandshakeAlreadyInStateException"
    | `HandshakeNotFoundException _ -> "com.amazonaws.organizations#HandshakeNotFoundException"
    | `InvalidHandshakeTransitionException _ ->
        "com.amazonaws.organizations#InvalidHandshakeTransitionException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "HandshakeAlreadyInStateException" ->
          `HandshakeAlreadyInStateException
            (Json_deserializers.handshake_already_in_state_exception_of_yojson tree path)
      | _, "HandshakeNotFoundException" ->
          `HandshakeNotFoundException
            (Json_deserializers.handshake_not_found_exception_of_yojson tree path)
      | _, "InvalidHandshakeTransitionException" ->
          `InvalidHandshakeTransitionException
            (Json_deserializers.invalid_handshake_transition_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_handshake_request) =
    let input = Json_serializers.cancel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.CancelHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_handshake_request) =
    let input = Json_serializers.cancel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CancelHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_handshake_response_of_yojson
      ~error_deserializer
end

module CloseAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountAlreadyClosedException _ ->
        "com.amazonaws.organizations#AccountAlreadyClosedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConflictException _ -> "com.amazonaws.organizations#ConflictException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountAlreadyClosedException" ->
          `AccountAlreadyClosedException
            (Json_deserializers.account_already_closed_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : close_account_request) =
    let input = Json_serializers.close_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.CloseAccount"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : close_account_request) =
    let input = Json_serializers.close_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CloseAccount" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `FinalizingOrganizationException _ ->
        "com.amazonaws.organizations#FinalizingOrganizationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "FinalizingOrganizationException" ->
          `FinalizingOrganizationException
            (Json_deserializers.finalizing_organization_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_account_request) =
    let input = Json_serializers.create_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.CreateAccount"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_account_request) =
    let input = Json_serializers.create_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CreateAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_response_of_yojson ~error_deserializer
end

module CreateGovCloudAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `FinalizingOrganizationException _ ->
        "com.amazonaws.organizations#FinalizingOrganizationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "FinalizingOrganizationException" ->
          `FinalizingOrganizationException
            (Json_deserializers.finalizing_organization_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_gov_cloud_account_request) =
    let input = Json_serializers.create_gov_cloud_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.CreateGovCloudAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_gov_cloud_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_gov_cloud_account_request) =
    let input = Json_serializers.create_gov_cloud_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CreateGovCloudAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_gov_cloud_account_response_of_yojson
      ~error_deserializer
end

module CreateOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccessDeniedForDependencyException _ ->
        "com.amazonaws.organizations#AccessDeniedForDependencyException"
    | `AlreadyInOrganizationException _ ->
        "com.amazonaws.organizations#AlreadyInOrganizationException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccessDeniedForDependencyException" ->
          `AccessDeniedForDependencyException
            (Json_deserializers.access_denied_for_dependency_exception_of_yojson tree path)
      | _, "AlreadyInOrganizationException" ->
          `AlreadyInOrganizationException
            (Json_deserializers.already_in_organization_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_organization_request) =
    let input = Json_serializers.create_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.CreateOrganization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_organization_request) =
    let input = Json_serializers.create_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CreateOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_organization_response_of_yojson
      ~error_deserializer
end

module CreateOrganizationalUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicateOrganizationalUnitException _ ->
        "com.amazonaws.organizations#DuplicateOrganizationalUnitException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ParentNotFoundException _ -> "com.amazonaws.organizations#ParentNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicateOrganizationalUnitException" ->
          `DuplicateOrganizationalUnitException
            (Json_deserializers.duplicate_organizational_unit_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ParentNotFoundException" ->
          `ParentNotFoundException
            (Json_deserializers.parent_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_organizational_unit_request) =
    let input = Json_serializers.create_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.CreateOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_organizational_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_organizational_unit_request) =
    let input = Json_serializers.create_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CreateOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_organizational_unit_response_of_yojson
      ~error_deserializer
end

module CreatePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicatePolicyException _ -> "com.amazonaws.organizations#DuplicatePolicyException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.organizations#MalformedPolicyDocumentException"
    | `PolicyTypeNotAvailableForOrganizationException _ ->
        "com.amazonaws.organizations#PolicyTypeNotAvailableForOrganizationException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicatePolicyException" ->
          `DuplicatePolicyException
            (Json_deserializers.duplicate_policy_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "PolicyTypeNotAvailableForOrganizationException" ->
          `PolicyTypeNotAvailableForOrganizationException
            (Json_deserializers.policy_type_not_available_for_organization_exception_of_yojson tree
               path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_policy_request) =
    let input = Json_serializers.create_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.CreatePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_policy_request) =
    let input = Json_serializers.create_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.CreatePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_policy_response_of_yojson ~error_deserializer
end

module DeclineHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `HandshakeAlreadyInStateException _ ->
        "com.amazonaws.organizations#HandshakeAlreadyInStateException"
    | `HandshakeNotFoundException _ -> "com.amazonaws.organizations#HandshakeNotFoundException"
    | `InvalidHandshakeTransitionException _ ->
        "com.amazonaws.organizations#InvalidHandshakeTransitionException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "HandshakeAlreadyInStateException" ->
          `HandshakeAlreadyInStateException
            (Json_deserializers.handshake_already_in_state_exception_of_yojson tree path)
      | _, "HandshakeNotFoundException" ->
          `HandshakeNotFoundException
            (Json_deserializers.handshake_not_found_exception_of_yojson tree path)
      | _, "InvalidHandshakeTransitionException" ->
          `InvalidHandshakeTransitionException
            (Json_deserializers.invalid_handshake_transition_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : decline_handshake_request) =
    let input = Json_serializers.decline_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DeclineHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.decline_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : decline_handshake_request) =
    let input = Json_serializers.decline_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeclineHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.decline_handshake_response_of_yojson
      ~error_deserializer
end

module DeleteOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `OrganizationNotEmptyException _ ->
        "com.amazonaws.organizations#OrganizationNotEmptyException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OrganizationNotEmptyException" ->
          `OrganizationNotEmptyException
            (Json_deserializers.organization_not_empty_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DeleteOrganization"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeleteOrganization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteOrganizationalUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `OrganizationalUnitNotEmptyException _ ->
        "com.amazonaws.organizations#OrganizationalUnitNotEmptyException"
    | `OrganizationalUnitNotFoundException _ ->
        "com.amazonaws.organizations#OrganizationalUnitNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OrganizationalUnitNotEmptyException" ->
          `OrganizationalUnitNotEmptyException
            (Json_deserializers.organizational_unit_not_empty_exception_of_yojson tree path)
      | _, "OrganizationalUnitNotFoundException" ->
          `OrganizationalUnitNotFoundException
            (Json_deserializers.organizational_unit_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_organizational_unit_request) =
    let input = Json_serializers.delete_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DeleteOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_organizational_unit_request) =
    let input = Json_serializers.delete_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeleteOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyInUseException _ -> "com.amazonaws.organizations#PolicyInUseException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyInUseException" ->
          `PolicyInUseException (Json_deserializers.policy_in_use_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_policy_request) =
    let input = Json_serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DeletePolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_policy_request) =
    let input = Json_serializers.delete_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeletePolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `ResourcePolicyNotFoundException _ ->
        "com.amazonaws.organizations#ResourcePolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeregisterDelegatedAdministrator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AccountNotRegisteredException _ ->
        "com.amazonaws.organizations#AccountNotRegisteredException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AccountNotRegisteredException" ->
          `AccountNotRegisteredException
            (Json_deserializers.account_not_registered_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_delegated_administrator_request) =
    let input = Json_serializers.deregister_delegated_administrator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DeregisterDelegatedAdministrator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_delegated_administrator_request) =
    let input = Json_serializers.deregister_delegated_administrator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DeregisterDelegatedAdministrator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_account_request) =
    let input = Json_serializers.describe_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DescribeAccount"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_request) =
    let input = Json_serializers.describe_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_response_of_yojson
      ~error_deserializer
end

module DescribeCreateAccountStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `CreateAccountStatusNotFoundException _ ->
        "com.amazonaws.organizations#CreateAccountStatusNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "CreateAccountStatusNotFoundException" ->
          `CreateAccountStatusNotFoundException
            (Json_deserializers.create_account_status_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_create_account_status_request) =
    let input = Json_serializers.describe_create_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DescribeCreateAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_create_account_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_create_account_status_request) =
    let input = Json_serializers.describe_create_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeCreateAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_create_account_status_response_of_yojson
      ~error_deserializer
end

module DescribeEffectivePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `EffectivePolicyNotFoundException _ ->
        "com.amazonaws.organizations#EffectivePolicyNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "EffectivePolicyNotFoundException" ->
          `EffectivePolicyNotFoundException
            (Json_deserializers.effective_policy_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_effective_policy_request) =
    let input = Json_serializers.describe_effective_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DescribeEffectivePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_effective_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_effective_policy_request) =
    let input = Json_serializers.describe_effective_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeEffectivePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_effective_policy_response_of_yojson
      ~error_deserializer
end

module DescribeHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `HandshakeNotFoundException _ -> "com.amazonaws.organizations#HandshakeNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "HandshakeNotFoundException" ->
          `HandshakeNotFoundException
            (Json_deserializers.handshake_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_handshake_request) =
    let input = Json_serializers.describe_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DescribeHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_handshake_request) =
    let input = Json_serializers.describe_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_handshake_response_of_yojson
      ~error_deserializer
end

module DescribeOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DescribeOrganization"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_organization_response_of_yojson
      ~error_deserializer
end

module DescribeOrganizationalUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `OrganizationalUnitNotFoundException _ ->
        "com.amazonaws.organizations#OrganizationalUnitNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OrganizationalUnitNotFoundException" ->
          `OrganizationalUnitNotFoundException
            (Json_deserializers.organizational_unit_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organizational_unit_request) =
    let input = Json_serializers.describe_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DescribeOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_organizational_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_organizational_unit_request) =
    let input = Json_serializers.describe_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_organizational_unit_response_of_yojson
      ~error_deserializer
end

module DescribePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_policy_request) =
    let input = Json_serializers.describe_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DescribePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_policy_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_policy_request) =
    let input = Json_serializers.describe_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_policy_response_of_yojson ~error_deserializer
end

module DescribeResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `ResourcePolicyNotFoundException _ ->
        "com.amazonaws.organizations#ResourcePolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "ResourcePolicyNotFoundException" ->
          `ResourcePolicyNotFoundException
            (Json_deserializers.resource_policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DescribeResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_resource_policy_response_of_yojson
      ~error_deserializer
end

module DescribeResponsibilityTransfer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ResponsibilityTransferNotFoundException _ ->
        "com.amazonaws.organizations#ResponsibilityTransferNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResponsibilityTransferNotFoundException" ->
          `ResponsibilityTransferNotFoundException
            (Json_deserializers.responsibility_transfer_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_responsibility_transfer_request) =
    let input = Json_serializers.describe_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DescribeResponsibilityTransfer" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_responsibility_transfer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_responsibility_transfer_request) =
    let input = Json_serializers.describe_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DescribeResponsibilityTransfer" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_responsibility_transfer_response_of_yojson
      ~error_deserializer
end

module DetachPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyChangesInProgressException _ ->
        "com.amazonaws.organizations#PolicyChangesInProgressException"
    | `PolicyNotAttachedException _ -> "com.amazonaws.organizations#PolicyNotAttachedException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyChangesInProgressException" ->
          `PolicyChangesInProgressException
            (Json_deserializers.policy_changes_in_progress_exception_of_yojson tree path)
      | _, "PolicyNotAttachedException" ->
          `PolicyNotAttachedException
            (Json_deserializers.policy_not_attached_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : detach_policy_request) =
    let input = Json_serializers.detach_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DetachPolicy"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_policy_request) =
    let input = Json_serializers.detach_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DetachPolicy" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DisableAWSServiceAccess = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_aws_service_access_request) =
    let input = Json_serializers.disable_aws_service_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.DisableAWSServiceAccess" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_aws_service_access_request) =
    let input = Json_serializers.disable_aws_service_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DisableAWSServiceAccess" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DisablePolicyType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyChangesInProgressException _ ->
        "com.amazonaws.organizations#PolicyChangesInProgressException"
    | `PolicyTypeNotEnabledException _ ->
        "com.amazonaws.organizations#PolicyTypeNotEnabledException"
    | `RootNotFoundException _ -> "com.amazonaws.organizations#RootNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyChangesInProgressException" ->
          `PolicyChangesInProgressException
            (Json_deserializers.policy_changes_in_progress_exception_of_yojson tree path)
      | _, "PolicyTypeNotEnabledException" ->
          `PolicyTypeNotEnabledException
            (Json_deserializers.policy_type_not_enabled_exception_of_yojson tree path)
      | _, "RootNotFoundException" ->
          `RootNotFoundException (Json_deserializers.root_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_policy_type_request) =
    let input = Json_serializers.disable_policy_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.DisablePolicyType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_policy_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_policy_type_request) =
    let input = Json_serializers.disable_policy_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.DisablePolicyType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_policy_type_response_of_yojson
      ~error_deserializer
end

module EnableAllFeatures = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `HandshakeConstraintViolationException _ ->
        "com.amazonaws.organizations#HandshakeConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "HandshakeConstraintViolationException" ->
          `HandshakeConstraintViolationException
            (Json_deserializers.handshake_constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_all_features_request) =
    let input = Json_serializers.enable_all_features_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.EnableAllFeatures"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_all_features_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_all_features_request) =
    let input = Json_serializers.enable_all_features_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.EnableAllFeatures" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_all_features_response_of_yojson
      ~error_deserializer
end

module EnableAWSServiceAccess = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_aws_service_access_request) =
    let input = Json_serializers.enable_aws_service_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.EnableAWSServiceAccess" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_aws_service_access_request) =
    let input = Json_serializers.enable_aws_service_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.EnableAWSServiceAccess" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module EnablePolicyType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyChangesInProgressException _ ->
        "com.amazonaws.organizations#PolicyChangesInProgressException"
    | `PolicyTypeAlreadyEnabledException _ ->
        "com.amazonaws.organizations#PolicyTypeAlreadyEnabledException"
    | `PolicyTypeNotAvailableForOrganizationException _ ->
        "com.amazonaws.organizations#PolicyTypeNotAvailableForOrganizationException"
    | `RootNotFoundException _ -> "com.amazonaws.organizations#RootNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyChangesInProgressException" ->
          `PolicyChangesInProgressException
            (Json_deserializers.policy_changes_in_progress_exception_of_yojson tree path)
      | _, "PolicyTypeAlreadyEnabledException" ->
          `PolicyTypeAlreadyEnabledException
            (Json_deserializers.policy_type_already_enabled_exception_of_yojson tree path)
      | _, "PolicyTypeNotAvailableForOrganizationException" ->
          `PolicyTypeNotAvailableForOrganizationException
            (Json_deserializers.policy_type_not_available_for_organization_exception_of_yojson tree
               path)
      | _, "RootNotFoundException" ->
          `RootNotFoundException (Json_deserializers.root_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_policy_type_request) =
    let input = Json_serializers.enable_policy_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.EnablePolicyType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_policy_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_policy_type_request) =
    let input = Json_serializers.enable_policy_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.EnablePolicyType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_policy_type_response_of_yojson
      ~error_deserializer
end

module InviteAccountToOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountOwnerNotVerifiedException _ ->
        "com.amazonaws.organizations#AccountOwnerNotVerifiedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicateHandshakeException _ -> "com.amazonaws.organizations#DuplicateHandshakeException"
    | `FinalizingOrganizationException _ ->
        "com.amazonaws.organizations#FinalizingOrganizationException"
    | `HandshakeConstraintViolationException _ ->
        "com.amazonaws.organizations#HandshakeConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountOwnerNotVerifiedException" ->
          `AccountOwnerNotVerifiedException
            (Json_deserializers.account_owner_not_verified_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicateHandshakeException" ->
          `DuplicateHandshakeException
            (Json_deserializers.duplicate_handshake_exception_of_yojson tree path)
      | _, "FinalizingOrganizationException" ->
          `FinalizingOrganizationException
            (Json_deserializers.finalizing_organization_exception_of_yojson tree path)
      | _, "HandshakeConstraintViolationException" ->
          `HandshakeConstraintViolationException
            (Json_deserializers.handshake_constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : invite_account_to_organization_request) =
    let input = Json_serializers.invite_account_to_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.InviteAccountToOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.invite_account_to_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : invite_account_to_organization_request) =
    let input = Json_serializers.invite_account_to_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.InviteAccountToOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.invite_account_to_organization_response_of_yojson
      ~error_deserializer
end

module InviteOrganizationToTransferResponsibility = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicateHandshakeException _ -> "com.amazonaws.organizations#DuplicateHandshakeException"
    | `HandshakeConstraintViolationException _ ->
        "com.amazonaws.organizations#HandshakeConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicateHandshakeException" ->
          `DuplicateHandshakeException
            (Json_deserializers.duplicate_handshake_exception_of_yojson tree path)
      | _, "HandshakeConstraintViolationException" ->
          `HandshakeConstraintViolationException
            (Json_deserializers.handshake_constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : invite_organization_to_transfer_responsibility_request) =
    let input =
      Json_serializers.invite_organization_to_transfer_responsibility_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.InviteOrganizationToTransferResponsibility" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.invite_organization_to_transfer_responsibility_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : invite_organization_to_transfer_responsibility_request) =
    let input =
      Json_serializers.invite_organization_to_transfer_responsibility_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.InviteOrganizationToTransferResponsibility" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.invite_organization_to_transfer_responsibility_response_of_yojson
      ~error_deserializer
end

module LeaveOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `MasterCannotLeaveOrganizationException _ ->
        "com.amazonaws.organizations#MasterCannotLeaveOrganizationException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MasterCannotLeaveOrganizationException" ->
          `MasterCannotLeaveOrganizationException
            (Json_deserializers.master_cannot_leave_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.LeaveOrganization"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.LeaveOrganization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ListAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accounts_request) =
    let input = Json_serializers.list_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListAccounts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_accounts_request) =
    let input = Json_serializers.list_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_response_of_yojson ~error_deserializer
end

module ListAccountsForParent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ParentNotFoundException _ -> "com.amazonaws.organizations#ParentNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ParentNotFoundException" ->
          `ParentNotFoundException
            (Json_deserializers.parent_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accounts_for_parent_request) =
    let input = Json_serializers.list_accounts_for_parent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListAccountsForParent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_for_parent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accounts_for_parent_request) =
    let input = Json_serializers.list_accounts_for_parent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListAccountsForParent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accounts_for_parent_response_of_yojson
      ~error_deserializer
end

module ListAccountsWithInvalidEffectivePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `EffectivePolicyNotFoundException _ ->
        "com.amazonaws.organizations#EffectivePolicyNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "EffectivePolicyNotFoundException" ->
          `EffectivePolicyNotFoundException
            (Json_deserializers.effective_policy_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accounts_with_invalid_effective_policy_request) =
    let input =
      Json_serializers.list_accounts_with_invalid_effective_policy_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListAccountsWithInvalidEffectivePolicy" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_accounts_with_invalid_effective_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accounts_with_invalid_effective_policy_request)
      =
    let input =
      Json_serializers.list_accounts_with_invalid_effective_policy_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListAccountsWithInvalidEffectivePolicy" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_accounts_with_invalid_effective_policy_response_of_yojson
      ~error_deserializer
end

module ListAWSServiceAccessForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aws_service_access_for_organization_request) =
    let input =
      Json_serializers.list_aws_service_access_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListAWSServiceAccessForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_aws_service_access_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_aws_service_access_for_organization_request) =
    let input =
      Json_serializers.list_aws_service_access_for_organization_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListAWSServiceAccessForOrganization" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_aws_service_access_for_organization_response_of_yojson
      ~error_deserializer
end

module ListChildren = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ParentNotFoundException _ -> "com.amazonaws.organizations#ParentNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ParentNotFoundException" ->
          `ParentNotFoundException
            (Json_deserializers.parent_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_children_request) =
    let input = Json_serializers.list_children_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListChildren"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_children_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_children_request) =
    let input = Json_serializers.list_children_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListChildren" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_children_response_of_yojson ~error_deserializer
end

module ListCreateAccountStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_create_account_status_request) =
    let input = Json_serializers.list_create_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListCreateAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_create_account_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_create_account_status_request) =
    let input = Json_serializers.list_create_account_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListCreateAccountStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_create_account_status_response_of_yojson
      ~error_deserializer
end

module ListDelegatedAdministrators = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_delegated_administrators_request) =
    let input = Json_serializers.list_delegated_administrators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListDelegatedAdministrators" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_delegated_administrators_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_delegated_administrators_request) =
    let input = Json_serializers.list_delegated_administrators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListDelegatedAdministrators" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_delegated_administrators_response_of_yojson
      ~error_deserializer
end

module ListDelegatedServicesForAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AccountNotRegisteredException _ ->
        "com.amazonaws.organizations#AccountNotRegisteredException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AccountNotRegisteredException" ->
          `AccountNotRegisteredException
            (Json_deserializers.account_not_registered_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_delegated_services_for_account_request) =
    let input = Json_serializers.list_delegated_services_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListDelegatedServicesForAccount" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_delegated_services_for_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_delegated_services_for_account_request) =
    let input = Json_serializers.list_delegated_services_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListDelegatedServicesForAccount" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_delegated_services_for_account_response_of_yojson
      ~error_deserializer
end

module ListEffectivePolicyValidationErrors = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `EffectivePolicyNotFoundException _ ->
        "com.amazonaws.organizations#EffectivePolicyNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "EffectivePolicyNotFoundException" ->
          `EffectivePolicyNotFoundException
            (Json_deserializers.effective_policy_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_effective_policy_validation_errors_request) =
    let input =
      Json_serializers.list_effective_policy_validation_errors_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListEffectivePolicyValidationErrors" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_effective_policy_validation_errors_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_effective_policy_validation_errors_request) =
    let input =
      Json_serializers.list_effective_policy_validation_errors_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListEffectivePolicyValidationErrors" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_effective_policy_validation_errors_response_of_yojson
      ~error_deserializer
end

module ListHandshakesForAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_handshakes_for_account_request) =
    let input = Json_serializers.list_handshakes_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListHandshakesForAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_handshakes_for_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_handshakes_for_account_request) =
    let input = Json_serializers.list_handshakes_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListHandshakesForAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_handshakes_for_account_response_of_yojson
      ~error_deserializer
end

module ListHandshakesForOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_handshakes_for_organization_request) =
    let input = Json_serializers.list_handshakes_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListHandshakesForOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_handshakes_for_organization_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_handshakes_for_organization_request) =
    let input = Json_serializers.list_handshakes_for_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListHandshakesForOrganization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_handshakes_for_organization_response_of_yojson
      ~error_deserializer
end

module ListInboundResponsibilityTransfers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ResponsibilityTransferNotFoundException _ ->
        "com.amazonaws.organizations#ResponsibilityTransferNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResponsibilityTransferNotFoundException" ->
          `ResponsibilityTransferNotFoundException
            (Json_deserializers.responsibility_transfer_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_inbound_responsibility_transfers_request) =
    let input = Json_serializers.list_inbound_responsibility_transfers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListInboundResponsibilityTransfers" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_inbound_responsibility_transfers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_inbound_responsibility_transfers_request) =
    let input = Json_serializers.list_inbound_responsibility_transfers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListInboundResponsibilityTransfers" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_inbound_responsibility_transfers_response_of_yojson
      ~error_deserializer
end

module ListOrganizationalUnitsForParent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ParentNotFoundException _ -> "com.amazonaws.organizations#ParentNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ParentNotFoundException" ->
          `ParentNotFoundException
            (Json_deserializers.parent_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_organizational_units_for_parent_request) =
    let input = Json_serializers.list_organizational_units_for_parent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListOrganizationalUnitsForParent" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_organizational_units_for_parent_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_organizational_units_for_parent_request) =
    let input = Json_serializers.list_organizational_units_for_parent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListOrganizationalUnitsForParent" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_organizational_units_for_parent_response_of_yojson
      ~error_deserializer
end

module ListOutboundResponsibilityTransfers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_outbound_responsibility_transfers_request) =
    let input = Json_serializers.list_outbound_responsibility_transfers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListOutboundResponsibilityTransfers" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_outbound_responsibility_transfers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_outbound_responsibility_transfers_request) =
    let input = Json_serializers.list_outbound_responsibility_transfers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListOutboundResponsibilityTransfers" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_outbound_responsibility_transfers_response_of_yojson
      ~error_deserializer
end

module ListParents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ChildNotFoundException _ -> "com.amazonaws.organizations#ChildNotFoundException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ChildNotFoundException" ->
          `ChildNotFoundException (Json_deserializers.child_not_found_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_parents_request) =
    let input = Json_serializers.list_parents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListParents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_parents_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_parents_request) =
    let input = Json_serializers.list_parents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListParents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_parents_response_of_yojson ~error_deserializer
end

module ListPolicies = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_policies_request) =
    let input = Json_serializers.list_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListPolicies"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policies_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_policies_request) =
    let input = Json_serializers.list_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policies_response_of_yojson ~error_deserializer
end

module ListPoliciesForTarget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_policies_for_target_request) =
    let input = Json_serializers.list_policies_for_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.ListPoliciesForTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policies_for_target_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_policies_for_target_request) =
    let input = Json_serializers.list_policies_for_target_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListPoliciesForTarget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_policies_for_target_response_of_yojson
      ~error_deserializer
end

module ListRoots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_roots_request) =
    let input = Json_serializers.list_roots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListRoots" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_roots_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_roots_request) =
    let input = Json_serializers.list_roots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListRoots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_roots_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTargetsForPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_targets_for_policy_request) =
    let input = Json_serializers.list_targets_for_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.ListTargetsForPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_targets_for_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_targets_for_policy_request) =
    let input = Json_serializers.list_targets_for_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.ListTargetsForPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_targets_for_policy_response_of_yojson
      ~error_deserializer
end

module MoveAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `DestinationParentNotFoundException _ ->
        "com.amazonaws.organizations#DestinationParentNotFoundException"
    | `DuplicateAccountException _ -> "com.amazonaws.organizations#DuplicateAccountException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `SourceParentNotFoundException _ ->
        "com.amazonaws.organizations#SourceParentNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "DestinationParentNotFoundException" ->
          `DestinationParentNotFoundException
            (Json_deserializers.destination_parent_not_found_exception_of_yojson tree path)
      | _, "DuplicateAccountException" ->
          `DuplicateAccountException
            (Json_deserializers.duplicate_account_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "SourceParentNotFoundException" ->
          `SourceParentNotFoundException
            (Json_deserializers.source_parent_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : move_account_request) =
    let input = Json_serializers.move_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.MoveAccount" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : move_account_request) =
    let input = Json_serializers.move_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.MoveAccount" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.PutResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_response_of_yojson
      ~error_deserializer
end

module RegisterDelegatedAdministrator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountAlreadyRegisteredException _ ->
        "com.amazonaws.organizations#AccountAlreadyRegisteredException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountAlreadyRegisteredException" ->
          `AccountAlreadyRegisteredException
            (Json_deserializers.account_already_registered_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_delegated_administrator_request) =
    let input = Json_serializers.register_delegated_administrator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.RegisterDelegatedAdministrator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_delegated_administrator_request) =
    let input = Json_serializers.register_delegated_administrator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.RegisterDelegatedAdministrator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveAccountFromOrganization = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AccountNotFoundException _ -> "com.amazonaws.organizations#AccountNotFoundException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `MasterCannotLeaveOrganizationException _ ->
        "com.amazonaws.organizations#MasterCannotLeaveOrganizationException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AccountNotFoundException" ->
          `AccountNotFoundException
            (Json_deserializers.account_not_found_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MasterCannotLeaveOrganizationException" ->
          `MasterCannotLeaveOrganizationException
            (Json_deserializers.master_cannot_leave_organization_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_account_from_organization_request) =
    let input = Json_serializers.remove_account_from_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.RemoveAccountFromOrganization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_account_from_organization_request) =
    let input = Json_serializers.remove_account_from_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.RemoveAccountFromOrganization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.TagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TerminateResponsibilityTransfer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `InvalidResponsibilityTransferTransitionException _ ->
        "com.amazonaws.organizations#InvalidResponsibilityTransferTransitionException"
    | `ResponsibilityTransferAlreadyInStatusException _ ->
        "com.amazonaws.organizations#ResponsibilityTransferAlreadyInStatusException"
    | `ResponsibilityTransferNotFoundException _ ->
        "com.amazonaws.organizations#ResponsibilityTransferNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "InvalidResponsibilityTransferTransitionException" ->
          `InvalidResponsibilityTransferTransitionException
            (Json_deserializers.invalid_responsibility_transfer_transition_exception_of_yojson tree
               path)
      | _, "ResponsibilityTransferAlreadyInStatusException" ->
          `ResponsibilityTransferAlreadyInStatusException
            (Json_deserializers.responsibility_transfer_already_in_status_exception_of_yojson tree
               path)
      | _, "ResponsibilityTransferNotFoundException" ->
          `ResponsibilityTransferNotFoundException
            (Json_deserializers.responsibility_transfer_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_responsibility_transfer_request) =
    let input = Json_serializers.terminate_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.TerminateResponsibilityTransfer" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.terminate_responsibility_transfer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_responsibility_transfer_request) =
    let input = Json_serializers.terminate_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.TerminateResponsibilityTransfer" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.terminate_responsibility_transfer_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TargetNotFoundException _ -> "com.amazonaws.organizations#TargetNotFoundException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TargetNotFoundException" ->
          `TargetNotFoundException
            (Json_deserializers.target_not_found_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.UntagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateOrganizationalUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `DuplicateOrganizationalUnitException _ ->
        "com.amazonaws.organizations#DuplicateOrganizationalUnitException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `OrganizationalUnitNotFoundException _ ->
        "com.amazonaws.organizations#OrganizationalUnitNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "DuplicateOrganizationalUnitException" ->
          `DuplicateOrganizationalUnitException
            (Json_deserializers.duplicate_organizational_unit_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "OrganizationalUnitNotFoundException" ->
          `OrganizationalUnitNotFoundException
            (Json_deserializers.organizational_unit_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_organizational_unit_request) =
    let input = Json_serializers.update_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.UpdateOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_organizational_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_organizational_unit_request) =
    let input = Json_serializers.update_organizational_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.UpdateOrganizationalUnit" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_organizational_unit_response_of_yojson
      ~error_deserializer
end

module UpdatePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConcurrentModificationException _ ->
        "com.amazonaws.organizations#ConcurrentModificationException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `DuplicatePolicyException _ -> "com.amazonaws.organizations#DuplicatePolicyException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `MalformedPolicyDocumentException _ ->
        "com.amazonaws.organizations#MalformedPolicyDocumentException"
    | `PolicyChangesInProgressException _ ->
        "com.amazonaws.organizations#PolicyChangesInProgressException"
    | `PolicyNotFoundException _ -> "com.amazonaws.organizations#PolicyNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConcurrentModificationException" ->
          `ConcurrentModificationException
            (Json_deserializers.concurrent_modification_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "DuplicatePolicyException" ->
          `DuplicatePolicyException
            (Json_deserializers.duplicate_policy_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "MalformedPolicyDocumentException" ->
          `MalformedPolicyDocumentException
            (Json_deserializers.malformed_policy_document_exception_of_yojson tree path)
      | _, "PolicyChangesInProgressException" ->
          `PolicyChangesInProgressException
            (Json_deserializers.policy_changes_in_progress_exception_of_yojson tree path)
      | _, "PolicyNotFoundException" ->
          `PolicyNotFoundException
            (Json_deserializers.policy_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_policy_request) =
    let input = Json_serializers.update_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSOrganizationsV20161128.UpdatePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_policy_request) =
    let input = Json_serializers.update_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.UpdatePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_policy_response_of_yojson ~error_deserializer
end

module UpdateResponsibilityTransfer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.organizations#AccessDeniedException"
    | `AWSOrganizationsNotInUseException _ ->
        "com.amazonaws.organizations#AWSOrganizationsNotInUseException"
    | `ConstraintViolationException _ -> "com.amazonaws.organizations#ConstraintViolationException"
    | `InvalidInputException _ -> "com.amazonaws.organizations#InvalidInputException"
    | `ResponsibilityTransferNotFoundException _ ->
        "com.amazonaws.organizations#ResponsibilityTransferNotFoundException"
    | `ServiceException _ -> "com.amazonaws.organizations#ServiceException"
    | `TooManyRequestsException _ -> "com.amazonaws.organizations#TooManyRequestsException"
    | `UnsupportedAPIEndpointException _ ->
        "com.amazonaws.organizations#UnsupportedAPIEndpointException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AWSOrganizationsNotInUseException" ->
          `AWSOrganizationsNotInUseException
            (Json_deserializers.aws_organizations_not_in_use_exception_of_yojson tree path)
      | _, "ConstraintViolationException" ->
          `ConstraintViolationException
            (Json_deserializers.constraint_violation_exception_of_yojson tree path)
      | _, "InvalidInputException" ->
          `InvalidInputException (Json_deserializers.invalid_input_exception_of_yojson tree path)
      | _, "ResponsibilityTransferNotFoundException" ->
          `ResponsibilityTransferNotFoundException
            (Json_deserializers.responsibility_transfer_not_found_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TooManyRequestsException" ->
          `TooManyRequestsException
            (Json_deserializers.too_many_requests_exception_of_yojson tree path)
      | _, "UnsupportedAPIEndpointException" ->
          `UnsupportedAPIEndpointException
            (Json_deserializers.unsupported_api_endpoint_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_responsibility_transfer_request) =
    let input = Json_serializers.update_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSOrganizationsV20161128.UpdateResponsibilityTransfer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_responsibility_transfer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_responsibility_transfer_request) =
    let input = Json_serializers.update_responsibility_transfer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSOrganizationsV20161128.UpdateResponsibilityTransfer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_responsibility_transfer_response_of_yojson
      ~error_deserializer
end
