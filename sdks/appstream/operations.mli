open Types

module AssociateAppBlockBuilderAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_app_block_builder_app_block_request ->
    ( associate_app_block_builder_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_app_block_builder_app_block_request ->
    ( associate_app_block_builder_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified app block builder with the specified app block.\n"]

module AssociateApplicationFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_application_fleet_request ->
    ( associate_application_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_application_fleet_request ->
    ( associate_application_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified application with the specified fleet. This is only supported for \
   Elastic fleets.\n"]

module AssociateApplicationToEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_application_to_entitlement_request ->
    ( associate_application_to_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_application_to_entitlement_request ->
    ( associate_application_to_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates an application to entitle.\n"]

module AssociateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_fleet_request ->
    ( associate_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_fleet_request ->
    ( associate_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Associates the specified fleet with the specified stack.\n"]

module AssociateSoftwareToImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_software_to_image_builder_request ->
    ( associate_software_to_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_software_to_image_builder_request ->
    ( associate_software_to_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates license included application(s) with an existing image builder instance.\n"]

module BatchAssociateUserStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_user_stack_request ->
    ( batch_associate_user_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_associate_user_stack_request ->
    ( batch_associate_user_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified users with the specified stacks. Users in a user pool cannot be \
   assigned to stacks with fleets that are joined to an Active Directory domain.\n"]

module BatchDisassociateUserStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_user_stack_request ->
    ( batch_disassociate_user_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_disassociate_user_stack_request ->
    ( batch_disassociate_user_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified users from the specified stacks.\n"]

module CopyImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    copy_image_request ->
    ( copy_image_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    copy_image_request ->
    ( copy_image_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Copies the image within the same region or to a new region within the same AWS account. Note \
   that any tags you added to the image will not be copied.\n"]

module CreateAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_request ->
    ( create_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_request ->
    ( create_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an app block.\n\n\
  \ App blocks are a WorkSpaces Applications resource that stores the details about the virtual \
   hard disk in an S3 bucket. It also stores the setup script with details about how to mount the \
   virtual hard disk. The virtual hard disk includes the application binaries and other files \
   necessary to launch your applications. Multiple applications can be assigned to a single app \
   block.\n\
  \ \n\
  \  This is only supported for Elastic fleets.\n\
  \  "]

module CreateAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_request ->
    ( create_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_request ->
    ( create_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates an app block builder.\n"]

module CreateAppBlockBuilderStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_streaming_url_request ->
    ( create_app_block_builder_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_block_builder_streaming_url_request ->
    ( create_app_block_builder_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a URL to start a create app block builder streaming session.\n"]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an application.\n\n\
  \ Applications are a WorkSpaces Applications resource that stores the details about how to \
   launch applications on Elastic fleet streaming instances. An application consists of the launch \
   details, icon, and display name. Applications are associated with an app block that contains \
   the application binaries and other files. The applications assigned to an Elastic fleet are the \
   applications users can launch. \n\
  \ \n\
  \  This is only supported for Elastic fleets.\n\
  \  "]

module CreateDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_directory_config_request ->
    ( create_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_directory_config_request ->
    ( create_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Directory Config object in WorkSpaces Applications. This object includes the \
   configuration information required to join fleets and image builders to Microsoft Active \
   Directory domains.\n"]

module CreateEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_entitlement_request ->
    ( create_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementAlreadyExistsException of entitlement_already_exists_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new entitlement. Entitlements control access to specific applications within a stack, \
   based on user attributes. Entitlements apply to SAML 2.0 federated user identities. WorkSpaces \
   Applications user pool and streaming URL users are entitled to all applications in a stack. \
   Entitlements don't apply to the desktop stream view application, or to applications managed by \
   a dynamic app provider using the Dynamic Application Framework.\n"]

module CreateExportImageTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_export_image_task_request ->
    ( create_export_image_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_export_image_task_request ->
    ( create_export_image_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a task to export a WorkSpaces Applications image to an EC2 AMI. This allows you to use \
   your customized WorkSpaces Applications images with other AWS services or for backup purposes.\n"]

module CreateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_request ->
    ( create_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_fleet_request ->
    ( create_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a fleet. A fleet consists of streaming instances that your users access for their \
   applications and desktops.\n"]

module CreateImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_request ->
    ( create_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_request ->
    ( create_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an image builder. An image builder is a virtual machine that is used to create an \
   image.\n\n\
  \ The initial state of the builder is [PENDING]. When it is ready, the state is [RUNNING].\n\
  \ "]

module CreateImageBuilderStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_streaming_url_request ->
    ( create_image_builder_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_image_builder_streaming_url_request ->
    ( create_image_builder_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a URL to start an image builder streaming session.\n"]

module CreateImportedImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DryRunOperationException of dry_run_operation_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_imported_image_request ->
    ( create_imported_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DryRunOperationException of dry_run_operation_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_imported_image_request ->
    ( create_imported_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DryRunOperationException of dry_run_operation_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a custom WorkSpaces Applications image by importing an EC2 AMI. This allows you to use \
   your own customized AMI to create WorkSpaces Applications images that support additional \
   instance types beyond the standard stream.* instances.\n"]

module CreateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_request ->
    ( create_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_request ->
    ( create_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a stack to start streaming applications to users. A stack consists of an associated \
   fleet, user access policies, and storage configurations. \n"]

module CreateStreamingURL : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_streaming_url_request ->
    ( create_streaming_url_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_streaming_url_request ->
    ( create_streaming_url_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a temporary URL to start an WorkSpaces Applications streaming session for the specified \
   user. A streaming URL enables application streaming to be tested without user setup. \n"]

module CreateThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_theme_for_stack_request ->
    ( create_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_theme_for_stack_request ->
    ( create_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates custom branding that customizes the appearance of the streaming application catalog page.\n"]

module CreateUpdatedImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_updated_image_request ->
    ( create_updated_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_updated_image_request ->
    ( create_updated_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new image with the latest Windows operating system updates, driver updates, and \
   WorkSpaces Applications agent software.\n\n\
  \ For more information, see the \"Update an Image by Using Managed WorkSpaces Applications Image \
   Updates\" section in \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/administer-images.html}Administer \
   Your WorkSpaces Applications Images}, in the {i Amazon WorkSpaces Applications Administration \
   Guide}.\n\
  \ "]

module CreateUsageReportSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_usage_report_subscription_request ->
    ( create_usage_report_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_usage_report_subscription_request ->
    ( create_usage_report_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a usage report subscription. Usage reports are generated daily.\n"]

module CreateUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceAlreadyExistsException of resource_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_user_request ->
    ( create_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceAlreadyExistsException of resource_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a new user in the user pool.\n"]

module DeleteAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_request ->
    ( delete_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_request ->
    ( delete_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an app block.\n"]

module DeleteAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_builder_request ->
    ( delete_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_app_block_builder_request ->
    ( delete_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an app block builder.\n\n\
  \ An app block builder can only be deleted when it has no association with an app block.\n\
  \ "]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an application.\n"]

module DeleteDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_config_request ->
    ( delete_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_directory_config_request ->
    ( delete_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified Directory Config object from WorkSpaces Applications. This object \
   includes the information required to join streaming instances to an Active Directory domain.\n"]

module DeleteEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_entitlement_request ->
    ( delete_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified entitlement.\n"]

module DeleteFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_request ->
    ( delete_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_fleet_request ->
    ( delete_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified fleet.\n"]

module DeleteImage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_request ->
    ( delete_image_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified image. You cannot delete an image when it is in use. After you delete an \
   image, you cannot provision new capacity using the image.\n"]

module DeleteImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_builder_request ->
    ( delete_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_builder_request ->
    ( delete_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified image builder and releases the capacity.\n"]

module DeleteImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_image_permissions_request ->
    ( delete_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_image_permissions_request ->
    ( delete_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes permissions for the specified private image. After you delete permissions for an image, \
   AWS accounts to which you previously granted these permissions can no longer use the image.\n"]

module DeleteStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_request ->
    ( delete_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_request ->
    ( delete_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified stack. After the stack is deleted, the application streaming environment \
   provided by the stack is no longer available to users. Also, any reservations made for \
   application streaming sessions for the stack are released.\n"]

module DeleteThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_theme_for_stack_request ->
    ( delete_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_theme_for_stack_request ->
    ( delete_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes custom branding that customizes the appearance of the streaming application catalog page.\n"]

module DeleteUsageReportSubscription : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_report_subscription_request ->
    ( delete_usage_report_subscription_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_usage_report_subscription_request ->
    ( delete_usage_report_subscription_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disables usage report generation.\n"]

module DeleteUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_user_request ->
    ( delete_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a user from the user pool.\n"]

module DescribeAppBlockBuilderAppBlockAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builder_app_block_associations_request ->
    ( describe_app_block_builder_app_block_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builder_app_block_associations_request ->
    ( describe_app_block_builder_app_block_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app block builder associations.\n"]

module DescribeAppBlockBuilders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builders_request ->
    ( describe_app_block_builders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_block_builders_request ->
    ( describe_app_block_builders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app block builders.\n"]

module DescribeAppBlocks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_blocks_request ->
    ( describe_app_blocks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_blocks_request ->
    ( describe_app_blocks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more app blocks.\n"]

module DescribeApplicationFleetAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_fleet_associations_request ->
    ( describe_application_fleet_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_fleet_associations_request ->
    ( describe_application_fleet_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more application fleet associations. Either \
   ApplicationArn or FleetName must be specified.\n"]

module DescribeApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_applications_request ->
    ( describe_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more applications.\n"]

module DescribeAppLicenseUsage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_app_license_usage_request ->
    ( describe_app_license_usage_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_app_license_usage_request ->
    ( describe_app_license_usage_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves license included application usage information.\n"]

module DescribeDirectoryConfigs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_configs_request ->
    ( describe_directory_configs_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_directory_configs_request ->
    ( describe_directory_configs_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified Directory Config objects for WorkSpaces \
   Applications, if the names for these objects are provided. Otherwise, all Directory Config \
   objects in the account are described. These objects include the configuration information \
   required to join fleets and image builders to Microsoft Active Directory domains. \n\n\
  \ Although the response syntax in this topic includes the account password, this password is not \
   returned in the actual response.\n\
  \ "]

module DescribeEntitlements : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entitlements_request ->
    ( describe_entitlements_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entitlements_request ->
    ( describe_entitlements_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one of more entitlements.\n"]

module DescribeFleets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_fleets_request ->
    ( describe_fleets_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_fleets_request ->
    ( describe_fleets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified fleets, if the fleet names are provided. \
   Otherwise, all fleets in the account are described.\n"]

module DescribeImageBuilders : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_builders_request ->
    ( describe_image_builders_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_builders_request ->
    ( describe_image_builders_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified image builders, if the image builder \
   names are provided. Otherwise, all image builders in the account are described.\n"]

module DescribeImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_image_permissions_request ->
    ( describe_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_image_permissions_request ->
    ( describe_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the permissions for shared AWS account IDs on a private image \
   that you own. \n"]

module DescribeImages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_images_request ->
    ( describe_images_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified images, if the image names or image ARNs \
   are provided. Otherwise, all images in the account are described.\n"]

module DescribeSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the streaming sessions for a specified stack and fleet. If a \
   UserId is provided for the stack and fleet, only streaming sessions for that user are \
   described. If an authentication type is not provided, the default is to authenticate users \
   using a streaming URL.\n"]

module DescribeSoftwareAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_software_associations_request ->
    ( describe_software_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_software_associations_request ->
    ( describe_software_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves license included application associations for a specified resource.\n"]

module DescribeStacks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_request ->
    ( describe_stacks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_request ->
    ( describe_stacks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes one or more specified stacks, if the stack names are provided. \
   Otherwise, all stacks in the account are described.\n"]

module DescribeThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_theme_for_stack_request ->
    ( describe_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_theme_for_stack_request ->
    ( describe_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the theme for a specified stack. A theme is custom branding \
   that customizes the appearance of the streaming application catalog page.\n"]

module DescribeUsageReportSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_report_subscriptions_request ->
    ( describe_usage_report_subscriptions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_usage_report_subscriptions_request ->
    ( describe_usage_report_subscriptions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more usage report subscriptions.\n"]

module DescribeUsers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_users_request ->
    ( describe_users_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list that describes one or more specified users in the user pool.\n"]

module DescribeUserStackAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_user_stack_associations_request ->
    ( describe_user_stack_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_user_stack_associations_request ->
    ( describe_user_stack_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list that describes the UserStackAssociation objects. You must specify either or \
   both of the following:\n\n\
  \ {ul\n\
  \       {-  The stack name\n\
  \           \n\
  \            }\n\
  \       {-  The user name (email address of the user associated with the stack) and the \
   authentication type for the user\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DisableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_user_request ->
    ( disable_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_user_request ->
    ( disable_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the specified user in the user pool. Users can't sign in to WorkSpaces Applications \
   until they are re-enabled. This action does not delete the user. \n"]

module DisassociateAppBlockBuilderAppBlock : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_app_block_builder_app_block_request ->
    ( disassociate_app_block_builder_app_block_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_app_block_builder_app_block_request ->
    ( disassociate_app_block_builder_app_block_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates a specified app block builder from a specified app block.\n"]

module DisassociateApplicationFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_fleet_request ->
    ( disassociate_application_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_fleet_request ->
    ( disassociate_application_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified application from the fleet.\n"]

module DisassociateApplicationFromEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_from_entitlement_request ->
    ( disassociate_application_from_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_application_from_entitlement_request ->
    ( disassociate_application_from_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified application from the specified entitlement.\n"]

module DisassociateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fleet_request ->
    ( disassociate_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_fleet_request ->
    ( disassociate_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Disassociates the specified fleet from the specified stack.\n"]

module DisassociateSoftwareFromImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_software_from_image_builder_request ->
    ( disassociate_software_from_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_software_from_image_builder_request ->
    ( disassociate_software_from_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes license included application(s) association(s) from an image builder instance.\n"]

module DrainSessionInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    drain_session_instance_request ->
    ( drain_session_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    drain_session_instance_request ->
    ( drain_session_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Drains the instance hosting the specified streaming session. The instance stops accepting new \
   sessions while existing sessions continue uninterrupted. Once all sessions end, the instance is \
   reclaimed and replaced. This only applies to multi-session fleets.\n"]

module EnableUser : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_user_request ->
    ( enable_user_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_user_request ->
    ( enable_user_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables a user in the user pool. After being enabled, users can sign in to WorkSpaces \
   Applications and open applications from the stacks to which they are assigned.\n"]

module ExpireSession : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    expire_session_request ->
    (expire_session_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    expire_session_request ->
    ( expire_session_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Immediately stops the specified streaming session.\n"]

module GetExportImageTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_export_image_task_request ->
    ( get_export_image_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_export_image_task_request ->
    ( get_export_image_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about an export image task, including its current state, progress, and \
   any error details.\n"]

module ListAssociatedFleets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associated_fleets_request ->
    (list_associated_fleets_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associated_fleets_request ->
    ( list_associated_fleets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the name of the fleet that is associated with the specified stack.\n"]

module ListAssociatedStacks : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associated_stacks_request ->
    (list_associated_stacks_result, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associated_stacks_request ->
    ( list_associated_stacks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the name of the stack with which the specified fleet is associated.\n"]

module ListEntitledApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entitled_applications_request ->
    ( list_entitled_applications_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entitled_applications_request ->
    ( list_entitled_applications_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a list of entitled applications.\n"]

module ListExportImageTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `OperationNotPermittedException of operation_not_permitted_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_export_image_tasks_request ->
    ( list_export_image_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_export_image_tasks_request ->
    ( list_export_image_tasks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `OperationNotPermittedException of operation_not_permitted_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists export image tasks, with optional filtering and pagination. Use this operation to monitor \
   the status of multiple export operations.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of all tags for the specified WorkSpaces Applications resource. You can tag \
   WorkSpaces Applications image builders, images, fleets, and stacks.\n\n\
  \ For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \ "]

module StartAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_app_block_builder_request ->
    ( start_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_app_block_builder_request ->
    ( start_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts an app block builder.\n\n\
  \ An app block builder can only be started when it's associated with an app block.\n\
  \ \n\
  \  Starting an app block builder starts a new instance, which is equivalent to an elastic fleet \
   instance with application builder assistance functionality.\n\
  \  "]

module StartFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_request ->
    ( start_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_fleet_request ->
    ( start_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified fleet.\n"]

module StartImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_image_builder_request ->
    ( start_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_image_builder_request ->
    ( start_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the specified image builder.\n"]

module StartSoftwareDeploymentToImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_software_deployment_to_image_builder_request ->
    ( start_software_deployment_to_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_software_deployment_to_image_builder_request ->
    ( start_software_deployment_to_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initiates license included applications deployment to an image builder instance.\n"]

module StopAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_app_block_builder_request ->
    ( stop_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_app_block_builder_request ->
    ( stop_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an app block builder.\n\n\
  \ Stopping an app block builder terminates the instance, and the instance state is not persisted.\n\
  \ "]

module StopFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_request ->
    ( stop_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_fleet_request ->
    ( stop_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified fleet.\n"]

module StopImageBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_image_builder_request ->
    ( stop_image_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_image_builder_request ->
    ( stop_image_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the specified image builder.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified WorkSpaces Applications resource. You can \
   tag WorkSpaces Applications image builders, images, fleets, and stacks.\n\n\
  \ Each tag consists of a key and an optional value. If a resource already has a tag with the \
   same key, this operation updates its value.\n\
  \ \n\
  \  To list the current tags for your resources, use [ListTagsForResource]. To disassociate tags \
   from your resources, use [UntagResource].\n\
  \  \n\
  \   For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \   "]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates one or more specified tags from the specified WorkSpaces Applications resource.\n\n\
  \ To list the current tags for your resources, use [ListTagsForResource].\n\
  \ \n\
  \  For more information about tags, see \
   {{:https://docs.aws.amazon.com/appstream2/latest/developerguide/tagging-basic.html}Tagging Your \
   Resources} in the {i Amazon WorkSpaces Applications Administration Guide}.\n\
  \  "]

module UpdateAppBlockBuilder : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_app_block_builder_request ->
    ( update_app_block_builder_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_app_block_builder_request ->
    ( update_app_block_builder_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an app block builder.\n\n\
  \ If the app block builder is in the [STARTING] or [STOPPING] state, you can't update it. If the \
   app block builder is in the [RUNNING] state, you can only update the DisplayName and \
   Description. If the app block builder is in the [STOPPED] state, you can update any attribute \
   except the Name.\n\
  \ "]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified application.\n"]

module UpdateDirectoryConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidRoleException of invalid_role_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_directory_config_request ->
    ( update_directory_config_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidRoleException of invalid_role_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_directory_config_request ->
    ( update_directory_config_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidRoleException of invalid_role_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified Directory Config object in WorkSpaces Applications. This object includes \
   the configuration information required to join fleets and image builders to Microsoft Active \
   Directory domains.\n"]

module UpdateEntitlement : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `EntitlementNotFoundException of entitlement_not_found_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_entitlement_request ->
    ( update_entitlement_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_entitlement_request ->
    ( update_entitlement_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `EntitlementNotFoundException of entitlement_not_found_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified entitlement.\n"]

module UpdateFleet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `RequestLimitExceededException of request_limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_request ->
    ( update_fleet_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_fleet_request ->
    ( update_fleet_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `RequestLimitExceededException of request_limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified fleet.\n\n\
  \ If the fleet is in the [STOPPED] state, you can update any attribute except the fleet name.\n\
  \ \n\
  \  If the fleet is in the [RUNNING] state, you can update the following based on the fleet type:\n\
  \  \n\
  \   {ul\n\
  \         {-  Always-On and On-Demand fleet types\n\
  \             \n\
  \              You can update the [DisplayName], [ComputeCapacity], [ImageARN], [ImageName], \
   [IdleDisconnectTimeoutInSeconds], and [DisconnectTimeoutInSeconds] attributes.\n\
  \              \n\
  \               }\n\
  \         {-  Elastic fleet type\n\
  \             \n\
  \              You can update the [DisplayName], [IdleDisconnectTimeoutInSeconds], \
   [DisconnectTimeoutInSeconds], [MaxConcurrentSessions], [SessionScriptS3Location] and \
   [UsbDeviceFilterStrings] attributes.\n\
  \              \n\
  \               }\n\
  \         }\n\
  \   If the fleet is in the [STARTING] or [STOPPED] state, you can't update it.\n\
  \   "]

module UpdateImagePermissions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotAvailableException of resource_not_available_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_image_permissions_request ->
    ( update_image_permissions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_image_permissions_request ->
    ( update_image_permissions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotAvailableException of resource_not_available_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds or updates permissions for the specified private image. \n"]

module UpdateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `IncompatibleImageException of incompatible_image_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `InvalidRoleException of invalid_role_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stack_request ->
    ( update_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stack_request ->
    ( update_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `IncompatibleImageException of incompatible_image_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates the specified fields for the specified stack.\n"]

module UpdateThemeForStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidAccountStatusException of invalid_account_status_exception
    | `InvalidParameterCombinationException of invalid_parameter_combination_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_theme_for_stack_request ->
    ( update_theme_for_stack_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_theme_for_stack_request ->
    ( update_theme_for_stack_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidAccountStatusException of invalid_account_status_exception
      | `InvalidParameterCombinationException of invalid_parameter_combination_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates custom branding that customizes the appearance of the streaming application catalog page.\n"]
