open Types

module CreateAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_automation_rule_request ->
    ( create_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_automation_rule_request ->
    ( create_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a new automation rule to apply recommended actions to resources based on specified \
   criteria. \n"]

module DeleteAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_automation_rule_request ->
    ( delete_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_automation_rule_request ->
    ( delete_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an existing automation rule. \n"]

module DisassociateAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_accounts_request ->
    ( disassociate_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_accounts_request ->
    ( disassociate_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Disassociates member accounts from your organization's management account, removing \
   centralized automation capabilities. Once disassociated, organization rules no longer apply to \
   the member account, and the management account (or delegated administrator) cannot create \
   Automation rules for that account. \n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]

module GetAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_automation_event_request ->
    ( get_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_automation_event_request ->
    ( get_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details about a specific automation event. \n"]

module GetAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_automation_rule_request ->
    ( get_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_automation_rule_request ->
    ( get_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details about a specific automation rule. \n"]

module GetEnrollmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_configuration_request ->
    ( get_enrollment_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_configuration_request ->
    ( get_enrollment_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves the current enrollment configuration for Compute Optimizer Automation. \n"]

module ListAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the accounts in your organization that are enrolled in Compute Optimizer and whether \
   they have enabled Automation. \n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]

module ListAutomationEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_events_request ->
    ( list_automation_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_events_request ->
    ( list_automation_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists automation events based on specified filters. You can retrieve events that were created \
   within the past year. \n"]

module ListAutomationEventSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_steps_request ->
    ( list_automation_event_steps_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_steps_request ->
    ( list_automation_event_steps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the steps for a specific automation event. You can only list steps for events created \
   within the past year. \n"]

module ListAutomationEventSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_summaries_request ->
    ( list_automation_event_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_summaries_request ->
    ( list_automation_event_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a summary of automation events based on specified filters. Only events created within \
   the past year will be included in the summary. \n"]

module ListAutomationRulePreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_request ->
    ( list_automation_rule_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_request ->
    ( list_automation_rule_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a preview of the recommended actions that match your Automation rule's configuration \
   and criteria. \n"]

module ListAutomationRulePreviewSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_summaries_request ->
    ( list_automation_rule_preview_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_summaries_request ->
    ( list_automation_rule_preview_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a summary of the recommended actions that match your rule preview configuration and \
   criteria. \n"]

module ListAutomationRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rules_request ->
    ( list_automation_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rules_request ->
    ( list_automation_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the automation rules that match specified filters. \n"]

module ListRecommendedActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the recommended actions based that match specified filters. \n\n\
  \  Management accounts and delegated administrators can retrieve recommended actions that \
   include associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module ListRecommendedActionSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_action_summaries_request ->
    ( list_recommended_action_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_action_summaries_request ->
    ( list_recommended_action_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Provides a summary of recommended actions based on specified filters. \n\n\
  \  Management accounts and delegated administrators can retrieve recommended actions that \
   include associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the tags for a specified resource. \n"]

module RollbackAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_automation_event_request ->
    ( rollback_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_automation_event_request ->
    ( rollback_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Initiates a rollback for a completed automation event. \n\n\
  \  Management accounts and delegated administrators can only initiate a rollback for events \
   belonging to associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module StartAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_automation_event_request ->
    ( start_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_automation_event_request ->
    ( start_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Initiates a one-time, on-demand automation for the specified recommended action. \n\n\
  \  Management accounts and delegated administrators can only initiate recommended actions for \
   associated member accounts. You can associate a member account using [AssociateAccounts].\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Adds tags to the specified resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes tags from the specified resource. \n"]

module UpdateAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_automation_rule_request ->
    ( update_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_automation_rule_request ->
    ( update_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates an existing automation rule. \n"]

module UpdateEnrollmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_configuration_request ->
    ( update_enrollment_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_configuration_request ->
    ( update_enrollment_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates your account\226\128\153s Compute Optimizer Automation enrollment configuration. \n"]

module AssociateAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_accounts_request ->
    ( associate_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_accounts_request ->
    ( associate_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates one or more member accounts with your organization's management account, enabling \
   centralized implementation of optimization actions across those accounts. Once associated, the \
   management account (or a delegated administrator) can apply recommended actions to the member \
   account. When you associate a member account, its organization rule mode is automatically set \
   to \"Any allowed,\" which permits the management account to create Automation rules that \
   automatically apply actions to that account. If the member account has not previously enabled \
   the Automation feature, the association process automatically enables it.\n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]
