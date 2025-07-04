open Types
module AssociateResourceTypes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_resource_types_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_resource_types_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceAssociateResourceTypes" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_resource_types_response_of_yojson
            ~error_deserializer
  end
module BatchGetAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : batch_get_aggregate_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_aggregate_resource_config_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceBatchGetAggregateResourceConfig"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_aggregate_resource_config_response_of_yojson
            ~error_deserializer
  end
module BatchGetResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : batch_get_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.batch_get_resource_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceBatchGetResourceConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:batch_get_resource_config_response_of_yojson
            ~error_deserializer
  end
module DeleteAggregationAuthorization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_aggregation_authorization_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_aggregation_authorization_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteAggregationAuthorization"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_config_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteConfigRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteConfigurationAggregator =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_configuration_aggregator_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_configuration_aggregator_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteConfigurationAggregator"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "UnmodifiableEntityException") ->
              `UnmodifiableEntityException
                (unmodifiable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_configuration_recorder_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteConformancePack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConformancePackException") ->
              `NoSuchConformancePackException
                (no_such_conformance_pack_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_conformance_pack_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteConformancePack" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteDeliveryChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "LastDeliveryChannelDeleteFailedException") ->
              `LastDeliveryChannelDeleteFailedException
                (last_delivery_channel_delete_failed_exception_of_yojson tree
                   path)
          | (_, "NoSuchDeliveryChannelException") ->
              `NoSuchDeliveryChannelException
                (no_such_delivery_channel_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_delivery_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_delivery_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteDeliveryChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteEvaluationResults =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_evaluation_results_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_evaluation_results_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteEvaluationResults" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_evaluation_results_response_of_yojson
            ~error_deserializer
  end
module DeleteOrganizationConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchOrganizationConfigRuleException") ->
              `NoSuchOrganizationConfigRuleException
                (no_such_organization_config_rule_exception_of_yojson tree
                   path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_organization_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_organization_config_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteOrganizationConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteOrganizationConformancePack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchOrganizationConformancePackException") ->
              `NoSuchOrganizationConformancePackException
                (no_such_organization_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_organization_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_organization_conformance_pack_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteOrganizationConformancePack"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeletePendingAggregationRequest =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_pending_aggregation_request_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_pending_aggregation_request_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeletePendingAggregationRequest"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteRemediationConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchRemediationConfigurationException") ->
              `NoSuchRemediationConfigurationException
                (no_such_remediation_configuration_exception_of_yojson tree
                   path)
          | (_, "RemediationInProgressException") ->
              `RemediationInProgressException
                (remediation_in_progress_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_remediation_configuration_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_remediation_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteRemediationConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_remediation_configuration_response_of_yojson
            ~error_deserializer
  end
module DeleteRemediationExceptions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchRemediationExceptionException") ->
              `NoSuchRemediationExceptionException
                (no_such_remediation_exception_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_remediation_exceptions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteRemediationExceptions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_remediation_exceptions_response_of_yojson
            ~error_deserializer
  end
module DeleteResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoRunningConfigurationRecorderException") ->
              `NoRunningConfigurationRecorderException
                (no_running_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_resource_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteResourceConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteRetentionConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchRetentionConfigurationException") ->
              `NoSuchRetentionConfigurationException
                (no_such_retention_configuration_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_retention_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_retention_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteRetentionConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteServiceLinkedConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_service_linked_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_service_linked_configuration_recorder_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteServiceLinkedConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_service_linked_configuration_recorder_response_of_yojson
            ~error_deserializer
  end
module DeleteStoredQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_stored_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_stored_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeleteStoredQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_stored_query_response_of_yojson
            ~error_deserializer
  end
module DeliverConfigSnapshot =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "NoRunningConfigurationRecorderException") ->
              `NoRunningConfigurationRecorderException
                (no_running_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "NoSuchDeliveryChannelException") ->
              `NoSuchDeliveryChannelException
                (no_such_delivery_channel_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deliver_config_snapshot_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deliver_config_snapshot_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDeliverConfigSnapshot" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:deliver_config_snapshot_response_of_yojson
            ~error_deserializer
  end
module DescribeAggregateComplianceByConfigRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_aggregate_compliance_by_config_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_aggregate_compliance_by_config_rules_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeAggregateComplianceByConfigRules"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_aggregate_compliance_by_config_rules_response_of_yojson
            ~error_deserializer
  end
module DescribeAggregateComplianceByConformancePacks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_aggregate_compliance_by_conformance_packs_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_aggregate_compliance_by_conformance_packs_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeAggregateComplianceByConformancePacks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_aggregate_compliance_by_conformance_packs_response_of_yojson
            ~error_deserializer
  end
module DescribeAggregationAuthorizations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_aggregation_authorizations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_aggregation_authorizations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeAggregationAuthorizations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_aggregation_authorizations_response_of_yojson
            ~error_deserializer
  end
module DescribeComplianceByConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_compliance_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_compliance_by_config_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeComplianceByConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_compliance_by_config_rule_response_of_yojson
            ~error_deserializer
  end
module DescribeComplianceByResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_compliance_by_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_compliance_by_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeComplianceByResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_compliance_by_resource_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigRuleEvaluationStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_config_rule_evaluation_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_config_rule_evaluation_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigRuleEvaluationStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_config_rule_evaluation_status_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_config_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_config_rules_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigRules" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_config_rules_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigurationAggregators =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_configuration_aggregators_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_configuration_aggregators_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigurationAggregators"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_configuration_aggregators_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigurationAggregatorSourcesStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_configuration_aggregator_sources_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_configuration_aggregator_sources_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigurationAggregatorSourcesStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_configuration_aggregator_sources_status_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigurationRecorders =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_configuration_recorders_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_configuration_recorders_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigurationRecorders"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_configuration_recorders_response_of_yojson
            ~error_deserializer
  end
module DescribeConfigurationRecorderStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_configuration_recorder_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_configuration_recorder_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConfigurationRecorderStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_configuration_recorder_status_response_of_yojson
            ~error_deserializer
  end
module DescribeConformancePackCompliance =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleInConformancePackException") ->
              `NoSuchConfigRuleInConformancePackException
                (no_such_config_rule_in_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "NoSuchConformancePackException") ->
              `NoSuchConformancePackException
                (no_such_conformance_pack_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_conformance_pack_compliance_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_conformance_pack_compliance_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConformancePackCompliance"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_conformance_pack_compliance_response_of_yojson
            ~error_deserializer
  end
module DescribeConformancePacks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConformancePackException") ->
              `NoSuchConformancePackException
                (no_such_conformance_pack_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_conformance_packs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_conformance_packs_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConformancePacks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_conformance_packs_response_of_yojson
            ~error_deserializer
  end
module DescribeConformancePackStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_conformance_pack_status_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_conformance_pack_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeConformancePackStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_conformance_pack_status_response_of_yojson
            ~error_deserializer
  end
module DescribeDeliveryChannels =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchDeliveryChannelException") ->
              `NoSuchDeliveryChannelException
                (no_such_delivery_channel_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_delivery_channels_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_delivery_channels_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeDeliveryChannels"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_delivery_channels_response_of_yojson
            ~error_deserializer
  end
module DescribeDeliveryChannelStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchDeliveryChannelException") ->
              `NoSuchDeliveryChannelException
                (no_such_delivery_channel_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_delivery_channel_status_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_delivery_channel_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeDeliveryChannelStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_delivery_channel_status_response_of_yojson
            ~error_deserializer
  end
module DescribeOrganizationConfigRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConfigRuleException") ->
              `NoSuchOrganizationConfigRuleException
                (no_such_organization_config_rule_exception_of_yojson tree
                   path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_organization_config_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_organization_config_rules_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeOrganizationConfigRules"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_organization_config_rules_response_of_yojson
            ~error_deserializer
  end
module DescribeOrganizationConfigRuleStatuses =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConfigRuleException") ->
              `NoSuchOrganizationConfigRuleException
                (no_such_organization_config_rule_exception_of_yojson tree
                   path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_organization_config_rule_statuses_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_organization_config_rule_statuses_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeOrganizationConfigRuleStatuses"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_organization_config_rule_statuses_response_of_yojson
            ~error_deserializer
  end
module DescribeOrganizationConformancePacks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConformancePackException") ->
              `NoSuchOrganizationConformancePackException
                (no_such_organization_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_organization_conformance_packs_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_organization_conformance_packs_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeOrganizationConformancePacks"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_organization_conformance_packs_response_of_yojson
            ~error_deserializer
  end
module DescribeOrganizationConformancePackStatuses =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConformancePackException") ->
              `NoSuchOrganizationConformancePackException
                (no_such_organization_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_organization_conformance_pack_statuses_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_organization_conformance_pack_statuses_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeOrganizationConformancePackStatuses"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_organization_conformance_pack_statuses_response_of_yojson
            ~error_deserializer
  end
module DescribePendingAggregationRequests =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_pending_aggregation_requests_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_pending_aggregation_requests_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribePendingAggregationRequests"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_pending_aggregation_requests_response_of_yojson
            ~error_deserializer
  end
module DescribeRemediationConfigurations =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_remediation_configurations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_remediation_configurations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeRemediationConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_remediation_configurations_response_of_yojson
            ~error_deserializer
  end
module DescribeRemediationExceptions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_remediation_exceptions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeRemediationExceptions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_remediation_exceptions_response_of_yojson
            ~error_deserializer
  end
module DescribeRemediationExecutionStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchRemediationConfigurationException") ->
              `NoSuchRemediationConfigurationException
                (no_such_remediation_configuration_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_remediation_execution_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_remediation_execution_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeRemediationExecutionStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_remediation_execution_status_response_of_yojson
            ~error_deserializer
  end
module DescribeRetentionConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchRetentionConfigurationException") ->
              `NoSuchRetentionConfigurationException
                (no_such_retention_configuration_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_retention_configurations_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_retention_configurations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDescribeRetentionConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_retention_configurations_response_of_yojson
            ~error_deserializer
  end
module DisassociateResourceTypes =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_resource_types_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_resource_types_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceDisassociateResourceTypes"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_resource_types_response_of_yojson
            ~error_deserializer
  end
module GetAggregateComplianceDetailsByConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_aggregate_compliance_details_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_aggregate_compliance_details_by_config_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetAggregateComplianceDetailsByConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_aggregate_compliance_details_by_config_rule_response_of_yojson
            ~error_deserializer
  end
module GetAggregateConfigRuleComplianceSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_aggregate_config_rule_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_aggregate_config_rule_compliance_summary_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetAggregateConfigRuleComplianceSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_aggregate_config_rule_compliance_summary_response_of_yojson
            ~error_deserializer
  end
module GetAggregateConformancePackComplianceSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_aggregate_conformance_pack_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_aggregate_conformance_pack_compliance_summary_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetAggregateConformancePackComplianceSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_aggregate_conformance_pack_compliance_summary_response_of_yojson
            ~error_deserializer
  end
module GetAggregateDiscoveredResourceCounts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_aggregate_discovered_resource_counts_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_aggregate_discovered_resource_counts_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetAggregateDiscoveredResourceCounts"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_aggregate_discovered_resource_counts_response_of_yojson
            ~error_deserializer
  end
module GetAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "OversizedConfigurationItemException") ->
              `OversizedConfigurationItemException
                (oversized_configuration_item_exception_of_yojson tree path)
          | (_, "ResourceNotDiscoveredException") ->
              `ResourceNotDiscoveredException
                (resource_not_discovered_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_aggregate_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_aggregate_resource_config_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetAggregateResourceConfig"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_aggregate_resource_config_response_of_yojson
            ~error_deserializer
  end
module GetComplianceDetailsByConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_compliance_details_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_compliance_details_by_config_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetComplianceDetailsByConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_details_by_config_rule_response_of_yojson
            ~error_deserializer
  end
module GetComplianceDetailsByResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_compliance_details_by_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_compliance_details_by_resource_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetComplianceDetailsByResource"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_details_by_resource_response_of_yojson
            ~error_deserializer
  end
module GetComplianceSummaryByConfigRule =
  struct
    let error_deserializer tree path =
      let handler a = a in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : unit) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.base_unit_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetComplianceSummaryByConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_summary_by_config_rule_response_of_yojson
            ~error_deserializer
  end
module GetComplianceSummaryByResourceType =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_compliance_summary_by_resource_type_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_compliance_summary_by_resource_type_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetComplianceSummaryByResourceType"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_compliance_summary_by_resource_type_response_of_yojson
            ~error_deserializer
  end
module GetConformancePackComplianceDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleInConformancePackException") ->
              `NoSuchConfigRuleInConformancePackException
                (no_such_config_rule_in_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "NoSuchConformancePackException") ->
              `NoSuchConformancePackException
                (no_such_conformance_pack_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_conformance_pack_compliance_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_conformance_pack_compliance_details_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetConformancePackComplianceDetails"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_conformance_pack_compliance_details_response_of_yojson
            ~error_deserializer
  end
module GetConformancePackComplianceSummary =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConformancePackException") ->
              `NoSuchConformancePackException
                (no_such_conformance_pack_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_conformance_pack_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_conformance_pack_compliance_summary_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetConformancePackComplianceSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_conformance_pack_compliance_summary_response_of_yojson
            ~error_deserializer
  end
module GetCustomRulePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_custom_rule_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_custom_rule_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetCustomRulePolicy" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_custom_rule_policy_response_of_yojson
            ~error_deserializer
  end
module GetDiscoveredResourceCounts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_discovered_resource_counts_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_discovered_resource_counts_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetDiscoveredResourceCounts"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_discovered_resource_counts_response_of_yojson
            ~error_deserializer
  end
module GetOrganizationConfigRuleDetailedStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConfigRuleException") ->
              `NoSuchOrganizationConfigRuleException
                (no_such_organization_config_rule_exception_of_yojson tree
                   path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_organization_config_rule_detailed_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_organization_config_rule_detailed_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetOrganizationConfigRuleDetailedStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_organization_config_rule_detailed_status_response_of_yojson
            ~error_deserializer
  end
module GetOrganizationConformancePackDetailedStatus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchOrganizationConformancePackException") ->
              `NoSuchOrganizationConformancePackException
                (no_such_organization_conformance_pack_exception_of_yojson
                   tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_organization_conformance_pack_detailed_status_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_organization_conformance_pack_detailed_status_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetOrganizationConformancePackDetailedStatus"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_organization_conformance_pack_detailed_status_response_of_yojson
            ~error_deserializer
  end
module GetOrganizationCustomRulePolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchOrganizationConfigRuleException") ->
              `NoSuchOrganizationConfigRuleException
                (no_such_organization_config_rule_exception_of_yojson tree
                   path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_organization_custom_rule_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_organization_custom_rule_policy_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetOrganizationCustomRulePolicy"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_organization_custom_rule_policy_response_of_yojson
            ~error_deserializer
  end
module GetResourceConfigHistory =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidTimeRangeException") ->
              `InvalidTimeRangeException
                (invalid_time_range_exception_of_yojson tree path)
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ResourceNotDiscoveredException") ->
              `ResourceNotDiscoveredException
                (resource_not_discovered_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_resource_config_history_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_config_history_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetResourceConfigHistory"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_config_history_response_of_yojson
            ~error_deserializer
  end
module GetResourceEvaluationSummary =
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
    let request context (request : get_resource_evaluation_summary_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_resource_evaluation_summary_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetResourceEvaluationSummary"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_resource_evaluation_summary_response_of_yojson
            ~error_deserializer
  end
module GetStoredQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_stored_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_stored_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceGetStoredQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_stored_query_response_of_yojson
            ~error_deserializer
  end
module ListAggregateDiscoveredResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_aggregate_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_aggregate_discovered_resources_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListAggregateDiscoveredResources"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_aggregate_discovered_resources_response_of_yojson
            ~error_deserializer
  end
module ListConfigurationRecorders =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_configuration_recorders_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_configuration_recorders_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListConfigurationRecorders"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_configuration_recorders_response_of_yojson
            ~error_deserializer
  end
module ListConformancePackComplianceScores =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_conformance_pack_compliance_scores_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_conformance_pack_compliance_scores_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListConformancePackComplianceScores"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_conformance_pack_compliance_scores_response_of_yojson
            ~error_deserializer
  end
module ListDiscoveredResources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_discovered_resources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListDiscoveredResources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_discovered_resources_response_of_yojson
            ~error_deserializer
  end
module ListResourceEvaluations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "InvalidTimeRangeException") ->
              `InvalidTimeRangeException
                (invalid_time_range_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resource_evaluations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resource_evaluations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListResourceEvaluations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resource_evaluations_response_of_yojson
            ~error_deserializer
  end
module ListStoredQueries =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_stored_queries_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_stored_queries_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceListStoredQueries" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_stored_queries_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"StarlingDoveServiceListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module PutAggregationAuthorization =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_aggregation_authorization_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_aggregation_authorization_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutAggregationAuthorization"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_aggregation_authorization_response_of_yojson
            ~error_deserializer
  end
module PutConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "MaxNumberOfConfigRulesExceededException") ->
              `MaxNumberOfConfigRulesExceededException
                (max_number_of_config_rules_exceeded_exception_of_yojson tree
                   path)
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_config_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutConfigRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutConfigurationAggregator =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "InvalidRoleException") ->
              `InvalidRoleException
                (invalid_role_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NoAvailableOrganizationException") ->
              `NoAvailableOrganizationException
                (no_available_organization_exception_of_yojson tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | (_, "OrganizationAllFeaturesNotEnabledException") ->
              `OrganizationAllFeaturesNotEnabledException
                (organization_all_features_not_enabled_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_configuration_aggregator_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_configuration_aggregator_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutConfigurationAggregator"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_configuration_aggregator_response_of_yojson
            ~error_deserializer
  end
module PutConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidConfigurationRecorderNameException") ->
              `InvalidConfigurationRecorderNameException
                (invalid_configuration_recorder_name_exception_of_yojson tree
                   path)
          | (_, "InvalidRecordingGroupException") ->
              `InvalidRecordingGroupException
                (invalid_recording_group_exception_of_yojson tree path)
          | (_, "InvalidRoleException") ->
              `InvalidRoleException
                (invalid_role_exception_of_yojson tree path)
          | (_, "MaxNumberOfConfigurationRecordersExceededException") ->
              `MaxNumberOfConfigurationRecordersExceededException
                (max_number_of_configuration_recorders_exceeded_exception_of_yojson
                   tree path)
          | (_, "UnmodifiableEntityException") ->
              `UnmodifiableEntityException
                (unmodifiable_entity_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_configuration_recorder_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutConformancePack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConformancePackTemplateValidationException") ->
              `ConformancePackTemplateValidationException
                (conformance_pack_template_validation_exception_of_yojson
                   tree path)
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "MaxNumberOfConformancePacksExceededException") ->
              `MaxNumberOfConformancePacksExceededException
                (max_number_of_conformance_packs_exceeded_exception_of_yojson
                   tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_conformance_pack_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutConformancePack" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_conformance_pack_response_of_yojson
            ~error_deserializer
  end
module PutDeliveryChannel =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientDeliveryPolicyException") ->
              `InsufficientDeliveryPolicyException
                (insufficient_delivery_policy_exception_of_yojson tree path)
          | (_, "InvalidDeliveryChannelNameException") ->
              `InvalidDeliveryChannelNameException
                (invalid_delivery_channel_name_exception_of_yojson tree path)
          | (_, "InvalidS3KeyPrefixException") ->
              `InvalidS3KeyPrefixException
                (invalid_s3_key_prefix_exception_of_yojson tree path)
          | (_, "InvalidS3KmsKeyArnException") ->
              `InvalidS3KmsKeyArnException
                (invalid_s3_kms_key_arn_exception_of_yojson tree path)
          | (_, "InvalidSNSTopicARNException") ->
              `InvalidSNSTopicARNException
                (invalid_sns_topic_arn_exception_of_yojson tree path)
          | (_, "MaxNumberOfDeliveryChannelsExceededException") ->
              `MaxNumberOfDeliveryChannelsExceededException
                (max_number_of_delivery_channels_exceeded_exception_of_yojson
                   tree path)
          | (_, "NoAvailableConfigurationRecorderException") ->
              `NoAvailableConfigurationRecorderException
                (no_available_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "NoSuchBucketException") ->
              `NoSuchBucketException
                (no_such_bucket_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_delivery_channel_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_delivery_channel_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutDeliveryChannel" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutEvaluations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "InvalidResultTokenException") ->
              `InvalidResultTokenException
                (invalid_result_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_evaluations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_evaluations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutEvaluations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_evaluations_response_of_yojson
            ~error_deserializer
  end
module PutExternalEvaluation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_external_evaluation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_external_evaluation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutExternalEvaluation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_external_evaluation_response_of_yojson
            ~error_deserializer
  end
module PutOrganizationConfigRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "MaxNumberOfOrganizationConfigRulesExceededException") ->
              `MaxNumberOfOrganizationConfigRulesExceededException
                (max_number_of_organization_config_rules_exceeded_exception_of_yojson
                   tree path)
          | (_, "NoAvailableOrganizationException") ->
              `NoAvailableOrganizationException
                (no_available_organization_exception_of_yojson tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | (_, "OrganizationAllFeaturesNotEnabledException") ->
              `OrganizationAllFeaturesNotEnabledException
                (organization_all_features_not_enabled_exception_of_yojson
                   tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_organization_config_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_organization_config_rule_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutOrganizationConfigRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_organization_config_rule_response_of_yojson
            ~error_deserializer
  end
module PutOrganizationConformancePack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "MaxNumberOfOrganizationConformancePacksExceededException")
              ->
              `MaxNumberOfOrganizationConformancePacksExceededException
                (max_number_of_organization_conformance_packs_exceeded_exception_of_yojson
                   tree path)
          | (_, "NoAvailableOrganizationException") ->
              `NoAvailableOrganizationException
                (no_available_organization_exception_of_yojson tree path)
          | (_, "OrganizationAccessDeniedException") ->
              `OrganizationAccessDeniedException
                (organization_access_denied_exception_of_yojson tree path)
          | (_, "OrganizationAllFeaturesNotEnabledException") ->
              `OrganizationAllFeaturesNotEnabledException
                (organization_all_features_not_enabled_exception_of_yojson
                   tree path)
          | (_, "OrganizationConformancePackTemplateValidationException") ->
              `OrganizationConformancePackTemplateValidationException
                (organization_conformance_pack_template_validation_exception_of_yojson
                   tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_organization_conformance_pack_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_organization_conformance_pack_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutOrganizationConformancePack"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_organization_conformance_pack_response_of_yojson
            ~error_deserializer
  end
module PutRemediationConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_remediation_configurations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_remediation_configurations_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutRemediationConfigurations"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_remediation_configurations_response_of_yojson
            ~error_deserializer
  end
module PutRemediationExceptions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_remediation_exceptions_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutRemediationExceptions"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_remediation_exceptions_response_of_yojson
            ~error_deserializer
  end
module PutResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "MaxActiveResourcesExceededException") ->
              `MaxActiveResourcesExceededException
                (max_active_resources_exceeded_exception_of_yojson tree path)
          | (_, "NoRunningConfigurationRecorderException") ->
              `NoRunningConfigurationRecorderException
                (no_running_configuration_recorder_exception_of_yojson tree
                   path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_resource_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutResourceConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutRetentionConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "MaxNumberOfRetentionConfigurationsExceededException") ->
              `MaxNumberOfRetentionConfigurationsExceededException
                (max_number_of_retention_configurations_exceeded_exception_of_yojson
                   tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_retention_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_retention_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutRetentionConfiguration"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_retention_configuration_response_of_yojson
            ~error_deserializer
  end
module PutServiceLinkedConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : put_service_linked_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_service_linked_configuration_recorder_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutServiceLinkedConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_service_linked_configuration_recorder_response_of_yojson
            ~error_deserializer
  end
module PutStoredQuery =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceConcurrentModificationException") ->
              `ResourceConcurrentModificationException
                (resource_concurrent_modification_exception_of_yojson tree
                   path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_stored_query_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_stored_query_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServicePutStoredQuery" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_stored_query_response_of_yojson
            ~error_deserializer
  end
module SelectAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidExpressionException") ->
              `InvalidExpressionException
                (invalid_expression_exception_of_yojson tree path)
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationAggregatorException") ->
              `NoSuchConfigurationAggregatorException
                (no_such_configuration_aggregator_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : select_aggregate_resource_config_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.select_aggregate_resource_config_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceSelectAggregateResourceConfig"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:select_aggregate_resource_config_response_of_yojson
            ~error_deserializer
  end
module SelectResourceConfig =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidExpressionException") ->
              `InvalidExpressionException
                (invalid_expression_exception_of_yojson tree path)
          | (_, "InvalidLimitException") ->
              `InvalidLimitException
                (invalid_limit_exception_of_yojson tree path)
          | (_, "InvalidNextTokenException") ->
              `InvalidNextTokenException
                (invalid_next_token_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : select_resource_config_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.select_resource_config_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceSelectResourceConfig" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:select_resource_config_response_of_yojson
            ~error_deserializer
  end
module StartConfigRulesEvaluation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "NoSuchConfigRuleException") ->
              `NoSuchConfigRuleException
                (no_such_config_rule_exception_of_yojson tree path)
          | (_, "ResourceInUseException") ->
              `ResourceInUseException
                (resource_in_use_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_config_rules_evaluation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_config_rules_evaluation_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceStartConfigRulesEvaluation"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_config_rules_evaluation_response_of_yojson
            ~error_deserializer
  end
module StartConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoAvailableDeliveryChannelException") ->
              `NoAvailableDeliveryChannelException
                (no_available_delivery_channel_exception_of_yojson tree path)
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "UnmodifiableEntityException") ->
              `UnmodifiableEntityException
                (unmodifiable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_configuration_recorder_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceStartConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module StartRemediationExecution =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InsufficientPermissionsException") ->
              `InsufficientPermissionsException
                (insufficient_permissions_exception_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | (_, "NoSuchRemediationConfigurationException") ->
              `NoSuchRemediationConfigurationException
                (no_such_remediation_configuration_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_remediation_execution_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_remediation_execution_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceStartRemediationExecution"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_remediation_execution_response_of_yojson
            ~error_deserializer
  end
module StartResourceEvaluation =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "IdempotentParameterMismatch") ->
              `IdempotentParameterMismatch
                (idempotent_parameter_mismatch_of_yojson tree path)
          | (_, "InvalidParameterValueException") ->
              `InvalidParameterValueException
                (invalid_parameter_value_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_resource_evaluation_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.start_resource_evaluation_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceStartResourceEvaluation" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_resource_evaluation_response_of_yojson
            ~error_deserializer
  end
module StopConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "NoSuchConfigurationRecorderException") ->
              `NoSuchConfigurationRecorderException
                (no_such_configuration_recorder_exception_of_yojson tree path)
          | (_, "UnmodifiableEntityException") ->
              `UnmodifiableEntityException
                (unmodifiable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : stop_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.stop_configuration_recorder_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"StarlingDoveServiceStopConfigurationRecorder"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "TooManyTagsException") ->
              `TooManyTagsException
                (too_many_tags_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"StarlingDoveServiceTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
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
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
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
            ~shape_name:"StarlingDoveServiceUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end