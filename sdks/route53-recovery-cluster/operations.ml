open Types
open Service_metadata

module GetRoutingControlState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53recoverycluster#AccessDeniedException"
    | `EndpointTemporarilyUnavailableException _ ->
        "com.amazonaws.route53recoverycluster#EndpointTemporarilyUnavailableException"
    | `InternalServerException _ -> "com.amazonaws.route53recoverycluster#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.route53recoverycluster#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53recoverycluster#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53recoverycluster#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointTemporarilyUnavailableException" ->
          `EndpointTemporarilyUnavailableException
            (Json_deserializers.endpoint_temporarily_unavailable_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : get_routing_control_state_request) =
    let input = Json_serializers.get_routing_control_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ToggleCustomerAPI.GetRoutingControlState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_routing_control_state_response_of_yojson
      ~error_deserializer
end

module ListRoutingControls = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53recoverycluster#AccessDeniedException"
    | `EndpointTemporarilyUnavailableException _ ->
        "com.amazonaws.route53recoverycluster#EndpointTemporarilyUnavailableException"
    | `InternalServerException _ -> "com.amazonaws.route53recoverycluster#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.route53recoverycluster#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53recoverycluster#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53recoverycluster#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointTemporarilyUnavailableException" ->
          `EndpointTemporarilyUnavailableException
            (Json_deserializers.endpoint_temporarily_unavailable_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : list_routing_controls_request) =
    let input = Json_serializers.list_routing_controls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ToggleCustomerAPI.ListRoutingControls" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_routing_controls_response_of_yojson
      ~error_deserializer
end

module UpdateRoutingControlState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53recoverycluster#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53recoverycluster#ConflictException"
    | `EndpointTemporarilyUnavailableException _ ->
        "com.amazonaws.route53recoverycluster#EndpointTemporarilyUnavailableException"
    | `InternalServerException _ -> "com.amazonaws.route53recoverycluster#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.route53recoverycluster#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.route53recoverycluster#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53recoverycluster#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EndpointTemporarilyUnavailableException" ->
          `EndpointTemporarilyUnavailableException
            (Json_deserializers.endpoint_temporarily_unavailable_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : update_routing_control_state_request) =
    let input = Json_serializers.update_routing_control_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ToggleCustomerAPI.UpdateRoutingControlState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_routing_control_state_response_of_yojson
      ~error_deserializer
end

module UpdateRoutingControlStates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.route53recoverycluster#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.route53recoverycluster#ConflictException"
    | `EndpointTemporarilyUnavailableException _ ->
        "com.amazonaws.route53recoverycluster#EndpointTemporarilyUnavailableException"
    | `InternalServerException _ -> "com.amazonaws.route53recoverycluster#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.route53recoverycluster#ResourceNotFoundException"
    | `ServiceLimitExceededException _ ->
        "com.amazonaws.route53recoverycluster#ServiceLimitExceededException"
    | `ThrottlingException _ -> "com.amazonaws.route53recoverycluster#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.route53recoverycluster#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EndpointTemporarilyUnavailableException" ->
          `EndpointTemporarilyUnavailableException
            (Json_deserializers.endpoint_temporarily_unavailable_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceLimitExceededException" ->
          `ServiceLimitExceededException
            (Json_deserializers.service_limit_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_routing_control_states_request) =
    let input = Json_serializers.update_routing_control_states_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"ToggleCustomerAPI.UpdateRoutingControlStates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_routing_control_states_response_of_yojson
      ~error_deserializer
end
