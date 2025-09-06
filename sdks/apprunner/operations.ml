open Types
open Service_metadata

module AssociateCustomDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_custom_domain_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.associate_custom_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerAssociateCustomDomain" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.associate_custom_domain_response_of_yojson
      ~error_deserializer
end

module CreateAutoScalingConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_auto_scaling_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateAutoScalingConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
end

module CreateConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_connection_response_of_yojson
      ~error_deserializer
end

module CreateObservabilityConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_observability_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateObservabilityConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_observability_configuration_response_of_yojson
      ~error_deserializer
end

module CreateService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_service_response_of_yojson ~error_deserializer
end

module CreateVpcConnector = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpc_connector_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateVpcConnector" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_vpc_connector_response_of_yojson
      ~error_deserializer
end

module CreateVpcIngressConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_vpc_ingress_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerCreateVpcIngressConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
end

module DeleteAutoScalingConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_auto_scaling_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteAutoScalingConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_connection_response_of_yojson
      ~error_deserializer
end

module DeleteObservabilityConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_observability_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteObservabilityConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_observability_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_service_response_of_yojson ~error_deserializer
end

module DeleteVpcConnector = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_connector_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteVpcConnector" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_vpc_connector_response_of_yojson
      ~error_deserializer
end

module DeleteVpcIngressConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_vpc_ingress_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDeleteVpcIngressConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
end

module DescribeAutoScalingConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_auto_scaling_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_auto_scaling_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeAutoScalingConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeCustomDomains = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_domains_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_custom_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeCustomDomains" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_custom_domains_response_of_yojson
      ~error_deserializer
end

module DescribeObservabilityConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_observability_configuration_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_observability_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeObservabilityConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_observability_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_service_response_of_yojson
      ~error_deserializer
end

module DescribeVpcConnector = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vpc_connector_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_vpc_connector_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeVpcConnector" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_vpc_connector_response_of_yojson
      ~error_deserializer
end

module DescribeVpcIngressConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_vpc_ingress_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDescribeVpcIngressConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
end

module DisassociateCustomDomain = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_custom_domain_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disassociate_custom_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerDisassociateCustomDomain" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disassociate_custom_domain_response_of_yojson
      ~error_deserializer
end

module ListAutoScalingConfigurations = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_auto_scaling_configurations_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_auto_scaling_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListAutoScalingConfigurations"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_auto_scaling_configurations_response_of_yojson
      ~error_deserializer
end

module ListConnections = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_connections_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListConnections" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_connections_response_of_yojson
      ~error_deserializer
end

module ListObservabilityConfigurations = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_observability_configurations_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_observability_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListObservabilityConfigurations"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_observability_configurations_response_of_yojson
      ~error_deserializer
end

module ListOperations = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_operations_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListOperations" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_operations_response_of_yojson ~error_deserializer
end

module ListServices = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListServices" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer
end

module ListServicesForAutoScalingConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_for_auto_scaling_configuration_request) =
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.list_services_for_auto_scaling_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AppRunnerListServicesForAutoScalingConfiguration" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.list_services_for_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListTagsForResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListVpcConnectors = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vpc_connectors_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_vpc_connectors_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListVpcConnectors" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_vpc_connectors_response_of_yojson
      ~error_deserializer
end

module ListVpcIngressConnections = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_vpc_ingress_connections_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_vpc_ingress_connections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerListVpcIngressConnections" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_vpc_ingress_connections_response_of_yojson
      ~error_deserializer
end

module PauseService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : pause_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.pause_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerPauseService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.pause_service_response_of_yojson ~error_deserializer
end

module ResumeService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resume_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.resume_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerResumeService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.resume_service_response_of_yojson ~error_deserializer
end

module StartDeployment = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_deployment_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_deployment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerStartDeployment" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_deployment_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerTagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerUntagResource" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateDefaultAutoScalingConfiguration = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_default_auto_scaling_configuration_request) =
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.update_default_auto_scaling_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerUpdateDefaultAutoScalingConfiguration"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.update_default_auto_scaling_configuration_response_of_yojson
      ~error_deserializer
end

module UpdateService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerUpdateService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_service_response_of_yojson ~error_deserializer
end

module UpdateVpcIngressConnection = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidStateException" ->
          `InvalidStateException (Json_deserializers.invalid_state_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_vpc_ingress_connection_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_vpc_ingress_connection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AppRunnerUpdateVpcIngressConnection" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_vpc_ingress_connection_response_of_yojson
      ~error_deserializer
end
