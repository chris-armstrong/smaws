open Types

module AssociateResourceTypes : sig
  val request :
    Smaws_Lib.Context.t ->
    associate_resource_types_request ->
    ( associate_resource_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Adds all resource types specified in the [ResourceTypes] list to the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} \
   of specified configuration recorder and includes those resource types when recording.\n\n\
  \ For this operation, the specified configuration recorder must use a \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} \
   that is either [INCLUSION_BY_RESOURCE_TYPES] or [EXCLUSION_BY_RESOURCE_TYPES].\n\
  \ "]

module BatchGetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_aggregate_resource_config_request ->
    ( batch_get_aggregate_resource_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the current configuration items for resources that are present in your Config \
   aggregator. The operation also returns a list of resources that are not processed in the \
   current request. If there are no unprocessed resources, the operation returns an empty \
   [unprocessedResourceIdentifiers] list. \n\n\
  \  {ul\n\
  \        {-  The API does not return results for deleted resources.\n\
  \            \n\
  \             }\n\
  \        {-   The API does not return tags and relationships.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module BatchGetResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    batch_get_resource_config_request ->
    ( batch_get_resource_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the [BaseConfigurationItem] for one or more requested resources. The operation also \
   returns a list of resources that are not processed in the current request. If there are no \
   unprocessed resources, the operation returns an empty unprocessedResourceKeys list. \n\n\
  \  {ul\n\
  \        {-  The API does not return results for deleted resources.\n\
  \            \n\
  \             }\n\
  \        {-   The API does not return any tags for the requested resources. This information is \
   filtered out of the supplementaryConfiguration section of the API response.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   "]

module DeleteAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_aggregation_authorization_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the authorization granted to the specified configuration aggregator account in a \
   specified region.\n"]

module DeleteConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_config_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigRuleException of no_such_config_rule_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified Config rule and all of its evaluation results.\n\n\
  \ Config sets the state of a rule to [DELETING] until the deletion is complete. You cannot \
   update a rule while it is in this state. If you make a [PutConfigRule] or [DeleteConfigRule] \
   request for the rule, you will receive a [ResourceInUseException].\n\
  \ \n\
  \  You can check the state of a rule by using the [DescribeConfigRules] request.\n\
  \  \n\
  \     {b Recommendation: Stop recording resource compliance before deleting rules} \n\
  \    \n\
  \     It is highly recommended that you stop recording for the [AWS::Config::ResourceCompliance] \
   resource type before you delete rules in your account. Deleting rules creates CIs for \
   [AWS::Config::ResourceCompliance] and can affect your Config \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html}configuration \
   recorder} costs. If you are deleting rules which evaluate a large number of resource types, \
   this can lead to a spike in the number of CIs recorded.\n\
  \     \n\
  \      Best practice:\n\
  \      \n\
  \       {ol\n\
  \             {-  Stop recording [AWS::Config::ResourceCompliance] \n\
  \                 \n\
  \                  }\n\
  \             {-  Delete rule(s)\n\
  \                 \n\
  \                  }\n\
  \             {-  Turn on recording for [AWS::Config::ResourceCompliance] \n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module DeleteConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_configuration_aggregator_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified configuration aggregator and the aggregated data associated with the \
   aggregator.\n"]

module DeleteConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_configuration_recorder_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the customer managed configuration recorder.\n\n\
  \ This operation does not delete the configuration information that was previously recorded. You \
   will be able to access the previously recorded information by using the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceConfigHistory.html}GetResourceConfigHistory} \
   operation, but you will not be able to access this information in the Config console until you \
   have created a new customer managed configuration recorder.\n\
  \ "]

module DeleteConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_conformance_pack_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConformancePackException of no_such_conformance_pack_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified conformance pack and all the Config rules, remediation actions, and all \
   evaluation results within that conformance pack.\n\n\
  \ Config sets the conformance pack to [DELETE_IN_PROGRESS] until the deletion is complete. You \
   cannot update a conformance pack while it is in this state.\n\
  \ "]

module DeleteDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_delivery_channel_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `LastDeliveryChannelDeleteFailedException of last_delivery_channel_delete_failed_exception
      | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the delivery channel.\n\n\
  \ Before you can delete the delivery channel, you must stop the customer managed configuration \
   recorder. You can use the [StopConfigurationRecorder] operation to stop the customer managed \
   configuration recorder.\n\
  \ "]

module DeleteEvaluationResults : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_evaluation_results_request ->
    ( delete_evaluation_results_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigRuleException of no_such_config_rule_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the evaluation results for the specified Config rule. You can specify one Config rule \
   per request. After you delete the evaluation results, you can call the \
   [StartConfigRulesEvaluation] API to start evaluating your Amazon Web Services resources against \
   the rule.\n"]

module DeleteOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_organization_config_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified organization Config rule and all of its evaluation results from all \
   member accounts in that organization. \n\n\
  \ Only a management account and a delegated administrator account can delete an organization \
   Config rule. When calling this API with a delegated administrator, you must ensure \
   Organizations [ListDelegatedAdministrator] permissions are added.\n\
  \ \n\
  \  Config sets the state of a rule to DELETE_IN_PROGRESS until the deletion is complete. You \
   cannot update a rule while it is in this state.\n\
  \  "]

module DeleteOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_organization_conformance_pack_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchOrganizationConformancePackException of
        no_such_organization_conformance_pack_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the specified organization conformance pack and all of the Config rules and remediation \
   actions from all member accounts in that organization. \n\n\
  \  Only a management account or a delegated administrator account can delete an organization \
   conformance pack. When calling this API with a delegated administrator, you must ensure \
   Organizations [ListDelegatedAdministrator] permissions are added.\n\
  \ \n\
  \  Config sets the state of a conformance pack to DELETE_IN_PROGRESS until the deletion is \
   complete. You cannot update a conformance pack while it is in this state. \n\
  \  "]

module DeletePendingAggregationRequest : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_pending_aggregation_request_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Deletes pending authorization requests for a specified aggregator account in a specified region.\n"]

module DeleteRemediationConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_remediation_configuration_request ->
    ( delete_remediation_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception
      | `RemediationInProgressException of remediation_in_progress_exception ] )
    result
end
[@@ocaml.doc "Deletes the remediation configuration.\n"]

module DeleteRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_remediation_exceptions_request ->
    ( delete_remediation_exceptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchRemediationExceptionException of no_such_remediation_exception_exception ] )
    result
end
[@@ocaml.doc
  "Deletes one or more remediation exceptions mentioned in the resource keys.\n\n\
  \  Config generates a remediation exception when a problem occurs executing a remediation action \
   to a specific resource. Remediation exceptions blocks auto-remediation until the exception is \
   cleared.\n\
  \  \n\
  \   "]

module DeleteResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_resource_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Records the configuration state for a custom resource that has been deleted. This API records a \
   new ConfigurationItem with a ResourceDeleted status. You can retrieve the ConfigurationItems \
   recorded for this resource in your Config History. \n"]

module DeleteRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_retention_configuration_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception ] )
    result
end
[@@ocaml.doc "Deletes the retention configuration.\n"]

module DeleteServiceLinkedConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_service_linked_configuration_recorder_request ->
    ( delete_service_linked_configuration_recorder_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes an existing service-linked configuration recorder.\n\n\
  \ This operation does not delete the configuration information that was previously recorded. You \
   will be able to access the previously recorded information by using the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceConfigHistory.html}GetResourceConfigHistory} \
   operation, but you will not be able to access this information in the Config console until you \
   have created a new service-linked configuration recorder for the same service.\n\
  \ \n\
  \    {b The recording scope determines if you receive configuration items} \n\
  \   \n\
  \    The recording scope is set by the service that is linked to the configuration recorder and \
   determines whether you receive configuration items (CIs) in the delivery channel. If the \
   recording scope is internal, you will not receive CIs in the delivery channel.\n\
  \    \n\
  \     "]

module DeleteStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    delete_stored_query_request ->
    ( delete_stored_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deletes the stored query for a single Amazon Web Services account and a single Amazon Web \
   Services Region.\n"]

module DeliverConfigSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
    deliver_config_snapshot_request ->
    ( deliver_config_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
      | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception ] )
    result
end
[@@ocaml.doc
  "Schedules delivery of a configuration snapshot to the Amazon S3 bucket in the specified \
   delivery channel. After the delivery has started, Config sends the following notifications \
   using an Amazon SNS topic that you have specified.\n\n\
  \ {ul\n\
  \       {-  Notification of the start of the delivery.\n\
  \           \n\
  \            }\n\
  \       {-  Notification of the completion of the delivery, if the delivery was successfully \
   completed.\n\
  \           \n\
  \            }\n\
  \       {-  Notification of delivery failure, if the delivery failed.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DescribeAggregateComplianceByConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_aggregate_compliance_by_config_rules_request ->
    ( describe_aggregate_compliance_by_config_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of compliant and noncompliant rules with the number of resources for compliant \
   and noncompliant rules. Does not display rules that do not have compliance results. \n\n\
  \  The results can return an empty result page, but if you have a [nextToken], the results are \
   displayed on the next page.\n\
  \  \n\
  \   "]

module DescribeAggregateComplianceByConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_aggregate_compliance_by_conformance_packs_request ->
    ( describe_aggregate_compliance_by_conformance_packs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of the existing and deleted conformance packs and their associated compliance \
   status with the count of compliant and noncompliant Config rules within each conformance pack. \
   Also returns the total rule count which includes compliant rules, noncompliant rules, and rules \
   that cannot be evaluated due to insufficient data.\n\n\
  \  The results can return an empty result page, but if you have a [nextToken], the results are \
   displayed on the next page.\n\
  \  \n\
  \   "]

module DescribeAggregationAuthorizations : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_aggregation_authorizations_request ->
    ( describe_aggregation_authorizations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of authorizations granted to various aggregator accounts and regions.\n"]

module DescribeComplianceByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_compliance_by_config_rule_request ->
    ( describe_compliance_by_config_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Indicates whether the specified Config rules are compliant. If a rule is noncompliant, this \
   operation returns the number of Amazon Web Services resources that do not comply with the \
   rule.\n\n\
  \ A rule is compliant if all of the evaluated resources comply with it. It is noncompliant if \
   any of these resources do not comply.\n\
  \ \n\
  \  If Config has no current evaluation results for the rule, it returns [INSUFFICIENT_DATA]. \
   This result might indicate one of the following conditions:\n\
  \  \n\
  \   {ul\n\
  \         {-  Config has never invoked an evaluation for the rule. To check whether it has, use \
   the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and \
   [LastFailedInvocationTime].\n\
  \             \n\
  \              }\n\
  \         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify \
   that the role you assigned to your configuration recorder includes the [config:PutEvaluations] \
   permission. If the rule is a custom rule, verify that the Lambda execution role includes the \
   [config:PutEvaluations] permission.\n\
  \             \n\
  \              }\n\
  \         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation \
   results. This can occur if the resources were deleted or removed from the rule's scope.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeComplianceByResource : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_compliance_by_resource_request ->
    ( describe_compliance_by_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Indicates whether the specified Amazon Web Services resources are compliant. If a resource is \
   noncompliant, this operation returns the number of Config rules that the resource does not \
   comply with.\n\n\
  \ A resource is compliant if it complies with all the Config rules that evaluate it. It is \
   noncompliant if it does not comply with one or more of these rules.\n\
  \ \n\
  \  If Config has no current evaluation results for the resource, it returns [INSUFFICIENT_DATA]. \
   This result might indicate one of the following conditions about the rules that evaluate the \
   resource:\n\
  \  \n\
  \   {ul\n\
  \         {-  Config has never invoked an evaluation for the rule. To check whether it has, use \
   the [DescribeConfigRuleEvaluationStatus] action to get the [LastSuccessfulInvocationTime] and \
   [LastFailedInvocationTime].\n\
  \             \n\
  \              }\n\
  \         {-  The rule's Lambda function is failing to send evaluation results to Config. Verify \
   that the role that you assigned to your configuration recorder includes the \
   [config:PutEvaluations] permission. If the rule is a custom rule, verify that the Lambda \
   execution role includes the [config:PutEvaluations] permission.\n\
  \             \n\
  \              }\n\
  \         {-  The rule's Lambda function has returned [NOT_APPLICABLE] for all evaluation \
   results. This can occur if the resources were deleted or removed from the rule's scope.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeConfigRuleEvaluationStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_config_rule_evaluation_status_request ->
    ( describe_config_rule_evaluation_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Returns status information for each of your Config managed rules. The status includes \
   information such as the last time Config invoked the rule, the last time Config failed to \
   invoke the rule, and the related error for the last failure.\n"]

module DescribeConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_config_rules_request ->
    ( describe_config_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc "Returns details about your Config rules.\n"]

module DescribeConfigurationAggregators : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_configuration_aggregators_request ->
    ( describe_configuration_aggregators_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception ] )
    result
end
[@@ocaml.doc
  "Returns the details of one or more configuration aggregators. If the configuration aggregator \
   is not specified, this operation returns the details for all the configuration aggregators \
   associated with the account. \n"]

module DescribeConfigurationAggregatorSourcesStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_configuration_aggregator_sources_status_request ->
    ( describe_configuration_aggregator_sources_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception ] )
    result
end
[@@ocaml.doc
  "Returns status information for sources within an aggregator. The status includes information \
   about the last time Config verified authorization between the source account and an aggregator \
   account. In case of a failure, the status contains the related error code or message. \n"]

module DescribeConfigurationRecorders : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_configuration_recorders_request ->
    ( describe_configuration_recorders_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns details for the configuration recorder you specify.\n\n\
  \ If a configuration recorder is not specified, this operation returns details for the customer \
   managed configuration recorder configured for the account, if applicable.\n\
  \ \n\
  \   When making a request to this operation, you can only specify one configuration recorder.\n\
  \   \n\
  \    "]

module DescribeConfigurationRecorderStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_configuration_recorder_status_request ->
    ( describe_configuration_recorder_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the current status of the configuration recorder you specify as well as the status of \
   the last recording event for the configuration recorders.\n\n\
  \ For a detailed status of recording events over time, add your Config events to Amazon \
   CloudWatch metrics and use CloudWatch metrics.\n\
  \ \n\
  \  If a configuration recorder is not specified, this operation returns the status for the \
   customer managed configuration recorder configured for the account, if applicable.\n\
  \  \n\
  \    When making a request to this operation, you can only specify one configuration recorder.\n\
  \    \n\
  \     "]

module DescribeConformancePackCompliance : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_conformance_pack_compliance_request ->
    ( describe_conformance_pack_compliance_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleInConformancePackException of
        no_such_config_rule_in_conformance_pack_exception
      | `NoSuchConformancePackException of no_such_conformance_pack_exception ] )
    result
end
[@@ocaml.doc
  "Returns compliance details for each rule in that conformance pack.\n\n\
  \  You must provide exact rule names.\n\
  \  \n\
  \   "]

module DescribeConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_conformance_packs_request ->
    ( describe_conformance_packs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConformancePackException of no_such_conformance_pack_exception ] )
    result
end
[@@ocaml.doc "Returns a list of one or more conformance packs.\n"]

module DescribeConformancePackStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_conformance_pack_status_request ->
    ( describe_conformance_pack_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Provides one or more conformance packs deployment status.\n\n\
  \  If there are no conformance packs then you will see an empty result.\n\
  \  \n\
  \   "]

module DescribeDeliveryChannels : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_delivery_channels_request ->
    ( describe_delivery_channels_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception ] )
    result
end
[@@ocaml.doc
  "Returns details about the specified delivery channel. If a delivery channel is not specified, \
   this operation returns the details of all delivery channels associated with the account.\n\n\
  \  Currently, you can specify only one delivery channel per region in your account.\n\
  \  \n\
  \   "]

module DescribeDeliveryChannelStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_delivery_channel_status_request ->
    ( describe_delivery_channel_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchDeliveryChannelException of no_such_delivery_channel_exception ] )
    result
end
[@@ocaml.doc
  "Returns the current status of the specified delivery channel. If a delivery channel is not \
   specified, this operation returns the current status of all delivery channels associated with \
   the account.\n\n\
  \  Currently, you can specify only one delivery channel per region in your account.\n\
  \  \n\
  \   "]

module DescribeOrganizationConfigRules : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_organization_config_rules_request ->
    ( describe_organization_config_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of organization Config rules. \n\n\
  \  When you specify the limit and the next token, you receive a paginated response.\n\
  \  \n\
  \   Limit and next token are not applicable if you specify organization Config rule names. It is \
   only applicable, when you request all the organization Config rules.\n\
  \   \n\
  \     {i For accounts within an organization} \n\
  \    \n\
  \     If you deploy an organizational rule or conformance pack in an organization administrator \
   account, and then establish a delegated administrator and deploy an organizational rule or \
   conformance pack in the delegated administrator account, you won't be able to see the \
   organizational rule or conformance pack in the organization administrator account from the \
   delegated administrator account or see the organizational rule or conformance pack in the \
   delegated administrator account from organization administrator account. The \
   [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see \
   and interact with the organization-related resource that were deployed from within the account \
   calling those APIs.\n\
  \     \n\
  \      "]

module DescribeOrganizationConfigRuleStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_organization_config_rule_statuses_request ->
    ( describe_organization_config_rule_statuses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Provides organization Config rule deployment status for an organization.\n\n\
  \  The status is not considered successful until organization Config rule is successfully \
   deployed in all the member accounts with an exception of excluded accounts.\n\
  \  \n\
  \   When you specify the limit and the next token, you receive a paginated response. Limit and \
   next token are not applicable if you specify organization Config rule names. It is only \
   applicable, when you request all the organization Config rules.\n\
  \   \n\
  \    "]

module DescribeOrganizationConformancePacks : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_organization_conformance_packs_request ->
    ( describe_organization_conformance_packs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConformancePackException of
        no_such_organization_conformance_pack_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of organization conformance packs. \n\n\
  \  When you specify the limit and the next token, you receive a paginated response. \n\
  \  \n\
  \   Limit and next token are not applicable if you specify organization conformance packs names. \
   They are only applicable, when you request all the organization conformance packs. \n\
  \   \n\
  \     {i For accounts within an organization} \n\
  \    \n\
  \     If you deploy an organizational rule or conformance pack in an organization administrator \
   account, and then establish a delegated administrator and deploy an organizational rule or \
   conformance pack in the delegated administrator account, you won't be able to see the \
   organizational rule or conformance pack in the organization administrator account from the \
   delegated administrator account or see the organizational rule or conformance pack in the \
   delegated administrator account from organization administrator account. The \
   [DescribeOrganizationConfigRules] and [DescribeOrganizationConformancePacks] APIs can only see \
   and interact with the organization-related resource that were deployed from within the account \
   calling those APIs.\n\
  \     \n\
  \      "]

module DescribeOrganizationConformancePackStatuses : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_organization_conformance_pack_statuses_request ->
    ( describe_organization_conformance_pack_statuses_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConformancePackException of
        no_such_organization_conformance_pack_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Provides organization conformance pack deployment status for an organization. \n\n\
  \  The status is not considered successful until organization conformance pack is successfully \
   deployed in all the member accounts with an exception of excluded accounts.\n\
  \  \n\
  \   When you specify the limit and the next token, you receive a paginated response. Limit and \
   next token are not applicable if you specify organization conformance pack names. They are only \
   applicable, when you request all the organization conformance packs.\n\
  \   \n\
  \    "]

module DescribePendingAggregationRequests : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_pending_aggregation_requests_request ->
    ( describe_pending_aggregation_requests_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc "Returns a list of all pending aggregation requests.\n"]

module DescribeRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_remediation_configurations_request ->
    (describe_remediation_configurations_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc "Returns the details of one or more remediation configurations.\n"]

module DescribeRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_remediation_exceptions_request ->
    ( describe_remediation_exceptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Returns the details of one or more remediation exceptions. A detailed view of a remediation \
   exception for a set of resources that includes an explanation of an exception and the time when \
   the exception will be deleted. When you specify the limit and the next token, you receive a \
   paginated response. \n\n\
  \  Config generates a remediation exception when a problem occurs executing a remediation action \
   to a specific resource. Remediation exceptions blocks auto-remediation until the exception is \
   cleared.\n\
  \  \n\
  \   When you specify the limit and the next token, you receive a paginated response. \n\
  \   \n\
  \    Limit and next token are not applicable if you request resources in batch. It is only \
   applicable, when you request all resources.\n\
  \    \n\
  \     "]

module DescribeRemediationExecutionStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_remediation_execution_status_request ->
    ( describe_remediation_execution_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception ]
    )
    result
end
[@@ocaml.doc
  "Provides a detailed view of a Remediation Execution for a set of resources including state, \
   timestamps for when steps for the remediation execution occur, and any error messages for steps \
   that have failed. When you specify the limit and the next token, you receive a paginated \
   response.\n"]

module DescribeRetentionConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    describe_retention_configurations_request ->
    ( describe_retention_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchRetentionConfigurationException of no_such_retention_configuration_exception ] )
    result
end
[@@ocaml.doc
  "Returns the details of one or more retention configurations. If the retention configuration \
   name is not specified, this operation returns the details for all the retention configurations \
   for that account.\n\n\
  \  Currently, Config supports only one retention configuration per region in your account.\n\
  \  \n\
  \   "]

module DisassociateResourceTypes : sig
  val request :
    Smaws_Lib.Context.t ->
    disassociate_resource_types_request ->
    ( disassociate_resource_types_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Removes all resource types specified in the [ResourceTypes] list from the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingGroup.html}RecordingGroup} \
   of configuration recorder and excludes these resource types when recording.\n\n\
  \ For this operation, the configuration recorder must use a \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_RecordingStrategy.html}RecordingStrategy} \
   that is either [INCLUSION_BY_RESOURCE_TYPES] or [EXCLUSION_BY_RESOURCE_TYPES].\n\
  \ "]

module GetAggregateComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    get_aggregate_compliance_details_by_config_rule_request ->
    ( get_aggregate_compliance_details_by_config_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the evaluation results for the specified Config rule for a specific resource in a rule. \
   The results indicate which Amazon Web Services resources were evaluated by the rule, when each \
   resource was last evaluated, and whether each resource complies with the rule. \n\n\
  \  The results can return an empty result page. But if you have a [nextToken], the results are \
   displayed on the next page.\n\
  \  \n\
  \   "]

module GetAggregateConfigRuleComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_aggregate_config_rule_compliance_summary_request ->
    ( get_aggregate_config_rule_compliance_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the number of compliant and noncompliant rules for one or more accounts and regions in \
   an aggregator.\n\n\
  \  The results can return an empty result page, but if you have a nextToken, the results are \
   displayed on the next page.\n\
  \  \n\
  \   "]

module GetAggregateConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_aggregate_conformance_pack_compliance_summary_request ->
    ( get_aggregate_conformance_pack_compliance_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the count of compliant and noncompliant conformance packs across all Amazon Web \
   Services accounts and Amazon Web Services Regions in an aggregator. You can filter based on \
   Amazon Web Services account ID or Amazon Web Services Region.\n\n\
  \  The results can return an empty result page, but if you have a nextToken, the results are \
   displayed on the next page.\n\
  \  \n\
  \   "]

module GetAggregateDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
    get_aggregate_discovered_resource_counts_request ->
    ( get_aggregate_discovered_resource_counts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the resource counts across accounts and regions that are present in your Config \
   aggregator. You can request the resource counts by providing filters and GroupByKey.\n\n\
  \ For example, if the input contains accountID 12345678910 and region us-east-1 in filters, the \
   API returns the count of resources in account ID 12345678910 and region us-east-1. If the input \
   contains ACCOUNT_ID as a GroupByKey, the API returns resource counts for all source accounts \
   that are present in your aggregator.\n\
  \ "]

module GetAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    get_aggregate_resource_config_request ->
    ( get_aggregate_resource_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `OversizedConfigurationItemException of oversized_configuration_item_exception
      | `ResourceNotDiscoveredException of resource_not_discovered_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns configuration item that is aggregated for your specific resource in a specific source \
   account and region.\n\n\
  \  The API does not return results for deleted resources.\n\
  \  \n\
  \   "]

module GetComplianceDetailsByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    get_compliance_details_by_config_rule_request ->
    ( get_compliance_details_by_config_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Returns the evaluation results for the specified Config rule. The results indicate which Amazon \
   Web Services resources were evaluated by the rule, when each resource was last evaluated, and \
   whether each resource complies with the rule.\n"]

module GetComplianceDetailsByResource : sig
  val request :
    Smaws_Lib.Context.t ->
    get_compliance_details_by_resource_request ->
    ( get_compliance_details_by_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Returns the evaluation results for the specified Amazon Web Services resource. The results \
   indicate which Config rules were used to evaluate the resource, when each rule was last \
   invoked, and whether the resource complies with each rule.\n"]

module GetComplianceSummaryByConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    Smaws_Lib.Smithy_api.Types.unit_ ->
    (get_compliance_summary_by_config_rule_response, [> Smaws_Lib.Protocols.AwsJson.error ]) result
end
[@@ocaml.doc
  "Returns the number of Config rules that are compliant and noncompliant, up to a maximum of 25 \
   for each.\n"]

module GetComplianceSummaryByResourceType : sig
  val request :
    Smaws_Lib.Context.t ->
    get_compliance_summary_by_resource_type_request ->
    ( get_compliance_summary_by_resource_type_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Returns the number of resources that are compliant and the number that are noncompliant. You \
   can specify one or more resource types to get these numbers for each resource type. The maximum \
   number returned is 100.\n"]

module GetConformancePackComplianceDetails : sig
  val request :
    Smaws_Lib.Context.t ->
    get_conformance_pack_compliance_details_request ->
    ( get_conformance_pack_compliance_details_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleInConformancePackException of
        no_such_config_rule_in_conformance_pack_exception
      | `NoSuchConformancePackException of no_such_conformance_pack_exception ] )
    result
end
[@@ocaml.doc
  "Returns compliance details of a conformance pack for all Amazon Web Services resources that are \
   monitered by conformance pack.\n"]

module GetConformancePackComplianceSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_conformance_pack_compliance_summary_request ->
    ( get_conformance_pack_compliance_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConformancePackException of no_such_conformance_pack_exception ] )
    result
end
[@@ocaml.doc
  "Returns compliance details for the conformance pack based on the cumulative compliance results \
   of all the rules in that conformance pack.\n"]

module GetCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    get_custom_rule_policy_request ->
    ( get_custom_rule_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Returns the policy definition containing the logic for your Config Custom Policy rule.\n"]

module GetDiscoveredResourceCounts : sig
  val request :
    Smaws_Lib.Context.t ->
    get_discovered_resource_counts_request ->
    ( get_discovered_resource_counts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Returns the resource types, the number of each resource type, and the total number of resources \
   that Config is recording in this region for your Amazon Web Services account. \n\n\
  \  {b Example} \n\
  \ \n\
  \  {ol\n\
  \        {-  Config is recording three resource types in the US East (Ohio) Region for your \
   account: 25 EC2 instances, 20 IAM users, and 15 S3 buckets.\n\
  \            \n\
  \             }\n\
  \        {-  You make a call to the [GetDiscoveredResourceCounts] action and specify that you \
   want all resource types. \n\
  \            \n\
  \             }\n\
  \        {-  Config returns the following:\n\
  \            \n\
  \             {ul\n\
  \                   {-  The resource types (EC2 instances, IAM users, and S3 buckets).\n\
  \                       \n\
  \                        }\n\
  \                   {-  The number of each resource type (25, 20, and 15).\n\
  \                       \n\
  \                        }\n\
  \                   {-  The total number of all resources (60).\n\
  \                       \n\
  \                        }\n\
  \                   \n\
  \         }\n\
  \          }\n\
  \        }\n\
  \   The response is paginated. By default, Config lists 100 [ResourceCount] objects on each \
   page. You can customize this number with the [limit] parameter. The response includes a \
   [nextToken] string. To get the next page of results, run the request again and specify the \
   string for the [nextToken] parameter.\n\
  \   \n\
  \     If you make a call to the [GetDiscoveredResourceCounts] action, you might not immediately \
   receive resource counts in the following situations:\n\
  \     \n\
  \      {ul\n\
  \            {-  You are a new Config customer.\n\
  \                \n\
  \                 }\n\
  \            {-  You just enabled resource recording.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   It might take a few minutes for Config to record and count your resources. Wait a few \
   minutes and then retry the [GetDiscoveredResourceCounts] action. \n\
  \   \n\
  \    "]

module GetOrganizationConfigRuleDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_organization_config_rule_detailed_status_request ->
    ( get_organization_config_rule_detailed_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Returns detailed status for each member account within an organization for a given organization \
   Config rule.\n"]

module GetOrganizationConformancePackDetailedStatus : sig
  val request :
    Smaws_Lib.Context.t ->
    get_organization_conformance_pack_detailed_status_request ->
    ( get_organization_conformance_pack_detailed_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchOrganizationConformancePackException of
        no_such_organization_conformance_pack_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Returns detailed status for each member account within an organization for a given organization \
   conformance pack.\n"]

module GetOrganizationCustomRulePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
    get_organization_custom_rule_policy_request ->
    ( get_organization_custom_rule_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchOrganizationConfigRuleException of no_such_organization_config_rule_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception ] )
    result
end
[@@ocaml.doc
  "Returns the policy definition containing the logic for your organization Config Custom Policy \
   rule.\n"]

module GetResourceConfigHistory : sig
  val request :
    Smaws_Lib.Context.t ->
    get_resource_config_history_request ->
    ( get_resource_config_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidTimeRangeException of invalid_time_range_exception
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `ResourceNotDiscoveredException of resource_not_discovered_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  " For accurate reporting on the compliance status, you must record the \
   [AWS::Config::ResourceCompliance] resource type. For more information, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/select-resources.html}Selecting \
   Which Resources Config Records}.\n\
  \ \n\
  \   Returns a list of [ConfigurationItems] for the specified resource. The list contains details \
   about each state of the resource during the specified time interval. If you specified a \
   retention period to retain your [ConfigurationItems] between a minimum of 30 days and a maximum \
   of 7 years (2557 days), Config returns the [ConfigurationItems] for the specified retention \
   period. \n\
  \   \n\
  \    The response is paginated. By default, Config returns a limit of 10 configuration items per \
   page. You can customize this number with the [limit] parameter. The response includes a \
   [nextToken] string. To get the next page of results, run the request again and specify the \
   string for the [nextToken] parameter.\n\
  \    \n\
  \      Each call to the API is limited to span a duration of seven days. It is likely that the \
   number of records returned is smaller than the specified [limit]. In such cases, you can make \
   another call, using the [nextToken].\n\
  \      \n\
  \       "]

module GetResourceEvaluationSummary : sig
  val request :
    Smaws_Lib.Context.t ->
    get_resource_evaluation_summary_request ->
    ( get_resource_evaluation_summary_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result
end
[@@ocaml.doc
  "Returns a summary of resource evaluation for the specified resource evaluation ID from the \
   proactive rules that were run. The results indicate which evaluation context was used to \
   evaluate the rules, which resource details were evaluated, the evaluation mode that was run, \
   and whether the resource details comply with the configuration of the proactive rules. \n\n\
  \  To see additional information about the evaluation result, such as which rule flagged a \
   resource as NON_COMPLIANT, use the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetComplianceDetailsByResource.html}GetComplianceDetailsByResource} \
   API. For more information, see the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_GetResourceEvaluationSummary.html#API_GetResourceEvaluationSummary_Examples}Examples} \
   section.\n\
  \  \n\
  \   "]

module GetStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    get_stored_query_request ->
    ( get_stored_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Returns the details of a specific stored query.\n"]

module ListAggregateDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
    list_aggregate_discovered_resources_request ->
    ( list_aggregate_discovered_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Accepts a resource type and returns a list of resource identifiers that are aggregated for a \
   specific resource type across accounts and regions. A resource identifier includes the resource \
   type, ID, (if available) the custom resource name, source account, and source region. You can \
   narrow the results to include only resources that have specific resource IDs, or a resource \
   name, or source account ID, or source region.\n\n\
  \ For example, if the input consists of accountID 12345678910 and the region is us-east-1 for \
   resource type [AWS::EC2::Instance] then the API returns all the EC2 instance identifiers of \
   accountID 12345678910 and region us-east-1.\n\
  \ "]

module ListConfigurationRecorders : sig
  val request :
    Smaws_Lib.Context.t ->
    list_configuration_recorders_request ->
    ( list_configuration_recorders_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Returns a list of configuration recorders depending on the filters you specify.\n"]

module ListConformancePackComplianceScores : sig
  val request :
    Smaws_Lib.Context.t ->
    list_conformance_pack_compliance_scores_request ->
    ( list_conformance_pack_compliance_scores_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Returns a list of conformance pack compliance scores. A compliance score is the percentage of \
   the number of compliant rule-resource combinations in a conformance pack compared to the number \
   of total possible rule-resource combinations in the conformance pack. This metric provides you \
   with a high-level view of the compliance state of your conformance packs. You can use it to \
   identify, investigate, and understand the level of compliance in your conformance packs.\n\n\
  \  Conformance packs with no evaluation results will have a compliance score of \
   [INSUFFICIENT_DATA].\n\
  \  \n\
  \   "]

module ListDiscoveredResources : sig
  val request :
    Smaws_Lib.Context.t ->
    list_discovered_resources_request ->
    ( list_discovered_resources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Accepts a resource type and returns a list of resource identifiers for the resources of that \
   type. A resource identifier includes the resource type, ID, and (if available) the custom \
   resource name. The results consist of resources that Config has discovered, including those \
   that Config is not currently recording. You can narrow the results to include only resources \
   that have specific resource IDs or a resource name.\n\n\
  \  You can specify either resource IDs or a resource name, but not both, in the same request.\n\
  \  \n\
  \    The response is paginated. By default, Config lists 100 resource identifiers on each page. \
   You can customize this number with the [limit] parameter. The response includes a [nextToken] \
   string. To get the next page of results, run the request again and specify the string for the \
   [nextToken] parameter.\n\
  \    "]

module ListResourceEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
    list_resource_evaluations_request ->
    ( list_resource_evaluations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidTimeRangeException of invalid_time_range_exception ] )
    result
end
[@@ocaml.doc "Returns a list of proactive resource evaluations.\n"]

module ListStoredQueries : sig
  val request :
    Smaws_Lib.Context.t ->
    list_stored_queries_request ->
    ( list_stored_queries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Lists the stored queries for a single Amazon Web Services account and a single Amazon Web \
   Services Region. The default is 100. \n"]

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "List the tags for Config resource.\n"]

module PutAggregationAuthorization : sig
  val request :
    Smaws_Lib.Context.t ->
    put_aggregation_authorization_request ->
    ( put_aggregation_authorization_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Authorizes the aggregator account and region to collect data from the source account and \
   region. \n\n\
  \   {b Tags are added at creation and cannot be updated with this operation} \n\
  \  \n\
  \    [PutAggregationAuthorization] is an idempotent API. Subsequent requests won\226\128\153t \
   create a duplicate resource if one was already created. If a following request has different \
   [tags] values, Config will ignore these differences and treat it as an idempotent request of \
   the previous. In this case, [tags] will not be updated, even if they are different.\n\
  \   \n\
  \    Use \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} \
   to update tags after creation.\n\
  \    \n\
  \     "]

module PutConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    put_config_rule_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MaxNumberOfConfigRulesExceededException of max_number_of_config_rules_exceeded_exception
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Adds or updates an Config rule to evaluate if your Amazon Web Services resources comply with \
   your desired configurations. For information on how many Config rules you can have per account, \
   see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service \
   Limits} } in the {i Config Developer Guide}.\n\n\
  \ There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can \
   use [PutConfigRule] to create both Config Managed Rules and Config Custom Rules.\n\
  \ \n\
  \  Config Managed Rules are predefined, customizable rules created by Config. For a list of \
   managed rules, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List \
   of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's \
   identifier for the [SourceIdentifier] key.\n\
  \  \n\
  \   Config Custom Rules are rules that you create from scratch. There are two ways to create \
   Config custom rules: with Lambda functions \
   ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} \
   Lambda Developer Guide}) and with Guard \
   ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a \
   policy-as-code language. Config custom rules created with Lambda are called {i Config Custom \
   Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy \
   Rules}.\n\
  \   \n\
  \    If you are adding a new Config Custom Lambda rule, you first need to create an Lambda \
   function that the rule invokes to evaluate your resources. When you use [PutConfigRule] to add \
   a Custom Lambda rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda \
   assigns to the function. You specify the ARN in the [SourceIdentifier] key. This key is part of \
   the [Source] object, which is part of the [ConfigRule] object. \n\
  \    \n\
  \     For any new Config rule that you add, specify the [ConfigRuleName] in the [ConfigRule] \
   object. Do not specify the [ConfigRuleArn] or the [ConfigRuleId]. These values are generated by \
   Config for new rules.\n\
  \     \n\
  \      If you are updating a rule that you added previously, you can specify the rule by \
   [ConfigRuleName], [ConfigRuleId], or [ConfigRuleArn] in the [ConfigRule] data type that you use \
   in this request.\n\
  \      \n\
  \       For more information about developing and using Config rules, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/evaluate-config.html}Evaluating \
   Resources with Config Rules} in the {i Config Developer Guide}.\n\
  \       \n\
  \          {b Tags are added at creation and cannot be updated with this operation} \n\
  \         \n\
  \           [PutConfigRule] is an idempotent API. Subsequent requests won\226\128\153t create a \
   duplicate resource if one was already created. If a following request has different [tags] \
   values, Config will ignore these differences and treat it as an idempotent request of the \
   previous. In this case, [tags] will not be updated, even if they are different.\n\
  \          \n\
  \           Use \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} \
   to update tags after creation.\n\
  \           \n\
  \            "]

module PutConfigurationAggregator : sig
  val request :
    Smaws_Lib.Context.t ->
    put_configuration_aggregator_request ->
    ( put_configuration_aggregator_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidRoleException of invalid_role_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception
      | `OrganizationAllFeaturesNotEnabledException of
        organization_all_features_not_enabled_exception ] )
    result
end
[@@ocaml.doc
  "Creates and updates the configuration aggregator with the selected source accounts and regions. \
   The source account can be individual account(s) or an organization.\n\n\
  \  [accountIds] that are passed will be replaced with existing accounts. If you want to add \
   additional accounts into the aggregator, call [DescribeConfigurationAggregators] to get the \
   previous accounts and then append new ones.\n\
  \ \n\
  \   Config should be enabled in source accounts and regions you want to aggregate.\n\
  \   \n\
  \    If your source type is an organization, you must be signed in to the management account or \
   a registered delegated administrator and all the features must be enabled in your organization. \
   If the caller is a management account, Config calls [EnableAwsServiceAccess] API to enable \
   integration between Config and Organizations. If the caller is a registered delegated \
   administrator, Config calls [ListDelegatedAdministrators] API to verify whether the caller is a \
   valid delegated administrator.\n\
  \    \n\
  \     To register a delegated administrator, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/set-up-aggregator-cli.html#register-a-delegated-administrator-cli}Register \
   a Delegated Administrator} in the {i Config developer guide}. \n\
  \     \n\
  \         {b Tags are added at creation and cannot be updated with this operation} \n\
  \        \n\
  \          [PutConfigurationAggregator] is an idempotent API. Subsequent requests \
   won\226\128\153t create a duplicate resource if one was already created. If a following request \
   has different [tags] values, Config will ignore these differences and treat it as an idempotent \
   request of the previous. In this case, [tags] will not be updated, even if they are different.\n\
  \         \n\
  \          Use \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} \
   to update tags after creation.\n\
  \          \n\
  \           "]

module PutConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    put_configuration_recorder_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidConfigurationRecorderNameException of invalid_configuration_recorder_name_exception
      | `InvalidRecordingGroupException of invalid_recording_group_exception
      | `InvalidRoleException of invalid_role_exception
      | `MaxNumberOfConfigurationRecordersExceededException of
        max_number_of_configuration_recorders_exceeded_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates or updates the customer managed configuration recorder.\n\n\
  \ You can use this operation to create a new customer managed configuration recorder or to \
   update the [roleARN] and the [recordingGroup] for an existing customer managed configuration \
   recorder.\n\
  \ \n\
  \  To start the customer managed configuration recorder and begin recording configuration \
   changes for the resource types you specify, use the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_StartConfigurationRecorder.html}StartConfigurationRecorder} \
   operation.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b \
   Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n\
  \   \n\
  \      {b One customer managed configuration recorder per account per Region} \n\
  \     \n\
  \      You can create only one customer managed configuration recorder for each account for each \
   Amazon Web Services Region.\n\
  \      \n\
  \        {b Default is to record all supported resource types, excluding the global IAM resource \
   types} \n\
  \       \n\
  \        If you have not specified values for the [recordingGroup] field, the default for the \
   customer managed configuration recorder is to record all supported resource types, excluding \
   the global IAM resource types: [AWS::IAM::Group], [AWS::IAM::Policy], [AWS::IAM::Role], and \
   [AWS::IAM::User].\n\
  \        \n\
  \          {b Tags are added at creation and cannot be updated} \n\
  \         \n\
  \           [PutConfigurationRecorder] is an idempotent API. Subsequent requests \
   won\226\128\153t create a duplicate resource if one was already created. If a following request \
   has different tags values, Config will ignore these differences and treat it as an idempotent \
   request of the previous. In this case, tags will not be updated, even if they are different.\n\
  \          \n\
  \           Use \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} \
   to update tags after creation.\n\
  \           \n\
  \            "]

module PutConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
    put_conformance_pack_request ->
    ( put_conformance_pack_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConformancePackTemplateValidationException of
        conformance_pack_template_validation_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MaxNumberOfConformancePacksExceededException of
        max_number_of_conformance_packs_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Creates or updates a conformance pack. A conformance pack is a collection of Config rules that \
   can be easily deployed in an account and a region and across an organization. For information \
   on how many conformance packs you can have per account, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service \
   Limits} } in the {i Config Developer Guide}.\n\n\
  \ This API creates a service-linked role [AWSServiceRoleForConfigConforms] in your account. The \
   service-linked role is created only when the role does not exist in your account. \n\
  \ \n\
  \   You must specify only one of the follow parameters: [TemplateS3Uri], [TemplateBody] or \
   [TemplateSSMDocumentDetails].\n\
  \   \n\
  \    "]

module PutDeliveryChannel : sig
  val request :
    Smaws_Lib.Context.t ->
    put_delivery_channel_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientDeliveryPolicyException of insufficient_delivery_policy_exception
      | `InvalidDeliveryChannelNameException of invalid_delivery_channel_name_exception
      | `InvalidS3KeyPrefixException of invalid_s3_key_prefix_exception
      | `InvalidS3KmsKeyArnException of invalid_s3_kms_key_arn_exception
      | `InvalidSNSTopicARNException of invalid_sns_topic_arn_exception
      | `MaxNumberOfDeliveryChannelsExceededException of
        max_number_of_delivery_channels_exceeded_exception
      | `NoAvailableConfigurationRecorderException of no_available_configuration_recorder_exception
      | `NoSuchBucketException of no_such_bucket_exception ] )
    result
end
[@@ocaml.doc
  "Creates or updates a delivery channel to deliver configuration information and other compliance \
   information.\n\n\
  \ You can use this operation to create a new delivery channel or to update the Amazon S3 bucket \
   and the Amazon SNS topic of an existing delivery channel.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/manage-delivery-channel.html} {b \
   Working with the Delivery Channel} } in the {i Config Developer Guide.} \n\
  \  \n\
  \     {b One delivery channel per account per Region} \n\
  \    \n\
  \     You can have only one delivery channel for each account for each Amazon Web Services Region.\n\
  \     \n\
  \      "]

module PutEvaluations : sig
  val request :
    Smaws_Lib.Context.t ->
    put_evaluations_request ->
    ( put_evaluations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `InvalidResultTokenException of invalid_result_token_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Used by an Lambda function to deliver evaluation results to Config. This operation is required \
   in every Lambda function that is invoked by an Config rule.\n"]

module PutExternalEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
    put_external_evaluation_request ->
    ( put_external_evaluation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception ] )
    result
end
[@@ocaml.doc
  "Add or updates the evaluations for process checks. This API checks if the rule is a process \
   check when the name of the Config rule is provided.\n"]

module PutOrganizationConfigRule : sig
  val request :
    Smaws_Lib.Context.t ->
    put_organization_config_rule_request ->
    ( put_organization_config_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MaxNumberOfOrganizationConfigRulesExceededException of
        max_number_of_organization_config_rules_exceeded_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception
      | `OrganizationAllFeaturesNotEnabledException of
        organization_all_features_not_enabled_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Adds or updates an Config rule for your entire organization to evaluate if your Amazon Web \
   Services resources comply with your desired configurations. For information on how many \
   organization Config rules you can have per account, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} {b Service \
   Limits} } in the {i Config Developer Guide}.\n\n\
  \  Only a management account and a delegated administrator can create or update an organization \
   Config rule. When calling this API with a delegated administrator, you must ensure \
   Organizations [ListDelegatedAdministrator] permissions are added. An organization can have up \
   to 3 delegated administrators.\n\
  \ \n\
  \  This API enables organization service access through the [EnableAWSServiceAccess] action and \
   creates a service-linked role [AWSServiceRoleForConfigMultiAccountSetup] in the management or \
   delegated administrator account of your organization. The service-linked role is created only \
   when the role does not exist in the caller account. Config verifies the existence of role with \
   [GetRole] action.\n\
  \  \n\
  \   To use this API with delegated administrator, register a delegated administrator by calling \
   Amazon Web Services Organization [register-delegated-administrator] for \
   [config-multiaccountsetup.amazonaws.com]. \n\
  \   \n\
  \    There are two types of rules: {i Config Managed Rules} and {i Config Custom Rules}. You can \
   use [PutOrganizationConfigRule] to create both Config Managed Rules and Config Custom Rules.\n\
  \    \n\
  \     Config Managed Rules are predefined, customizable rules created by Config. For a list of \
   managed rules, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html}List \
   of Config Managed Rules}. If you are adding an Config managed rule, you must specify the rule's \
   identifier for the [RuleIdentifier] key.\n\
  \     \n\
  \      Config Custom Rules are rules that you create from scratch. There are two ways to create \
   Config custom rules: with Lambda functions \
   ({{:https://docs.aws.amazon.com/config/latest/developerguide/gettingstarted-concepts.html#gettingstarted-concepts-function} \
   Lambda Developer Guide}) and with Guard \
   ({{:https://github.com/aws-cloudformation/cloudformation-guard}Guard GitHub Repository}), a \
   policy-as-code language. Config custom rules created with Lambda are called {i Config Custom \
   Lambda Rules} and Config custom rules created with Guard are called {i Config Custom Policy \
   Rules}.\n\
  \      \n\
  \       If you are adding a new Config Custom Lambda rule, you first need to create an Lambda \
   function in the management account or a delegated administrator that the rule invokes to \
   evaluate your resources. You also need to create an IAM role in the managed account that can be \
   assumed by the Lambda function. When you use [PutOrganizationConfigRule] to add a Custom Lambda \
   rule to Config, you must specify the Amazon Resource Name (ARN) that Lambda assigns to the \
   function.\n\
  \       \n\
  \         Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an \
   organization.\n\
  \         \n\
  \          Make sure to specify one of either [OrganizationCustomPolicyRuleMetadata] for Custom \
   Policy rules, [OrganizationCustomRuleMetadata] for Custom Lambda rules, or \
   [OrganizationManagedRuleMetadata] for managed rules.\n\
  \          \n\
  \           "]

module PutOrganizationConformancePack : sig
  val request :
    Smaws_Lib.Context.t ->
    put_organization_conformance_pack_request ->
    ( put_organization_conformance_pack_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `MaxNumberOfOrganizationConformancePacksExceededException of
        max_number_of_organization_conformance_packs_exceeded_exception
      | `NoAvailableOrganizationException of no_available_organization_exception
      | `OrganizationAccessDeniedException of organization_access_denied_exception
      | `OrganizationAllFeaturesNotEnabledException of
        organization_all_features_not_enabled_exception
      | `OrganizationConformancePackTemplateValidationException of
        organization_conformance_pack_template_validation_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Deploys conformance packs across member accounts in an Amazon Web Services Organization. For \
   information on how many organization conformance packs and how many Config rules you can have \
   per account, see {{:https://docs.aws.amazon.com/config/latest/developerguide/configlimits.html} \
   {b Service Limits} } in the {i Config Developer Guide}.\n\n\
  \ Only a management account and a delegated administrator can call this API. When calling this \
   API with a delegated administrator, you must ensure Organizations [ListDelegatedAdministrator] \
   permissions are added. An organization can have up to 3 delegated administrators.\n\
  \ \n\
  \  This API enables organization service access for [config-multiaccountsetup.amazonaws.com] \
   through the [EnableAWSServiceAccess] action and creates a service-linked role \
   [AWSServiceRoleForConfigMultiAccountSetup] in the management or delegated administrator account \
   of your organization. The service-linked role is created only when the role does not exist in \
   the caller account. To use this API with delegated administrator, register a delegated \
   administrator by calling Amazon Web Services Organization [register-delegate-admin] for \
   [config-multiaccountsetup.amazonaws.com].\n\
  \  \n\
  \    Prerequisite: Ensure you call [EnableAllFeatures] API to enable all features in an \
   organization.\n\
  \    \n\
  \     You must specify either the [TemplateS3Uri] or the [TemplateBody] parameter, but not both. \
   If you provide both Config uses the [TemplateS3Uri] parameter and ignores the [TemplateBody] \
   parameter.\n\
  \     \n\
  \      Config sets the state of a conformance pack to CREATE_IN_PROGRESS and UPDATE_IN_PROGRESS \
   until the conformance pack is created or updated. You cannot update a conformance pack while it \
   is in this state.\n\
  \      \n\
  \       "]

module PutRemediationConfigurations : sig
  val request :
    Smaws_Lib.Context.t ->
    put_remediation_configurations_request ->
    ( put_remediation_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Adds or updates the remediation configuration with a specific Config rule with the selected \
   target or action. The API creates the [RemediationConfiguration] object for the Config rule. \
   The Config rule must already exist for you to add a remediation configuration. The target (SSM \
   document) must exist and have permissions to use the target. \n\n\
  \   {b Be aware of backward incompatible changes} \n\
  \  \n\
  \   If you make backward incompatible changes to the SSM document, you must call this again to \
   ensure the remediations can run.\n\
  \   \n\
  \    This API does not support adding remediation configurations for service-linked Config Rules \
   such as Organization Config rules, the rules deployed by conformance packs, and rules deployed \
   by Amazon Web Services Security Hub.\n\
  \    \n\
  \        {b Required fields} \n\
  \       \n\
  \        For manual remediation configuration, you need to provide a value for \
   [automationAssumeRole] or use a value in the [assumeRole]field to remediate your resources. The \
   SSM automation document can use either as long as it maps to a valid parameter.\n\
  \        \n\
  \         However, for automatic remediation configuration, the only valid [assumeRole] field \
   value is [AutomationAssumeRole] and you need to provide a value for [AutomationAssumeRole] to \
   remediate your resources.\n\
  \         \n\
  \             {b Auto remediation can be initiated even for compliant resources} \n\
  \            \n\
  \             If you enable auto remediation for a specific Config rule using the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} \
   API or the Config console, it initiates the remediation process for all non-compliant resources \
   for that specific rule. The auto remediation process relies on the compliance data snapshot \
   which is captured on a periodic basis. Any non-compliant resource that is updated between the \
   snapshot schedule will continue to be remediated based on the last known compliance data \
   snapshot.\n\
  \             \n\
  \              This means that in some cases auto remediation can be initiated even for \
   compliant resources, since the bootstrap processor uses a database that can have stale \
   evaluation results based on the last known compliance data snapshot.\n\
  \              \n\
  \               "]

module PutRemediationExceptions : sig
  val request :
    Smaws_Lib.Context.t ->
    put_remediation_exceptions_request ->
    ( put_remediation_exceptions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "A remediation exception is when a specified resource is no longer considered for \
   auto-remediation. This API adds a new exception or updates an existing exception for a \
   specified resource with a specified Config rule. \n\n\
  \   {b Exceptions block auto remediation} \n\
  \  \n\
  \   Config generates a remediation exception when a problem occurs running a remediation action \
   for a specified resource. Remediation exceptions blocks auto-remediation until the exception is \
   cleared.\n\
  \   \n\
  \       {b Manual remediation is recommended when placing an exception} \n\
  \      \n\
  \       When placing an exception on an Amazon Web Services resource, it is recommended that \
   remediation is set as manual remediation until the given Config rule for the specified resource \
   evaluates the resource as [NON_COMPLIANT]. Once the resource has been evaluated as \
   [NON_COMPLIANT], you can add remediation exceptions and change the remediation type back from \
   Manual to Auto if you want to use auto-remediation. Otherwise, using auto-remediation before a \
   [NON_COMPLIANT] evaluation result can delete resources before the exception is applied.\n\
  \       \n\
  \           {b Exceptions can only be performed on non-compliant resources} \n\
  \          \n\
  \           Placing an exception can only be performed on resources that are [NON_COMPLIANT]. If \
   you use this API for [COMPLIANT] resources or resources that are [NOT_APPLICABLE], a \
   remediation exception will not be generated. For more information on the conditions that \
   initiate the possible Config evaluation results, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/config-concepts.html#aws-config-rules}Concepts \
   | Config Rules} in the {i Config Developer Guide}.\n\
  \           \n\
  \               {b Exceptions cannot be placed on service-linked remediation actions} \n\
  \              \n\
  \               You cannot place an exception on service-linked remediation actions, such as \
   remediation actions put by an organizational conformance pack.\n\
  \               \n\
  \                   {b Auto remediation can be initiated even for compliant resources} \n\
  \                  \n\
  \                   If you enable auto remediation for a specific Config rule using the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/emAPI_PutRemediationConfigurations.html}PutRemediationConfigurations} \
   API or the Config console, it initiates the remediation process for all non-compliant resources \
   for that specific rule. The auto remediation process relies on the compliance data snapshot \
   which is captured on a periodic basis. Any non-compliant resource that is updated between the \
   snapshot schedule will continue to be remediated based on the last known compliance data \
   snapshot.\n\
  \                   \n\
  \                    This means that in some cases auto remediation can be initiated even for \
   compliant resources, since the bootstrap processor uses a database that can have stale \
   evaluation results based on the last known compliance data snapshot.\n\
  \                    \n\
  \                     "]

module PutResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    put_resource_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `MaxActiveResourcesExceededException of max_active_resources_exceeded_exception
      | `NoRunningConfigurationRecorderException of no_running_configuration_recorder_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Records the configuration state for the resource provided in the request. The configuration \
   state of a resource is represented in Config as Configuration Items. Once this API records the \
   configuration item, you can retrieve the list of configuration items for the custom resource \
   type using existing Config APIs. \n\n\
  \  The custom resource type must be registered with CloudFormation. This API accepts the \
   configuration item registered with CloudFormation.\n\
  \  \n\
  \   When you call this API, Config only stores configuration state of the resource provided in \
   the request. This API does not change or remediate the configuration of the resource. \n\
  \   \n\
  \    Write-only schema properites are not recorded as part of the published configuration item.\n\
  \    \n\
  \     "]

module PutRetentionConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
    put_retention_configuration_request ->
    ( put_retention_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `MaxNumberOfRetentionConfigurationsExceededException of
        max_number_of_retention_configurations_exceeded_exception ] )
    result
end
[@@ocaml.doc
  "Creates and updates the retention configuration with details about retention period (number of \
   days) that Config stores your historical information. The API creates the \
   [RetentionConfiguration] object and names the object as {b default}. When you have a \
   [RetentionConfiguration] object named {b default}, calling the API modifies the default object. \
   \n\n\
  \  Currently, Config supports only one retention configuration per region in your account.\n\
  \  \n\
  \   "]

module PutServiceLinkedConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    put_service_linked_configuration_recorder_request ->
    ( put_service_linked_configuration_recorder_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Creates a service-linked configuration recorder that is linked to a specific Amazon Web \
   Services service based on the [ServicePrincipal] you specify.\n\n\
  \ The configuration recorder's [name], [recordingGroup], [recordingMode], and [recordingScope] \
   is set by the service that is linked to the configuration recorder.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/stop-start-recorder.html} {b \
   Working with the Configuration Recorder} } in the {i Config Developer Guide}.\n\
  \  \n\
  \   This API creates a service-linked role [AWSServiceRoleForConfig] in your account. The \
   service-linked role is created only when the role does not exist in your account.\n\
  \   \n\
  \      {b The recording scope determines if you receive configuration items} \n\
  \     \n\
  \      The recording scope is set by the service that is linked to the configuration recorder \
   and determines whether you receive configuration items (CIs) in the delivery channel. If the \
   recording scope is internal, you will not receive CIs in the delivery channel.\n\
  \      \n\
  \        {b Tags are added at creation and cannot be updated with this operation} \n\
  \       \n\
  \        Use \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_TagResource.html}TagResource} and \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_UntagResource.html}UntagResource} \
   to update tags after creation.\n\
  \        \n\
  \         "]

module PutStoredQuery : sig
  val request :
    Smaws_Lib.Context.t ->
    put_stored_query_request ->
    ( put_stored_query_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceConcurrentModificationException of resource_concurrent_modification_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Saves a new query or updates an existing saved query. The [QueryName] must be unique for a \
   single Amazon Web Services account and a single Amazon Web Services Region. You can create upto \
   300 queries in a single Amazon Web Services account and a single Amazon Web Services Region.\n\n\
  \   {b Tags are added at creation and cannot be updated} \n\
  \  \n\
  \    [PutStoredQuery] is an idempotent API. Subsequent requests won\226\128\153t create a \
   duplicate resource if one was already created. If a following request has different [tags] \
   values, Config will ignore these differences and treat it as an idempotent request of the \
   previous. In this case, [tags] will not be updated, even if they are different.\n\
  \   \n\
  \    "]

module SelectAggregateResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    select_aggregate_resource_config_request ->
    ( select_aggregate_resource_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidExpressionException of invalid_expression_exception
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `NoSuchConfigurationAggregatorException of no_such_configuration_aggregator_exception ] )
    result
end
[@@ocaml.doc
  "Accepts a structured query language (SQL) SELECT command and an aggregator to query \
   configuration state of Amazon Web Services resources across multiple accounts and regions, \
   performs the corresponding search, and returns resource configurations matching the \
   properties.\n\n\
  \ For more information about query components, see the \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query \
   Components} } section in the {i Config Developer Guide}.\n\
  \ \n\
  \   If you run an aggregation query (i.e., using [GROUP BY] or using aggregate functions such as \
   [COUNT]; e.g., [SELECT resourceId, COUNT(*) WHERE resourceType = 'AWS::IAM::Role' GROUP BY \
   resourceId]) and do not specify the [MaxResults] or the [Limit] query parameters, the default \
   page size is set to 500.\n\
  \   \n\
  \    If you run a non-aggregation query (i.e., not using [GROUP BY] or aggregate function; e.g., \
   [SELECT * WHERE resourceType = 'AWS::IAM::Role']) and do not specify the [MaxResults] or the \
   [Limit] query parameters, the default page size is set to 25.\n\
  \    \n\
  \     "]

module SelectResourceConfig : sig
  val request :
    Smaws_Lib.Context.t ->
    select_resource_config_request ->
    ( select_resource_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidExpressionException of invalid_expression_exception
      | `InvalidLimitException of invalid_limit_exception
      | `InvalidNextTokenException of invalid_next_token_exception ] )
    result
end
[@@ocaml.doc
  "Accepts a structured query language (SQL) [SELECT] command, performs the corresponding search, \
   and returns resource configurations matching the properties.\n\n\
  \ For more information about query components, see the \
   {{:https://docs.aws.amazon.com/config/latest/developerguide/query-components.html} {b Query \
   Components} } section in the {i Config Developer Guide}.\n\
  \ "]

module StartConfigRulesEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
    start_config_rules_evaluation_request ->
    ( start_config_rules_evaluation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NoSuchConfigRuleException of no_such_config_rule_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result
end
[@@ocaml.doc
  "Runs an on-demand evaluation for the specified Config rules against the last known \
   configuration state of the resources. Use [StartConfigRulesEvaluation] when you want to test \
   that a rule you updated is working as expected. [StartConfigRulesEvaluation] does not re-record \
   the latest configuration state for your resources. It re-runs an evaluation against the last \
   known state of your resources. \n\n\
  \ You can specify up to 25 Config rules per request. \n\
  \ \n\
  \  An existing [StartConfigRulesEvaluation] call for the specified rules must complete before \
   you can call the API again. If you chose to have Config stream to an Amazon SNS topic, you will \
   receive a [ConfigRuleEvaluationStarted] notification when the evaluation starts.\n\
  \  \n\
  \    You don't need to call the [StartConfigRulesEvaluation] API to run an evaluation for a new \
   rule. When you create a rule, Config evaluates your resources against the rule automatically. \n\
  \    \n\
  \      The [StartConfigRulesEvaluation] API is useful if you want to run on-demand evaluations, \
   such as the following example:\n\
  \      \n\
  \       {ol\n\
  \             {-  You have a custom rule that evaluates your IAM resources every 24 hours.\n\
  \                 \n\
  \                  }\n\
  \             {-  You update your Lambda function to add additional conditions to your rule.\n\
  \                 \n\
  \                  }\n\
  \             {-  Instead of waiting for the next periodic evaluation, you call the \
   [StartConfigRulesEvaluation] API.\n\
  \                 \n\
  \                  }\n\
  \             {-  Config invokes your Lambda function and evaluates your IAM resources.\n\
  \                 \n\
  \                  }\n\
  \             {-  Your custom rule will still run periodic evaluations every 24 hours.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \  "]

module StartConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    start_configuration_recorder_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoAvailableDeliveryChannelException of no_available_delivery_channel_exception
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result
end
[@@ocaml.doc
  "Starts the customer managed configuration recorder. The customer managed configuration recorder \
   will begin recording configuration changes for the resource types you specify.\n\n\
  \ You must have created a delivery channel to successfully start the customer managed \
   configuration recorder. You can use the \
   {{:https://docs.aws.amazon.com/config/latest/APIReference/API_PutDeliveryChannel.html}PutDeliveryChannel} \
   operation to create a delivery channel.\n\
  \ "]

module StartRemediationExecution : sig
  val request :
    Smaws_Lib.Context.t ->
    start_remediation_execution_request ->
    ( start_remediation_execution_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InsufficientPermissionsException of insufficient_permissions_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NoSuchRemediationConfigurationException of no_such_remediation_configuration_exception ]
    )
    result
end
[@@ocaml.doc
  "Runs an on-demand remediation for the specified Config rules against the last known remediation \
   configuration. It runs an execution against the current state of your resources. Remediation \
   execution is asynchronous.\n\n\
  \ You can specify up to 100 resource keys per request. An existing StartRemediationExecution \
   call for the specified resource keys must complete before you can call the API again.\n\
  \ "]

module StartResourceEvaluation : sig
  val request :
    Smaws_Lib.Context.t ->
    start_resource_evaluation_request ->
    ( start_resource_evaluation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InvalidParameterValueException of invalid_parameter_value_exception ] )
    result
end
[@@ocaml.doc
  "Runs an on-demand evaluation for the specified resource to determine whether the resource \
   details will comply with configured Config rules. You can also use it for evaluation purposes. \
   Config recommends using an evaluation context. It runs an execution against the resource \
   details with all of the Config rules in your account that match with the specified proactive \
   mode and resource type.\n\n\
  \  Ensure you have the [cloudformation:DescribeType] role setup to validate the resource type \
   schema.\n\
  \  \n\
  \   You can find the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-schema.html}Resource \
   type schema} in \"{i Amazon Web Services public extensions}\" within the CloudFormation \
   registry or with the following CLI commmand: [aws cloudformation describe-type --type-name \
   \"AWS::S3::Bucket\" --type RESOURCE].\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry.html#registry-view}Managing \
   extensions through the CloudFormation registry} and \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html}Amazon \
   Web Services resource and property types reference} in the CloudFormation User Guide.\n\
  \    \n\
  \     "]

module StopConfigurationRecorder : sig
  val request :
    Smaws_Lib.Context.t ->
    stop_configuration_recorder_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `NoSuchConfigurationRecorderException of no_such_configuration_recorder_exception
      | `UnmodifiableEntityException of unmodifiable_entity_exception ] )
    result
end
[@@ocaml.doc
  "Stops the customer managed configuration recorder. The customer managed configuration recorder \
   will stop recording configuration changes for the resource types you have specified.\n"]

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc
  "Associates the specified tags to a resource with the specified [ResourceArn]. If existing tags \
   on a resource are not specified in the request parameters, they are not changed. If existing \
   tags are specified, however, then their values will be updated. When a resource is deleted, the \
   tags associated with that resource are deleted as well.\n"]

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result
end
[@@ocaml.doc "Deletes specified tags from a resource.\n"]
