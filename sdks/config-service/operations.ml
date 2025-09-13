open Types
open Service_metadata

module AssociateResourceTypes = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.configservice#ConflictException"
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_resource_types_request) =
    let input = Json_serializers.associate_resource_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.AssociateResourceTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_resource_types_response_of_yojson
      ~error_deserializer
end

module BatchGetAggregateResourceConfig = struct
  let error_to_string = function
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_aggregate_resource_config_request) =
    let input = Json_serializers.batch_get_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.BatchGetAggregateResourceConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_aggregate_resource_config_response_of_yojson
      ~error_deserializer
end

module BatchGetResourceConfig = struct
  let error_to_string = function
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_get_resource_config_request) =
    let input = Json_serializers.batch_get_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.BatchGetResourceConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_resource_config_response_of_yojson
      ~error_deserializer
end

module DeleteAggregationAuthorization = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_aggregation_authorization_request) =
    let input = Json_serializers.delete_aggregation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteAggregationAuthorization" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteConfigRule = struct
  let error_to_string = function
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_config_rule_request) =
    let input = Json_serializers.delete_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteConfigRule" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteConfigurationAggregator = struct
  let error_to_string = function
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_configuration_aggregator_request) =
    let input = Json_serializers.delete_configuration_aggregator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteConfigurationAggregator" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteConfigurationRecorder = struct
  let error_to_string = function
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.configservice#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "UnmodifiableEntityException" ->
          `UnmodifiableEntityException
            (Json_deserializers.unmodifiable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_configuration_recorder_request) =
    let input = Json_serializers.delete_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteConfigurationRecorder" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteConformancePack = struct
  let error_to_string = function
    | `NoSuchConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConformancePackException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConformancePackException" ->
          `NoSuchConformancePackException
            (Json_deserializers.no_such_conformance_pack_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_conformance_pack_request) =
    let input = Json_serializers.delete_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteConformancePack"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteDeliveryChannel = struct
  let error_to_string = function
    | `LastDeliveryChannelDeleteFailedException _ ->
        "com.amazonaws.configservice#LastDeliveryChannelDeleteFailedException"
    | `NoSuchDeliveryChannelException _ ->
        "com.amazonaws.configservice#NoSuchDeliveryChannelException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "LastDeliveryChannelDeleteFailedException" ->
          `LastDeliveryChannelDeleteFailedException
            (Json_deserializers.last_delivery_channel_delete_failed_exception_of_yojson tree path)
      | _, "NoSuchDeliveryChannelException" ->
          `NoSuchDeliveryChannelException
            (Json_deserializers.no_such_delivery_channel_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_delivery_channel_request) =
    let input = Json_serializers.delete_delivery_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteDeliveryChannel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEvaluationResults = struct
  let error_to_string = function
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_evaluation_results_request) =
    let input = Json_serializers.delete_evaluation_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteEvaluationResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_evaluation_results_response_of_yojson
      ~error_deserializer
end

module DeleteOrganizationConfigRule = struct
  let error_to_string = function
    | `NoSuchOrganizationConfigRuleException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConfigRuleException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchOrganizationConfigRuleException" ->
          `NoSuchOrganizationConfigRuleException
            (Json_deserializers.no_such_organization_config_rule_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_organization_config_rule_request) =
    let input = Json_serializers.delete_organization_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteOrganizationConfigRule" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteOrganizationConformancePack = struct
  let error_to_string = function
    | `NoSuchOrganizationConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConformancePackException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchOrganizationConformancePackException" ->
          `NoSuchOrganizationConformancePackException
            (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_organization_conformance_pack_request) =
    let input = Json_serializers.delete_organization_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteOrganizationConformancePack" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePendingAggregationRequest = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_pending_aggregation_request_request) =
    let input = Json_serializers.delete_pending_aggregation_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeletePendingAggregationRequest" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteRemediationConfiguration = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchRemediationConfigurationException _ ->
        "com.amazonaws.configservice#NoSuchRemediationConfigurationException"
    | `RemediationInProgressException _ ->
        "com.amazonaws.configservice#RemediationInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchRemediationConfigurationException" ->
          `NoSuchRemediationConfigurationException
            (Json_deserializers.no_such_remediation_configuration_exception_of_yojson tree path)
      | _, "RemediationInProgressException" ->
          `RemediationInProgressException
            (Json_deserializers.remediation_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_remediation_configuration_request) =
    let input = Json_serializers.delete_remediation_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteRemediationConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_remediation_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteRemediationExceptions = struct
  let error_to_string = function
    | `NoSuchRemediationExceptionException _ ->
        "com.amazonaws.configservice#NoSuchRemediationExceptionException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchRemediationExceptionException" ->
          `NoSuchRemediationExceptionException
            (Json_deserializers.no_such_remediation_exception_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_remediation_exceptions_request) =
    let input = Json_serializers.delete_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteRemediationExceptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_remediation_exceptions_response_of_yojson
      ~error_deserializer
end

module DeleteResourceConfig = struct
  let error_to_string = function
    | `NoRunningConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoRunningConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoRunningConfigurationRecorderException" ->
          `NoRunningConfigurationRecorderException
            (Json_deserializers.no_running_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_config_request) =
    let input = Json_serializers.delete_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteResourceConfig"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteRetentionConfiguration = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchRetentionConfigurationException _ ->
        "com.amazonaws.configservice#NoSuchRetentionConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchRetentionConfigurationException" ->
          `NoSuchRetentionConfigurationException
            (Json_deserializers.no_such_retention_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_retention_configuration_request) =
    let input = Json_serializers.delete_retention_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteRetentionConfiguration" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteServiceLinkedConfigurationRecorder = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.configservice#ConflictException"
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_linked_configuration_recorder_request) =
    let input =
      Json_serializers.delete_service_linked_configuration_recorder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DeleteServiceLinkedConfigurationRecorder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_service_linked_configuration_recorder_response_of_yojson
      ~error_deserializer
end

module DeleteStoredQuery = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_stored_query_request) =
    let input = Json_serializers.delete_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeleteStoredQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_stored_query_response_of_yojson
      ~error_deserializer
end

module DeliverConfigSnapshot = struct
  let error_to_string = function
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `NoRunningConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoRunningConfigurationRecorderException"
    | `NoSuchDeliveryChannelException _ ->
        "com.amazonaws.configservice#NoSuchDeliveryChannelException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "NoRunningConfigurationRecorderException" ->
          `NoRunningConfigurationRecorderException
            (Json_deserializers.no_running_configuration_recorder_exception_of_yojson tree path)
      | _, "NoSuchDeliveryChannelException" ->
          `NoSuchDeliveryChannelException
            (Json_deserializers.no_such_delivery_channel_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deliver_config_snapshot_request) =
    let input = Json_serializers.deliver_config_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DeliverConfigSnapshot"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deliver_config_snapshot_response_of_yojson
      ~error_deserializer
end

module DescribeAggregateComplianceByConfigRules = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_aggregate_compliance_by_config_rules_request) =
    let input =
      Json_serializers.describe_aggregate_compliance_by_config_rules_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeAggregateComplianceByConfigRules" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_aggregate_compliance_by_config_rules_response_of_yojson
      ~error_deserializer
end

module DescribeAggregateComplianceByConformancePacks = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_aggregate_compliance_by_conformance_packs_request) =
    let input =
      Json_serializers.describe_aggregate_compliance_by_conformance_packs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeAggregateComplianceByConformancePacks" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_aggregate_compliance_by_conformance_packs_response_of_yojson
      ~error_deserializer
end

module DescribeAggregationAuthorizations = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_aggregation_authorizations_request) =
    let input = Json_serializers.describe_aggregation_authorizations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeAggregationAuthorizations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_aggregation_authorizations_response_of_yojson
      ~error_deserializer
end

module DescribeComplianceByConfigRule = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_compliance_by_config_rule_request) =
    let input = Json_serializers.describe_compliance_by_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeComplianceByConfigRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_compliance_by_config_rule_response_of_yojson
      ~error_deserializer
end

module DescribeComplianceByResource = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_compliance_by_resource_request) =
    let input = Json_serializers.describe_compliance_by_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeComplianceByResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_compliance_by_resource_response_of_yojson
      ~error_deserializer
end

module DescribeConfigRuleEvaluationStatus = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_config_rule_evaluation_status_request) =
    let input = Json_serializers.describe_config_rule_evaluation_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConfigRuleEvaluationStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_config_rule_evaluation_status_response_of_yojson
      ~error_deserializer
end

module DescribeConfigRules = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_config_rules_request) =
    let input = Json_serializers.describe_config_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DescribeConfigRules"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_config_rules_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurationAggregators = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configuration_aggregators_request) =
    let input = Json_serializers.describe_configuration_aggregators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConfigurationAggregators" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_aggregators_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurationAggregatorSourcesStatus = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configuration_aggregator_sources_status_request) =
    let input =
      Json_serializers.describe_configuration_aggregator_sources_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConfigurationAggregatorSourcesStatus" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_configuration_aggregator_sources_status_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurationRecorders = struct
  let error_to_string = function
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configuration_recorders_request) =
    let input = Json_serializers.describe_configuration_recorders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConfigurationRecorders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_recorders_response_of_yojson
      ~error_deserializer
end

module DescribeConfigurationRecorderStatus = struct
  let error_to_string = function
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_configuration_recorder_status_request) =
    let input = Json_serializers.describe_configuration_recorder_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConfigurationRecorderStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_configuration_recorder_status_response_of_yojson
      ~error_deserializer
end

module DescribeConformancePackCompliance = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleInConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConfigRuleInConformancePackException"
    | `NoSuchConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConformancePackException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleInConformancePackException" ->
          `NoSuchConfigRuleInConformancePackException
            (Json_deserializers.no_such_config_rule_in_conformance_pack_exception_of_yojson tree
               path)
      | _, "NoSuchConformancePackException" ->
          `NoSuchConformancePackException
            (Json_deserializers.no_such_conformance_pack_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_conformance_pack_compliance_request) =
    let input = Json_serializers.describe_conformance_pack_compliance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConformancePackCompliance" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_conformance_pack_compliance_response_of_yojson
      ~error_deserializer
end

module DescribeConformancePacks = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConformancePackException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConformancePackException" ->
          `NoSuchConformancePackException
            (Json_deserializers.no_such_conformance_pack_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_conformance_packs_request) =
    let input = Json_serializers.describe_conformance_packs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DescribeConformancePacks"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_conformance_packs_response_of_yojson
      ~error_deserializer
end

module DescribeConformancePackStatus = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_conformance_pack_status_request) =
    let input = Json_serializers.describe_conformance_pack_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeConformancePackStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_conformance_pack_status_response_of_yojson
      ~error_deserializer
end

module DescribeDeliveryChannels = struct
  let error_to_string = function
    | `NoSuchDeliveryChannelException _ ->
        "com.amazonaws.configservice#NoSuchDeliveryChannelException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchDeliveryChannelException" ->
          `NoSuchDeliveryChannelException
            (Json_deserializers.no_such_delivery_channel_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_delivery_channels_request) =
    let input = Json_serializers.describe_delivery_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DescribeDeliveryChannels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_channels_response_of_yojson
      ~error_deserializer
end

module DescribeDeliveryChannelStatus = struct
  let error_to_string = function
    | `NoSuchDeliveryChannelException _ ->
        "com.amazonaws.configservice#NoSuchDeliveryChannelException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchDeliveryChannelException" ->
          `NoSuchDeliveryChannelException
            (Json_deserializers.no_such_delivery_channel_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_delivery_channel_status_request) =
    let input = Json_serializers.describe_delivery_channel_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeDeliveryChannelStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_delivery_channel_status_response_of_yojson
      ~error_deserializer
end

module DescribeOrganizationConfigRules = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConfigRuleException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConfigRuleException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConfigRuleException" ->
          `NoSuchOrganizationConfigRuleException
            (Json_deserializers.no_such_organization_config_rule_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organization_config_rules_request) =
    let input = Json_serializers.describe_organization_config_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeOrganizationConfigRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_organization_config_rules_response_of_yojson
      ~error_deserializer
end

module DescribeOrganizationConfigRuleStatuses = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConfigRuleException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConfigRuleException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConfigRuleException" ->
          `NoSuchOrganizationConfigRuleException
            (Json_deserializers.no_such_organization_config_rule_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organization_config_rule_statuses_request) =
    let input =
      Json_serializers.describe_organization_config_rule_statuses_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeOrganizationConfigRuleStatuses" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_organization_config_rule_statuses_response_of_yojson
      ~error_deserializer
end

module DescribeOrganizationConformancePacks = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConformancePackException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConformancePackException" ->
          `NoSuchOrganizationConformancePackException
            (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organization_conformance_packs_request) =
    let input =
      Json_serializers.describe_organization_conformance_packs_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeOrganizationConformancePacks" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_organization_conformance_packs_response_of_yojson
      ~error_deserializer
end

module DescribeOrganizationConformancePackStatuses = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConformancePackException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConformancePackException" ->
          `NoSuchOrganizationConformancePackException
            (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_organization_conformance_pack_statuses_request) =
    let input =
      Json_serializers.describe_organization_conformance_pack_statuses_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeOrganizationConformancePackStatuses" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_organization_conformance_pack_statuses_response_of_yojson
      ~error_deserializer
end

module DescribePendingAggregationRequests = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_pending_aggregation_requests_request) =
    let input = Json_serializers.describe_pending_aggregation_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribePendingAggregationRequests" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_pending_aggregation_requests_response_of_yojson
      ~error_deserializer
end

module DescribeRemediationConfigurations = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_remediation_configurations_request) =
    let input = Json_serializers.describe_remediation_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeRemediationConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_remediation_configurations_response_of_yojson
      ~error_deserializer
end

module DescribeRemediationExceptions = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_remediation_exceptions_request) =
    let input = Json_serializers.describe_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeRemediationExceptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_remediation_exceptions_response_of_yojson
      ~error_deserializer
end

module DescribeRemediationExecutionStatus = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchRemediationConfigurationException _ ->
        "com.amazonaws.configservice#NoSuchRemediationConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchRemediationConfigurationException" ->
          `NoSuchRemediationConfigurationException
            (Json_deserializers.no_such_remediation_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_remediation_execution_status_request) =
    let input = Json_serializers.describe_remediation_execution_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeRemediationExecutionStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_remediation_execution_status_response_of_yojson
      ~error_deserializer
end

module DescribeRetentionConfigurations = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchRetentionConfigurationException _ ->
        "com.amazonaws.configservice#NoSuchRetentionConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchRetentionConfigurationException" ->
          `NoSuchRetentionConfigurationException
            (Json_deserializers.no_such_retention_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_retention_configurations_request) =
    let input = Json_serializers.describe_retention_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.DescribeRetentionConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_retention_configurations_response_of_yojson
      ~error_deserializer
end

module DisassociateResourceTypes = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.configservice#ConflictException"
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_resource_types_request) =
    let input = Json_serializers.disassociate_resource_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.DisassociateResourceTypes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_resource_types_response_of_yojson
      ~error_deserializer
end

module GetAggregateComplianceDetailsByConfigRule = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aggregate_compliance_details_by_config_rule_request) =
    let input =
      Json_serializers.get_aggregate_compliance_details_by_config_rule_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetAggregateComplianceDetailsByConfigRule" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_aggregate_compliance_details_by_config_rule_response_of_yojson
      ~error_deserializer
end

module GetAggregateConfigRuleComplianceSummary = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aggregate_config_rule_compliance_summary_request) =
    let input =
      Json_serializers.get_aggregate_config_rule_compliance_summary_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetAggregateConfigRuleComplianceSummary" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_aggregate_config_rule_compliance_summary_response_of_yojson
      ~error_deserializer
end

module GetAggregateConformancePackComplianceSummary = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aggregate_conformance_pack_compliance_summary_request) =
    let input =
      Json_serializers.get_aggregate_conformance_pack_compliance_summary_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetAggregateConformancePackComplianceSummary" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_aggregate_conformance_pack_compliance_summary_response_of_yojson
      ~error_deserializer
end

module GetAggregateDiscoveredResourceCounts = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aggregate_discovered_resource_counts_request) =
    let input =
      Json_serializers.get_aggregate_discovered_resource_counts_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetAggregateDiscoveredResourceCounts" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_aggregate_discovered_resource_counts_response_of_yojson
      ~error_deserializer
end

module GetAggregateResourceConfig = struct
  let error_to_string = function
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `OversizedConfigurationItemException _ ->
        "com.amazonaws.configservice#OversizedConfigurationItemException"
    | `ResourceNotDiscoveredException _ ->
        "com.amazonaws.configservice#ResourceNotDiscoveredException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "OversizedConfigurationItemException" ->
          `OversizedConfigurationItemException
            (Json_deserializers.oversized_configuration_item_exception_of_yojson tree path)
      | _, "ResourceNotDiscoveredException" ->
          `ResourceNotDiscoveredException
            (Json_deserializers.resource_not_discovered_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_aggregate_resource_config_request) =
    let input = Json_serializers.get_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.GetAggregateResourceConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_aggregate_resource_config_response_of_yojson
      ~error_deserializer
end

module GetComplianceDetailsByConfigRule = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compliance_details_by_config_rule_request) =
    let input = Json_serializers.get_compliance_details_by_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetComplianceDetailsByConfigRule" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_compliance_details_by_config_rule_response_of_yojson
      ~error_deserializer
end

module GetComplianceDetailsByResource = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compliance_details_by_resource_request) =
    let input = Json_serializers.get_compliance_details_by_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetComplianceDetailsByResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_compliance_details_by_resource_response_of_yojson
      ~error_deserializer
end

module GetComplianceSummaryByConfigRule = struct
  let error_to_string = Smaws_Lib.Protocols.AwsJson.error_to_string

  let error_deserializer tree path =
    let handler a = a in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : Smaws_Lib.Smithy_api.Types.unit_) =
    let input = Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetComplianceSummaryByConfigRule" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_compliance_summary_by_config_rule_response_of_yojson
      ~error_deserializer
end

module GetComplianceSummaryByResourceType = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_compliance_summary_by_resource_type_request) =
    let input =
      Json_serializers.get_compliance_summary_by_resource_type_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetComplianceSummaryByResourceType" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_compliance_summary_by_resource_type_response_of_yojson
      ~error_deserializer
end

module GetConformancePackComplianceDetails = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleInConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConfigRuleInConformancePackException"
    | `NoSuchConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConformancePackException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleInConformancePackException" ->
          `NoSuchConfigRuleInConformancePackException
            (Json_deserializers.no_such_config_rule_in_conformance_pack_exception_of_yojson tree
               path)
      | _, "NoSuchConformancePackException" ->
          `NoSuchConformancePackException
            (Json_deserializers.no_such_conformance_pack_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_conformance_pack_compliance_details_request) =
    let input =
      Json_serializers.get_conformance_pack_compliance_details_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetConformancePackComplianceDetails" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_conformance_pack_compliance_details_response_of_yojson
      ~error_deserializer
end

module GetConformancePackComplianceSummary = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchConformancePackException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConformancePackException" ->
          `NoSuchConformancePackException
            (Json_deserializers.no_such_conformance_pack_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_conformance_pack_compliance_summary_request) =
    let input =
      Json_serializers.get_conformance_pack_compliance_summary_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetConformancePackComplianceSummary" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_conformance_pack_compliance_summary_response_of_yojson
      ~error_deserializer
end

module GetCustomRulePolicy = struct
  let error_to_string = function
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_custom_rule_policy_request) =
    let input = Json_serializers.get_custom_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.GetCustomRulePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_custom_rule_policy_response_of_yojson
      ~error_deserializer
end

module GetDiscoveredResourceCounts = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_discovered_resource_counts_request) =
    let input = Json_serializers.get_discovered_resource_counts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetDiscoveredResourceCounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_discovered_resource_counts_response_of_yojson
      ~error_deserializer
end

module GetOrganizationConfigRuleDetailedStatus = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConfigRuleException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConfigRuleException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConfigRuleException" ->
          `NoSuchOrganizationConfigRuleException
            (Json_deserializers.no_such_organization_config_rule_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_organization_config_rule_detailed_status_request) =
    let input =
      Json_serializers.get_organization_config_rule_detailed_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetOrganizationConfigRuleDetailedStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_organization_config_rule_detailed_status_response_of_yojson
      ~error_deserializer
end

module GetOrganizationConformancePackDetailedStatus = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchOrganizationConformancePackException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConformancePackException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchOrganizationConformancePackException" ->
          `NoSuchOrganizationConformancePackException
            (Json_deserializers.no_such_organization_conformance_pack_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_organization_conformance_pack_detailed_status_request) =
    let input =
      Json_serializers.get_organization_conformance_pack_detailed_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetOrganizationConformancePackDetailedStatus" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.get_organization_conformance_pack_detailed_status_response_of_yojson
      ~error_deserializer
end

module GetOrganizationCustomRulePolicy = struct
  let error_to_string = function
    | `NoSuchOrganizationConfigRuleException _ ->
        "com.amazonaws.configservice#NoSuchOrganizationConfigRuleException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchOrganizationConfigRuleException" ->
          `NoSuchOrganizationConfigRuleException
            (Json_deserializers.no_such_organization_config_rule_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_organization_custom_rule_policy_request) =
    let input = Json_serializers.get_organization_custom_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetOrganizationCustomRulePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_organization_custom_rule_policy_response_of_yojson
      ~error_deserializer
end

module GetResourceConfigHistory = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidTimeRangeException _ -> "com.amazonaws.configservice#InvalidTimeRangeException"
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `ResourceNotDiscoveredException _ ->
        "com.amazonaws.configservice#ResourceNotDiscoveredException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidTimeRangeException" ->
          `InvalidTimeRangeException
            (Json_deserializers.invalid_time_range_exception_of_yojson tree path)
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "ResourceNotDiscoveredException" ->
          `ResourceNotDiscoveredException
            (Json_deserializers.resource_not_discovered_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_config_history_request) =
    let input = Json_serializers.get_resource_config_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.GetResourceConfigHistory"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_config_history_response_of_yojson
      ~error_deserializer
end

module GetResourceEvaluationSummary = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_evaluation_summary_request) =
    let input = Json_serializers.get_resource_evaluation_summary_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.GetResourceEvaluationSummary" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_evaluation_summary_response_of_yojson
      ~error_deserializer
end

module GetStoredQuery = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_stored_query_request) =
    let input = Json_serializers.get_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.GetStoredQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_stored_query_response_of_yojson
      ~error_deserializer
end

module ListAggregateDiscoveredResources = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aggregate_discovered_resources_request) =
    let input = Json_serializers.list_aggregate_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.ListAggregateDiscoveredResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aggregate_discovered_resources_response_of_yojson
      ~error_deserializer
end

module ListConfigurationRecorders = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_configuration_recorders_request) =
    let input = Json_serializers.list_configuration_recorders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.ListConfigurationRecorders"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_configuration_recorders_response_of_yojson
      ~error_deserializer
end

module ListConformancePackComplianceScores = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_conformance_pack_compliance_scores_request) =
    let input =
      Json_serializers.list_conformance_pack_compliance_scores_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.ListConformancePackComplianceScores" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_conformance_pack_compliance_scores_response_of_yojson
      ~error_deserializer
end

module ListDiscoveredResources = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_discovered_resources_request) =
    let input = Json_serializers.list_discovered_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.ListDiscoveredResources"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_discovered_resources_response_of_yojson
      ~error_deserializer
end

module ListResourceEvaluations = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `InvalidTimeRangeException _ -> "com.amazonaws.configservice#InvalidTimeRangeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidTimeRangeException" ->
          `InvalidTimeRangeException
            (Json_deserializers.invalid_time_range_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resource_evaluations_request) =
    let input = Json_serializers.list_resource_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.ListResourceEvaluations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resource_evaluations_response_of_yojson
      ~error_deserializer
end

module ListStoredQueries = struct
  let error_to_string = function
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_stored_queries_request) =
    let input = Json_serializers.list_stored_queries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.ListStoredQueries" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_stored_queries_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutAggregationAuthorization = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_aggregation_authorization_request) =
    let input = Json_serializers.put_aggregation_authorization_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.PutAggregationAuthorization" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_aggregation_authorization_response_of_yojson
      ~error_deserializer
end

module PutConfigRule = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `MaxNumberOfConfigRulesExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfConfigRulesExceededException"
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MaxNumberOfConfigRulesExceededException" ->
          `MaxNumberOfConfigRulesExceededException
            (Json_deserializers.max_number_of_config_rules_exceeded_exception_of_yojson tree path)
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_config_rule_request) =
    let input = Json_serializers.put_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutConfigRule" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutConfigurationAggregator = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `InvalidRoleException _ -> "com.amazonaws.configservice#InvalidRoleException"
    | `LimitExceededException _ -> "com.amazonaws.configservice#LimitExceededException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.configservice#NoAvailableOrganizationException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | `OrganizationAllFeaturesNotEnabledException _ ->
        "com.amazonaws.configservice#OrganizationAllFeaturesNotEnabledException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _, "OrganizationAllFeaturesNotEnabledException" ->
          `OrganizationAllFeaturesNotEnabledException
            (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_configuration_aggregator_request) =
    let input = Json_serializers.put_configuration_aggregator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutConfigurationAggregator"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_configuration_aggregator_response_of_yojson
      ~error_deserializer
end

module PutConfigurationRecorder = struct
  let error_to_string = function
    | `InvalidConfigurationRecorderNameException _ ->
        "com.amazonaws.configservice#InvalidConfigurationRecorderNameException"
    | `InvalidRecordingGroupException _ ->
        "com.amazonaws.configservice#InvalidRecordingGroupException"
    | `InvalidRoleException _ -> "com.amazonaws.configservice#InvalidRoleException"
    | `MaxNumberOfConfigurationRecordersExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfConfigurationRecordersExceededException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.configservice#UnmodifiableEntityException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidConfigurationRecorderNameException" ->
          `InvalidConfigurationRecorderNameException
            (Json_deserializers.invalid_configuration_recorder_name_exception_of_yojson tree path)
      | _, "InvalidRecordingGroupException" ->
          `InvalidRecordingGroupException
            (Json_deserializers.invalid_recording_group_exception_of_yojson tree path)
      | _, "InvalidRoleException" ->
          `InvalidRoleException (Json_deserializers.invalid_role_exception_of_yojson tree path)
      | _, "MaxNumberOfConfigurationRecordersExceededException" ->
          `MaxNumberOfConfigurationRecordersExceededException
            (Json_deserializers.max_number_of_configuration_recorders_exceeded_exception_of_yojson
               tree path)
      | _, "UnmodifiableEntityException" ->
          `UnmodifiableEntityException
            (Json_deserializers.unmodifiable_entity_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_configuration_recorder_request) =
    let input = Json_serializers.put_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutConfigurationRecorder"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutConformancePack = struct
  let error_to_string = function
    | `ConformancePackTemplateValidationException _ ->
        "com.amazonaws.configservice#ConformancePackTemplateValidationException"
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `MaxNumberOfConformancePacksExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfConformancePacksExceededException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConformancePackTemplateValidationException" ->
          `ConformancePackTemplateValidationException
            (Json_deserializers.conformance_pack_template_validation_exception_of_yojson tree path)
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MaxNumberOfConformancePacksExceededException" ->
          `MaxNumberOfConformancePacksExceededException
            (Json_deserializers.max_number_of_conformance_packs_exceeded_exception_of_yojson tree
               path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_conformance_pack_request) =
    let input = Json_serializers.put_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutConformancePack"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_conformance_pack_response_of_yojson
      ~error_deserializer
end

module PutDeliveryChannel = struct
  let error_to_string = function
    | `InsufficientDeliveryPolicyException _ ->
        "com.amazonaws.configservice#InsufficientDeliveryPolicyException"
    | `InvalidDeliveryChannelNameException _ ->
        "com.amazonaws.configservice#InvalidDeliveryChannelNameException"
    | `InvalidS3KeyPrefixException _ -> "com.amazonaws.configservice#InvalidS3KeyPrefixException"
    | `InvalidS3KmsKeyArnException _ -> "com.amazonaws.configservice#InvalidS3KmsKeyArnException"
    | `InvalidSNSTopicARNException _ -> "com.amazonaws.configservice#InvalidSNSTopicARNException"
    | `MaxNumberOfDeliveryChannelsExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfDeliveryChannelsExceededException"
    | `NoAvailableConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoAvailableConfigurationRecorderException"
    | `NoSuchBucketException _ -> "com.amazonaws.configservice#NoSuchBucketException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientDeliveryPolicyException" ->
          `InsufficientDeliveryPolicyException
            (Json_deserializers.insufficient_delivery_policy_exception_of_yojson tree path)
      | _, "InvalidDeliveryChannelNameException" ->
          `InvalidDeliveryChannelNameException
            (Json_deserializers.invalid_delivery_channel_name_exception_of_yojson tree path)
      | _, "InvalidS3KeyPrefixException" ->
          `InvalidS3KeyPrefixException
            (Json_deserializers.invalid_s3_key_prefix_exception_of_yojson tree path)
      | _, "InvalidS3KmsKeyArnException" ->
          `InvalidS3KmsKeyArnException
            (Json_deserializers.invalid_s3_kms_key_arn_exception_of_yojson tree path)
      | _, "InvalidSNSTopicARNException" ->
          `InvalidSNSTopicARNException
            (Json_deserializers.invalid_sns_topic_arn_exception_of_yojson tree path)
      | _, "MaxNumberOfDeliveryChannelsExceededException" ->
          `MaxNumberOfDeliveryChannelsExceededException
            (Json_deserializers.max_number_of_delivery_channels_exceeded_exception_of_yojson tree
               path)
      | _, "NoAvailableConfigurationRecorderException" ->
          `NoAvailableConfigurationRecorderException
            (Json_deserializers.no_available_configuration_recorder_exception_of_yojson tree path)
      | _, "NoSuchBucketException" ->
          `NoSuchBucketException (Json_deserializers.no_such_bucket_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_delivery_channel_request) =
    let input = Json_serializers.put_delivery_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutDeliveryChannel"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutEvaluations = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `InvalidResultTokenException _ -> "com.amazonaws.configservice#InvalidResultTokenException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "InvalidResultTokenException" ->
          `InvalidResultTokenException
            (Json_deserializers.invalid_result_token_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_evaluations_request) =
    let input = Json_serializers.put_evaluations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutEvaluations" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_evaluations_response_of_yojson
      ~error_deserializer
end

module PutExternalEvaluation = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_external_evaluation_request) =
    let input = Json_serializers.put_external_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutExternalEvaluation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_external_evaluation_response_of_yojson
      ~error_deserializer
end

module PutOrganizationConfigRule = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `MaxNumberOfOrganizationConfigRulesExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfOrganizationConfigRulesExceededException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.configservice#NoAvailableOrganizationException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | `OrganizationAllFeaturesNotEnabledException _ ->
        "com.amazonaws.configservice#OrganizationAllFeaturesNotEnabledException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MaxNumberOfOrganizationConfigRulesExceededException" ->
          `MaxNumberOfOrganizationConfigRulesExceededException
            (Json_deserializers.max_number_of_organization_config_rules_exceeded_exception_of_yojson
               tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _, "OrganizationAllFeaturesNotEnabledException" ->
          `OrganizationAllFeaturesNotEnabledException
            (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_organization_config_rule_request) =
    let input = Json_serializers.put_organization_config_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutOrganizationConfigRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_organization_config_rule_response_of_yojson
      ~error_deserializer
end

module PutOrganizationConformancePack = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `MaxNumberOfOrganizationConformancePacksExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfOrganizationConformancePacksExceededException"
    | `NoAvailableOrganizationException _ ->
        "com.amazonaws.configservice#NoAvailableOrganizationException"
    | `OrganizationAccessDeniedException _ ->
        "com.amazonaws.configservice#OrganizationAccessDeniedException"
    | `OrganizationAllFeaturesNotEnabledException _ ->
        "com.amazonaws.configservice#OrganizationAllFeaturesNotEnabledException"
    | `OrganizationConformancePackTemplateValidationException _ ->
        "com.amazonaws.configservice#OrganizationConformancePackTemplateValidationException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "MaxNumberOfOrganizationConformancePacksExceededException" ->
          `MaxNumberOfOrganizationConformancePacksExceededException
            (Json_deserializers
             .max_number_of_organization_conformance_packs_exceeded_exception_of_yojson tree path)
      | _, "NoAvailableOrganizationException" ->
          `NoAvailableOrganizationException
            (Json_deserializers.no_available_organization_exception_of_yojson tree path)
      | _, "OrganizationAccessDeniedException" ->
          `OrganizationAccessDeniedException
            (Json_deserializers.organization_access_denied_exception_of_yojson tree path)
      | _, "OrganizationAllFeaturesNotEnabledException" ->
          `OrganizationAllFeaturesNotEnabledException
            (Json_deserializers.organization_all_features_not_enabled_exception_of_yojson tree path)
      | _, "OrganizationConformancePackTemplateValidationException" ->
          `OrganizationConformancePackTemplateValidationException
            (Json_deserializers
             .organization_conformance_pack_template_validation_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_organization_conformance_pack_request) =
    let input = Json_serializers.put_organization_conformance_pack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.PutOrganizationConformancePack" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_organization_conformance_pack_response_of_yojson
      ~error_deserializer
end

module PutRemediationConfigurations = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_remediation_configurations_request) =
    let input = Json_serializers.put_remediation_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.PutRemediationConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_remediation_configurations_response_of_yojson
      ~error_deserializer
end

module PutRemediationExceptions = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_remediation_exceptions_request) =
    let input = Json_serializers.put_remediation_exceptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutRemediationExceptions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_remediation_exceptions_response_of_yojson
      ~error_deserializer
end

module PutResourceConfig = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `MaxActiveResourcesExceededException _ ->
        "com.amazonaws.configservice#MaxActiveResourcesExceededException"
    | `NoRunningConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoRunningConfigurationRecorderException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "MaxActiveResourcesExceededException" ->
          `MaxActiveResourcesExceededException
            (Json_deserializers.max_active_resources_exceeded_exception_of_yojson tree path)
      | _, "NoRunningConfigurationRecorderException" ->
          `NoRunningConfigurationRecorderException
            (Json_deserializers.no_running_configuration_recorder_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_config_request) =
    let input = Json_serializers.put_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutResourceConfig" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutRetentionConfiguration = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `MaxNumberOfRetentionConfigurationsExceededException _ ->
        "com.amazonaws.configservice#MaxNumberOfRetentionConfigurationsExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "MaxNumberOfRetentionConfigurationsExceededException" ->
          `MaxNumberOfRetentionConfigurationsExceededException
            (Json_deserializers.max_number_of_retention_configurations_exceeded_exception_of_yojson
               tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_retention_configuration_request) =
    let input = Json_serializers.put_retention_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutRetentionConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_retention_configuration_response_of_yojson
      ~error_deserializer
end

module PutServiceLinkedConfigurationRecorder = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.configservice#ConflictException"
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `LimitExceededException _ -> "com.amazonaws.configservice#LimitExceededException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_service_linked_configuration_recorder_request) =
    let input =
      Json_serializers.put_service_linked_configuration_recorder_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.PutServiceLinkedConfigurationRecorder" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_service_linked_configuration_recorder_response_of_yojson
      ~error_deserializer
end

module PutStoredQuery = struct
  let error_to_string = function
    | `ResourceConcurrentModificationException _ ->
        "com.amazonaws.configservice#ResourceConcurrentModificationException"
    | `TooManyTagsException _ -> "com.amazonaws.configservice#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceConcurrentModificationException" ->
          `ResourceConcurrentModificationException
            (Json_deserializers.resource_concurrent_modification_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_stored_query_request) =
    let input = Json_serializers.put_stored_query_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.PutStoredQuery" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_stored_query_response_of_yojson
      ~error_deserializer
end

module SelectAggregateResourceConfig = struct
  let error_to_string = function
    | `InvalidExpressionException _ -> "com.amazonaws.configservice#InvalidExpressionException"
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | `NoSuchConfigurationAggregatorException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationAggregatorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidExpressionException" ->
          `InvalidExpressionException
            (Json_deserializers.invalid_expression_exception_of_yojson tree path)
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "NoSuchConfigurationAggregatorException" ->
          `NoSuchConfigurationAggregatorException
            (Json_deserializers.no_such_configuration_aggregator_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : select_aggregate_resource_config_request) =
    let input = Json_serializers.select_aggregate_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"StarlingDoveService.SelectAggregateResourceConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.select_aggregate_resource_config_response_of_yojson
      ~error_deserializer
end

module SelectResourceConfig = struct
  let error_to_string = function
    | `InvalidExpressionException _ -> "com.amazonaws.configservice#InvalidExpressionException"
    | `InvalidLimitException _ -> "com.amazonaws.configservice#InvalidLimitException"
    | `InvalidNextTokenException _ -> "com.amazonaws.configservice#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidExpressionException" ->
          `InvalidExpressionException
            (Json_deserializers.invalid_expression_exception_of_yojson tree path)
      | _, "InvalidLimitException" ->
          `InvalidLimitException (Json_deserializers.invalid_limit_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : select_resource_config_request) =
    let input = Json_serializers.select_resource_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.SelectResourceConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.select_resource_config_response_of_yojson
      ~error_deserializer
end

module StartConfigRulesEvaluation = struct
  let error_to_string = function
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `LimitExceededException _ -> "com.amazonaws.configservice#LimitExceededException"
    | `NoSuchConfigRuleException _ -> "com.amazonaws.configservice#NoSuchConfigRuleException"
    | `ResourceInUseException _ -> "com.amazonaws.configservice#ResourceInUseException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "NoSuchConfigRuleException" ->
          `NoSuchConfigRuleException
            (Json_deserializers.no_such_config_rule_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_config_rules_evaluation_request) =
    let input = Json_serializers.start_config_rules_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.StartConfigRulesEvaluation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_config_rules_evaluation_response_of_yojson
      ~error_deserializer
end

module StartConfigurationRecorder = struct
  let error_to_string = function
    | `NoAvailableDeliveryChannelException _ ->
        "com.amazonaws.configservice#NoAvailableDeliveryChannelException"
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.configservice#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoAvailableDeliveryChannelException" ->
          `NoAvailableDeliveryChannelException
            (Json_deserializers.no_available_delivery_channel_exception_of_yojson tree path)
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "UnmodifiableEntityException" ->
          `UnmodifiableEntityException
            (Json_deserializers.unmodifiable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_configuration_recorder_request) =
    let input = Json_serializers.start_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.StartConfigurationRecorder"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module StartRemediationExecution = struct
  let error_to_string = function
    | `InsufficientPermissionsException _ ->
        "com.amazonaws.configservice#InsufficientPermissionsException"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | `NoSuchRemediationConfigurationException _ ->
        "com.amazonaws.configservice#NoSuchRemediationConfigurationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _, "NoSuchRemediationConfigurationException" ->
          `NoSuchRemediationConfigurationException
            (Json_deserializers.no_such_remediation_configuration_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_remediation_execution_request) =
    let input = Json_serializers.start_remediation_execution_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.StartRemediationExecution"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_remediation_execution_response_of_yojson
      ~error_deserializer
end

module StartResourceEvaluation = struct
  let error_to_string = function
    | `IdempotentParameterMismatch _ -> "com.amazonaws.configservice#IdempotentParameterMismatch"
    | `InvalidParameterValueException _ ->
        "com.amazonaws.configservice#InvalidParameterValueException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "IdempotentParameterMismatch" ->
          `IdempotentParameterMismatch
            (Json_deserializers.idempotent_parameter_mismatch_of_yojson tree path)
      | _, "InvalidParameterValueException" ->
          `InvalidParameterValueException
            (Json_deserializers.invalid_parameter_value_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_resource_evaluation_request) =
    let input = Json_serializers.start_resource_evaluation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.StartResourceEvaluation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_resource_evaluation_response_of_yojson
      ~error_deserializer
end

module StopConfigurationRecorder = struct
  let error_to_string = function
    | `NoSuchConfigurationRecorderException _ ->
        "com.amazonaws.configservice#NoSuchConfigurationRecorderException"
    | `UnmodifiableEntityException _ -> "com.amazonaws.configservice#UnmodifiableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "NoSuchConfigurationRecorderException" ->
          `NoSuchConfigurationRecorderException
            (Json_deserializers.no_such_configuration_recorder_exception_of_yojson tree path)
      | _, "UnmodifiableEntityException" ->
          `UnmodifiableEntityException
            (Json_deserializers.unmodifiable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_configuration_recorder_request) =
    let input = Json_serializers.stop_configuration_recorder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.StopConfigurationRecorder"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.configservice#TooManyTagsException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.configservice#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.configservice#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"StarlingDoveService.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end
