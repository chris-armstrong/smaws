open Types

module ListAssessmentRunAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_run_agents_request ->
    ( list_assessment_run_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_run_agents_request ->
    ( list_assessment_run_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the agents of the assessment runs that are specified by the ARNs of the assessment runs.\n"]

module ListAssessmentRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_runs_request ->
    ( list_assessment_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_runs_request ->
    ( list_assessment_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the assessment runs that correspond to the assessment templates that are specified by the \
   ARNs of the assessment templates.\n"]

module ListAssessmentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_targets_request ->
    ( list_assessment_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_targets_request ->
    ( list_assessment_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the ARNs of the assessment targets within this AWS account. For more information about \
   assessment targets, see \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html}Amazon \
   Inspector Assessment Targets}.\n"]

module ListAssessmentTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_templates_request ->
    ( list_assessment_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_assessment_templates_request ->
    ( list_assessment_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the assessment templates that correspond to the assessment targets that are specified by \
   the ARNs of the assessment targets.\n"]

module ListEventSubscriptions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_event_subscriptions_request ->
    ( list_event_subscriptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_event_subscriptions_request ->
    ( list_event_subscriptions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the event subscriptions for the assessment template that is specified by the ARN of \
   the assessment template. For more information, see [SubscribeToEvent] and \
   [UnsubscribeFromEvent].\n"]

module ListExclusions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_exclusions_request ->
    ( list_exclusions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_exclusions_request ->
    ( list_exclusions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List exclusions that are generated by the assessment run.\n"]

module ListFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_findings_request ->
    ( list_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_findings_request ->
    ( list_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists findings that are generated by the assessment runs that are specified by the ARNs of the \
   assessment runs.\n"]

module ListRulesPackages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rules_packages_request ->
    ( list_rules_packages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rules_packages_request ->
    ( list_rules_packages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all available Amazon Inspector rules packages.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all tags associated with an assessment template.\n"]

module PreviewAgents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    preview_agents_request ->
    ( preview_agents_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    preview_agents_request ->
    ( preview_agents_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Previews the agents installed on the EC2 instances that are part of the specified assessment \
   target.\n"]

module RegisterCrossAccountAccessRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_cross_account_access_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_cross_account_access_role_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers the IAM role that grants Amazon Inspector access to AWS Services needed to perform \
   security assessments.\n"]

module RemoveAttributesFromFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_attributes_from_findings_request ->
    ( remove_attributes_from_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_attributes_from_findings_request ->
    ( remove_attributes_from_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes entire attributes (key and value pairs) from the findings that are specified by the \
   ARNs of the findings where an attribute with the specified key exists.\n"]

module SetTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_tags_for_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_tags_for_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets tags (key and value pairs) to the assessment template that is specified by the ARN of the \
   assessment template.\n"]

module StartAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_assessment_run_request ->
    ( start_assessment_run_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_assessment_run_request ->
    ( start_assessment_run_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AgentsAlreadyRunningAssessmentException of agents_already_running_assessment_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the assessment run specified by the ARN of the assessment template. For this API to \
   function properly, you must not exceed the limit of running up to 500 concurrent agents per AWS \
   account.\n"]

module StopAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stops the assessment run that is specified by the ARN of the assessment run.\n"]

module SubscribeToEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    subscribe_to_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    subscribe_to_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables the process of sending Amazon Simple Notification Service (SNS) notifications about a \
   specified event to a specified SNS topic.\n"]

module UnsubscribeFromEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_from_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unsubscribe_from_event_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables the process of sending Amazon Simple Notification Service (SNS) notifications about a \
   specified event to a specified SNS topic.\n"]

module UpdateAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the assessment target that is specified by the ARN of the assessment target.\n\n\
  \ If resourceGroupArn is not specified, all EC2 instances in the current AWS account and region \
   are included in the assessment target.\n\
  \ "]

module GetTelemetryMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_telemetry_metadata_request ->
    ( get_telemetry_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_telemetry_metadata_request ->
    ( get_telemetry_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Information about the data that is collected for the specified assessment run.\n"]

module GetExclusionsPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_exclusions_preview_request ->
    ( get_exclusions_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_exclusions_preview_request ->
    ( get_exclusions_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the exclusions preview (a list of ExclusionPreview objects) specified by the preview \
   token. You can obtain the preview token by running the CreateExclusionsPreview API.\n"]

module GetAssessmentReport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
    | `UnsupportedFeatureException of unsupported_feature_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_assessment_report_request ->
    ( get_assessment_report_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_assessment_report_request ->
    ( get_assessment_report_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception
      | `UnsupportedFeatureException of unsupported_feature_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Produces an assessment report that includes detailed and comprehensive results of a specified \
   assessment run. \n"]

module DescribeRulesPackages : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_packages_request ->
    ( describe_rules_packages_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_rules_packages_request ->
    ( describe_rules_packages_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the rules packages that are specified by the ARNs of the rules packages.\n"]

module DescribeResourceGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_groups_request ->
    ( describe_resource_groups_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_groups_request ->
    ( describe_resource_groups_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the resource groups that are specified by the ARNs of the resource groups.\n"]

module DescribeFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_findings_request ->
    ( describe_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_findings_request ->
    ( describe_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the findings that are specified by the ARNs of the findings.\n"]

module DescribeExclusions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_exclusions_request ->
    ( describe_exclusions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_exclusions_request ->
    ( describe_exclusions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the exclusions that are specified by the exclusions' ARNs.\n"]

module DescribeCrossAccountAccessRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_cross_account_access_role_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_cross_account_access_role_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalException of internal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the IAM role that enables Amazon Inspector to access your AWS account.\n"]

module DescribeAssessmentTemplates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_templates_request ->
    ( describe_assessment_templates_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_templates_request ->
    ( describe_assessment_templates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment templates that are specified by the ARNs of the assessment templates.\n"]

module DescribeAssessmentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_targets_request ->
    ( describe_assessment_targets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_targets_request ->
    ( describe_assessment_targets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment targets that are specified by the ARNs of the assessment targets.\n"]

module DescribeAssessmentRuns : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_runs_request ->
    ( describe_assessment_runs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_assessment_runs_request ->
    ( describe_assessment_runs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the assessment runs that are specified by the ARNs of the assessment runs.\n"]

module DeleteAssessmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_template_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the assessment template that is specified by the ARN of the assessment template.\n"]

module DeleteAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_target_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the assessment target that is specified by the ARN of the assessment target.\n"]

module DeleteAssessmentRun : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `AssessmentRunInProgressException of assessment_run_in_progress_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_assessment_run_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `AssessmentRunInProgressException of assessment_run_in_progress_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the assessment run that is specified by the ARN of the assessment run.\n"]

module CreateResourceGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resource_group_request ->
    ( create_resource_group_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resource_group_request ->
    ( create_resource_group_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a resource group using the specified set of tags (key and value pairs) that are used to \
   select the EC2 instances to be included in an Amazon Inspector assessment target. The created \
   resource group is then used to create an Amazon Inspector assessment target. For more \
   information, see [CreateAssessmentTarget].\n"]

module CreateExclusionsPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_exclusions_preview_request ->
    ( create_exclusions_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_exclusions_preview_request ->
    ( create_exclusions_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `PreviewGenerationInProgressException of preview_generation_in_progress_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the generation of an exclusions preview for the specified assessment template. The \
   exclusions preview lists the potential exclusions (ExclusionPreview) that Inspector can detect \
   before it runs the assessment. \n"]

module CreateAssessmentTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_template_request ->
    ( create_assessment_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_template_request ->
    ( create_assessment_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an assessment template for the assessment target that is specified by the ARN of the \
   assessment target. If the \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html}service-linked \
   role} isn\226\128\153t already registered, this action also creates and registers a \
   service-linked role to grant Amazon Inspector access to AWS Services needed to perform security \
   assessments.\n"]

module CreateAssessmentTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
    | `InvalidInputException of invalid_input_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_target_request ->
    ( create_assessment_target_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_assessment_target_request ->
    ( create_assessment_target_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidCrossAccountRoleException of invalid_cross_account_role_exception
      | `InvalidInputException of invalid_input_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new assessment target using the ARN of the resource group that is generated by \
   [CreateResourceGroup]. If resourceGroupArn is not specified, all EC2 instances in the current \
   AWS account and region are included in the assessment target. If the \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_slr.html}service-linked \
   role} isn\226\128\153t already registered, this action also creates and registers a \
   service-linked role to grant Amazon Inspector access to AWS Services needed to perform security \
   assessments. You can create up to 50 assessment targets per AWS account. You can run up to 500 \
   concurrent agents per AWS account. For more information, see \
   {{:https://docs.aws.amazon.com/inspector/latest/userguide/inspector_applications.html} Amazon \
   Inspector Assessment Targets}.\n"]

module AddAttributesToFindings : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalException of internal_exception
    | `InvalidInputException of invalid_input_exception
    | `NoSuchEntityException of no_such_entity_exception
    | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_attributes_to_findings_request ->
    ( add_attributes_to_findings_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_attributes_to_findings_request ->
    ( add_attributes_to_findings_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalException of internal_exception
      | `InvalidInputException of invalid_input_exception
      | `NoSuchEntityException of no_such_entity_exception
      | `ServiceTemporarilyUnavailableException of service_temporarily_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Assigns attributes (key and value pairs) to the findings that are specified by the ARNs of the \
   findings.\n"]
