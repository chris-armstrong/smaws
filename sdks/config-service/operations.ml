open Types
open Service_metadata
module AssociateResourceTypes =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : associate_resource_types_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.associate_resource_types_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceAssociateResourceTypes" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.associate_resource_types_response_of_yojson
          ~error_deserializer
  end
module BatchGetAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : batch_get_aggregate_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.batch_get_aggregate_resource_config_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceBatchGetAggregateResourceConfig"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.batch_get_aggregate_resource_config_response_of_yojson
          ~error_deserializer
  end
module BatchGetResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : batch_get_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.batch_get_resource_config_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceBatchGetResourceConfig" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.batch_get_resource_config_response_of_yojson
          ~error_deserializer
  end
module DeleteAggregationAuthorization =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_aggregation_authorization_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_aggregation_authorization_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteAggregationAuthorization"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_config_rule_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteConfigRule" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteConfigurationAggregator =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_configuration_aggregator_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_configuration_aggregator_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteConfigurationAggregator"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "UnmodifiableEntityException") ->
            `UnmodifiableEntityException
              (Json_deserializers.unmodifiable_entity_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteConfigurationRecorder"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteConformancePack =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConformancePackException") ->
            `NoSuchConformancePackException
              (Json_deserializers.no_such_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_conformance_pack_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteConformancePack" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteDeliveryChannel =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "LastDeliveryChannelDeleteFailedException") ->
            `LastDeliveryChannelDeleteFailedException
              (Json_deserializers.last_delivery_channel_delete_failed_exception_of_yojson
                 tree path)
        | (_, "NoSuchDeliveryChannelException") ->
            `NoSuchDeliveryChannelException
              (Json_deserializers.no_such_delivery_channel_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_delivery_channel_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_delivery_channel_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteDeliveryChannel" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteEvaluationResults =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_evaluation_results_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_evaluation_results_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteEvaluationResults" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_evaluation_results_response_of_yojson
          ~error_deserializer
  end
module DeleteOrganizationConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchOrganizationConfigRuleException") ->
            `NoSuchOrganizationConfigRuleException
              (Json_deserializers.no_such_organization_config_rule_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_organization_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_organization_config_rule_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteOrganizationConfigRule"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteOrganizationConformancePack =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchOrganizationConformancePackException") ->
            `NoSuchOrganizationConformancePackException
              (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : delete_organization_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_organization_conformance_pack_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteOrganizationConformancePack"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeletePendingAggregationRequest =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : delete_pending_aggregation_request_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_pending_aggregation_request_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeletePendingAggregationRequest"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteRemediationConfiguration =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchRemediationConfigurationException") ->
            `NoSuchRemediationConfigurationException
              (Json_deserializers.no_such_remediation_configuration_exception_of_yojson
                 tree path)
        | (_, "RemediationInProgressException") ->
            `RemediationInProgressException
              (Json_deserializers.remediation_in_progress_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_remediation_configuration_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_remediation_configuration_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteRemediationConfiguration"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_remediation_configuration_response_of_yojson
          ~error_deserializer
  end
module DeleteRemediationExceptions =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchRemediationExceptionException") ->
            `NoSuchRemediationExceptionException
              (Json_deserializers.no_such_remediation_exception_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_remediation_exceptions_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteRemediationExceptions"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_remediation_exceptions_response_of_yojson
          ~error_deserializer
  end
module DeleteResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoRunningConfigurationRecorderException") ->
            `NoRunningConfigurationRecorderException
              (Json_deserializers.no_running_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_resource_config_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteResourceConfig" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteRetentionConfiguration =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchRetentionConfigurationException") ->
            `NoSuchRetentionConfigurationException
              (Json_deserializers.no_such_retention_configuration_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_retention_configuration_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_retention_configuration_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteRetentionConfiguration"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module DeleteServiceLinkedConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : delete_service_linked_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_service_linked_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteServiceLinkedConfigurationRecorder"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_service_linked_configuration_recorder_response_of_yojson
          ~error_deserializer
  end
module DeleteStoredQuery =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : delete_stored_query_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.delete_stored_query_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeleteStoredQuery" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.delete_stored_query_response_of_yojson
          ~error_deserializer
  end
module DeliverConfigSnapshot =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "NoRunningConfigurationRecorderException") ->
            `NoRunningConfigurationRecorderException
              (Json_deserializers.no_running_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "NoSuchDeliveryChannelException") ->
            `NoSuchDeliveryChannelException
              (Json_deserializers.no_such_delivery_channel_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : deliver_config_snapshot_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.deliver_config_snapshot_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDeliverConfigSnapshot" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.deliver_config_snapshot_response_of_yojson
          ~error_deserializer
  end
module DescribeAggregateComplianceByConfigRules =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_aggregate_compliance_by_config_rules_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_aggregate_compliance_by_config_rules_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeAggregateComplianceByConfigRules"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_aggregate_compliance_by_config_rules_response_of_yojson
          ~error_deserializer
  end
module DescribeAggregateComplianceByConformancePacks =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_aggregate_compliance_by_conformance_packs_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_aggregate_compliance_by_conformance_packs_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeAggregateComplianceByConformancePacks"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_aggregate_compliance_by_conformance_packs_response_of_yojson
          ~error_deserializer
  end
module DescribeAggregationAuthorizations =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_aggregation_authorizations_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_aggregation_authorizations_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeAggregationAuthorizations"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_aggregation_authorizations_response_of_yojson
          ~error_deserializer
  end
module DescribeComplianceByConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_compliance_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_compliance_by_config_rule_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeComplianceByConfigRule"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_compliance_by_config_rule_response_of_yojson
          ~error_deserializer
  end
module DescribeComplianceByResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_compliance_by_resource_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_compliance_by_resource_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeComplianceByResource"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_compliance_by_resource_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigRuleEvaluationStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_config_rule_evaluation_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_config_rule_evaluation_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigRuleEvaluationStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_config_rule_evaluation_status_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigRules =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_config_rules_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_config_rules_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigRules" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_config_rules_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigurationAggregators =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_configuration_aggregators_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_configuration_aggregators_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigurationAggregators"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_configuration_aggregators_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigurationAggregatorSourcesStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_configuration_aggregator_sources_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_configuration_aggregator_sources_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigurationAggregatorSourcesStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_configuration_aggregator_sources_status_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigurationRecorders =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_configuration_recorders_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_configuration_recorders_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigurationRecorders"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_configuration_recorders_response_of_yojson
          ~error_deserializer
  end
module DescribeConfigurationRecorderStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_configuration_recorder_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_configuration_recorder_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConfigurationRecorderStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_configuration_recorder_status_response_of_yojson
          ~error_deserializer
  end
module DescribeConformancePackCompliance =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleInConformancePackException") ->
            `NoSuchConfigRuleInConformancePackException
              (Json_deserializers.no_such_config_rule_in_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "NoSuchConformancePackException") ->
            `NoSuchConformancePackException
              (Json_deserializers.no_such_conformance_pack_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_conformance_pack_compliance_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_conformance_pack_compliance_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConformancePackCompliance"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_conformance_pack_compliance_response_of_yojson
          ~error_deserializer
  end
module DescribeConformancePacks =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConformancePackException") ->
            `NoSuchConformancePackException
              (Json_deserializers.no_such_conformance_pack_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_conformance_packs_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_conformance_packs_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConformancePacks" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_conformance_packs_response_of_yojson
          ~error_deserializer
  end
module DescribeConformancePackStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_conformance_pack_status_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_conformance_pack_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeConformancePackStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_conformance_pack_status_response_of_yojson
          ~error_deserializer
  end
module DescribeDeliveryChannels =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchDeliveryChannelException") ->
            `NoSuchDeliveryChannelException
              (Json_deserializers.no_such_delivery_channel_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_delivery_channels_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_delivery_channels_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeDeliveryChannels" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_delivery_channels_response_of_yojson
          ~error_deserializer
  end
module DescribeDeliveryChannelStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchDeliveryChannelException") ->
            `NoSuchDeliveryChannelException
              (Json_deserializers.no_such_delivery_channel_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_delivery_channel_status_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_delivery_channel_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeDeliveryChannelStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_delivery_channel_status_response_of_yojson
          ~error_deserializer
  end
module DescribeOrganizationConfigRules =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConfigRuleException") ->
            `NoSuchOrganizationConfigRuleException
              (Json_deserializers.no_such_organization_config_rule_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_organization_config_rules_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_organization_config_rules_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeOrganizationConfigRules"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_organization_config_rules_response_of_yojson
          ~error_deserializer
  end
module DescribeOrganizationConfigRuleStatuses =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConfigRuleException") ->
            `NoSuchOrganizationConfigRuleException
              (Json_deserializers.no_such_organization_config_rule_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_organization_config_rule_statuses_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_organization_config_rule_statuses_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeOrganizationConfigRuleStatuses"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_organization_config_rule_statuses_response_of_yojson
          ~error_deserializer
  end
module DescribeOrganizationConformancePacks =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConformancePackException") ->
            `NoSuchOrganizationConformancePackException
              (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_organization_conformance_packs_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_organization_conformance_packs_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeOrganizationConformancePacks"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_organization_conformance_packs_response_of_yojson
          ~error_deserializer
  end
module DescribeOrganizationConformancePackStatuses =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConformancePackException") ->
            `NoSuchOrganizationConformancePackException
              (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_organization_conformance_pack_statuses_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_organization_conformance_pack_statuses_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeOrganizationConformancePackStatuses"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_organization_conformance_pack_statuses_response_of_yojson
          ~error_deserializer
  end
module DescribePendingAggregationRequests =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_pending_aggregation_requests_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_pending_aggregation_requests_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribePendingAggregationRequests"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_pending_aggregation_requests_response_of_yojson
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
        let input =
          Json_serializers.describe_remediation_configurations_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeRemediationConfigurations"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_remediation_configurations_response_of_yojson
          ~error_deserializer
  end
module DescribeRemediationExceptions =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_remediation_exceptions_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeRemediationExceptions"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_remediation_exceptions_response_of_yojson
          ~error_deserializer
  end
module DescribeRemediationExecutionStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchRemediationConfigurationException") ->
            `NoSuchRemediationConfigurationException
              (Json_deserializers.no_such_remediation_configuration_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : describe_remediation_execution_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_remediation_execution_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeRemediationExecutionStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_remediation_execution_status_response_of_yojson
          ~error_deserializer
  end
module DescribeRetentionConfigurations =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchRetentionConfigurationException") ->
            `NoSuchRetentionConfigurationException
              (Json_deserializers.no_such_retention_configuration_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : describe_retention_configurations_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.describe_retention_configurations_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDescribeRetentionConfigurations"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.describe_retention_configurations_response_of_yojson
          ~error_deserializer
  end
module DisassociateResourceTypes =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : disassociate_resource_types_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.disassociate_resource_types_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceDisassociateResourceTypes" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.disassociate_resource_types_response_of_yojson
          ~error_deserializer
  end
module GetAggregateComplianceDetailsByConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_aggregate_compliance_details_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_aggregate_compliance_details_by_config_rule_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetAggregateComplianceDetailsByConfigRule"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_aggregate_compliance_details_by_config_rule_response_of_yojson
          ~error_deserializer
  end
module GetAggregateConfigRuleComplianceSummary =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_aggregate_config_rule_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_aggregate_config_rule_compliance_summary_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetAggregateConfigRuleComplianceSummary"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_aggregate_config_rule_compliance_summary_response_of_yojson
          ~error_deserializer
  end
module GetAggregateConformancePackComplianceSummary =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_aggregate_conformance_pack_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_aggregate_conformance_pack_compliance_summary_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetAggregateConformancePackComplianceSummary"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_aggregate_conformance_pack_compliance_summary_response_of_yojson
          ~error_deserializer
  end
module GetAggregateDiscoveredResourceCounts =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_aggregate_discovered_resource_counts_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_aggregate_discovered_resource_counts_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetAggregateDiscoveredResourceCounts"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_aggregate_discovered_resource_counts_response_of_yojson
          ~error_deserializer
  end
module GetAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "OversizedConfigurationItemException") ->
            `OversizedConfigurationItemException
              (Json_deserializers.oversized_configuration_item_exception_of_yojson
                 tree path)
        | (_, "ResourceNotDiscoveredException") ->
            `ResourceNotDiscoveredException
              (Json_deserializers.resource_not_discovered_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_aggregate_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_aggregate_resource_config_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetAggregateResourceConfig"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_aggregate_resource_config_response_of_yojson
          ~error_deserializer
  end
module GetComplianceDetailsByConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_compliance_details_by_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_compliance_details_by_config_rule_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetComplianceDetailsByConfigRule"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_compliance_details_by_config_rule_response_of_yojson
          ~error_deserializer
  end
module GetComplianceDetailsByResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_compliance_details_by_resource_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_compliance_details_by_resource_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetComplianceDetailsByResource"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_compliance_details_by_resource_response_of_yojson
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
    let request context (request : Smaws_Lib.Smithy_api.unit_) =
      let open Smaws_Lib.Context in
        let input =
          Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetComplianceSummaryByConfigRule"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_compliance_summary_by_config_rule_response_of_yojson
          ~error_deserializer
  end
module GetComplianceSummaryByResourceType =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_compliance_summary_by_resource_type_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_compliance_summary_by_resource_type_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetComplianceSummaryByResourceType"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_compliance_summary_by_resource_type_response_of_yojson
          ~error_deserializer
  end
module GetConformancePackComplianceDetails =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleInConformancePackException") ->
            `NoSuchConfigRuleInConformancePackException
              (Json_deserializers.no_such_config_rule_in_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "NoSuchConformancePackException") ->
            `NoSuchConformancePackException
              (Json_deserializers.no_such_conformance_pack_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_conformance_pack_compliance_details_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_conformance_pack_compliance_details_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetConformancePackComplianceDetails"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_conformance_pack_compliance_details_response_of_yojson
          ~error_deserializer
  end
module GetConformancePackComplianceSummary =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConformancePackException") ->
            `NoSuchConformancePackException
              (Json_deserializers.no_such_conformance_pack_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_conformance_pack_compliance_summary_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_conformance_pack_compliance_summary_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetConformancePackComplianceSummary"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_conformance_pack_compliance_summary_response_of_yojson
          ~error_deserializer
  end
module GetCustomRulePolicy =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_custom_rule_policy_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_custom_rule_policy_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetCustomRulePolicy" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_custom_rule_policy_response_of_yojson
          ~error_deserializer
  end
module GetDiscoveredResourceCounts =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_discovered_resource_counts_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_discovered_resource_counts_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetDiscoveredResourceCounts"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_discovered_resource_counts_response_of_yojson
          ~error_deserializer
  end
module GetOrganizationConfigRuleDetailedStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConfigRuleException") ->
            `NoSuchOrganizationConfigRuleException
              (Json_deserializers.no_such_organization_config_rule_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_organization_config_rule_detailed_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_organization_config_rule_detailed_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetOrganizationConfigRuleDetailedStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_organization_config_rule_detailed_status_response_of_yojson
          ~error_deserializer
  end
module GetOrganizationConformancePackDetailedStatus =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchOrganizationConformancePackException") ->
            `NoSuchOrganizationConformancePackException
              (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_organization_conformance_pack_detailed_status_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_organization_conformance_pack_detailed_status_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetOrganizationConformancePackDetailedStatus"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_organization_conformance_pack_detailed_status_response_of_yojson
          ~error_deserializer
  end
module GetOrganizationCustomRulePolicy =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchOrganizationConfigRuleException") ->
            `NoSuchOrganizationConfigRuleException
              (Json_deserializers.no_such_organization_config_rule_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : get_organization_custom_rule_policy_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_organization_custom_rule_policy_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetOrganizationCustomRulePolicy"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_organization_custom_rule_policy_response_of_yojson
          ~error_deserializer
  end
module GetResourceConfigHistory =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidTimeRangeException") ->
            `InvalidTimeRangeException
              (Json_deserializers.invalid_time_range_exception_of_yojson tree
                 path)
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ResourceNotDiscoveredException") ->
            `ResourceNotDiscoveredException
              (Json_deserializers.resource_not_discovered_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_resource_config_history_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_resource_config_history_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetResourceConfigHistory" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_resource_config_history_response_of_yojson
          ~error_deserializer
  end
module GetResourceEvaluationSummary =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_resource_evaluation_summary_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_resource_evaluation_summary_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetResourceEvaluationSummary"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_resource_evaluation_summary_response_of_yojson
          ~error_deserializer
  end
module GetStoredQuery =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : get_stored_query_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.get_stored_query_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceGetStoredQuery" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.get_stored_query_response_of_yojson
          ~error_deserializer
  end
module ListAggregateDiscoveredResources =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : list_aggregate_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_aggregate_discovered_resources_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListAggregateDiscoveredResources"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_aggregate_discovered_resources_response_of_yojson
          ~error_deserializer
  end
module ListConfigurationRecorders =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_configuration_recorders_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_configuration_recorders_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListConfigurationRecorders"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_configuration_recorders_response_of_yojson
          ~error_deserializer
  end
module ListConformancePackComplianceScores =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : list_conformance_pack_compliance_scores_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_conformance_pack_compliance_scores_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListConformancePackComplianceScores"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_conformance_pack_compliance_scores_response_of_yojson
          ~error_deserializer
  end
module ListDiscoveredResources =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_discovered_resources_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_discovered_resources_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListDiscoveredResources" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_discovered_resources_response_of_yojson
          ~error_deserializer
  end
module ListResourceEvaluations =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "InvalidTimeRangeException") ->
            `InvalidTimeRangeException
              (Json_deserializers.invalid_time_range_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_resource_evaluations_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_resource_evaluations_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListResourceEvaluations" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_resource_evaluations_response_of_yojson
          ~error_deserializer
  end
module ListStoredQueries =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_stored_queries_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_stored_queries_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListStoredQueries" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_stored_queries_response_of_yojson
          ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.list_tags_for_resource_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceListTagsForResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
          ~error_deserializer
  end
module PutAggregationAuthorization =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_aggregation_authorization_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_aggregation_authorization_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutAggregationAuthorization"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_aggregation_authorization_response_of_yojson
          ~error_deserializer
  end
module PutConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfConfigRulesExceededException") ->
            `MaxNumberOfConfigRulesExceededException
              (Json_deserializers.max_number_of_config_rules_exceeded_exception_of_yojson
                 tree path)
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_config_rule_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutConfigRule" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module PutConfigurationAggregator =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "InvalidRoleException") ->
            `InvalidRoleException
              (Json_deserializers.invalid_role_exception_of_yojson tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "NoAvailableOrganizationException") ->
            `NoAvailableOrganizationException
              (Json_deserializers.no_available_organization_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | (_, "OrganizationAllFeaturesNotEnabledException") ->
            `OrganizationAllFeaturesNotEnabledException
              (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_configuration_aggregator_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_configuration_aggregator_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutConfigurationAggregator"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_configuration_aggregator_response_of_yojson
          ~error_deserializer
  end
module PutConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidConfigurationRecorderNameException") ->
            `InvalidConfigurationRecorderNameException
              (Json_deserializers.invalid_configuration_recorder_name_exception_of_yojson
                 tree path)
        | (_, "InvalidRecordingGroupException") ->
            `InvalidRecordingGroupException
              (Json_deserializers.invalid_recording_group_exception_of_yojson
                 tree path)
        | (_, "InvalidRoleException") ->
            `InvalidRoleException
              (Json_deserializers.invalid_role_exception_of_yojson tree path)
        | (_, "MaxNumberOfConfigurationRecordersExceededException") ->
            `MaxNumberOfConfigurationRecordersExceededException
              (Json_deserializers.max_number_of_configuration_recorders_exceeded_exception_of_yojson
                 tree path)
        | (_, "UnmodifiableEntityException") ->
            `UnmodifiableEntityException
              (Json_deserializers.unmodifiable_entity_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutConfigurationRecorder" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module PutConformancePack =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConformancePackTemplateValidationException") ->
            `ConformancePackTemplateValidationException
              (Json_deserializers.conformance_pack_template_validation_exception_of_yojson
                 tree path)
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfConformancePacksExceededException") ->
            `MaxNumberOfConformancePacksExceededException
              (Json_deserializers.max_number_of_conformance_packs_exceeded_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_conformance_pack_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_conformance_pack_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutConformancePack" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_conformance_pack_response_of_yojson
          ~error_deserializer
  end
module PutDeliveryChannel =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientDeliveryPolicyException") ->
            `InsufficientDeliveryPolicyException
              (Json_deserializers.insufficient_delivery_policy_exception_of_yojson
                 tree path)
        | (_, "InvalidDeliveryChannelNameException") ->
            `InvalidDeliveryChannelNameException
              (Json_deserializers.invalid_delivery_channel_name_exception_of_yojson
                 tree path)
        | (_, "InvalidS3KeyPrefixException") ->
            `InvalidS3KeyPrefixException
              (Json_deserializers.invalid_s3_key_prefix_exception_of_yojson
                 tree path)
        | (_, "InvalidS3KmsKeyArnException") ->
            `InvalidS3KmsKeyArnException
              (Json_deserializers.invalid_s3_kms_key_arn_exception_of_yojson
                 tree path)
        | (_, "InvalidSNSTopicARNException") ->
            `InvalidSNSTopicARNException
              (Json_deserializers.invalid_sns_topic_arn_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfDeliveryChannelsExceededException") ->
            `MaxNumberOfDeliveryChannelsExceededException
              (Json_deserializers.max_number_of_delivery_channels_exceeded_exception_of_yojson
                 tree path)
        | (_, "NoAvailableConfigurationRecorderException") ->
            `NoAvailableConfigurationRecorderException
              (Json_deserializers.no_available_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "NoSuchBucketException") ->
            `NoSuchBucketException
              (Json_deserializers.no_such_bucket_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_delivery_channel_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_delivery_channel_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutDeliveryChannel" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module PutEvaluations =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "InvalidResultTokenException") ->
            `InvalidResultTokenException
              (Json_deserializers.invalid_result_token_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_evaluations_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_evaluations_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutEvaluations" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_evaluations_response_of_yojson
          ~error_deserializer
  end
module PutExternalEvaluation =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_external_evaluation_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_external_evaluation_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutExternalEvaluation" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_external_evaluation_response_of_yojson
          ~error_deserializer
  end
module PutOrganizationConfigRule =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfOrganizationConfigRulesExceededException") ->
            `MaxNumberOfOrganizationConfigRulesExceededException
              (Json_deserializers.max_number_of_organization_config_rules_exceeded_exception_of_yojson
                 tree path)
        | (_, "NoAvailableOrganizationException") ->
            `NoAvailableOrganizationException
              (Json_deserializers.no_available_organization_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | (_, "OrganizationAllFeaturesNotEnabledException") ->
            `OrganizationAllFeaturesNotEnabledException
              (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_organization_config_rule_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_organization_config_rule_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutOrganizationConfigRule" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_organization_config_rule_response_of_yojson
          ~error_deserializer
  end
module PutOrganizationConformancePack =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfOrganizationConformancePacksExceededException") ->
            `MaxNumberOfOrganizationConformancePacksExceededException
              (Json_deserializers.max_number_of_organization_conformance_packs_exceeded_exception_of_yojson
                 tree path)
        | (_, "NoAvailableOrganizationException") ->
            `NoAvailableOrganizationException
              (Json_deserializers.no_available_organization_exception_of_yojson
                 tree path)
        | (_, "OrganizationAccessDeniedException") ->
            `OrganizationAccessDeniedException
              (Json_deserializers.organization_access_denied_exception_of_yojson
                 tree path)
        | (_, "OrganizationAllFeaturesNotEnabledException") ->
            `OrganizationAllFeaturesNotEnabledException
              (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson
                 tree path)
        | (_, "OrganizationConformancePackTemplateValidationException") ->
            `OrganizationConformancePackTemplateValidationException
              (Json_deserializers.organization_conformance_pack_template_validation_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_organization_conformance_pack_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_organization_conformance_pack_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutOrganizationConformancePack"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_organization_conformance_pack_response_of_yojson
          ~error_deserializer
  end
module PutRemediationConfigurations =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_remediation_configurations_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_remediation_configurations_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutRemediationConfigurations"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_remediation_configurations_response_of_yojson
          ~error_deserializer
  end
module PutRemediationExceptions =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_remediation_exceptions_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_remediation_exceptions_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutRemediationExceptions" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_remediation_exceptions_response_of_yojson
          ~error_deserializer
  end
module PutResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "MaxActiveResourcesExceededException") ->
            `MaxActiveResourcesExceededException
              (Json_deserializers.max_active_resources_exceeded_exception_of_yojson
                 tree path)
        | (_, "NoRunningConfigurationRecorderException") ->
            `NoRunningConfigurationRecorderException
              (Json_deserializers.no_running_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_resource_config_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutResourceConfig" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module PutRetentionConfiguration =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "MaxNumberOfRetentionConfigurationsExceededException") ->
            `MaxNumberOfRetentionConfigurationsExceededException
              (Json_deserializers.max_number_of_retention_configurations_exceeded_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_retention_configuration_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_retention_configuration_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutRetentionConfiguration" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_retention_configuration_response_of_yojson
          ~error_deserializer
  end
module PutServiceLinkedConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ConflictException") ->
            `ConflictException
              (Json_deserializers.conflict_exception_of_yojson tree path)
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context
      (request : put_service_linked_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_service_linked_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutServiceLinkedConfigurationRecorder"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_service_linked_configuration_recorder_response_of_yojson
          ~error_deserializer
  end
module PutStoredQuery =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceConcurrentModificationException") ->
            `ResourceConcurrentModificationException
              (Json_deserializers.resource_concurrent_modification_exception_of_yojson
                 tree path)
        | (_, "TooManyTagsException") ->
            `TooManyTagsException
              (Json_deserializers.too_many_tags_exception_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : put_stored_query_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.put_stored_query_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServicePutStoredQuery" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.put_stored_query_response_of_yojson
          ~error_deserializer
  end
module SelectAggregateResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidExpressionException") ->
            `InvalidExpressionException
              (Json_deserializers.invalid_expression_exception_of_yojson tree
                 path)
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigurationAggregatorException") ->
            `NoSuchConfigurationAggregatorException
              (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : select_aggregate_resource_config_request)
      =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.select_aggregate_resource_config_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceSelectAggregateResourceConfig"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.select_aggregate_resource_config_response_of_yojson
          ~error_deserializer
  end
module SelectResourceConfig =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidExpressionException") ->
            `InvalidExpressionException
              (Json_deserializers.invalid_expression_exception_of_yojson tree
                 path)
        | (_, "InvalidLimitException") ->
            `InvalidLimitException
              (Json_deserializers.invalid_limit_exception_of_yojson tree path)
        | (_, "InvalidNextTokenException") ->
            `InvalidNextTokenException
              (Json_deserializers.invalid_next_token_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : select_resource_config_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.select_resource_config_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceSelectResourceConfig" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.select_resource_config_response_of_yojson
          ~error_deserializer
  end
module StartConfigRulesEvaluation =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "LimitExceededException") ->
            `LimitExceededException
              (Json_deserializers.limit_exceeded_exception_of_yojson tree
                 path)
        | (_, "NoSuchConfigRuleException") ->
            `NoSuchConfigRuleException
              (Json_deserializers.no_such_config_rule_exception_of_yojson
                 tree path)
        | (_, "ResourceInUseException") ->
            `ResourceInUseException
              (Json_deserializers.resource_in_use_exception_of_yojson tree
                 path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_config_rules_evaluation_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_config_rules_evaluation_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceStartConfigRulesEvaluation"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_config_rules_evaluation_response_of_yojson
          ~error_deserializer
  end
module StartConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoAvailableDeliveryChannelException") ->
            `NoAvailableDeliveryChannelException
              (Json_deserializers.no_available_delivery_channel_exception_of_yojson
                 tree path)
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "UnmodifiableEntityException") ->
            `UnmodifiableEntityException
              (Json_deserializers.unmodifiable_entity_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceStartConfigurationRecorder"
          ~service ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module StartRemediationExecution =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "InsufficientPermissionsException") ->
            `InsufficientPermissionsException
              (Json_deserializers.insufficient_permissions_exception_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | (_, "NoSuchRemediationConfigurationException") ->
            `NoSuchRemediationConfigurationException
              (Json_deserializers.no_such_remediation_configuration_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_remediation_execution_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_remediation_execution_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceStartRemediationExecution" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_remediation_execution_response_of_yojson
          ~error_deserializer
  end
module StartResourceEvaluation =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "IdempotentParameterMismatch") ->
            `IdempotentParameterMismatch
              (Json_deserializers.idempotent_parameter_mismatch_of_yojson
                 tree path)
        | (_, "InvalidParameterValueException") ->
            `InvalidParameterValueException
              (Json_deserializers.invalid_parameter_value_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : start_resource_evaluation_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.start_resource_evaluation_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceStartResourceEvaluation" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Json_deserializers.start_resource_evaluation_response_of_yojson
          ~error_deserializer
  end
module StopConfigurationRecorder =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "NoSuchConfigurationRecorderException") ->
            `NoSuchConfigurationRecorderException
              (Json_deserializers.no_such_configuration_recorder_exception_of_yojson
                 tree path)
        | (_, "UnmodifiableEntityException") ->
            `UnmodifiableEntityException
              (Json_deserializers.unmodifiable_entity_exception_of_yojson
                 tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : stop_configuration_recorder_request) =
      let open Smaws_Lib.Context in
        let input =
          Json_serializers.stop_configuration_recorder_request_to_yojson
            request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceStopConfigurationRecorder" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "TooManyTagsException") ->
            `TooManyTagsException
              (Json_deserializers.too_many_tags_exception_of_yojson tree path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.tag_resource_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceTagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let handler handler tree path =
        function
        | (_, "ResourceNotFoundException") ->
            `ResourceNotFoundException
              (Json_deserializers.resource_not_found_exception_of_yojson tree
                 path)
        | (_, "ValidationException") ->
            `ValidationException
              (Json_deserializers.validation_exception_of_yojson tree path)
        | _type -> handler tree path _type in
      Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                     (handler
                                        Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                     tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let input = Json_serializers.untag_resource_request_to_yojson request in
        Smaws_Lib.Protocols.AwsJson.request
          ~shape_name:"StarlingDoveServiceUntagResource" ~service
          ~config:context.config ~http:context.http ~input
          ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
          ~error_deserializer
  end