(** CloudControl client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_progress_event :
  ?retry_after:timestamp ->
  ?error_code:handler_error_code ->
  ?status_message:status_message ->
  ?resource_model:properties ->
  ?event_time:timestamp ->
  ?operation_status:operation_status ->
  ?operation:operation ->
  ?hooks_request_token:request_token ->
  ?request_token:request_token ->
  ?identifier:identifier ->
  ?type_name:type_name ->
  unit ->
  progress_event

val make_update_resource_output : ?progress_event:progress_event -> unit -> update_resource_output

val make_update_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  patch_document:patch_document ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  update_resource_input

val make_resource_request_status_filter :
  ?operation_statuses:operation_statuses ->
  ?operations:operations ->
  unit ->
  resource_request_status_filter

val make_resource_description :
  ?properties:properties -> ?identifier:identifier -> unit -> resource_description

val make_list_resources_output :
  ?next_token:handler_next_token ->
  ?resource_descriptions:resource_descriptions ->
  ?type_name:type_name ->
  unit ->
  list_resources_output

val make_list_resources_input :
  ?resource_model:properties ->
  ?max_results:max_results ->
  ?next_token:handler_next_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  type_name:type_name ->
  unit ->
  list_resources_input

val make_list_resource_requests_output :
  ?next_token:next_token ->
  ?resource_request_status_summaries:resource_request_status_summaries ->
  unit ->
  list_resource_requests_output

val make_list_resource_requests_input :
  ?resource_request_status_filter:resource_request_status_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resource_requests_input

val make_hook_progress_event :
  ?failure_mode:hook_failure_mode ->
  ?hook_status_message:status_message ->
  ?hook_event_time:timestamp ->
  ?hook_status:hook_status ->
  ?invocation_point:hook_invocation_point ->
  ?hook_type_arn:hook_type_arn ->
  ?hook_type_version_id:type_version_id ->
  ?hook_type_name:type_name ->
  unit ->
  hook_progress_event

val make_get_resource_request_status_output :
  ?hooks_progress_event:hooks_progress_event ->
  ?progress_event:progress_event ->
  unit ->
  get_resource_request_status_output

val make_get_resource_request_status_input :
  request_token:request_token -> unit -> get_resource_request_status_input

val make_get_resource_output :
  ?resource_description:resource_description -> ?type_name:type_name -> unit -> get_resource_output

val make_get_resource_input :
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  get_resource_input

val make_delete_resource_output : ?progress_event:progress_event -> unit -> delete_resource_output

val make_delete_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  identifier:identifier ->
  type_name:type_name ->
  unit ->
  delete_resource_input

val make_create_resource_output : ?progress_event:progress_event -> unit -> create_resource_output

val make_create_resource_input :
  ?client_token:client_token ->
  ?role_arn:role_arn ->
  ?type_version_id:type_version_id ->
  desired_state:properties ->
  type_name:type_name ->
  unit ->
  create_resource_input

val make_cancel_resource_request_output :
  ?progress_event:progress_event -> unit -> cancel_resource_request_output

val make_cancel_resource_request_input :
  request_token:request_token -> unit -> cancel_resource_request_input
(** {1:operations Operations} *)

module CancelResourceRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `RequestTokenNotFoundException of request_token_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_resource_request_input ->
    ( cancel_resource_request_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `RequestTokenNotFoundException of request_token_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_resource_request_input ->
    ( cancel_resource_request_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `RequestTokenNotFoundException of request_token_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels the specified resource operation request. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-cancel}Canceling \
   resource operation requests} in the {i Amazon Web Services Cloud Control API User Guide}.\n\n\
  \ Only resource operations requests with a status of [PENDING] or [IN_PROGRESS] can be canceled.\n\
  \ "]

module CreateResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ClientTokenConflictException of client_token_conflict_exception
    | `ConcurrentOperationException of concurrent_operation_exception
    | `GeneralServiceException of general_service_exception
    | `HandlerFailureException of handler_failure_exception
    | `HandlerInternalFailureException of handler_internal_failure_exception
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidRequestException of invalid_request_exception
    | `NetworkFailureException of network_failure_exception
    | `NotStabilizedException of not_stabilized_exception
    | `NotUpdatableException of not_updatable_exception
    | `PrivateTypeException of private_type_exception
    | `ResourceConflictException of resource_conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceInternalErrorException of service_internal_error_exception
    | `ServiceLimitExceededException of service_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TypeNotFoundException of type_not_found_exception
    | `UnsupportedActionException of unsupported_action_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resource_input ->
    ( create_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resource_input ->
    ( create_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates the specified resource. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-create.html}Creating \
   a resource} in the {i Amazon Web Services Cloud Control API User Guide}.\n\n\
  \ After you have initiated a resource creation request, you can monitor the progress of your \
   request by calling \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
   using the [RequestToken] of the [ProgressEvent] type returned by [CreateResource].\n\
  \ "]

module DeleteResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ClientTokenConflictException of client_token_conflict_exception
    | `ConcurrentOperationException of concurrent_operation_exception
    | `GeneralServiceException of general_service_exception
    | `HandlerFailureException of handler_failure_exception
    | `HandlerInternalFailureException of handler_internal_failure_exception
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidRequestException of invalid_request_exception
    | `NetworkFailureException of network_failure_exception
    | `NotStabilizedException of not_stabilized_exception
    | `NotUpdatableException of not_updatable_exception
    | `PrivateTypeException of private_type_exception
    | `ResourceConflictException of resource_conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceInternalErrorException of service_internal_error_exception
    | `ServiceLimitExceededException of service_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TypeNotFoundException of type_not_found_exception
    | `UnsupportedActionException of unsupported_action_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_input ->
    ( delete_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_input ->
    ( delete_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified resource. For details, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-delete.html}Deleting \
   a resource} in the {i Amazon Web Services Cloud Control API User Guide}.\n\n\
  \ After you have initiated a resource deletion request, you can monitor the progress of your \
   request by calling \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
   using the [RequestToken] of the [ProgressEvent] returned by [DeleteResource].\n\
  \ "]

module GetResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `GeneralServiceException of general_service_exception
    | `HandlerFailureException of handler_failure_exception
    | `HandlerInternalFailureException of handler_internal_failure_exception
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidRequestException of invalid_request_exception
    | `NetworkFailureException of network_failure_exception
    | `NotStabilizedException of not_stabilized_exception
    | `NotUpdatableException of not_updatable_exception
    | `PrivateTypeException of private_type_exception
    | `ResourceConflictException of resource_conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceInternalErrorException of service_internal_error_exception
    | `ServiceLimitExceededException of service_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TypeNotFoundException of type_not_found_exception
    | `UnsupportedActionException of unsupported_action_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_input ->
    ( get_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_input ->
    ( get_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the current state of the specified resource. For details, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-read.html}Reading \
   a resource's current state}.\n\n\
  \ You can use this action to return information about an existing resource in your account and \
   Amazon Web Services Region, whether those resources were provisioned using Cloud Control API.\n\
  \ "]

module GetResourceRequestStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `RequestTokenNotFoundException of request_token_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_request_status_input ->
    ( get_resource_request_status_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestTokenNotFoundException of request_token_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_request_status_input ->
    ( get_resource_request_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `RequestTokenNotFoundException of request_token_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the current status of a resource operation request. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-track}Tracking \
   the progress of resource operation requests} in the {i Amazon Web Services Cloud Control API \
   User Guide}.\n"]

module ListResourceRequests : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_requests_input ->
    (list_resource_requests_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_requests_input ->
    ( list_resource_requests_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns existing resource operation requests. This includes requests of all status types. For \
   more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-manage-requests.html#resource-operations-manage-requests-list}Listing \
   active resource operation requests} in the {i Amazon Web Services Cloud Control API User \
   Guide}.\n\n\
  \  Resource operation requests expire after 7 days.\n\
  \  \n\
  \   "]

module ListResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `GeneralServiceException of general_service_exception
    | `HandlerFailureException of handler_failure_exception
    | `HandlerInternalFailureException of handler_internal_failure_exception
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidRequestException of invalid_request_exception
    | `NetworkFailureException of network_failure_exception
    | `NotStabilizedException of not_stabilized_exception
    | `NotUpdatableException of not_updatable_exception
    | `PrivateTypeException of private_type_exception
    | `ResourceConflictException of resource_conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceInternalErrorException of service_internal_error_exception
    | `ServiceLimitExceededException of service_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TypeNotFoundException of type_not_found_exception
    | `UnsupportedActionException of unsupported_action_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resources_input ->
    ( list_resources_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resources_input ->
    ( list_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the specified resources. For more information, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-list.html}Discovering \
   resources} in the {i Amazon Web Services Cloud Control API User Guide}.\n\n\
  \ You can use this action to return information about existing resources in your account and \
   Amazon Web Services Region, whether those resources were provisioned using Cloud Control API.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module UpdateResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `ClientTokenConflictException of client_token_conflict_exception
    | `ConcurrentOperationException of concurrent_operation_exception
    | `GeneralServiceException of general_service_exception
    | `HandlerFailureException of handler_failure_exception
    | `HandlerInternalFailureException of handler_internal_failure_exception
    | `InvalidCredentialsException of invalid_credentials_exception
    | `InvalidRequestException of invalid_request_exception
    | `NetworkFailureException of network_failure_exception
    | `NotStabilizedException of not_stabilized_exception
    | `NotUpdatableException of not_updatable_exception
    | `PrivateTypeException of private_type_exception
    | `ResourceConflictException of resource_conflict_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceInternalErrorException of service_internal_error_exception
    | `ServiceLimitExceededException of service_limit_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `TypeNotFoundException of type_not_found_exception
    | `UnsupportedActionException of unsupported_action_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resource_input ->
    ( update_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resource_input ->
    ( update_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `ClientTokenConflictException of client_token_conflict_exception
      | `ConcurrentOperationException of concurrent_operation_exception
      | `GeneralServiceException of general_service_exception
      | `HandlerFailureException of handler_failure_exception
      | `HandlerInternalFailureException of handler_internal_failure_exception
      | `InvalidCredentialsException of invalid_credentials_exception
      | `InvalidRequestException of invalid_request_exception
      | `NetworkFailureException of network_failure_exception
      | `NotStabilizedException of not_stabilized_exception
      | `NotUpdatableException of not_updatable_exception
      | `PrivateTypeException of private_type_exception
      | `ResourceConflictException of resource_conflict_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceInternalErrorException of service_internal_error_exception
      | `ServiceLimitExceededException of service_limit_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `TypeNotFoundException of type_not_found_exception
      | `UnsupportedActionException of unsupported_action_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified property values in the resource.\n\n\
  \ You specify your resource property updates as a list of patch operations contained in a JSON \
   patch document that adheres to the {{:https://datatracker.ietf.org/doc/html/rfc6902} {i RFC \
   6902 - JavaScript Object Notation (JSON) Patch} } standard.\n\
  \ \n\
  \  For details on how Cloud Control API performs resource update operations, see \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/userguide/resource-operations-update.html}Updating \
   a resource} in the {i Amazon Web Services Cloud Control API User Guide}.\n\
  \  \n\
  \   After you have initiated a resource update request, you can monitor the progress of your \
   request by calling \
   {{:https://docs.aws.amazon.com/cloudcontrolapi/latest/APIReference/API_GetResourceRequestStatus.html}GetResourceRequestStatus} \
   using the [RequestToken] of the [ProgressEvent] returned by [UpdateResource].\n\
  \   \n\
  \    For more information about the properties of a specific resource, refer to the related \
   topic for the resource in the \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Resource \
   and property types reference} in the {i CloudFormation Users Guide}.\n\
  \    "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
