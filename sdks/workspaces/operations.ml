open Types
open Service_metadata

module AcceptAccountLinkInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_account_link_invitation_request) =
    let input = Json_serializers.accept_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.AcceptAccountLinkInvitation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_account_link_invitation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_account_link_invitation_request) =
    let input = Json_serializers.accept_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.AcceptAccountLinkInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_account_link_invitation_result_of_yojson
      ~error_deserializer
end

module AssociateConnectionAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_connection_alias_request) =
    let input = Json_serializers.associate_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.AssociateConnectionAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_connection_alias_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_connection_alias_request) =
    let input = Json_serializers.associate_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.AssociateConnectionAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_connection_alias_result_of_yojson
      ~error_deserializer
end

module AssociateIpGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_ip_groups_request) =
    let input = Json_serializers.associate_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.AssociateIpGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.associate_ip_groups_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_ip_groups_request) =
    let input = Json_serializers.associate_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.AssociateIpGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_ip_groups_result_of_yojson
      ~error_deserializer
end

module AssociateWorkspaceApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ApplicationNotSupportedException _ ->
        "com.amazonaws.workspaces#ApplicationNotSupportedException"
    | `ComputeNotCompatibleException _ -> "com.amazonaws.workspaces#ComputeNotCompatibleException"
    | `IncompatibleApplicationsException _ ->
        "com.amazonaws.workspaces#IncompatibleApplicationsException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperatingSystemNotCompatibleException _ ->
        "com.amazonaws.workspaces#OperatingSystemNotCompatibleException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceInUseException _ -> "com.amazonaws.workspaces#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ApplicationNotSupportedException" ->
          `ApplicationNotSupportedException
            (Json_deserializers.application_not_supported_exception_of_yojson tree path)
      | _, "ComputeNotCompatibleException" ->
          `ComputeNotCompatibleException
            (Json_deserializers.compute_not_compatible_exception_of_yojson tree path)
      | _, "IncompatibleApplicationsException" ->
          `IncompatibleApplicationsException
            (Json_deserializers.incompatible_applications_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperatingSystemNotCompatibleException" ->
          `OperatingSystemNotCompatibleException
            (Json_deserializers.operating_system_not_compatible_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_workspace_application_request) =
    let input = Json_serializers.associate_workspace_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.AssociateWorkspaceApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_workspace_application_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_workspace_application_request) =
    let input = Json_serializers.associate_workspace_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.AssociateWorkspaceApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_workspace_application_result_of_yojson
      ~error_deserializer
end

module AuthorizeIpRules = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : authorize_ip_rules_request) =
    let input = Json_serializers.authorize_ip_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.AuthorizeIpRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.authorize_ip_rules_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : authorize_ip_rules_request) =
    let input = Json_serializers.authorize_ip_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.AuthorizeIpRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.authorize_ip_rules_result_of_yojson
      ~error_deserializer
end

module CopyWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : copy_workspace_image_request) =
    let input = Json_serializers.copy_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CopyWorkspaceImage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.copy_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : copy_workspace_image_request) =
    let input = Json_serializers.copy_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CopyWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.copy_workspace_image_result_of_yojson
      ~error_deserializer
end

module CreateAccountLinkInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_account_link_invitation_request) =
    let input = Json_serializers.create_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateAccountLinkInvitation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_link_invitation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_account_link_invitation_request) =
    let input = Json_serializers.create_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateAccountLinkInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_link_invitation_result_of_yojson
      ~error_deserializer
end

module CreateConnectClientAddIn = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceCreationFailedException _ ->
        "com.amazonaws.workspaces#ResourceCreationFailedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceCreationFailedException" ->
          `ResourceCreationFailedException
            (Json_deserializers.resource_creation_failed_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connect_client_add_in_request) =
    let input = Json_serializers.create_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateConnectClientAddIn"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connect_client_add_in_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connect_client_add_in_request) =
    let input = Json_serializers.create_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateConnectClientAddIn" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connect_client_add_in_result_of_yojson
      ~error_deserializer
end

module CreateConnectionAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_alias_request) =
    let input = Json_serializers.create_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateConnectionAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_alias_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_connection_alias_request) =
    let input = Json_serializers.create_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateConnectionAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_connection_alias_result_of_yojson
      ~error_deserializer
end

module CreateIpGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceCreationFailedException _ ->
        "com.amazonaws.workspaces#ResourceCreationFailedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceCreationFailedException" ->
          `ResourceCreationFailedException
            (Json_deserializers.resource_creation_failed_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ip_group_request) =
    let input = Json_serializers.create_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateIpGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_ip_group_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ip_group_request) =
    let input = Json_serializers.create_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.CreateIpGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ip_group_result_of_yojson ~error_deserializer
end

module CreateStandbyWorkspaces = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_standby_workspaces_request) =
    let input = Json_serializers.create_standby_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateStandbyWorkspaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_standby_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_standby_workspaces_request) =
    let input = Json_serializers.create_standby_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateStandbyWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_standby_workspaces_result_of_yojson
      ~error_deserializer
end

module CreateTags = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_tags_request) =
    let input = Json_serializers.create_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_tags_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_tags_request) =
    let input = Json_serializers.create_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.CreateTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_tags_result_of_yojson
      ~error_deserializer
end

module CreateUpdatedWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_updated_workspace_image_request) =
    let input = Json_serializers.create_updated_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateUpdatedWorkspaceImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_updated_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_updated_workspace_image_request) =
    let input = Json_serializers.create_updated_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateUpdatedWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_updated_workspace_image_result_of_yojson
      ~error_deserializer
end

module CreateWorkspaceBundle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workspace_bundle_request) =
    let input = Json_serializers.create_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateWorkspaceBundle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_bundle_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workspace_bundle_request) =
    let input = Json_serializers.create_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateWorkspaceBundle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_bundle_result_of_yojson
      ~error_deserializer
end

module CreateWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workspace_image_request) =
    let input = Json_serializers.create_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateWorkspaceImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workspace_image_request) =
    let input = Json_serializers.create_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspace_image_result_of_yojson
      ~error_deserializer
end

module CreateWorkspaces = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workspaces_request) =
    let input = Json_serializers.create_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workspaces_request) =
    let input = Json_serializers.create_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspaces_result_of_yojson ~error_deserializer
end

module CreateWorkspacesPool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_workspaces_pool_request) =
    let input = Json_serializers.create_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.CreateWorkspacesPool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspaces_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_workspaces_pool_request) =
    let input = Json_serializers.create_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.CreateWorkspacesPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_workspaces_pool_result_of_yojson
      ~error_deserializer
end

module DeleteAccountLinkInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_account_link_invitation_request) =
    let input = Json_serializers.delete_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteAccountLinkInvitation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_link_invitation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_account_link_invitation_request) =
    let input = Json_serializers.delete_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteAccountLinkInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_link_invitation_result_of_yojson
      ~error_deserializer
end

module DeleteClientBranding = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_client_branding_request) =
    let input = Json_serializers.delete_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteClientBranding"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_client_branding_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_client_branding_request) =
    let input = Json_serializers.delete_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteClientBranding" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_client_branding_result_of_yojson
      ~error_deserializer
end

module DeleteConnectClientAddIn = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connect_client_add_in_request) =
    let input = Json_serializers.delete_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteConnectClientAddIn"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connect_client_add_in_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connect_client_add_in_request) =
    let input = Json_serializers.delete_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteConnectClientAddIn" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connect_client_add_in_result_of_yojson
      ~error_deserializer
end

module DeleteConnectionAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_alias_request) =
    let input = Json_serializers.delete_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteConnectionAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_alias_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_connection_alias_request) =
    let input = Json_serializers.delete_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteConnectionAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_connection_alias_result_of_yojson
      ~error_deserializer
end

module DeleteIpGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ip_group_request) =
    let input = Json_serializers.delete_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteIpGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_ip_group_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ip_group_request) =
    let input = Json_serializers.delete_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.DeleteIpGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ip_group_result_of_yojson ~error_deserializer
end

module DeleteTags = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_tags_request) =
    let input = Json_serializers.delete_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteTags" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_tags_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_tags_request) =
    let input = Json_serializers.delete_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.DeleteTags"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_tags_result_of_yojson
      ~error_deserializer
end

module DeleteWorkspaceBundle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workspace_bundle_request) =
    let input = Json_serializers.delete_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteWorkspaceBundle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_bundle_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workspace_bundle_request) =
    let input = Json_serializers.delete_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteWorkspaceBundle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_bundle_result_of_yojson
      ~error_deserializer
end

module DeleteWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_workspace_image_request) =
    let input = Json_serializers.delete_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeleteWorkspaceImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_workspace_image_request) =
    let input = Json_serializers.delete_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeleteWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_workspace_image_result_of_yojson
      ~error_deserializer
end

module DeployWorkspaceApplications = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `IncompatibleApplicationsException _ ->
        "com.amazonaws.workspaces#IncompatibleApplicationsException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceInUseException _ -> "com.amazonaws.workspaces#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IncompatibleApplicationsException" ->
          `IncompatibleApplicationsException
            (Json_deserializers.incompatible_applications_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deploy_workspace_applications_request) =
    let input = Json_serializers.deploy_workspace_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeployWorkspaceApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deploy_workspace_applications_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deploy_workspace_applications_request) =
    let input = Json_serializers.deploy_workspace_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeployWorkspaceApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deploy_workspace_applications_result_of_yojson
      ~error_deserializer
end

module DeregisterWorkspaceDirectory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_workspace_directory_request) =
    let input = Json_serializers.deregister_workspace_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DeregisterWorkspaceDirectory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_workspace_directory_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_workspace_directory_request) =
    let input = Json_serializers.deregister_workspace_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DeregisterWorkspaceDirectory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_workspace_directory_result_of_yojson
      ~error_deserializer
end

module DescribeAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_account_request) =
    let input = Json_serializers.describe_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeAccount" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_account_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_request) =
    let input = Json_serializers.describe_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_result_of_yojson ~error_deserializer
end

module DescribeAccountModifications = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_account_modifications_request) =
    let input = Json_serializers.describe_account_modifications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeAccountModifications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_modifications_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_modifications_request) =
    let input = Json_serializers.describe_account_modifications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeAccountModifications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_modifications_result_of_yojson
      ~error_deserializer
end

module DescribeApplicationAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_application_associations_request) =
    let input = Json_serializers.describe_application_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeApplicationAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_associations_request) =
    let input = Json_serializers.describe_application_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeApplicationAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_associations_result_of_yojson
      ~error_deserializer
end

module DescribeApplications = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_applications_request) =
    let input = Json_serializers.describe_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeApplications"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_applications_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_applications_request) =
    let input = Json_serializers.describe_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_applications_result_of_yojson
      ~error_deserializer
end

module DescribeBundleAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_bundle_associations_request) =
    let input = Json_serializers.describe_bundle_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeBundleAssociations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_bundle_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_bundle_associations_request) =
    let input = Json_serializers.describe_bundle_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeBundleAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_bundle_associations_result_of_yojson
      ~error_deserializer
end

module DescribeClientBranding = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_client_branding_request) =
    let input = Json_serializers.describe_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeClientBranding"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_client_branding_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_client_branding_request) =
    let input = Json_serializers.describe_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeClientBranding" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_client_branding_result_of_yojson
      ~error_deserializer
end

module DescribeClientProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_client_properties_request) =
    let input = Json_serializers.describe_client_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeClientProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_client_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_client_properties_request) =
    let input = Json_serializers.describe_client_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeClientProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_client_properties_result_of_yojson
      ~error_deserializer
end

module DescribeConnectClientAddIns = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connect_client_add_ins_request) =
    let input = Json_serializers.describe_connect_client_add_ins_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeConnectClientAddIns"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connect_client_add_ins_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connect_client_add_ins_request) =
    let input = Json_serializers.describe_connect_client_add_ins_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeConnectClientAddIns" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connect_client_add_ins_result_of_yojson
      ~error_deserializer
end

module DescribeConnectionAliases = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_aliases_request) =
    let input = Json_serializers.describe_connection_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeConnectionAliases"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_aliases_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connection_aliases_request) =
    let input = Json_serializers.describe_connection_aliases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeConnectionAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_aliases_result_of_yojson
      ~error_deserializer
end

module DescribeConnectionAliasPermissions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_connection_alias_permissions_request) =
    let input = Json_serializers.describe_connection_alias_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeConnectionAliasPermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_alias_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_connection_alias_permissions_request) =
    let input = Json_serializers.describe_connection_alias_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeConnectionAliasPermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_connection_alias_permissions_result_of_yojson
      ~error_deserializer
end

module DescribeCustomWorkspaceImageImport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_workspace_image_import_request) =
    let input = Json_serializers.describe_custom_workspace_image_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeCustomWorkspaceImageImport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_workspace_image_import_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_custom_workspace_image_import_request) =
    let input = Json_serializers.describe_custom_workspace_image_import_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeCustomWorkspaceImageImport" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_workspace_image_import_result_of_yojson
      ~error_deserializer
end

module DescribeImageAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_image_associations_request) =
    let input = Json_serializers.describe_image_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeImageAssociations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_image_associations_request) =
    let input = Json_serializers.describe_image_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeImageAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_image_associations_result_of_yojson
      ~error_deserializer
end

module DescribeIpGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ip_groups_request) =
    let input = Json_serializers.describe_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeIpGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_ip_groups_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_ip_groups_request) =
    let input = Json_serializers.describe_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeIpGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_ip_groups_result_of_yojson
      ~error_deserializer
end

module DescribeTags = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
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

  let request context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeTags" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_tags_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_tags_request) =
    let input = Json_serializers.describe_tags_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.DescribeTags"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_tags_result_of_yojson ~error_deserializer
end

module DescribeWorkspaceAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_associations_request) =
    let input = Json_serializers.describe_workspace_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeWorkspaceAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_associations_request) =
    let input = Json_serializers.describe_workspace_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_associations_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaceBundles = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_bundles_request) =
    let input = Json_serializers.describe_workspace_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspaceBundles"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_bundles_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_bundles_request) =
    let input = Json_serializers.describe_workspace_bundles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceBundles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_bundles_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaceDirectories = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_directories_request) =
    let input = Json_serializers.describe_workspace_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspaceDirectories"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_directories_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_directories_request) =
    let input = Json_serializers.describe_workspace_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceDirectories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_directories_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaceImagePermissions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_image_permissions_request) =
    let input = Json_serializers.describe_workspace_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeWorkspaceImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_image_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_image_permissions_request) =
    let input = Json_serializers.describe_workspace_image_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceImagePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_image_permissions_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaceImages = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_images_request) =
    let input = Json_serializers.describe_workspace_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspaceImages"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_images_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_images_request) =
    let input = Json_serializers.describe_workspace_images_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceImages" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_images_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaces = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspaces_request) =
    let input = Json_serializers.describe_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspaces_request) =
    let input = Json_serializers.describe_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspacesConnectionStatus = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspaces_connection_status_request) =
    let input = Json_serializers.describe_workspaces_connection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeWorkspacesConnectionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_connection_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspaces_connection_status_request) =
    let input = Json_serializers.describe_workspaces_connection_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspacesConnectionStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_connection_status_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspaceSnapshots = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspace_snapshots_request) =
    let input = Json_serializers.describe_workspace_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspaceSnapshots"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_snapshots_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspace_snapshots_request) =
    let input = Json_serializers.describe_workspace_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspaceSnapshots" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspace_snapshots_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspacesPools = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspaces_pools_request) =
    let input = Json_serializers.describe_workspaces_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DescribeWorkspacesPools"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_pools_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspaces_pools_request) =
    let input = Json_serializers.describe_workspaces_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspacesPools" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_pools_result_of_yojson
      ~error_deserializer
end

module DescribeWorkspacesPoolSessions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_workspaces_pool_sessions_request) =
    let input = Json_serializers.describe_workspaces_pool_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DescribeWorkspacesPoolSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_pool_sessions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_workspaces_pool_sessions_request) =
    let input = Json_serializers.describe_workspaces_pool_sessions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DescribeWorkspacesPoolSessions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_workspaces_pool_sessions_result_of_yojson
      ~error_deserializer
end

module DisassociateConnectionAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_connection_alias_request) =
    let input = Json_serializers.disassociate_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DisassociateConnectionAlias"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_connection_alias_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_connection_alias_request) =
    let input = Json_serializers.disassociate_connection_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DisassociateConnectionAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_connection_alias_result_of_yojson
      ~error_deserializer
end

module DisassociateIpGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_ip_groups_request) =
    let input = Json_serializers.disassociate_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.DisassociateIpGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_ip_groups_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_ip_groups_request) =
    let input = Json_serializers.disassociate_ip_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DisassociateIpGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_ip_groups_result_of_yojson
      ~error_deserializer
end

module DisassociateWorkspaceApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceInUseException _ -> "com.amazonaws.workspaces#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_workspace_application_request) =
    let input = Json_serializers.disassociate_workspace_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.DisassociateWorkspaceApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_workspace_application_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_workspace_application_request) =
    let input = Json_serializers.disassociate_workspace_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.DisassociateWorkspaceApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_workspace_application_result_of_yojson
      ~error_deserializer
end

module GetAccountLink = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_link_request) =
    let input = Json_serializers.get_account_link_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.GetAccountLink" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_account_link_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_link_request) =
    let input = Json_serializers.get_account_link_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.GetAccountLink"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_link_result_of_yojson ~error_deserializer
end

module ImportClientBranding = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_client_branding_request) =
    let input = Json_serializers.import_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ImportClientBranding"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_client_branding_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_client_branding_request) =
    let input = Json_serializers.import_client_branding_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ImportClientBranding" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_client_branding_result_of_yojson
      ~error_deserializer
end

module ImportCustomWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_custom_workspace_image_request) =
    let input = Json_serializers.import_custom_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ImportCustomWorkspaceImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_custom_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_custom_workspace_image_request) =
    let input = Json_serializers.import_custom_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ImportCustomWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_custom_workspace_image_result_of_yojson
      ~error_deserializer
end

module ImportWorkspaceImage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_workspace_image_request) =
    let input = Json_serializers.import_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ImportWorkspaceImage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_workspace_image_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_workspace_image_request) =
    let input = Json_serializers.import_workspace_image_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ImportWorkspaceImage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_workspace_image_result_of_yojson
      ~error_deserializer
end

module ListAccountLinks = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_account_links_request) =
    let input = Json_serializers.list_account_links_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ListAccountLinks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_account_links_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_links_request) =
    let input = Json_serializers.list_account_links_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ListAccountLinks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_links_result_of_yojson
      ~error_deserializer
end

module ListAvailableManagementCidrRanges = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_management_cidr_ranges_request) =
    let input = Json_serializers.list_available_management_cidr_ranges_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.ListAvailableManagementCidrRanges" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_available_management_cidr_ranges_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_available_management_cidr_ranges_request) =
    let input = Json_serializers.list_available_management_cidr_ranges_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ListAvailableManagementCidrRanges" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_available_management_cidr_ranges_result_of_yojson
      ~error_deserializer
end

module MigrateWorkspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : migrate_workspace_request) =
    let input = Json_serializers.migrate_workspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.MigrateWorkspace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.migrate_workspace_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : migrate_workspace_request) =
    let input = Json_serializers.migrate_workspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.MigrateWorkspace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.migrate_workspace_result_of_yojson ~error_deserializer
end

module ModifyAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_account_request) =
    let input = Json_serializers.modify_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyAccount" ~service
      ~context ~input ~output_deserializer:Json_deserializers.modify_account_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_account_request) =
    let input = Json_serializers.modify_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.ModifyAccount"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_account_result_of_yojson ~error_deserializer
end

module ModifyCertificateBasedAuthProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_certificate_based_auth_properties_request) =
    let input =
      Json_serializers.modify_certificate_based_auth_properties_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.ModifyCertificateBasedAuthProperties" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.modify_certificate_based_auth_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_certificate_based_auth_properties_request) =
    let input =
      Json_serializers.modify_certificate_based_auth_properties_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyCertificateBasedAuthProperties" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.modify_certificate_based_auth_properties_result_of_yojson
      ~error_deserializer
end

module ModifyClientProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_client_properties_request) =
    let input = Json_serializers.modify_client_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyClientProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_client_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_client_properties_request) =
    let input = Json_serializers.modify_client_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyClientProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_client_properties_result_of_yojson
      ~error_deserializer
end

module ModifyEndpointEncryptionMode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_endpoint_encryption_mode_request) =
    let input = Json_serializers.modify_endpoint_encryption_mode_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyEndpointEncryptionMode"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_endpoint_encryption_mode_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_endpoint_encryption_mode_request) =
    let input = Json_serializers.modify_endpoint_encryption_mode_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyEndpointEncryptionMode" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_endpoint_encryption_mode_response_of_yojson
      ~error_deserializer
end

module ModifySamlProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_saml_properties_request) =
    let input = Json_serializers.modify_saml_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifySamlProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_saml_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_saml_properties_request) =
    let input = Json_serializers.modify_saml_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifySamlProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_saml_properties_result_of_yojson
      ~error_deserializer
end

module ModifySelfservicePermissions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_selfservice_permissions_request) =
    let input = Json_serializers.modify_selfservice_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifySelfservicePermissions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_selfservice_permissions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_selfservice_permissions_request) =
    let input = Json_serializers.modify_selfservice_permissions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifySelfservicePermissions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_selfservice_permissions_result_of_yojson
      ~error_deserializer
end

module ModifyStreamingProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_streaming_properties_request) =
    let input = Json_serializers.modify_streaming_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyStreamingProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_streaming_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_streaming_properties_request) =
    let input = Json_serializers.modify_streaming_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyStreamingProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_streaming_properties_result_of_yojson
      ~error_deserializer
end

module ModifyWorkspaceAccessProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterCombinationException _ ->
        "com.amazonaws.workspaces#InvalidParameterCombinationException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterCombinationException" ->
          `InvalidParameterCombinationException
            (Json_deserializers.invalid_parameter_combination_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_workspace_access_properties_request) =
    let input = Json_serializers.modify_workspace_access_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.ModifyWorkspaceAccessProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_access_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_workspace_access_properties_request) =
    let input = Json_serializers.modify_workspace_access_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyWorkspaceAccessProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_access_properties_result_of_yojson
      ~error_deserializer
end

module ModifyWorkspaceCreationProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_workspace_creation_properties_request) =
    let input = Json_serializers.modify_workspace_creation_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.ModifyWorkspaceCreationProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_creation_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_workspace_creation_properties_request) =
    let input = Json_serializers.modify_workspace_creation_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyWorkspaceCreationProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_creation_properties_result_of_yojson
      ~error_deserializer
end

module ModifyWorkspaceProperties = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | `UnsupportedWorkspaceConfigurationException _ ->
        "com.amazonaws.workspaces#UnsupportedWorkspaceConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "UnsupportedWorkspaceConfigurationException" ->
          `UnsupportedWorkspaceConfigurationException
            (Json_deserializers.unsupported_workspace_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_workspace_properties_request) =
    let input = Json_serializers.modify_workspace_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyWorkspaceProperties"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_properties_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_workspace_properties_request) =
    let input = Json_serializers.modify_workspace_properties_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyWorkspaceProperties" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_properties_result_of_yojson
      ~error_deserializer
end

module ModifyWorkspaceState = struct
  let error_to_string = function
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : modify_workspace_state_request) =
    let input = Json_serializers.modify_workspace_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.ModifyWorkspaceState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_state_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : modify_workspace_state_request) =
    let input = Json_serializers.modify_workspace_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.ModifyWorkspaceState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.modify_workspace_state_result_of_yojson
      ~error_deserializer
end

module RebootWorkspaces = struct
  let error_to_string = function
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reboot_workspaces_request) =
    let input = Json_serializers.reboot_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RebootWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.reboot_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reboot_workspaces_request) =
    let input = Json_serializers.reboot_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.RebootWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reboot_workspaces_result_of_yojson ~error_deserializer
end

module RebuildWorkspaces = struct
  let error_to_string = function
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : rebuild_workspaces_request) =
    let input = Json_serializers.rebuild_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RebuildWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.rebuild_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : rebuild_workspaces_request) =
    let input = Json_serializers.rebuild_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.RebuildWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.rebuild_workspaces_result_of_yojson
      ~error_deserializer
end

module RegisterWorkspaceDirectory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.workspaces#ResourceAlreadyExistsException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `UnsupportedNetworkConfigurationException _ ->
        "com.amazonaws.workspaces#UnsupportedNetworkConfigurationException"
    | `WorkspacesDefaultRoleNotFoundException _ ->
        "com.amazonaws.workspaces#WorkspacesDefaultRoleNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "UnsupportedNetworkConfigurationException" ->
          `UnsupportedNetworkConfigurationException
            (Json_deserializers.unsupported_network_configuration_exception_of_yojson tree path)
      | _, "WorkspacesDefaultRoleNotFoundException" ->
          `WorkspacesDefaultRoleNotFoundException
            (Json_deserializers.workspaces_default_role_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_workspace_directory_request) =
    let input = Json_serializers.register_workspace_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RegisterWorkspaceDirectory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_workspace_directory_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_workspace_directory_request) =
    let input = Json_serializers.register_workspace_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.RegisterWorkspaceDirectory" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_workspace_directory_result_of_yojson
      ~error_deserializer
end

module RejectAccountLinkInvitation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.workspaces#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.workspaces#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.workspaces#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_account_link_invitation_request) =
    let input = Json_serializers.reject_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RejectAccountLinkInvitation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_account_link_invitation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_account_link_invitation_request) =
    let input = Json_serializers.reject_account_link_invitation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.RejectAccountLinkInvitation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_account_link_invitation_result_of_yojson
      ~error_deserializer
end

module RestoreWorkspace = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_workspace_request) =
    let input = Json_serializers.restore_workspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RestoreWorkspace" ~service
      ~context ~input ~output_deserializer:Json_deserializers.restore_workspace_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_workspace_request) =
    let input = Json_serializers.restore_workspace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.RestoreWorkspace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_workspace_result_of_yojson ~error_deserializer
end

module RevokeIpRules = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : revoke_ip_rules_request) =
    let input = Json_serializers.revoke_ip_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.RevokeIpRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.revoke_ip_rules_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : revoke_ip_rules_request) =
    let input = Json_serializers.revoke_ip_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.RevokeIpRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.revoke_ip_rules_result_of_yojson ~error_deserializer
end

module StartWorkspaces = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_workspaces_request) =
    let input = Json_serializers.start_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.StartWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_workspaces_request) =
    let input = Json_serializers.start_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.StartWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_workspaces_result_of_yojson ~error_deserializer
end

module StartWorkspacesPool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_workspaces_pool_request) =
    let input = Json_serializers.start_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.StartWorkspacesPool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.start_workspaces_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_workspaces_pool_request) =
    let input = Json_serializers.start_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.StartWorkspacesPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_workspaces_pool_result_of_yojson
      ~error_deserializer
end

module StopWorkspaces = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_workspaces_request) =
    let input = Json_serializers.stop_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.StopWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_workspaces_request) =
    let input = Json_serializers.stop_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"WorkspacesService.StopWorkspaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_workspaces_result_of_yojson ~error_deserializer
end

module StopWorkspacesPool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_workspaces_pool_request) =
    let input = Json_serializers.stop_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.StopWorkspacesPool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_workspaces_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_workspaces_pool_request) =
    let input = Json_serializers.stop_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.StopWorkspacesPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_workspaces_pool_result_of_yojson
      ~error_deserializer
end

module TerminateWorkspaces = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_workspaces_request) =
    let input = Json_serializers.terminate_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.TerminateWorkspaces" ~service
      ~context ~input ~output_deserializer:Json_deserializers.terminate_workspaces_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_workspaces_request) =
    let input = Json_serializers.terminate_workspaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.TerminateWorkspaces" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_workspaces_result_of_yojson
      ~error_deserializer
end

module TerminateWorkspacesPool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_workspaces_pool_request) =
    let input = Json_serializers.terminate_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.TerminateWorkspacesPool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_workspaces_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_workspaces_pool_request) =
    let input = Json_serializers.terminate_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.TerminateWorkspacesPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_workspaces_pool_result_of_yojson
      ~error_deserializer
end

module TerminateWorkspacesPoolSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : terminate_workspaces_pool_session_request) =
    let input = Json_serializers.terminate_workspaces_pool_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.TerminateWorkspacesPoolSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_workspaces_pool_session_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : terminate_workspaces_pool_session_request) =
    let input = Json_serializers.terminate_workspaces_pool_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.TerminateWorkspacesPoolSession" ~service ~context ~input
      ~output_deserializer:Json_deserializers.terminate_workspaces_pool_session_result_of_yojson
      ~error_deserializer
end

module UpdateConnectClientAddIn = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connect_client_add_in_request) =
    let input = Json_serializers.update_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.UpdateConnectClientAddIn"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connect_client_add_in_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connect_client_add_in_request) =
    let input = Json_serializers.update_connect_client_add_in_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateConnectClientAddIn" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connect_client_add_in_result_of_yojson
      ~error_deserializer
end

module UpdateConnectionAliasPermission = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceAssociatedException _ -> "com.amazonaws.workspaces#ResourceAssociatedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceAssociatedException" ->
          `ResourceAssociatedException
            (Json_deserializers.resource_associated_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_connection_alias_permission_request) =
    let input = Json_serializers.update_connection_alias_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.UpdateConnectionAliasPermission" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_alias_permission_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_connection_alias_permission_request) =
    let input = Json_serializers.update_connection_alias_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateConnectionAliasPermission" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_connection_alias_permission_result_of_yojson
      ~error_deserializer
end

module UpdateRulesOfIpGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rules_of_ip_group_request) =
    let input = Json_serializers.update_rules_of_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.UpdateRulesOfIpGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rules_of_ip_group_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rules_of_ip_group_request) =
    let input = Json_serializers.update_rules_of_ip_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateRulesOfIpGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rules_of_ip_group_result_of_yojson
      ~error_deserializer
end

module UpdateWorkspaceBundle = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workspace_bundle_request) =
    let input = Json_serializers.update_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.UpdateWorkspaceBundle"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspace_bundle_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workspace_bundle_request) =
    let input = Json_serializers.update_workspace_bundle_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateWorkspaceBundle" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspace_bundle_result_of_yojson
      ~error_deserializer
end

module UpdateWorkspaceImagePermission = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | `ResourceUnavailableException _ -> "com.amazonaws.workspaces#ResourceUnavailableException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workspace_image_permission_request) =
    let input = Json_serializers.update_workspace_image_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"WorkspacesService.UpdateWorkspaceImagePermission" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspace_image_permission_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workspace_image_permission_request) =
    let input = Json_serializers.update_workspace_image_permission_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateWorkspaceImagePermission" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspace_image_permission_result_of_yojson
      ~error_deserializer
end

module UpdateWorkspacesPool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.workspaces#AccessDeniedException"
    | `InvalidParameterValuesException _ ->
        "com.amazonaws.workspaces#InvalidParameterValuesException"
    | `InvalidResourceStateException _ -> "com.amazonaws.workspaces#InvalidResourceStateException"
    | `OperationInProgressException _ -> "com.amazonaws.workspaces#OperationInProgressException"
    | `OperationNotSupportedException _ -> "com.amazonaws.workspaces#OperationNotSupportedException"
    | `ResourceLimitExceededException _ -> "com.amazonaws.workspaces#ResourceLimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.workspaces#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InvalidParameterValuesException" ->
          `InvalidParameterValuesException
            (Json_deserializers.invalid_parameter_values_exception_of_yojson tree path)
      | _, "InvalidResourceStateException" ->
          `InvalidResourceStateException
            (Json_deserializers.invalid_resource_state_exception_of_yojson tree path)
      | _, "OperationInProgressException" ->
          `OperationInProgressException
            (Json_deserializers.operation_in_progress_exception_of_yojson tree path)
      | _, "OperationNotSupportedException" ->
          `OperationNotSupportedException
            (Json_deserializers.operation_not_supported_exception_of_yojson tree path)
      | _, "ResourceLimitExceededException" ->
          `ResourceLimitExceededException
            (Json_deserializers.resource_limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_workspaces_pool_request) =
    let input = Json_serializers.update_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"WorkspacesService.UpdateWorkspacesPool"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspaces_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_workspaces_pool_request) =
    let input = Json_serializers.update_workspaces_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"WorkspacesService.UpdateWorkspacesPool" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_workspaces_pool_result_of_yojson
      ~error_deserializer
end
