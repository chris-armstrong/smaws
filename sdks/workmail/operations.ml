open Types
open Service_metadata

module AssociateDelegateToResource = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_delegate_to_resource_request) =
    let input = Json_serializers.associate_delegate_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.AssociateDelegateToResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_delegate_to_resource_response_of_yojson
      ~error_deserializer
end

module AssociateMemberToGroup = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_member_to_group_request) =
    let input = Json_serializers.associate_member_to_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.AssociateMemberToGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_member_to_group_response_of_yojson
      ~error_deserializer
end

module AssumeImpersonationRole = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : assume_impersonation_role_request) =
    let input = Json_serializers.assume_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.AssumeImpersonationRole"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.assume_impersonation_role_response_of_yojson
      ~error_deserializer
end

module CancelMailboxExportJob = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_mailbox_export_job_request) =
    let input = Json_serializers.cancel_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CancelMailboxExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_mailbox_export_job_response_of_yojson
      ~error_deserializer
end

module CreateAlias = struct
  let error_to_string = function
    | `EmailAddressInUseException _ -> "com.amazonaws.workmail#EmailAddressInUseException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `MailDomainStateException _ -> "com.amazonaws.workmail#MailDomainStateException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EmailAddressInUseException" ->
          `EmailAddressInUseException
            (Json_deserializers.email_address_in_use_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "MailDomainStateException" ->
          `MailDomainStateException
            (Json_deserializers.mail_domain_state_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_alias_request) =
    let input = Json_serializers.create_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateAlias" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_alias_response_of_yojson
      ~error_deserializer
end

module CreateAvailabilityConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_availability_configuration_request) =
    let input = Json_serializers.create_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.CreateAvailabilityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_availability_configuration_response_of_yojson
      ~error_deserializer
end

module CreateGroup = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ReservedNameException _ -> "com.amazonaws.workmail#ReservedNameException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ReservedNameException" ->
          `ReservedNameException (Json_deserializers.reserved_name_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_group_request) =
    let input = Json_serializers.create_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_group_response_of_yojson
      ~error_deserializer
end

module CreateIdentityCenterApplication = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_identity_center_application_request) =
    let input = Json_serializers.create_identity_center_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.CreateIdentityCenterApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_identity_center_application_response_of_yojson
      ~error_deserializer
end

module CreateImpersonationRole = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_impersonation_role_request) =
    let input = Json_serializers.create_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateImpersonationRole"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_impersonation_role_response_of_yojson
      ~error_deserializer
end

module CreateMobileDeviceAccessRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_mobile_device_access_rule_request) =
    let input = Json_serializers.create_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateMobileDeviceAccessRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
end

module CreateOrganization = struct
  let error_to_string = function
    | `DirectoryInUseException _ -> "com.amazonaws.workmail#DirectoryInUseException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryInUseException" ->
          `DirectoryInUseException
            (Json_deserializers.directory_in_use_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_organization_request) =
    let input = Json_serializers.create_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateOrganization" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_organization_response_of_yojson
      ~error_deserializer
end

module CreateResource = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ReservedNameException _ -> "com.amazonaws.workmail#ReservedNameException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ReservedNameException" ->
          `ReservedNameException (Json_deserializers.reserved_name_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resource_request) =
    let input = Json_serializers.create_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_resource_response_of_yojson
      ~error_deserializer
end

module CreateUser = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `InvalidPasswordException _ -> "com.amazonaws.workmail#InvalidPasswordException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ReservedNameException _ -> "com.amazonaws.workmail#ReservedNameException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ReservedNameException" ->
          `ReservedNameException (Json_deserializers.reserved_name_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_user_request) =
    let input = Json_serializers.create_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.CreateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_user_response_of_yojson
      ~error_deserializer
end

module DeleteAccessControlRule = struct
  let error_to_string = function
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_access_control_rule_request) =
    let input = Json_serializers.delete_access_control_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteAccessControlRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_access_control_rule_response_of_yojson
      ~error_deserializer
end

module DeleteAlias = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_alias_request) =
    let input = Json_serializers.delete_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteAlias" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_alias_response_of_yojson
      ~error_deserializer
end

module DeleteAvailabilityConfiguration = struct
  let error_to_string = function
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_availability_configuration_request) =
    let input = Json_serializers.delete_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DeleteAvailabilityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_availability_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteEmailMonitoringConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_email_monitoring_configuration_request) =
    let input = Json_serializers.delete_email_monitoring_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DeleteEmailMonitoringConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteGroup = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_group_request) =
    let input = Json_serializers.delete_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_group_response_of_yojson
      ~error_deserializer
end

module DeleteIdentityCenterApplication = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_identity_center_application_request) =
    let input = Json_serializers.delete_identity_center_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DeleteIdentityCenterApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_identity_center_application_response_of_yojson
      ~error_deserializer
end

module DeleteIdentityProviderConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_identity_provider_configuration_request) =
    let input = Json_serializers.delete_identity_provider_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DeleteIdentityProviderConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_identity_provider_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteImpersonationRole = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_impersonation_role_request) =
    let input = Json_serializers.delete_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteImpersonationRole"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_impersonation_role_response_of_yojson
      ~error_deserializer
end

module DeleteMailboxPermissions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_mailbox_permissions_request) =
    let input = Json_serializers.delete_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteMailboxPermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_mailbox_permissions_response_of_yojson
      ~error_deserializer
end

module DeleteMobileDeviceAccessOverride = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_mobile_device_access_override_request) =
    let input = Json_serializers.delete_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DeleteMobileDeviceAccessOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_mobile_device_access_override_response_of_yojson
      ~error_deserializer
end

module DeleteMobileDeviceAccessRule = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_mobile_device_access_rule_request) =
    let input = Json_serializers.delete_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteMobileDeviceAccessRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
end

module DeleteOrganization = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_organization_request) =
    let input = Json_serializers.delete_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteOrganization" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_organization_response_of_yojson
      ~error_deserializer
end

module DeletePersonalAccessToken = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_personal_access_token_request) =
    let input = Json_serializers.delete_personal_access_token_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeletePersonalAccessToken"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_personal_access_token_response_of_yojson
      ~error_deserializer
end

module DeleteResource = struct
  let error_to_string = function
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_request) =
    let input = Json_serializers.delete_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_resource_response_of_yojson
      ~error_deserializer
end

module DeleteRetentionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_retention_policy_request) =
    let input = Json_serializers.delete_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteRetentionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_retention_policy_response_of_yojson
      ~error_deserializer
end

module DeleteUser = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_user_request) =
    let input = Json_serializers.delete_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeleteUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_user_response_of_yojson
      ~error_deserializer
end

module DeregisterFromWorkMail = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_from_work_mail_request) =
    let input = Json_serializers.deregister_from_work_mail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeregisterFromWorkMail"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_from_work_mail_response_of_yojson
      ~error_deserializer
end

module DeregisterMailDomain = struct
  let error_to_string = function
    | `InvalidCustomSesConfigurationException _ ->
        "com.amazonaws.workmail#InvalidCustomSesConfigurationException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainInUseException _ -> "com.amazonaws.workmail#MailDomainInUseException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidCustomSesConfigurationException" ->
          `InvalidCustomSesConfigurationException
            (Json_deserializers.invalid_custom_ses_configuration_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainInUseException" ->
          `MailDomainInUseException
            (Json_deserializers.mail_domain_in_use_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_mail_domain_request) =
    let input = Json_serializers.deregister_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DeregisterMailDomain" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.deregister_mail_domain_response_of_yojson
      ~error_deserializer
end

module DescribeEmailMonitoringConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_email_monitoring_configuration_request) =
    let input =
      Json_serializers.describe_email_monitoring_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DescribeEmailMonitoringConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeEntity = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_entity_request) =
    let input = Json_serializers.describe_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeEntity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_entity_response_of_yojson
      ~error_deserializer
end

module DescribeGroup = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_group_request) =
    let input = Json_serializers.describe_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_group_response_of_yojson
      ~error_deserializer
end

module DescribeIdentityProviderConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_identity_provider_configuration_request) =
    let input =
      Json_serializers.describe_identity_provider_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DescribeIdentityProviderConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_identity_provider_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeInboundDmarcSettings = struct
  let error_to_string = function
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_inbound_dmarc_settings_request) =
    let input = Json_serializers.describe_inbound_dmarc_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeInboundDmarcSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_inbound_dmarc_settings_response_of_yojson
      ~error_deserializer
end

module DescribeMailboxExportJob = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_mailbox_export_job_request) =
    let input = Json_serializers.describe_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeMailboxExportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_mailbox_export_job_response_of_yojson
      ~error_deserializer
end

module DescribeOrganization = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organization_request) =
    let input = Json_serializers.describe_organization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeOrganization" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_organization_response_of_yojson
      ~error_deserializer
end

module DescribeResource = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_resource_request) =
    let input = Json_serializers.describe_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_resource_response_of_yojson
      ~error_deserializer
end

module DescribeUser = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_user_request) =
    let input = Json_serializers.describe_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DescribeUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_user_response_of_yojson
      ~error_deserializer
end

module DisassociateDelegateFromResource = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_delegate_from_resource_request) =
    let input = Json_serializers.disassociate_delegate_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.DisassociateDelegateFromResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_delegate_from_resource_response_of_yojson
      ~error_deserializer
end

module DisassociateMemberFromGroup = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_member_from_group_request) =
    let input = Json_serializers.disassociate_member_from_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.DisassociateMemberFromGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_member_from_group_response_of_yojson
      ~error_deserializer
end

module GetAccessControlEffect = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_access_control_effect_request) =
    let input = Json_serializers.get_access_control_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetAccessControlEffect"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_access_control_effect_response_of_yojson
      ~error_deserializer
end

module GetDefaultRetentionPolicy = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_default_retention_policy_request) =
    let input = Json_serializers.get_default_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetDefaultRetentionPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_default_retention_policy_response_of_yojson
      ~error_deserializer
end

module GetImpersonationRole = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_impersonation_role_request) =
    let input = Json_serializers.get_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetImpersonationRole" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_impersonation_role_response_of_yojson
      ~error_deserializer
end

module GetImpersonationRoleEffect = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_impersonation_role_effect_request) =
    let input = Json_serializers.get_impersonation_role_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetImpersonationRoleEffect"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_impersonation_role_effect_response_of_yojson
      ~error_deserializer
end

module GetMailboxDetails = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mailbox_details_request) =
    let input = Json_serializers.get_mailbox_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetMailboxDetails" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_mailbox_details_response_of_yojson
      ~error_deserializer
end

module GetMailDomain = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mail_domain_request) =
    let input = Json_serializers.get_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetMailDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_mail_domain_response_of_yojson
      ~error_deserializer
end

module GetMobileDeviceAccessEffect = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mobile_device_access_effect_request) =
    let input = Json_serializers.get_mobile_device_access_effect_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetMobileDeviceAccessEffect"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_mobile_device_access_effect_response_of_yojson
      ~error_deserializer
end

module GetMobileDeviceAccessOverride = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mobile_device_access_override_request) =
    let input = Json_serializers.get_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetMobileDeviceAccessOverride"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_mobile_device_access_override_response_of_yojson
      ~error_deserializer
end

module GetPersonalAccessTokenMetadata = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_personal_access_token_metadata_request) =
    let input = Json_serializers.get_personal_access_token_metadata_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.GetPersonalAccessTokenMetadata"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_personal_access_token_metadata_response_of_yojson
      ~error_deserializer
end

module ListAccessControlRules = struct
  let error_to_string = function
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_access_control_rules_request) =
    let input = Json_serializers.list_access_control_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListAccessControlRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_access_control_rules_response_of_yojson
      ~error_deserializer
end

module ListAliases = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aliases_request) =
    let input = Json_serializers.list_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListAliases" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_aliases_response_of_yojson
      ~error_deserializer
end

module ListAvailabilityConfigurations = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_availability_configurations_request) =
    let input = Json_serializers.list_availability_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListAvailabilityConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_availability_configurations_response_of_yojson
      ~error_deserializer
end

module ListGroupMembers = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_group_members_request) =
    let input = Json_serializers.list_group_members_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListGroupMembers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_group_members_response_of_yojson
      ~error_deserializer
end

module ListGroups = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_groups_request) =
    let input = Json_serializers.list_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListGroups" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_groups_response_of_yojson
      ~error_deserializer
end

module ListGroupsForEntity = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_groups_for_entity_request) =
    let input = Json_serializers.list_groups_for_entity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListGroupsForEntity" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_groups_for_entity_response_of_yojson
      ~error_deserializer
end

module ListImpersonationRoles = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_impersonation_roles_request) =
    let input = Json_serializers.list_impersonation_roles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListImpersonationRoles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_impersonation_roles_response_of_yojson
      ~error_deserializer
end

module ListMailboxExportJobs = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mailbox_export_jobs_request) =
    let input = Json_serializers.list_mailbox_export_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListMailboxExportJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_mailbox_export_jobs_response_of_yojson
      ~error_deserializer
end

module ListMailboxPermissions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mailbox_permissions_request) =
    let input = Json_serializers.list_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListMailboxPermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_mailbox_permissions_response_of_yojson
      ~error_deserializer
end

module ListMailDomains = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mail_domains_request) =
    let input = Json_serializers.list_mail_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListMailDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_mail_domains_response_of_yojson
      ~error_deserializer
end

module ListMobileDeviceAccessOverrides = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mobile_device_access_overrides_request) =
    let input = Json_serializers.list_mobile_device_access_overrides_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.ListMobileDeviceAccessOverrides" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_mobile_device_access_overrides_response_of_yojson
      ~error_deserializer
end

module ListMobileDeviceAccessRules = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mobile_device_access_rules_request) =
    let input = Json_serializers.list_mobile_device_access_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListMobileDeviceAccessRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_mobile_device_access_rules_response_of_yojson
      ~error_deserializer
end

module ListOrganizations = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_organizations_request) =
    let input = Json_serializers.list_organizations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListOrganizations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_organizations_response_of_yojson
      ~error_deserializer
end

module ListPersonalAccessTokens = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_personal_access_tokens_request) =
    let input = Json_serializers.list_personal_access_tokens_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListPersonalAccessTokens"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_personal_access_tokens_response_of_yojson
      ~error_deserializer
end

module ListResourceDelegates = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_delegates_request) =
    let input = Json_serializers.list_resource_delegates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListResourceDelegates" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_delegates_response_of_yojson
      ~error_deserializer
end

module ListResources = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_request) =
    let input = Json_serializers.list_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListResources" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_resources_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListUsers = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_users_request) =
    let input = Json_serializers.list_users_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ListUsers" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_users_response_of_yojson
      ~error_deserializer
end

module PutAccessControlRule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_access_control_rule_request) =
    let input = Json_serializers.put_access_control_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.PutAccessControlRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_access_control_rule_response_of_yojson
      ~error_deserializer
end

module PutEmailMonitoringConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_email_monitoring_configuration_request) =
    let input = Json_serializers.put_email_monitoring_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.PutEmailMonitoringConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_email_monitoring_configuration_response_of_yojson
      ~error_deserializer
end

module PutIdentityProviderConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_identity_provider_configuration_request) =
    let input = Json_serializers.put_identity_provider_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.PutIdentityProviderConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_identity_provider_configuration_response_of_yojson
      ~error_deserializer
end

module PutInboundDmarcSettings = struct
  let error_to_string = function
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_inbound_dmarc_settings_request) =
    let input = Json_serializers.put_inbound_dmarc_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.PutInboundDmarcSettings"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_inbound_dmarc_settings_response_of_yojson
      ~error_deserializer
end

module PutMailboxPermissions = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_mailbox_permissions_request) =
    let input = Json_serializers.put_mailbox_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.PutMailboxPermissions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_mailbox_permissions_response_of_yojson
      ~error_deserializer
end

module PutMobileDeviceAccessOverride = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_mobile_device_access_override_request) =
    let input = Json_serializers.put_mobile_device_access_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.PutMobileDeviceAccessOverride"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_mobile_device_access_override_response_of_yojson
      ~error_deserializer
end

module PutRetentionPolicy = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_retention_policy_request) =
    let input = Json_serializers.put_retention_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.PutRetentionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_retention_policy_response_of_yojson
      ~error_deserializer
end

module RegisterMailDomain = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `MailDomainInUseException _ -> "com.amazonaws.workmail#MailDomainInUseException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "MailDomainInUseException" ->
          `MailDomainInUseException
            (Json_deserializers.mail_domain_in_use_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_mail_domain_request) =
    let input = Json_serializers.register_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.RegisterMailDomain" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_mail_domain_response_of_yojson
      ~error_deserializer
end

module RegisterToWorkMail = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EmailAddressInUseException _ -> "com.amazonaws.workmail#EmailAddressInUseException"
    | `EntityAlreadyRegisteredException _ ->
        "com.amazonaws.workmail#EntityAlreadyRegisteredException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `MailDomainStateException _ -> "com.amazonaws.workmail#MailDomainStateException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EmailAddressInUseException" ->
          `EmailAddressInUseException
            (Json_deserializers.email_address_in_use_exception_of_yojson tree path)
      | _, "EntityAlreadyRegisteredException" ->
          `EntityAlreadyRegisteredException
            (Json_deserializers.entity_already_registered_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "MailDomainStateException" ->
          `MailDomainStateException
            (Json_deserializers.mail_domain_state_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_to_work_mail_request) =
    let input = Json_serializers.register_to_work_mail_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.RegisterToWorkMail" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.register_to_work_mail_response_of_yojson
      ~error_deserializer
end

module ResetPassword = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `InvalidPasswordException _ -> "com.amazonaws.workmail#InvalidPasswordException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_password_request) =
    let input = Json_serializers.reset_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.ResetPassword" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reset_password_response_of_yojson
      ~error_deserializer
end

module StartMailboxExportJob = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_mailbox_export_job_request) =
    let input = Json_serializers.start_mailbox_export_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.StartMailboxExportJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_mailbox_export_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.workmail#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module TestAvailabilityConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : test_availability_configuration_request) =
    let input = Json_serializers.test_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.TestAvailabilityConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_availability_configuration_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateAvailabilityConfiguration = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_availability_configuration_request) =
    let input = Json_serializers.update_availability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkMailService.UpdateAvailabilityConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_availability_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateDefaultMailDomain = struct
  let error_to_string = function
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `MailDomainStateException _ -> "com.amazonaws.workmail#MailDomainStateException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "MailDomainStateException" ->
          `MailDomainStateException
            (Json_deserializers.mail_domain_state_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_default_mail_domain_request) =
    let input = Json_serializers.update_default_mail_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateDefaultMailDomain"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_default_mail_domain_response_of_yojson
      ~error_deserializer
end

module UpdateGroup = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_group_request) =
    let input = Json_serializers.update_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_group_response_of_yojson
      ~error_deserializer
end

module UpdateImpersonationRole = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `LimitExceededException _ -> "com.amazonaws.workmail#LimitExceededException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workmail#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_impersonation_role_request) =
    let input = Json_serializers.update_impersonation_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateImpersonationRole"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_impersonation_role_response_of_yojson
      ~error_deserializer
end

module UpdateMailboxQuota = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_mailbox_quota_request) =
    let input = Json_serializers.update_mailbox_quota_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateMailboxQuota" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_mailbox_quota_response_of_yojson
      ~error_deserializer
end

module UpdateMobileDeviceAccessRule = struct
  let error_to_string = function
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_mobile_device_access_rule_request) =
    let input = Json_serializers.update_mobile_device_access_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateMobileDeviceAccessRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_mobile_device_access_rule_response_of_yojson
      ~error_deserializer
end

module UpdatePrimaryEmailAddress = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EmailAddressInUseException _ -> "com.amazonaws.workmail#EmailAddressInUseException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `MailDomainStateException _ -> "com.amazonaws.workmail#MailDomainStateException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EmailAddressInUseException" ->
          `EmailAddressInUseException
            (Json_deserializers.email_address_in_use_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "MailDomainStateException" ->
          `MailDomainStateException
            (Json_deserializers.mail_domain_state_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_primary_email_address_request) =
    let input = Json_serializers.update_primary_email_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdatePrimaryEmailAddress"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_primary_email_address_response_of_yojson
      ~error_deserializer
end

module UpdateResource = struct
  let error_to_string = function
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EmailAddressInUseException _ -> "com.amazonaws.workmail#EmailAddressInUseException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidConfigurationException _ -> "com.amazonaws.workmail#InvalidConfigurationException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `MailDomainNotFoundException _ -> "com.amazonaws.workmail#MailDomainNotFoundException"
    | `MailDomainStateException _ -> "com.amazonaws.workmail#MailDomainStateException"
    | `NameAvailabilityException _ -> "com.amazonaws.workmail#NameAvailabilityException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EmailAddressInUseException" ->
          `EmailAddressInUseException
            (Json_deserializers.email_address_in_use_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidConfigurationException" ->
          `InvalidConfigurationException
            (Json_deserializers.invalid_configuration_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "MailDomainNotFoundException" ->
          `MailDomainNotFoundException
            (Json_deserializers.mail_domain_not_found_exception_of_yojson tree path)
      | _, "MailDomainStateException" ->
          `MailDomainStateException
            (Json_deserializers.mail_domain_state_exception_of_yojson tree path)
      | _, "NameAvailabilityException" ->
          `NameAvailabilityException
            (Json_deserializers.name_availability_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resource_request) =
    let input = Json_serializers.update_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_resource_response_of_yojson
      ~error_deserializer
end

module UpdateUser = struct
  let error_to_string = function
    | `DirectoryServiceAuthenticationFailedException _ ->
        "com.amazonaws.workmail#DirectoryServiceAuthenticationFailedException"
    | `DirectoryUnavailableException _ -> "com.amazonaws.workmail#DirectoryUnavailableException"
    | `EntityNotFoundException _ -> "com.amazonaws.workmail#EntityNotFoundException"
    | `EntityStateException _ -> "com.amazonaws.workmail#EntityStateException"
    | `InvalidParameterException _ -> "com.amazonaws.workmail#InvalidParameterException"
    | `OrganizationNotFoundException _ -> "com.amazonaws.workmail#OrganizationNotFoundException"
    | `OrganizationStateException _ -> "com.amazonaws.workmail#OrganizationStateException"
    | `UnsupportedOperationException _ -> "com.amazonaws.workmail#UnsupportedOperationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DirectoryServiceAuthenticationFailedException" ->
          `DirectoryServiceAuthenticationFailedException
            (Json_deserializers.directory_service_authentication_failed_exception_of_yojson tree
               path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityNotFoundException" ->
          `EntityNotFoundException
            (Json_deserializers.entity_not_found_exception_of_yojson tree path)
      | _, "EntityStateException" ->
          `EntityStateException (Json_deserializers.entity_state_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OrganizationNotFoundException" ->
          `OrganizationNotFoundException
            (Json_deserializers.organization_not_found_exception_of_yojson tree path)
      | _, "OrganizationStateException" ->
          `OrganizationStateException
            (Json_deserializers.organization_state_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_user_request) =
    let input = Json_serializers.update_user_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkMailService.UpdateUser" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_user_response_of_yojson
      ~error_deserializer
end
