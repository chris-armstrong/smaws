open Types
module ActivateEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      activate_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Activates a partner event source that has been deactivated. Once activated, your matching event bus will start receiving events from the event source.\n"]
module CancelReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_replay_request ->
        (cancel_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `IllegalStatusException of illegal_status_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Cancels the specified replay.\n"]
module CreateApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_destination_request ->
        (create_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.\n\n API destinations do not support private destinations, such as interface VPC endpoints.\n \n  For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html}API destinations} in the {i EventBridge User Guide}.\n  "]
module CreateArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_archive_request ->
        (create_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates an archive of events with the specified settings. When you create an archive, incoming events might not immediately start being sent to the archive. Allow a short period of time for changes to take effect. If you do not specify a pattern to filter events sent to the archive, all events are sent to the archive except replayed events. Replayed events are not sent to an archive.\n\n  If you have specified that EventBridge use a customer managed key for encrypting the source event bus, we strongly recommend you also specify a customer managed key for any archives for the event bus as well. \n  \n   For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/encryption-archives.html}Encrypting archives} in the {i Amazon EventBridge User Guide}.\n   \n    "]
module CreateConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception ]) result
end[@@ocaml.doc
     "Creates a connection. A connection defines the authorization type and credentials to use for authorization with an API destination HTTP endpoint.\n\n For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-target-connection.html}Connections for endpoint targets} in the {i Amazon EventBridge User Guide}.\n "]
module CreateEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_endpoint_request ->
        (create_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Creates a global endpoint. Global endpoints improve your application's availability by making it regional-fault tolerant. To do this, you define a primary and secondary Region with event buses in each Region. You also create a Amazon Route\194\16053 health check that will tell EventBridge to route events to the secondary Region when an \"unhealthy\" state is encountered and events will be routed back to the primary Region when the health check reports a \"healthy\" state.\n"]
module CreateEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_bus_request ->
        (create_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates a new event bus within your account. This can be a custom event bus which you can use to receive events from your custom applications and services, or it can be a partner event bus which can be matched to a partner event source.\n"]
module CreatePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_partner_event_source_request ->
        (create_partner_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web Services customers.\n\n Each partner event source can be used by one Amazon Web Services account to create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create one partner event source for each Amazon Web Services account that wants to receive those event types. \n \n  A partner event source creates events based on resources within the SaaS partner's service or application.\n  \n   An Amazon Web Services account that creates a partner event bus that matches the partner event source can use that event bus to receive events from the partner, and then process them using Amazon Web Services Events rules and targets.\n   \n    Partner event source names follow this format:\n    \n      \n     {[\n      {i partner_name}/{i event_namespace}/{i event_name} \n     ]}\n      \n     \n      {ul\n            {-   {i partner_name} is determined during partner registration, and identifies the partner to Amazon Web Services customers. \n                \n                 }\n            {-   {i event_namespace} is determined by the partner, and is a way for the partner to categorize their events.\n                \n                 }\n            {-   {i event_name} is determined by the partner, and should uniquely identify an event-generating resource within the partner system. \n                \n                 The {i event_name} must be unique across all Amazon Web Services customers. This is because the event source is a shared resource between the partner and customer accounts, and each partner event source unique in the partner account.\n                 \n                  }\n            }\n   The combination of {i event_namespace} and {i event_name} should help Amazon Web Services customers decide whether to create an event bus to receive these events.\n   "]
module DeactivateEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      deactivate_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "You can use this operation to temporarily stop receiving events from the specified partner event source. The matching event bus is not deleted. \n\n When you deactivate a partner event source, the source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is deleted.\n \n  To activate a deactivated partner event source, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html}ActivateEventSource}.\n  "]
module DeauthorizeConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      deauthorize_connection_request ->
        (deauthorize_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes all authorization parameters from the connection. This lets you remove the secret from the connection so you can reuse it without having to create a new connection.\n"]
module DeleteApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_destination_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes the specified API destination.\n"]
module DeleteArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_archive_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes the specified archive.\n"]
module DeleteConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a connection.\n"]
module DeleteEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_endpoint_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module DeleteEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_bus_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Deletes the specified custom event bus or partner event bus. All rules associated with this event bus need to be deleted. You can't delete your account's default event bus.\n"]
module DeletePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_partner_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "This operation is used by SaaS partners to delete a partner event source. This operation is not used by Amazon Web Services customers.\n\n When you delete an event source, the status of the corresponding partner event bus in the Amazon Web Services customer account becomes DELETED.\n \n  \n  "]
module DeleteRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified rule.\n\n Before you can delete the rule, you must remove all targets, using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html}RemoveTargets}.\n \n  When you delete a rule, incoming events might continue to match to the deleted rule. Allow a short period of time for changes to take effect.\n  \n   If you call delete rule multiple times for the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus, [ResourceNotFoundException] is returned.\n   \n    Managed rules are rules created and managed by another Amazon Web Services service on your behalf. These rules are created by those other Amazon Web Services services to support functionality in those services. You can delete these rules using the [Force] option, but you should do so only if you are sure the other service is not still using that rule.\n    "]
module DescribeApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_api_destination_request ->
        (describe_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about an API destination.\n"]
module DescribeArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_archive_request ->
        (describe_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about an archive.\n"]
module DescribeConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_connection_request ->
        (describe_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about a connection.\n"]
module DescribeEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoint_request ->
        (describe_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Get the information about an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module DescribeEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_bus_request ->
        (describe_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Displays details about an event bus in your account. This can include the external Amazon Web Services accounts that are permitted to write events to your default event bus, and the associated policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state, and creation time.\n\n  To enable your account to receive events from other accounts on its default event bus, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n \n  For more information about partner event buses, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n  "]
module DescribeEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_source_request ->
        (describe_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This operation lists details about a partner event source that is shared with your account.\n"]
module DescribePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_partner_event_source_request ->
        (describe_partner_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to list details about a partner event source that they have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services customers can use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html}DescribeEventSource} to see details about a partner event source that is shared with them.\n"]
module DescribeReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_replay_request ->
        (describe_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves details about a replay. Use [DescribeReplay] to determine the progress of a running replay. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you use [StartReplay] and specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.\n"]
module DescribeRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_rule_request ->
        (describe_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Describes the specified rule.\n\n DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n "]
module DisableRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.\n\n When you disable a rule, incoming events might continue to match to the disabled rule. Allow a short period of time for changes to take effect.\n "]
module EnableRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enables the specified rule. If the rule does not exist, the operation fails.\n\n When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Allow a short period of time for changes to take effect.\n "]
module ListApiDestinations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_destinations_request ->
        (list_api_destinations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Retrieves a list of API destination in the account in the current Region.\n"]
module ListArchives :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_archives_request ->
        (list_archives_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists your archives. You can either list all the archives or you can provide a prefix to match to the archive names. Filter parameters are exclusive.\n"]
module ListConnections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc "Retrieves a list of connections from the account.\n"]
module ListEndpoints :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_endpoints_request ->
        (list_endpoints_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "List the global endpoints associated with this account. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module ListEventBuses :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_buses_request ->
        (list_event_buses_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Lists all the event buses in your account, including the default event bus, custom event buses, and partner event buses.\n"]
module ListEventSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_sources_request ->
        (list_event_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "You can use this to see all the partner event sources that have been shared with your Amazon Web Services account. For more information about partner event sources, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n"]
module ListPartnerEventSourceAccounts :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_source_accounts_request ->
        (list_partner_event_source_accounts_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to display the Amazon Web Services account ID that a particular partner event source name is associated with. This operation is not used by Amazon Web Services customers.\n"]
module ListPartnerEventSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_sources_request ->
        (list_partner_event_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to list all the partner event source names that they have created. This operation is not used by Amazon Web Services customers.\n"]
module ListReplays :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_replays_request ->
        (list_replays_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Lists your replays. You can either list all the replays or you can provide a prefix to match to the replay names. Filter parameters are exclusive.\n"]
module ListRuleNamesByTarget :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_names_by_target_request ->
        (list_rule_names_by_target_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can invoke a specific target in your account.\n\n The maximum number of results per page for requests is 100.\n "]
module ListRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix to match to the rule names.\n\n The maximum number of results per page for requests is 100.\n \n  ListRules does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n  "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can be tagged.\n"]
module ListTargetsByRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_targets_by_rule_request ->
        (list_targets_by_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the targets assigned to the specified rule.\n\n The maximum number of results per page for requests is 100.\n "]
module PutEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_events_request ->
        (put_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Sends custom events to Amazon EventBridge so that they can be matched to rules.\n\n You can batch multiple event entries into one request for efficiency. However, the total entry size must be less than 256KB. You can calculate the entry size before you send the events. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevents.html#eb-putevent-size}Calculating PutEvents event entry size} in the {i  {i Amazon EventBridge User Guide} }.\n \n  PutEvents accepts the data in JSON format. For the JSON number (integer) data type, the constraints are: a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807.\n  \n    PutEvents will only process nested JSON up to 1000 levels deep.\n    \n     "]
module PutPartnerEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_partner_events_request ->
        (put_partner_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services customers do not use this operation.\n\n For information on calculating event batch size, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html}Calculating EventBridge PutEvents event entry size} in the {i EventBridge User Guide}.\n "]
module PutPermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `PolicyLengthExceededException of
              policy_length_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Running [PutPermission] permits the specified Amazon Web Services account or Amazon Web Services organization to put events to the specified {i event bus}. Amazon EventBridge rules in your account are triggered by these events arriving to an event bus in your account. \n\n For another account to send events to your account, that external account must have an EventBridge rule with your account's event bus as a target.\n \n  To enable multiple Amazon Web Services accounts to put events to your event bus, run [PutPermission] once for each of these accounts. Or, if all the accounts are members of the same Amazon Web Services organization, you can run [PutPermission] once specifying [Principal] as \"*\" and specifying the Amazon Web Services organization ID in [Condition], to grant permissions to all accounts in that organization.\n  \n   If you grant permissions using an organization, then accounts in that organization must specify a [RoleArn] with proper permissions when they use [PutTarget] to add your account's event bus as a target. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.\n   \n    The permission policy on the event bus cannot exceed 10 KB in size.\n    "]
module PutRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_rule_request ->
        (put_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html}DisableRule}.\n\n A single rule watches for events from a single event bus. Events generated by Amazon Web Services services go to your account's default event bus. Events generated by SaaS partner services or applications go to the matching partner event bus. If you have custom applications or services, you can specify whether their events go to your default event bus or a custom event bus that you have created. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n \n  If you are updating an existing rule, the rule is replaced with what you specify in this [PutRule] command. If you omit arguments in [PutRule], the old values for those arguments are not kept. Instead, they are replaced with null values.\n  \n   When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Allow a short period of time for changes to take effect.\n   \n    A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.\n    \n     When you initially create a rule, you can optionally assign one or more tags to the rule. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only rules with certain tag values. To use the [PutRule] operation and assign tags, you must have both the [events:PutRule] and [events:TagResource] permissions.\n     \n      If you are updating an existing rule, any tags you specify in the [PutRule] operation are ignored. To update the tags of an existing rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html}UntagResource}.\n      \n       Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.\n       \n        In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop.\n        \n         To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of after any change. \n         \n          An infinite loop can quickly cause higher than expected charges. We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html}Managing Your Costs with Budgets}.\n          \n           To create a rule that filters for management events from Amazon Web Services services, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event-cloudtrail.html#eb-service-event-cloudtrail-management}Receiving read-only management events from Amazon Web Services services} in the {i EventBridge User Guide}.\n           "]
module PutTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_targets_request ->
        (put_targets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.\n\n Targets are the resources that are invoked when a rule is triggered.\n \n  The maximum number of entries per request is 10.\n  \n    Each rule can have up to five (5) targets associated with it at one time.\n    \n      For a list of services you can configure as targets for events, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html}EventBridge targets} in the {i  {i Amazon EventBridge User Guide} }.\n      \n       Creating rules with built-in targets is supported only in the Amazon Web Services Management Console. The built-in targets are:\n       \n        {ul\n              {-   [Amazon EBS CreateSnapshot API call] \n                  \n                   }\n              {-   [Amazon EC2 RebootInstances API call] \n                  \n                   }\n              {-   [Amazon EC2 StopInstances API call] \n                  \n                   }\n              {-   [Amazon EC2 TerminateInstances API call] \n                  \n                   }\n              }\n   For some target types, [PutTargets] provides target-specific parameters. If the target is a Kinesis data stream, you can optionally specify which shard the event goes to by using the [KinesisParameters] argument. To invoke a command on multiple EC2 instances with one rule, you can use the [RunCommandParameters] field.\n   \n    To be able to make API calls against the resources that you own, Amazon EventBridge needs the appropriate permissions: \n    \n     {ul\n           {-  For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies.\n               \n                }\n           {-  For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs, EventBridge relies on IAM roles that you specify in the [RoleARN] argument in [PutTargets].\n               \n                }\n           }\n   For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html}Authentication and Access Control} in the {i  {i Amazon EventBridge User Guide} }.\n   \n    If another Amazon Web Services account is in the same region and has granted you permission (using [PutPermission]), you can send events to that account. Set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the [Arn] value when you run [PutTargets]. If your account sends events to another account, your account is charged for each sent event. Each event sent to another account is charged as a custom event. The account receiving the event is not charged. For more information, see {{:http://aws.amazon.com/eventbridge/pricing/}Amazon EventBridge Pricing}.\n    \n       [Input], [InputPath], and [InputTransformer] are not available with [PutTarget] if the target is an event bus of a different Amazon Web Services account.\n      \n        If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.\n        \n          If you have an IAM role on a cross-account event bus target, a [PutTargets] call without a role on the same target (same [Id] and [Arn]) will not remove the role.\n          \n            For more information about enabling cross-account events, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n            \n              {b Input}, {b InputPath}, and {b InputTransformer} are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:\n             \n              {ul\n                    {-  If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).\n                        \n                         }\n                    {-  If {b Input} is specified in the form of valid JSON, then the matched event is overridden with this constant.\n                        \n                         }\n                    {-  If {b InputPath} is specified in the form of JSONPath (for example, [$.detail]), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).\n                        \n                         }\n                    {-  If {b InputTransformer} is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.\n                        \n                         }\n                    }\n   When you specify [InputPath] or [InputTransformer], you must use JSON dot notation, not bracket notation.\n   \n    When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Allow a short period of time for changes to take effect.\n    \n     This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.\n     "]
module RemovePermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Revokes the permission of another Amazon Web Services account to be able to put events to the specified event bus. Specify the account to revoke by the [StatementId] value that you associated with the account when you granted it permission with [PutPermission]. You can find the [StatementId] by using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html}DescribeEventBus}.\n"]
module RemoveTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_targets_request ->
        (remove_targets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.\n\n  A successful execution of [RemoveTargets] doesn't guarantee all targets are removed from the rule, it means that the target(s) listed in the request are removed.\n  \n    When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Allow a short period of time for changes to take effect.\n    \n     This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.\n     \n      The maximum number of entries per request is 10.\n      "]
module StartReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_replay_request ->
        (start_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Starts the specified replay. Events are not necessarily replayed in the exact same order that they were added to the archive. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values. In EventBridge, rules and event buses can be tagged.\n\n Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.\n \n  You can use the [TagResource] action with a resource that already has tags. If you specify a new tag key, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.\n  \n   You can associate as many as 50 tags with a resource.\n   "]
module TestEventPattern :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_event_pattern_request ->
        (test_event_pattern_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception ])
          result
end[@@ocaml.doc
     "Tests whether the specified event pattern matches the provided event.\n\n Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge, rules and event buses can be tagged.\n"]
module UpdateApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_api_destination_request ->
        (update_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates an API destination.\n"]
module UpdateArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_archive_request ->
        (update_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates the specified archive.\n"]
module UpdateConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_connection_request ->
        (update_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception ]) result
end[@@ocaml.doc "Updates settings for a connection.\n"]
module UpdateEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_endpoint_request ->
        (update_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Update an existing endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module UpdateEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_bus_request ->
        (update_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates the specified event bus.\n"]