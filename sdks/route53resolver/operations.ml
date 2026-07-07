open Types
open Service_metadata

module AssociateFirewallRuleGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_firewall_rule_group_request) =
    let input = Json_serializers.associate_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.AssociateFirewallRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_firewall_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_firewall_rule_group_request) =
    let input = Json_serializers.associate_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.AssociateFirewallRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_firewall_rule_group_response_of_yojson
      ~error_deserializer
end

module AssociateResolverEndpointIpAddress = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_resolver_endpoint_ip_address_request) =
    let input = Json_serializers.associate_resolver_endpoint_ip_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.AssociateResolverEndpointIpAddress" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_resolver_endpoint_ip_address_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_resolver_endpoint_ip_address_request) =
    let input = Json_serializers.associate_resolver_endpoint_ip_address_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.AssociateResolverEndpointIpAddress" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_resolver_endpoint_ip_address_response_of_yojson
      ~error_deserializer
end

module AssociateResolverQueryLogConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_resolver_query_log_config_request) =
    let input = Json_serializers.associate_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.AssociateResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_resolver_query_log_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_resolver_query_log_config_request) =
    let input = Json_serializers.associate_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.AssociateResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_resolver_query_log_config_response_of_yojson
      ~error_deserializer
end

module AssociateResolverRule = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.route53resolver#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_resolver_rule_request) =
    let input = Json_serializers.associate_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.AssociateResolverRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_resolver_rule_request) =
    let input = Json_serializers.associate_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.AssociateResolverRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_resolver_rule_response_of_yojson
      ~error_deserializer
end

module BatchCreateFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_create_firewall_rule_request) =
    let input = Json_serializers.batch_create_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.BatchCreateFirewallRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_firewall_rule_request) =
    let input = Json_serializers.batch_create_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.BatchCreateFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_create_firewall_rule_response_of_yojson
      ~error_deserializer
end

module BatchDeleteFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_delete_firewall_rule_request) =
    let input = Json_serializers.batch_delete_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.BatchDeleteFirewallRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_delete_firewall_rule_request) =
    let input = Json_serializers.batch_delete_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.BatchDeleteFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_delete_firewall_rule_response_of_yojson
      ~error_deserializer
end

module BatchUpdateFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_update_firewall_rule_request) =
    let input = Json_serializers.batch_update_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.BatchUpdateFirewallRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_update_firewall_rule_request) =
    let input = Json_serializers.batch_update_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.BatchUpdateFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_update_firewall_rule_response_of_yojson
      ~error_deserializer
end

module CreateFirewallDomainList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_firewall_domain_list_request) =
    let input = Json_serializers.create_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateFirewallDomainList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_domain_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_firewall_domain_list_request) =
    let input = Json_serializers.create_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateFirewallDomainList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_domain_list_response_of_yojson
      ~error_deserializer
end

module CreateFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_firewall_rule_request) =
    let input = Json_serializers.create_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateFirewallRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_firewall_rule_request) =
    let input = Json_serializers.create_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_rule_response_of_yojson
      ~error_deserializer
end

module CreateFirewallRuleGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_firewall_rule_group_request) =
    let input = Json_serializers.create_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateFirewallRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_firewall_rule_group_request) =
    let input = Json_serializers.create_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateFirewallRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_firewall_rule_group_response_of_yojson
      ~error_deserializer
end

module CreateOutpostResolver = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.route53resolver#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_outpost_resolver_request) =
    let input = Json_serializers.create_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateOutpostResolver" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_outpost_resolver_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_outpost_resolver_request) =
    let input = Json_serializers.create_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateOutpostResolver" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_outpost_resolver_response_of_yojson
      ~error_deserializer
end

module CreateResolverEndpoint = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resolver_endpoint_request) =
    let input = Json_serializers.create_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateResolverEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resolver_endpoint_request) =
    let input = Json_serializers.create_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateResolverEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_endpoint_response_of_yojson
      ~error_deserializer
end

module CreateResolverQueryLogConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resolver_query_log_config_request) =
    let input = Json_serializers.create_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateResolverQueryLogConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_query_log_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resolver_query_log_config_request) =
    let input = Json_serializers.create_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_query_log_config_response_of_yojson
      ~error_deserializer
end

module CreateResolverRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.route53resolver#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_resolver_rule_request) =
    let input = Json_serializers.create_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.CreateResolverRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_resolver_rule_request) =
    let input = Json_serializers.create_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.CreateResolverRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_resolver_rule_response_of_yojson
      ~error_deserializer
end

module DeleteFirewallDomainList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_domain_list_request) =
    let input = Json_serializers.delete_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteFirewallDomainList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_domain_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_firewall_domain_list_request) =
    let input = Json_serializers.delete_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteFirewallDomainList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_domain_list_response_of_yojson
      ~error_deserializer
end

module DeleteFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_rule_request) =
    let input = Json_serializers.delete_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteFirewallRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_firewall_rule_request) =
    let input = Json_serializers.delete_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_rule_response_of_yojson
      ~error_deserializer
end

module DeleteFirewallRuleGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_rule_group_request) =
    let input = Json_serializers.delete_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteFirewallRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_firewall_rule_group_request) =
    let input = Json_serializers.delete_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteFirewallRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_rule_group_response_of_yojson
      ~error_deserializer
end

module DeleteOutpostResolver = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_outpost_resolver_request) =
    let input = Json_serializers.delete_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteOutpostResolver" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_outpost_resolver_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_outpost_resolver_request) =
    let input = Json_serializers.delete_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteOutpostResolver" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_outpost_resolver_response_of_yojson
      ~error_deserializer
end

module DeleteResolverEndpoint = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resolver_endpoint_request) =
    let input = Json_serializers.delete_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteResolverEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resolver_endpoint_request) =
    let input = Json_serializers.delete_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteResolverEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_endpoint_response_of_yojson
      ~error_deserializer
end

module DeleteResolverQueryLogConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resolver_query_log_config_request) =
    let input = Json_serializers.delete_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteResolverQueryLogConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_query_log_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resolver_query_log_config_request) =
    let input = Json_serializers.delete_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_query_log_config_response_of_yojson
      ~error_deserializer
end

module DeleteResolverRule = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceInUseException _ -> "com.amazonaws.route53resolver#ResourceInUseException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceInUseException" ->
          `ResourceInUseException (Json_deserializers.resource_in_use_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resolver_rule_request) =
    let input = Json_serializers.delete_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DeleteResolverRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resolver_rule_request) =
    let input = Json_serializers.delete_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DeleteResolverRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resolver_rule_response_of_yojson
      ~error_deserializer
end

module DisassociateFirewallRuleGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_firewall_rule_group_request) =
    let input = Json_serializers.disassociate_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DisassociateFirewallRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_firewall_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_firewall_rule_group_request) =
    let input = Json_serializers.disassociate_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DisassociateFirewallRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_firewall_rule_group_response_of_yojson
      ~error_deserializer
end

module DisassociateResolverEndpointIpAddress = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceExistsException _ -> "com.amazonaws.route53resolver#ResourceExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceExistsException" ->
          `ResourceExistsException
            (Json_deserializers.resource_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_resolver_endpoint_ip_address_request) =
    let input =
      Json_serializers.disassociate_resolver_endpoint_ip_address_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.DisassociateResolverEndpointIpAddress" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_resolver_endpoint_ip_address_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_resolver_endpoint_ip_address_request) =
    let input =
      Json_serializers.disassociate_resolver_endpoint_ip_address_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DisassociateResolverEndpointIpAddress" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_resolver_endpoint_ip_address_response_of_yojson
      ~error_deserializer
end

module DisassociateResolverQueryLogConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_resolver_query_log_config_request) =
    let input = Json_serializers.disassociate_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.DisassociateResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_resolver_query_log_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_resolver_query_log_config_request) =
    let input = Json_serializers.disassociate_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DisassociateResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_resolver_query_log_config_response_of_yojson
      ~error_deserializer
end

module DisassociateResolverRule = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_resolver_rule_request) =
    let input = Json_serializers.disassociate_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.DisassociateResolverRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_resolver_rule_request) =
    let input = Json_serializers.disassociate_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.DisassociateResolverRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_resolver_rule_response_of_yojson
      ~error_deserializer
end

module GetFirewallConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_firewall_config_request) =
    let input = Json_serializers.get_firewall_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetFirewallConfig" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_firewall_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_firewall_config_request) =
    let input = Json_serializers.get_firewall_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetFirewallConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_config_response_of_yojson
      ~error_deserializer
end

module GetFirewallDomainList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_firewall_domain_list_request) =
    let input = Json_serializers.get_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetFirewallDomainList" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_domain_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_firewall_domain_list_request) =
    let input = Json_serializers.get_firewall_domain_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetFirewallDomainList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_domain_list_response_of_yojson
      ~error_deserializer
end

module GetFirewallRuleGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_firewall_rule_group_request) =
    let input = Json_serializers.get_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetFirewallRuleGroup" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_firewall_rule_group_request) =
    let input = Json_serializers.get_firewall_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetFirewallRuleGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_response_of_yojson
      ~error_deserializer
end

module GetFirewallRuleGroupAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_firewall_rule_group_association_request) =
    let input = Json_serializers.get_firewall_rule_group_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.GetFirewallRuleGroupAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_firewall_rule_group_association_request) =
    let input = Json_serializers.get_firewall_rule_group_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetFirewallRuleGroupAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_association_response_of_yojson
      ~error_deserializer
end

module GetFirewallRuleGroupPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_firewall_rule_group_policy_request) =
    let input = Json_serializers.get_firewall_rule_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetFirewallRuleGroupPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_firewall_rule_group_policy_request) =
    let input = Json_serializers.get_firewall_rule_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetFirewallRuleGroupPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_firewall_rule_group_policy_response_of_yojson
      ~error_deserializer
end

module GetOutpostResolver = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_outpost_resolver_request) =
    let input = Json_serializers.get_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetOutpostResolver" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_outpost_resolver_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_outpost_resolver_request) =
    let input = Json_serializers.get_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetOutpostResolver" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_outpost_resolver_response_of_yojson
      ~error_deserializer
end

module GetResolverConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_config_request) =
    let input = Json_serializers.get_resolver_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverConfig" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resolver_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_config_request) =
    let input = Json_serializers.get_resolver_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_config_response_of_yojson
      ~error_deserializer
end

module GetResolverDnssecConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_dnssec_config_request) =
    let input = Json_serializers.get_resolver_dnssec_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverDnssecConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_dnssec_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_dnssec_config_request) =
    let input = Json_serializers.get_resolver_dnssec_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverDnssecConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_dnssec_config_response_of_yojson
      ~error_deserializer
end

module GetResolverEndpoint = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_endpoint_request) =
    let input = Json_serializers.get_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverEndpoint" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_endpoint_request) =
    let input = Json_serializers.get_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_endpoint_response_of_yojson
      ~error_deserializer
end

module GetResolverQueryLogConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_query_log_config_request) =
    let input = Json_serializers.get_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverQueryLogConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_query_log_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_query_log_config_request) =
    let input = Json_serializers.get_resolver_query_log_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverQueryLogConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_query_log_config_response_of_yojson
      ~error_deserializer
end

module GetResolverQueryLogConfigAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_query_log_config_association_request) =
    let input =
      Json_serializers.get_resolver_query_log_config_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.GetResolverQueryLogConfigAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_resolver_query_log_config_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_query_log_config_association_request) =
    let input =
      Json_serializers.get_resolver_query_log_config_association_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverQueryLogConfigAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_resolver_query_log_config_association_response_of_yojson
      ~error_deserializer
end

module GetResolverQueryLogConfigPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `UnknownResourceException _ -> "com.amazonaws.route53resolver#UnknownResourceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnknownResourceException" ->
          `UnknownResourceException
            (Json_deserializers.unknown_resource_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_query_log_config_policy_request) =
    let input = Json_serializers.get_resolver_query_log_config_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.GetResolverQueryLogConfigPolicy" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_resolver_query_log_config_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_query_log_config_policy_request) =
    let input = Json_serializers.get_resolver_query_log_config_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverQueryLogConfigPolicy" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_resolver_query_log_config_policy_response_of_yojson
      ~error_deserializer
end

module GetResolverRule = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_rule_request) =
    let input = Json_serializers.get_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverRule" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_rule_request) =
    let input = Json_serializers.get_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Route53Resolver.GetResolverRule"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_rule_response_of_yojson
      ~error_deserializer
end

module GetResolverRuleAssociation = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_rule_association_request) =
    let input = Json_serializers.get_resolver_rule_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverRuleAssociation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_rule_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_rule_association_request) =
    let input = Json_serializers.get_resolver_rule_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverRuleAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_rule_association_response_of_yojson
      ~error_deserializer
end

module GetResolverRulePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `UnknownResourceException _ -> "com.amazonaws.route53resolver#UnknownResourceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "UnknownResourceException" ->
          `UnknownResourceException
            (Json_deserializers.unknown_resource_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resolver_rule_policy_request) =
    let input = Json_serializers.get_resolver_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.GetResolverRulePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_rule_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resolver_rule_policy_request) =
    let input = Json_serializers.get_resolver_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.GetResolverRulePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resolver_rule_policy_response_of_yojson
      ~error_deserializer
end

module ImportFirewallDomains = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_firewall_domains_request) =
    let input = Json_serializers.import_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ImportFirewallDomains" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.import_firewall_domains_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_firewall_domains_request) =
    let input = Json_serializers.import_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ImportFirewallDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_firewall_domains_response_of_yojson
      ~error_deserializer
end

module ListFirewallConfigs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_configs_request) =
    let input = Json_serializers.list_firewall_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_configs_request) =
    let input = Json_serializers.list_firewall_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_configs_response_of_yojson
      ~error_deserializer
end

module ListFirewallDomainLists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_domain_lists_request) =
    let input = Json_serializers.list_firewall_domain_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallDomainLists"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_domain_lists_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_domain_lists_request) =
    let input = Json_serializers.list_firewall_domain_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallDomainLists" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_domain_lists_response_of_yojson
      ~error_deserializer
end

module ListFirewallDomains = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_domains_request) =
    let input = Json_serializers.list_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallDomains" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_domains_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_domains_request) =
    let input = Json_serializers.list_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_domains_response_of_yojson
      ~error_deserializer
end

module ListFirewallRuleGroupAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_rule_group_associations_request) =
    let input = Json_serializers.list_firewall_rule_group_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.ListFirewallRuleGroupAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_firewall_rule_group_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_rule_group_associations_request) =
    let input = Json_serializers.list_firewall_rule_group_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallRuleGroupAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_firewall_rule_group_associations_response_of_yojson
      ~error_deserializer
end

module ListFirewallRuleGroups = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_rule_groups_request) =
    let input = Json_serializers.list_firewall_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallRuleGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_rule_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_rule_groups_request) =
    let input = Json_serializers.list_firewall_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListFirewallRules = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_rules_request) =
    let input = Json_serializers.list_firewall_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_firewall_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_rules_request) =
    let input = Json_serializers.list_firewall_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_rules_response_of_yojson
      ~error_deserializer
end

module ListFirewallRuleTypes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_firewall_rule_types_request) =
    let input = Json_serializers.list_firewall_rule_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListFirewallRuleTypes" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_rule_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_firewall_rule_types_request) =
    let input = Json_serializers.list_firewall_rule_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListFirewallRuleTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_firewall_rule_types_response_of_yojson
      ~error_deserializer
end

module ListOutpostResolvers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_outpost_resolvers_request) =
    let input = Json_serializers.list_outpost_resolvers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListOutpostResolvers" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_outpost_resolvers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_outpost_resolvers_request) =
    let input = Json_serializers.list_outpost_resolvers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListOutpostResolvers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_outpost_resolvers_response_of_yojson
      ~error_deserializer
end

module ListResolverConfigs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_configs_request) =
    let input = Json_serializers.list_resolver_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverConfigs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_configs_request) =
    let input = Json_serializers.list_resolver_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_configs_response_of_yojson
      ~error_deserializer
end

module ListResolverDnssecConfigs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_dnssec_configs_request) =
    let input = Json_serializers.list_resolver_dnssec_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverDnssecConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_dnssec_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_dnssec_configs_request) =
    let input = Json_serializers.list_resolver_dnssec_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverDnssecConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_dnssec_configs_response_of_yojson
      ~error_deserializer
end

module ListResolverEndpointIpAddresses = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_endpoint_ip_addresses_request) =
    let input = Json_serializers.list_resolver_endpoint_ip_addresses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.ListResolverEndpointIpAddresses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_endpoint_ip_addresses_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_endpoint_ip_addresses_request) =
    let input = Json_serializers.list_resolver_endpoint_ip_addresses_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverEndpointIpAddresses" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_endpoint_ip_addresses_response_of_yojson
      ~error_deserializer
end

module ListResolverEndpoints = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_endpoints_request) =
    let input = Json_serializers.list_resolver_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverEndpoints" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_endpoints_request) =
    let input = Json_serializers.list_resolver_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_endpoints_response_of_yojson
      ~error_deserializer
end

module ListResolverQueryLogConfigAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_query_log_config_associations_request) =
    let input =
      Json_serializers.list_resolver_query_log_config_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.ListResolverQueryLogConfigAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_resolver_query_log_config_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_query_log_config_associations_request)
      =
    let input =
      Json_serializers.list_resolver_query_log_config_associations_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverQueryLogConfigAssociations" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_resolver_query_log_config_associations_response_of_yojson
      ~error_deserializer
end

module ListResolverQueryLogConfigs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_query_log_configs_request) =
    let input = Json_serializers.list_resolver_query_log_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverQueryLogConfigs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_query_log_configs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_query_log_configs_request) =
    let input = Json_serializers.list_resolver_query_log_configs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverQueryLogConfigs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_query_log_configs_response_of_yojson
      ~error_deserializer
end

module ListResolverRuleAssociations = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_rule_associations_request) =
    let input = Json_serializers.list_resolver_rule_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverRuleAssociations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_rule_associations_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_rule_associations_request) =
    let input = Json_serializers.list_resolver_rule_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverRuleAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_rule_associations_response_of_yojson
      ~error_deserializer
end

module ListResolverRules = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resolver_rules_request) =
    let input = Json_serializers.list_resolver_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListResolverRules" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_resolver_rules_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_resolver_rules_request) =
    let input = Json_serializers.list_resolver_rules_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListResolverRules" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resolver_rules_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.route53resolver#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutFirewallRuleGroupPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_firewall_rule_group_policy_request) =
    let input = Json_serializers.put_firewall_rule_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.PutFirewallRuleGroupPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_firewall_rule_group_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_firewall_rule_group_policy_request) =
    let input = Json_serializers.put_firewall_rule_group_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.PutFirewallRuleGroupPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_firewall_rule_group_policy_response_of_yojson
      ~error_deserializer
end

module PutResolverQueryLogConfigPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidPolicyDocument _ -> "com.amazonaws.route53resolver#InvalidPolicyDocument"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `UnknownResourceException _ -> "com.amazonaws.route53resolver#UnknownResourceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPolicyDocument" ->
          `InvalidPolicyDocument (Json_deserializers.invalid_policy_document_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "UnknownResourceException" ->
          `UnknownResourceException
            (Json_deserializers.unknown_resource_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resolver_query_log_config_policy_request) =
    let input = Json_serializers.put_resolver_query_log_config_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.PutResolverQueryLogConfigPolicy" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_resolver_query_log_config_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resolver_query_log_config_policy_request) =
    let input = Json_serializers.put_resolver_query_log_config_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.PutResolverQueryLogConfigPolicy" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_resolver_query_log_config_policy_response_of_yojson
      ~error_deserializer
end

module PutResolverRulePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidPolicyDocument _ -> "com.amazonaws.route53resolver#InvalidPolicyDocument"
    | `UnknownResourceException _ -> "com.amazonaws.route53resolver#UnknownResourceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidPolicyDocument" ->
          `InvalidPolicyDocument (Json_deserializers.invalid_policy_document_of_yojson tree path)
      | _, "UnknownResourceException" ->
          `UnknownResourceException
            (Json_deserializers.unknown_resource_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resolver_rule_policy_request) =
    let input = Json_serializers.put_resolver_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.PutResolverRulePolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_resolver_rule_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resolver_rule_policy_request) =
    let input = Json_serializers.put_resolver_rule_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.PutResolverRulePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resolver_rule_policy_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `InvalidTagException _ -> "com.amazonaws.route53resolver#InvalidTagException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Route53Resolver.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Route53Resolver.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateFirewallConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_config_request) =
    let input = Json_serializers.update_firewall_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateFirewallConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_config_request) =
    let input = Json_serializers.update_firewall_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateFirewallConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_config_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallDomains = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_domains_request) =
    let input = Json_serializers.update_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateFirewallDomains" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_domains_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_domains_request) =
    let input = Json_serializers.update_firewall_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateFirewallDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_domains_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_rule_request) =
    let input = Json_serializers.update_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateFirewallRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_rule_request) =
    let input = Json_serializers.update_firewall_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateFirewallRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_firewall_rule_response_of_yojson
      ~error_deserializer
end

module UpdateFirewallRuleGroupAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_firewall_rule_group_association_request) =
    let input = Json_serializers.update_firewall_rule_group_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53Resolver.UpdateFirewallRuleGroupAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_rule_group_association_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_firewall_rule_group_association_request) =
    let input = Json_serializers.update_firewall_rule_group_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateFirewallRuleGroupAssociation" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_firewall_rule_group_association_response_of_yojson
      ~error_deserializer
end

module UpdateOutpostResolver = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53resolver#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.route53resolver#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_outpost_resolver_request) =
    let input = Json_serializers.update_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateOutpostResolver" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_outpost_resolver_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_outpost_resolver_request) =
    let input = Json_serializers.update_outpost_resolver_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateOutpostResolver" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_outpost_resolver_response_of_yojson
      ~error_deserializer
end

module UpdateResolverConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.route53resolver#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53resolver#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resolver_config_request) =
    let input = Json_serializers.update_resolver_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateResolverConfig" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resolver_config_request) =
    let input = Json_serializers.update_resolver_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateResolverConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_config_response_of_yojson
      ~error_deserializer
end

module UpdateResolverDnssecConfig = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resolver_dnssec_config_request) =
    let input = Json_serializers.update_resolver_dnssec_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateResolverDnssecConfig"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_dnssec_config_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resolver_dnssec_config_request) =
    let input = Json_serializers.update_resolver_dnssec_config_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateResolverDnssecConfig" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_dnssec_config_response_of_yojson
      ~error_deserializer
end

module UpdateResolverEndpoint = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resolver_endpoint_request) =
    let input = Json_serializers.update_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateResolverEndpoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_endpoint_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resolver_endpoint_request) =
    let input = Json_serializers.update_resolver_endpoint_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateResolverEndpoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_endpoint_response_of_yojson
      ~error_deserializer
end

module UpdateResolverRule = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53resolver#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.route53resolver#InternalServiceErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.route53resolver#InvalidParameterException"
    | `InvalidRequestException _ -> "com.amazonaws.route53resolver#InvalidRequestException"
    | `LimitExceededException _ -> "com.amazonaws.route53resolver#LimitExceededException"
    | `ResourceNotFoundException _ -> "com.amazonaws.route53resolver#ResourceNotFoundException"
    | `ResourceUnavailableException _ ->
        "com.amazonaws.route53resolver#ResourceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.route53resolver#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidRequestException" ->
          `InvalidRequestException
            (Json_deserializers.invalid_request_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ResourceUnavailableException" ->
          `ResourceUnavailableException
            (Json_deserializers.resource_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_resolver_rule_request) =
    let input = Json_serializers.update_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53Resolver.UpdateResolverRule" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_rule_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_resolver_rule_request) =
    let input = Json_serializers.update_resolver_rule_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Route53Resolver.UpdateResolverRule" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_resolver_rule_response_of_yojson
      ~error_deserializer
end
