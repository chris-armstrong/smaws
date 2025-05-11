open Types
module AssociateDelegateToResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_delegate_to_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_delegate_to_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceAssociateDelegateToResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_delegate_to_resource_response_of_yojson
            ~error_deserializer
  end
module AssociateMemberToGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_member_to_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_member_to_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceAssociateMemberToGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_member_to_group_response_of_yojson
            ~error_deserializer
  end
module AssumeImpersonationRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : assume_impersonation_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.assume_impersonation_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceAssumeImpersonationRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:assume_impersonation_role_response_of_yojson
            ~error_deserializer
  end
module CancelMailboxExportJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_mailbox_export_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.cancel_mailbox_export_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCancelMailboxExportJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_mailbox_export_job_response_of_yojson
            ~error_deserializer
  end
module CreateAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EmailAddressInUseException") ->
              `EmailAddressInUseException
                (email_address_in_use_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "MailDomainStateException") ->
              `MailDomainStateException
                (mail_domain_state_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_alias_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_alias_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_alias_response_of_yojson
            ~error_deserializer
  end
module CreateAvailabilityConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_availability_configuration_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_availability_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateAvailabilityConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_availability_configuration_response_of_yojson
            ~error_deserializer
  end
module CreateGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ReservedNameException") ->
              `ReservedNameException
                (reserved_name_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_group_response_of_yojson
            ~error_deserializer
  end
module CreateImpersonationRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_impersonation_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_impersonation_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateImpersonationRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_impersonation_role_response_of_yojson
            ~error_deserializer
  end
module CreateMobileDeviceAccessRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_mobile_device_access_rule_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_mobile_device_access_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateMobileDeviceAccessRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_mobile_device_access_rule_response_of_yojson
            ~error_deserializer
  end
module CreateOrganization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryInUseException") ->
              `DirectoryInUseException
                (directory_in_use_exception_of_yojson tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_organization_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_organization_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateOrganization" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_organization_response_of_yojson
            ~error_deserializer
  end
module CreateResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ReservedNameException") ->
              `ReservedNameException
                (reserved_name_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_resource_response_of_yojson
            ~error_deserializer
  end
module CreateUser =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidPasswordException") ->
              `InvalidPasswordException
                (invalid_password_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ReservedNameException") ->
              `ReservedNameException
                (reserved_name_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_user_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_user_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceCreateUser" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_user_response_of_yojson
            ~error_deserializer
  end
module DeleteAccessControlRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_access_control_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_access_control_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteAccessControlRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_access_control_rule_response_of_yojson
            ~error_deserializer
  end
module DeleteAlias =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_alias_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_alias_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteAlias" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_alias_response_of_yojson
            ~error_deserializer
  end
module DeleteAvailabilityConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_availability_configuration_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_availability_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteAvailabilityConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_availability_configuration_response_of_yojson
            ~error_deserializer
  end
module DeleteEmailMonitoringConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_email_monitoring_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_email_monitoring_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteEmailMonitoringConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_email_monitoring_configuration_response_of_yojson
            ~error_deserializer
  end
module DeleteGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_group_response_of_yojson
            ~error_deserializer
  end
module DeleteImpersonationRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_impersonation_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_impersonation_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteImpersonationRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_impersonation_role_response_of_yojson
            ~error_deserializer
  end
module DeleteMailboxPermissions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_mailbox_permissions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_mailbox_permissions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteMailboxPermissions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_mailbox_permissions_response_of_yojson
            ~error_deserializer
  end
module DeleteMobileDeviceAccessOverride =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_mobile_device_access_override_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_mobile_device_access_override_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteMobileDeviceAccessOverride"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_mobile_device_access_override_response_of_yojson
            ~error_deserializer
  end
module DeleteMobileDeviceAccessRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_mobile_device_access_rule_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_mobile_device_access_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteMobileDeviceAccessRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_mobile_device_access_rule_response_of_yojson
            ~error_deserializer
  end
module DeleteOrganization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_organization_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_organization_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteOrganization" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_organization_response_of_yojson
            ~error_deserializer
  end
module DeleteResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_resource_response_of_yojson
            ~error_deserializer
  end
module DeleteRetentionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_retention_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_retention_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteRetentionPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_retention_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteUser =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_user_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_user_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeleteUser" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_user_response_of_yojson
            ~error_deserializer
  end
module DeregisterFromWorkMail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deregister_from_work_mail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_from_work_mail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeregisterFromWorkMail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:deregister_from_work_mail_response_of_yojson
            ~error_deserializer
  end
module DeregisterMailDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidCustomSesConfigurationException") ->
              `InvalidCustomSesConfigurationException
                (invalid_custom_ses_configuration_exception_of_yojson tree
                   path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainInUseException") ->
              `MailDomainInUseException
                (mail_domain_in_use_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deregister_mail_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deregister_mail_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDeregisterMailDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:deregister_mail_domain_response_of_yojson
            ~error_deserializer
  end
module DescribeEmailMonitoringConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_email_monitoring_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_email_monitoring_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeEmailMonitoringConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_email_monitoring_configuration_response_of_yojson
            ~error_deserializer
  end
module DescribeEntity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_entity_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_entity_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeEntity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_entity_response_of_yojson
            ~error_deserializer
  end
module DescribeGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_group_response_of_yojson
            ~error_deserializer
  end
module DescribeInboundDmarcSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_inbound_dmarc_settings_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_inbound_dmarc_settings_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeInboundDmarcSettings"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_inbound_dmarc_settings_response_of_yojson
            ~error_deserializer
  end
module DescribeMailboxExportJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_mailbox_export_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_mailbox_export_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeMailboxExportJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_mailbox_export_job_response_of_yojson
            ~error_deserializer
  end
module DescribeOrganization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_organization_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_organization_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeOrganization" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_organization_response_of_yojson
            ~error_deserializer
  end
module DescribeResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_resource_response_of_yojson
            ~error_deserializer
  end
module DescribeUser =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_user_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_user_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDescribeUser" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_user_response_of_yojson
            ~error_deserializer
  end
module DisassociateDelegateFromResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : disassociate_delegate_from_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_delegate_from_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDisassociateDelegateFromResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_delegate_from_resource_response_of_yojson
            ~error_deserializer
  end
module DisassociateMemberFromGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_member_from_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_member_from_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceDisassociateMemberFromGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_member_from_group_response_of_yojson
            ~error_deserializer
  end
module GetAccessControlEffect =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_access_control_effect_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_access_control_effect_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetAccessControlEffect" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_access_control_effect_response_of_yojson
            ~error_deserializer
  end
module GetDefaultRetentionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_default_retention_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_default_retention_policy_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetDefaultRetentionPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_default_retention_policy_response_of_yojson
            ~error_deserializer
  end
module GetImpersonationRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_impersonation_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_impersonation_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetImpersonationRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_impersonation_role_response_of_yojson
            ~error_deserializer
  end
module GetImpersonationRoleEffect =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_impersonation_role_effect_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_impersonation_role_effect_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetImpersonationRoleEffect" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_impersonation_role_effect_response_of_yojson
            ~error_deserializer
  end
module GetMailboxDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_mailbox_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_mailbox_details_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetMailboxDetails" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_mailbox_details_response_of_yojson
            ~error_deserializer
  end
module GetMailDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_mail_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_mail_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetMailDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_mail_domain_response_of_yojson
            ~error_deserializer
  end
module GetMobileDeviceAccessEffect =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_mobile_device_access_effect_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_mobile_device_access_effect_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetMobileDeviceAccessEffect" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_mobile_device_access_effect_response_of_yojson
            ~error_deserializer
  end
module GetMobileDeviceAccessOverride =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_mobile_device_access_override_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_mobile_device_access_override_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceGetMobileDeviceAccessOverride"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_mobile_device_access_override_response_of_yojson
            ~error_deserializer
  end
module ListAccessControlRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_access_control_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_access_control_rules_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListAccessControlRules" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_access_control_rules_response_of_yojson
            ~error_deserializer
  end
module ListAliases =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_aliases_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_aliases_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListAliases" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_aliases_response_of_yojson
            ~error_deserializer
  end
module ListAvailabilityConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_availability_configurations_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_availability_configurations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListAvailabilityConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_availability_configurations_response_of_yojson
            ~error_deserializer
  end
module ListGroupMembers =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_group_members_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_group_members_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListGroupMembers" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_group_members_response_of_yojson
            ~error_deserializer
  end
module ListGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_groups_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListGroups" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_groups_response_of_yojson
            ~error_deserializer
  end
module ListGroupsForEntity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_groups_for_entity_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_groups_for_entity_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListGroupsForEntity" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_groups_for_entity_response_of_yojson
            ~error_deserializer
  end
module ListImpersonationRoles =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_impersonation_roles_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_impersonation_roles_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListImpersonationRoles" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_impersonation_roles_response_of_yojson
            ~error_deserializer
  end
module ListMailboxExportJobs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_mailbox_export_jobs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_mailbox_export_jobs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListMailboxExportJobs" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_mailbox_export_jobs_response_of_yojson
            ~error_deserializer
  end
module ListMailboxPermissions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_mailbox_permissions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_mailbox_permissions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListMailboxPermissions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_mailbox_permissions_response_of_yojson
            ~error_deserializer
  end
module ListMailDomains =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_mail_domains_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_mail_domains_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListMailDomains" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_mail_domains_response_of_yojson
            ~error_deserializer
  end
module ListMobileDeviceAccessOverrides =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_mobile_device_access_overrides_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_mobile_device_access_overrides_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListMobileDeviceAccessOverrides"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_mobile_device_access_overrides_response_of_yojson
            ~error_deserializer
  end
module ListMobileDeviceAccessRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_mobile_device_access_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_mobile_device_access_rules_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListMobileDeviceAccessRules" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_mobile_device_access_rules_response_of_yojson
            ~error_deserializer
  end
module ListOrganizations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_organizations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_organizations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListOrganizations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_organizations_response_of_yojson
            ~error_deserializer
  end
module ListResourceDelegates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_delegates_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_delegates_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListResourceDelegates" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resource_delegates_response_of_yojson
            ~error_deserializer
  end
module ListResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListResources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resources_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListUsers =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_users_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_users_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceListUsers" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_users_response_of_yojson
            ~error_deserializer
  end
module PutAccessControlRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_access_control_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_access_control_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutAccessControlRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_access_control_rule_response_of_yojson
            ~error_deserializer
  end
module PutEmailMonitoringConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : put_email_monitoring_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_email_monitoring_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutEmailMonitoringConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_email_monitoring_configuration_response_of_yojson
            ~error_deserializer
  end
module PutInboundDmarcSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_inbound_dmarc_settings_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_inbound_dmarc_settings_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutInboundDmarcSettings" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_inbound_dmarc_settings_response_of_yojson
            ~error_deserializer
  end
module PutMailboxPermissions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_mailbox_permissions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_mailbox_permissions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutMailboxPermissions" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_mailbox_permissions_response_of_yojson
            ~error_deserializer
  end
module PutMobileDeviceAccessOverride =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_mobile_device_access_override_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_mobile_device_access_override_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutMobileDeviceAccessOverride"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_mobile_device_access_override_response_of_yojson
            ~error_deserializer
  end
module PutRetentionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_retention_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_retention_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServicePutRetentionPolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_retention_policy_response_of_yojson
            ~error_deserializer
  end
module RegisterMailDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "MailDomainInUseException") ->
              `MailDomainInUseException
                (mail_domain_in_use_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_mail_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_mail_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceRegisterMailDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:register_mail_domain_response_of_yojson
            ~error_deserializer
  end
module RegisterToWorkMail =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EmailAddressInUseException") ->
              `EmailAddressInUseException
                (email_address_in_use_exception_of_yojson tree path)
          | (_, "EntityAlreadyRegisteredException") ->
              `EntityAlreadyRegisteredException
                (entity_already_registered_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "MailDomainStateException") ->
              `MailDomainStateException
                (mail_domain_state_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : register_to_work_mail_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.register_to_work_mail_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceRegisterToWorkMail" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:register_to_work_mail_response_of_yojson
            ~error_deserializer
  end
module ResetPassword =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidPasswordException") ->
              `InvalidPasswordException
                (invalid_password_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : reset_password_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.reset_password_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceResetPassword" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:reset_password_response_of_yojson
            ~error_deserializer
  end
module StartMailboxExportJob =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_mailbox_export_job_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_mailbox_export_job_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceStartMailboxExportJob" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_mailbox_export_job_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module TestAvailabilityConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : test_availability_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.test_availability_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceTestAvailabilityConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:test_availability_configuration_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateAvailabilityConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_availability_configuration_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_availability_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateAvailabilityConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_availability_configuration_response_of_yojson
            ~error_deserializer
  end
module UpdateDefaultMailDomain =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "MailDomainStateException") ->
              `MailDomainStateException
                (mail_domain_state_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_default_mail_domain_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_default_mail_domain_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateDefaultMailDomain" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_default_mail_domain_response_of_yojson
            ~error_deserializer
  end
module UpdateGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_group_response_of_yojson
            ~error_deserializer
  end
module UpdateImpersonationRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_impersonation_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_impersonation_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateImpersonationRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_impersonation_role_response_of_yojson
            ~error_deserializer
  end
module UpdateMailboxQuota =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_mailbox_quota_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_mailbox_quota_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateMailboxQuota" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_mailbox_quota_response_of_yojson
            ~error_deserializer
  end
module UpdateMobileDeviceAccessRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_mobile_device_access_rule_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_mobile_device_access_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateMobileDeviceAccessRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_mobile_device_access_rule_response_of_yojson
            ~error_deserializer
  end
module UpdatePrimaryEmailAddress =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EmailAddressInUseException") ->
              `EmailAddressInUseException
                (email_address_in_use_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "MailDomainStateException") ->
              `MailDomainStateException
                (mail_domain_state_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_primary_email_address_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_primary_email_address_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdatePrimaryEmailAddress" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_primary_email_address_response_of_yojson
            ~error_deserializer
  end
module UpdateResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EmailAddressInUseException") ->
              `EmailAddressInUseException
                (email_address_in_use_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidConfigurationException") ->
              `InvalidConfigurationException
                (invalid_configuration_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "MailDomainNotFoundException") ->
              `MailDomainNotFoundException
                (mail_domain_not_found_exception_of_yojson tree path)
          | (_, "MailDomainStateException") ->
              `MailDomainStateException
                (mail_domain_state_exception_of_yojson tree path)
          | (_, "NameAvailabilityException") ->
              `NameAvailabilityException
                (name_availability_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateUser =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "DirectoryServiceAuthenticationFailedException") ->
              `DirectoryServiceAuthenticationFailedException
                (directory_service_authentication_failed_exception_of_yojson
                   tree path)
          | (_, "DirectoryUnavailableException") ->
              `DirectoryUnavailableException
                (directory_unavailable_exception_of_yojson tree path)
          | (_, "EntityNotFoundException") ->
              `EntityNotFoundException
                (entity_not_found_exception_of_yojson tree path)
          | (_, "EntityStateException") ->
              `EntityStateException
                (entity_state_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OrganizationNotFoundException") ->
              `OrganizationNotFoundException
                (organization_not_found_exception_of_yojson tree path)
          | (_, "OrganizationStateException") ->
              `OrganizationStateException
                (organization_state_exception_of_yojson tree path)
          | (_, "UnsupportedOperationException") ->
              `UnsupportedOperationException
                (unsupported_operation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_user_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_user_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"WorkMailServiceUpdateUser" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_user_response_of_yojson
            ~error_deserializer
  end