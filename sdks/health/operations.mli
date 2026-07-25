open Types

module DescribeAffectedAccountsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_accounts_for_organization_request ->
    ( describe_affected_accounts_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_accounts_for_organization_request ->
    ( describe_affected_accounts_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of accounts in the organization from Organizations that are affected by the \
   provided event. For more information about the different types of Health events, see \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event}. \n\n\
  \ Before you can call this operation, you must first enable Health to work with Organizations. \
   To do this, call the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html}EnableHealthServiceAccessForOrganization} \
   operation from your organization's management account.\n\
  \ \n\
  \   This API operation uses pagination. Specify the [nextToken] parameter in the next request to \
   return more results.\n\
  \   \n\
  \    "]

module DescribeAffectedEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationToken of invalid_pagination_token
    | `UnsupportedLocale of unsupported_locale ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_entities_request ->
    ( describe_affected_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_entities_request ->
    ( describe_affected_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of entities that have been affected by the specified events, based on the \
   specified filter criteria. Entities can refer to individual customer resources, groups of \
   customer resources, or any other construct, depending on the Amazon Web Services service. \
   Events that have impact beyond that of the affected entities, or where the extent of impact is \
   unknown, include at least one entity indicating this.\n\n\
  \ At least one event ARN is required.\n\
  \ \n\
  \   {ul\n\
  \         {-  This API operation uses pagination. Specify the [nextToken] parameter in the next \
   request to return more results.\n\
  \             \n\
  \              }\n\
  \         {-  This operation supports resource-level permissions. You can use this operation to \
   allow or deny access to specific Health events. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions}Resource- \
   and action-based conditions} in the {i Health User Guide}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DescribeAffectedEntitiesForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationToken of invalid_pagination_token
    | `UnsupportedLocale of unsupported_locale ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_entities_for_organization_request ->
    ( describe_affected_entities_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_affected_entities_for_organization_request ->
    ( describe_affected_entities_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of entities that have been affected by one or more events for one or more \
   accounts in your organization in Organizations, based on the filter criteria. Entities can \
   refer to individual customer resources, groups of customer resources, or any other construct, \
   depending on the Amazon Web Services service.\n\n\
  \ At least one event Amazon Resource Name (ARN) and account ID are required.\n\
  \ \n\
  \  Before you can call this operation, you must first enable Health to work with Organizations. \
   To do this, call the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html}EnableHealthServiceAccessForOrganization} \
   operation from your organization's management account.\n\
  \  \n\
  \    {ul\n\
  \          {-  This API operation uses pagination. Specify the [nextToken] parameter in the next \
   request to return more results.\n\
  \              \n\
  \               }\n\
  \          {-  This operation doesn't support resource-level permissions. You can't use this \
   operation to allow or deny access to specific Health events. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions}Resource- \
   and action-based conditions} in the {i Health User Guide}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DescribeEntityAggregates : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_aggregates_request ->
    (describe_entity_aggregates_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_aggregates_request ->
    ( describe_entity_aggregates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns the number of entities that are affected by each of the specified events.\n"]

module DescribeEntityAggregatesForOrganization : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_aggregates_for_organization_request ->
    ( describe_entity_aggregates_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_entity_aggregates_for_organization_request ->
    ( describe_entity_aggregates_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of entity aggregates for your Organizations that are affected by each of the \
   specified events.\n"]

module DescribeEventAggregates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_aggregates_request ->
    ( describe_event_aggregates_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_aggregates_request ->
    ( describe_event_aggregates_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidPaginationToken of invalid_pagination_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the number of events of each event type (issue, scheduled change, and account \
   notification). If no filter is specified, the counts of all events in each category are \
   returned.\n\n\
  \  This API operation uses pagination. Specify the [nextToken] parameter in the next request to \
   return more results.\n\
  \  \n\
  \   "]

module DescribeEventDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_details_request ->
    ( describe_event_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_details_request ->
    ( describe_event_details_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about one or more specified events. Information includes standard \
   event data (Amazon Web Services Region, service, and so on, as returned by \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEvents.html}DescribeEvents}), \
   a detailed event description, and possible additional metadata that depends upon the nature of \
   the event. Affected entities are not included. To retrieve the entities, use the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html}DescribeAffectedEntities} \
   operation.\n\n\
  \ If a specified event can't be retrieved, an error message is returned for that event.\n\
  \ \n\
  \   This operation supports resource-level permissions. You can use this operation to allow or \
   deny access to specific Health events. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions}Resource- \
   and action-based conditions} in the {i Health User Guide}.\n\
  \   \n\
  \    "]

module DescribeEventDetailsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_details_for_organization_request ->
    ( describe_event_details_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_details_for_organization_request ->
    ( describe_event_details_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about one or more specified events for one or more Amazon Web \
   Services accounts in your organization. This information includes standard event data (such as \
   the Amazon Web Services Region and service), an event description, and (depending on the event) \
   possible metadata. This operation doesn't return affected entities, such as the resources \
   related to the event. To return affected entities, use the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html}DescribeAffectedEntitiesForOrganization} \
   operation.\n\n\
  \  Before you can call this operation, you must first enable Health to work with Organizations. \
   To do this, call the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html}EnableHealthServiceAccessForOrganization} \
   operation from your organization's management account.\n\
  \  \n\
  \    When you call the [DescribeEventDetailsForOrganization] operation, specify the \
   [organizationEventDetailFilters] object in the request. Depending on the Health event type, \
   note the following differences:\n\
  \    \n\
  \     {ul\n\
  \           {-  To return event details for a public event, you must specify a null value for \
   the [awsAccountId] parameter. If you specify an account ID for a public event, Health returns \
   an error message because public events aren't specific to an account.\n\
  \               \n\
  \                }\n\
  \           {-  To return event details for an event that is specific to an account in your \
   organization, you must specify the [awsAccountId] parameter in the request. If you don't \
   specify an account ID, Health returns an error message because the event is specific to an \
   account in your organization. \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event}.\n\
  \   \n\
  \     This operation doesn't support resource-level permissions. You can't use this operation to \
   allow or deny access to specific Health events. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html#resource-action-based-conditions}Resource- \
   and action-based conditions} in the {i Health User Guide}.\n\
  \     \n\
  \      "]

module DescribeEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationToken of invalid_pagination_token
    | `UnsupportedLocale of unsupported_locale ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_request ->
    ( describe_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_request ->
    ( describe_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Returns information about events that meet the specified filter criteria. Events are returned \
   in a summary form and do not include the detailed description, any additional metadata that \
   depends on the event type, or any affected resources. To retrieve that information, use the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetails.html}DescribeEventDetails} \
   and \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntities.html}DescribeAffectedEntities} \
   operations.\n\n\
  \ If no filter criteria are specified, all events are returned. Results are sorted by \
   [lastModifiedTime], starting with the most recent event.\n\
  \ \n\
  \   {ul\n\
  \         {-  When you call the [DescribeEvents] operation and specify an entity for the \
   [entityValues] parameter, Health might return public events that aren't specific to that \
   resource. For example, if you call [DescribeEvents] and specify an ID for an Amazon Elastic \
   Compute Cloud (Amazon EC2) instance, Health might return events that aren't specific to that \
   resource or service. To get events that are specific to a service, use the [services] parameter \
   in the [filter] object. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event}.\n\
  \             \n\
  \              }\n\
  \         {-  This API operation uses pagination. Specify the [nextToken] parameter in the next \
   request to return more results.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DescribeEventsForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationToken of invalid_pagination_token
    | `UnsupportedLocale of unsupported_locale ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_for_organization_request ->
    ( describe_events_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_for_organization_request ->
    ( describe_events_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about events across your organization in Organizations. You can use \
   the[filters] parameter to specify the events that you want to return. Events are returned in a \
   summary form and don't include the affected accounts, detailed description, any additional \
   metadata that depends on the event type, or any affected resources. To retrieve that \
   information, use the following operations:\n\n\
  \ {ul\n\
  \       {-   \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedAccountsForOrganization.html}DescribeAffectedAccountsForOrganization} \n\
  \           \n\
  \            }\n\
  \       {-   \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeEventDetailsForOrganization.html}DescribeEventDetailsForOrganization} \n\
  \           \n\
  \            }\n\
  \       {-   \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_DescribeAffectedEntitiesForOrganization.html}DescribeAffectedEntitiesForOrganization} \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   If you don't specify a [filter], the [DescribeEventsForOrganizations] returns all events \
   across your organization. Results are sorted by [lastModifiedTime], starting with the most \
   recent event. \n\
  \   \n\
  \    For more information about the different types of Health events, see \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_Event.html}Event}.\n\
  \    \n\
  \     Before you can call this operation, you must first enable Health to work with \
   Organizations. To do this, call the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EnableHealthServiceAccessForOrganization.html}EnableHealthServiceAccessForOrganization} \
   operation from your organization's management account.\n\
  \     \n\
  \       This API operation uses pagination. Specify the [nextToken] parameter in the next \
   request to return more results.\n\
  \       \n\
  \        "]

module DescribeEventTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidPaginationToken of invalid_pagination_token
    | `UnsupportedLocale of unsupported_locale ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_event_types_request ->
    ( describe_event_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_event_types_request ->
    ( describe_event_types_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidPaginationToken of invalid_pagination_token
      | `UnsupportedLocale of unsupported_locale ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the event types that meet the specified filter criteria. You can use this API operation \
   to find information about the Health event, such as the category, Amazon Web Services service, \
   and event code. The metadata for each event appears in the \
   {{:https://docs.aws.amazon.com/health/latest/APIReference/API_EventType.html}EventType} object. \
   \n\n\
  \ If you don't specify a filter criteria, the API operation returns all event types, in no \
   particular order. \n\
  \ \n\
  \   This API operation uses pagination. Specify the [nextToken] parameter in the next request to \
   return more results.\n\
  \   \n\
  \    "]

module DescribeHealthServiceStatusForOrganization : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_health_service_status_for_organization_response,
      [> Smaws_Lib.Protocols.AwsJson.error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( describe_health_service_status_for_organization_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation provides status information on enabling or disabling Health to work with your \
   organization. To call this operation, you must use the organization's management account.\n"]

module DisableHealthServiceAccessForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables Health from working with Organizations. To call this operation, you must sign in to \
   the organization's management account. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html}Aggregating Health \
   events} in the {i Health User Guide}.\n\n\
  \ This operation doesn't remove the service-linked role from the management account in your \
   organization. You must use the IAM console, API, or Command Line Interface (CLI) to remove the \
   service-linked role. For more information, see \
   {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/using-service-linked-roles.html#delete-service-linked-role}Deleting \
   a Service-Linked Role} in the {i IAM User Guide}.\n\
  \ \n\
  \   You can also disable the organizational feature by using the Organizations \
   {{:https://docs.aws.amazon.com/organizations/latest/APIReference/API_DisableAWSServiceAccess.html}DisableAWSServiceAccess} \
   API operation. After you call this operation, Health stops aggregating events for all other \
   Amazon Web Services accounts in your organization. If you call the Health API operations for \
   organizational view, Health returns an error. Health continues to aggregate health events for \
   your Amazon Web Services account.\n\
  \   \n\
  \    "]

module EnableHealthServiceAccessForOrganization : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables Health to work with Organizations. You can use the organizational view feature to \
   aggregate events from all Amazon Web Services accounts in your organization in a centralized \
   location. \n\n\
  \ This operation also creates a service-linked role for the management account in the \
   organization. \n\
  \ \n\
  \   To call this operation, you must meet the following requirements:\n\
  \   \n\
  \    {ul\n\
  \          {-  You must have a Business, Enterprise On-Ramp, or Enterprise Support plan from \
   {{:http://aws.amazon.com/premiumsupport/}Amazon Web Services Support} to use the Health API. If \
   you call the Health API from an Amazon Web Services account that doesn't have a Business, \
   Enterprise On-Ramp, or Enterprise Support plan, you receive a [SubscriptionRequiredException] \
   error.\n\
  \              \n\
  \               }\n\
  \          {-  You must have permission to call this operation from the organization's \
   management account. For example IAM policies, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/security_iam_id-based-policy-examples.html}Health \
   identity-based policy examples}.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \    If you don't have the required support plan, you can instead use the Health console to \
   enable the organizational view feature. For more information, see \
   {{:https://docs.aws.amazon.com/health/latest/ug/aggregate-events.html}Aggregating Health \
   events} in the {i Health User Guide}.\n\
  \    "]
