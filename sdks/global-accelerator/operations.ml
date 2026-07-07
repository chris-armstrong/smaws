open Types
open Service_metadata

module AddCustomRoutingEndpoints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.globalaccelerator#ConflictException"
    | `EndpointAlreadyExistsException _ ->
        "com.amazonaws.globalaccelerator#EndpointAlreadyExistsException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EndpointAlreadyExistsException" ->
          `EndpointAlreadyExistsException
            (Json_deserializers.endpoint_already_exists_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_custom_routing_endpoints_request) =
    let input = Json_serializers.add_custom_routing_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.AddCustomRoutingEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_custom_routing_endpoints_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_custom_routing_endpoints_request) =
    let input = Json_serializers.add_custom_routing_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.AddCustomRoutingEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_custom_routing_endpoints_response_of_yojson
      ~error_deserializer
end

module AddEndpoints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_endpoints_request) =
    let input = Json_serializers.add_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.AddEndpoints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_endpoints_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : add_endpoints_request) =
    let input = Json_serializers.add_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.AddEndpoints" ~service ~context ~input
      ~output_deserializer:Json_deserializers.add_endpoints_response_of_yojson ~error_deserializer
end

module AdvertiseByoipCidr = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ByoipCidrNotFoundException _ -> "com.amazonaws.globalaccelerator#ByoipCidrNotFoundException"
    | `IncorrectCidrStateException _ ->
        "com.amazonaws.globalaccelerator#IncorrectCidrStateException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ByoipCidrNotFoundException" ->
          `ByoipCidrNotFoundException
            (Json_deserializers.byoip_cidr_not_found_exception_of_yojson tree path)
      | _, "IncorrectCidrStateException" ->
          `IncorrectCidrStateException
            (Json_deserializers.incorrect_cidr_state_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : advertise_byoip_cidr_request) =
    let input = Json_serializers.advertise_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.AdvertiseByoipCidr"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.advertise_byoip_cidr_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : advertise_byoip_cidr_request) =
    let input = Json_serializers.advertise_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.AdvertiseByoipCidr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.advertise_byoip_cidr_response_of_yojson
      ~error_deserializer
end

module AllowCustomRoutingTraffic = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : allow_custom_routing_traffic_request) =
    let input = Json_serializers.allow_custom_routing_traffic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.AllowCustomRoutingTraffic" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : allow_custom_routing_traffic_request) =
    let input = Json_serializers.allow_custom_routing_traffic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.AllowCustomRoutingTraffic" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module CreateAccelerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_accelerator_request) =
    let input = Json_serializers.create_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.CreateAccelerator"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_accelerator_request) =
    let input = Json_serializers.create_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateAccelerator" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_accelerator_response_of_yojson
      ~error_deserializer
end

module CreateCrossAccountAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_cross_account_attachment_request) =
    let input = Json_serializers.create_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.CreateCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_cross_account_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_cross_account_attachment_request) =
    let input = Json_serializers.create_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_cross_account_attachment_response_of_yojson
      ~error_deserializer
end

module CreateCustomRoutingAccelerator = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_routing_accelerator_request) =
    let input = Json_serializers.create_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_custom_routing_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_routing_accelerator_request) =
    let input = Json_serializers.create_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.create_custom_routing_accelerator_response_of_yojson
      ~error_deserializer
end

module CreateCustomRoutingEndpointGroup = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `EndpointGroupAlreadyExistsException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupAlreadyExistsException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidPortRangeException _ -> "com.amazonaws.globalaccelerator#InvalidPortRangeException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointGroupAlreadyExistsException" ->
          `EndpointGroupAlreadyExistsException
            (Json_deserializers.endpoint_group_already_exists_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidPortRangeException" ->
          `InvalidPortRangeException
            (Json_deserializers.invalid_port_range_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_routing_endpoint_group_request) =
    let input = Json_serializers.create_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingEndpointGroup" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_custom_routing_endpoint_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_routing_endpoint_group_request) =
    let input = Json_serializers.create_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingEndpointGroup" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.create_custom_routing_endpoint_group_response_of_yojson
      ~error_deserializer
end

module CreateCustomRoutingListener = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidPortRangeException _ -> "com.amazonaws.globalaccelerator#InvalidPortRangeException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidPortRangeException" ->
          `InvalidPortRangeException
            (Json_deserializers.invalid_port_range_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_custom_routing_listener_request) =
    let input = Json_serializers.create_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_routing_listener_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_custom_routing_listener_request) =
    let input = Json_serializers.create_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_custom_routing_listener_response_of_yojson
      ~error_deserializer
end

module CreateEndpointGroup = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `EndpointGroupAlreadyExistsException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupAlreadyExistsException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointGroupAlreadyExistsException" ->
          `EndpointGroupAlreadyExistsException
            (Json_deserializers.endpoint_group_already_exists_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_endpoint_group_request) =
    let input = Json_serializers.create_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.CreateEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_endpoint_group_request) =
    let input = Json_serializers.create_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_endpoint_group_response_of_yojson
      ~error_deserializer
end

module CreateListener = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidPortRangeException _ -> "com.amazonaws.globalaccelerator#InvalidPortRangeException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidPortRangeException" ->
          `InvalidPortRangeException
            (Json_deserializers.invalid_port_range_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_listener_request) =
    let input = Json_serializers.create_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.CreateListener"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_listener_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_listener_request) =
    let input = Json_serializers.create_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.CreateListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_listener_response_of_yojson ~error_deserializer
end

module DeleteAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotDisabledException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotDisabledException"
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AssociatedListenerFoundException _ ->
        "com.amazonaws.globalaccelerator#AssociatedListenerFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotDisabledException" ->
          `AcceleratorNotDisabledException
            (Json_deserializers.accelerator_not_disabled_exception_of_yojson tree path)
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AssociatedListenerFoundException" ->
          `AssociatedListenerFoundException
            (Json_deserializers.associated_listener_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_accelerator_request) =
    let input = Json_serializers.delete_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.DeleteAccelerator"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_accelerator_request) =
    let input = Json_serializers.delete_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteAccelerator" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCrossAccountAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `AttachmentNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AttachmentNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AttachmentNotFoundException" ->
          `AttachmentNotFoundException
            (Json_deserializers.attachment_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_cross_account_attachment_request) =
    let input = Json_serializers.delete_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCrossAccountAttachment" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_cross_account_attachment_request) =
    let input = Json_serializers.delete_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCrossAccountAttachment" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCustomRoutingAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotDisabledException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotDisabledException"
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AssociatedListenerFoundException _ ->
        "com.amazonaws.globalaccelerator#AssociatedListenerFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotDisabledException" ->
          `AcceleratorNotDisabledException
            (Json_deserializers.accelerator_not_disabled_exception_of_yojson tree path)
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AssociatedListenerFoundException" ->
          `AssociatedListenerFoundException
            (Json_deserializers.associated_listener_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_routing_accelerator_request) =
    let input = Json_serializers.delete_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingAccelerator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_routing_accelerator_request) =
    let input = Json_serializers.delete_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingAccelerator" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCustomRoutingEndpointGroup = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_routing_endpoint_group_request) =
    let input = Json_serializers.delete_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingEndpointGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_routing_endpoint_group_request) =
    let input = Json_serializers.delete_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingEndpointGroup" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteCustomRoutingListener = struct
  let error_to_string = function
    | `AssociatedEndpointGroupFoundException _ ->
        "com.amazonaws.globalaccelerator#AssociatedEndpointGroupFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociatedEndpointGroupFoundException" ->
          `AssociatedEndpointGroupFoundException
            (Json_deserializers.associated_endpoint_group_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_custom_routing_listener_request) =
    let input = Json_serializers.delete_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_custom_routing_listener_request) =
    let input = Json_serializers.delete_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteEndpointGroup = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_endpoint_group_request) =
    let input = Json_serializers.delete_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeleteEndpointGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_endpoint_group_request) =
    let input = Json_serializers.delete_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteEndpointGroup" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteListener = struct
  let error_to_string = function
    | `AssociatedEndpointGroupFoundException _ ->
        "com.amazonaws.globalaccelerator#AssociatedEndpointGroupFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AssociatedEndpointGroupFoundException" ->
          `AssociatedEndpointGroupFoundException
            (Json_deserializers.associated_endpoint_group_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_listener_request) =
    let input = Json_serializers.delete_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.DeleteListener"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_listener_request) =
    let input = Json_serializers.delete_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeleteListener" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DenyCustomRoutingTraffic = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deny_custom_routing_traffic_request) =
    let input = Json_serializers.deny_custom_routing_traffic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DenyCustomRoutingTraffic" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deny_custom_routing_traffic_request) =
    let input = Json_serializers.deny_custom_routing_traffic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DenyCustomRoutingTraffic" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeprovisionByoipCidr = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ByoipCidrNotFoundException _ -> "com.amazonaws.globalaccelerator#ByoipCidrNotFoundException"
    | `IncorrectCidrStateException _ ->
        "com.amazonaws.globalaccelerator#IncorrectCidrStateException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ByoipCidrNotFoundException" ->
          `ByoipCidrNotFoundException
            (Json_deserializers.byoip_cidr_not_found_exception_of_yojson tree path)
      | _, "IncorrectCidrStateException" ->
          `IncorrectCidrStateException
            (Json_deserializers.incorrect_cidr_state_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deprovision_byoip_cidr_request) =
    let input = Json_serializers.deprovision_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DeprovisionByoipCidr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprovision_byoip_cidr_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deprovision_byoip_cidr_request) =
    let input = Json_serializers.deprovision_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DeprovisionByoipCidr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deprovision_byoip_cidr_response_of_yojson
      ~error_deserializer
end

module DescribeAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_accelerator_request) =
    let input = Json_serializers.describe_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeAccelerator" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_accelerator_request) =
    let input = Json_serializers.describe_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeAccelerator" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_accelerator_response_of_yojson
      ~error_deserializer
end

module DescribeAcceleratorAttributes = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_accelerator_attributes_request) =
    let input = Json_serializers.describe_accelerator_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeAcceleratorAttributes" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_accelerator_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_accelerator_attributes_request) =
    let input = Json_serializers.describe_accelerator_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeAcceleratorAttributes" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_accelerator_attributes_response_of_yojson
      ~error_deserializer
end

module DescribeCrossAccountAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `AttachmentNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AttachmentNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AttachmentNotFoundException" ->
          `AttachmentNotFoundException
            (Json_deserializers.attachment_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_cross_account_attachment_request) =
    let input = Json_serializers.describe_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_cross_account_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_cross_account_attachment_request) =
    let input = Json_serializers.describe_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_cross_account_attachment_response_of_yojson
      ~error_deserializer
end

module DescribeCustomRoutingAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_routing_accelerator_request) =
    let input = Json_serializers.describe_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_custom_routing_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_custom_routing_accelerator_request) =
    let input = Json_serializers.describe_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_custom_routing_accelerator_response_of_yojson
      ~error_deserializer
end

module DescribeCustomRoutingAcceleratorAttributes = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_routing_accelerator_attributes_request) =
    let input =
      Json_serializers.describe_custom_routing_accelerator_attributes_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingAcceleratorAttributes" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_routing_accelerator_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_custom_routing_accelerator_attributes_request) =
    let input =
      Json_serializers.describe_custom_routing_accelerator_attributes_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingAcceleratorAttributes" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_routing_accelerator_attributes_response_of_yojson
      ~error_deserializer
end

module DescribeCustomRoutingEndpointGroup = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_routing_endpoint_group_request) =
    let input = Json_serializers.describe_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingEndpointGroup" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_routing_endpoint_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_custom_routing_endpoint_group_request) =
    let input = Json_serializers.describe_custom_routing_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingEndpointGroup" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_custom_routing_endpoint_group_response_of_yojson
      ~error_deserializer
end

module DescribeCustomRoutingListener = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_custom_routing_listener_request) =
    let input = Json_serializers.describe_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingListener" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_custom_routing_listener_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_custom_routing_listener_request) =
    let input = Json_serializers.describe_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeCustomRoutingListener" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_custom_routing_listener_response_of_yojson
      ~error_deserializer
end

module DescribeEndpointGroup = struct
  let error_to_string = function
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_endpoint_group_request) =
    let input = Json_serializers.describe_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.DescribeEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_endpoint_group_request) =
    let input = Json_serializers.describe_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_endpoint_group_response_of_yojson
      ~error_deserializer
end

module DescribeListener = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_listener_request) =
    let input = Json_serializers.describe_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.DescribeListener"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_listener_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_listener_request) =
    let input = Json_serializers.describe_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.DescribeListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_listener_response_of_yojson
      ~error_deserializer
end

module ListAccelerators = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_accelerators_request) =
    let input = Json_serializers.list_accelerators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.ListAccelerators"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accelerators_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accelerators_request) =
    let input = Json_serializers.list_accelerators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListAccelerators" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_accelerators_response_of_yojson
      ~error_deserializer
end

module ListByoipCidrs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_byoip_cidrs_request) =
    let input = Json_serializers.list_byoip_cidrs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.ListByoipCidrs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_byoip_cidrs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_byoip_cidrs_request) =
    let input = Json_serializers.list_byoip_cidrs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListByoipCidrs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_byoip_cidrs_response_of_yojson
      ~error_deserializer
end

module ListCrossAccountAttachments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cross_account_attachments_request) =
    let input = Json_serializers.list_cross_account_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountAttachments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cross_account_attachments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cross_account_attachments_request) =
    let input = Json_serializers.list_cross_account_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountAttachments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cross_account_attachments_response_of_yojson
      ~error_deserializer
end

module ListCrossAccountResourceAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cross_account_resource_accounts_request) =
    let input = Json_serializers.list_cross_account_resource_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountResourceAccounts" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cross_account_resource_accounts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cross_account_resource_accounts_request) =
    let input = Json_serializers.list_cross_account_resource_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountResourceAccounts" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_cross_account_resource_accounts_response_of_yojson
      ~error_deserializer
end

module ListCrossAccountResources = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_cross_account_resources_request) =
    let input = Json_serializers.list_cross_account_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cross_account_resources_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_cross_account_resources_request) =
    let input = Json_serializers.list_cross_account_resources_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCrossAccountResources" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_cross_account_resources_response_of_yojson
      ~error_deserializer
end

module ListCustomRoutingAccelerators = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_routing_accelerators_request) =
    let input = Json_serializers.list_custom_routing_accelerators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingAccelerators" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_accelerators_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_routing_accelerators_request) =
    let input = Json_serializers.list_custom_routing_accelerators_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingAccelerators" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_accelerators_response_of_yojson
      ~error_deserializer
end

module ListCustomRoutingEndpointGroups = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_routing_endpoint_groups_request) =
    let input = Json_serializers.list_custom_routing_endpoint_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingEndpointGroups" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_endpoint_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_routing_endpoint_groups_request) =
    let input = Json_serializers.list_custom_routing_endpoint_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingEndpointGroups" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_endpoint_groups_response_of_yojson
      ~error_deserializer
end

module ListCustomRoutingListeners = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_routing_listeners_request) =
    let input = Json_serializers.list_custom_routing_listeners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingListeners" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_listeners_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_routing_listeners_request) =
    let input = Json_serializers.list_custom_routing_listeners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingListeners" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_listeners_response_of_yojson
      ~error_deserializer
end

module ListCustomRoutingPortMappings = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_routing_port_mappings_request) =
    let input = Json_serializers.list_custom_routing_port_mappings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingPortMappings" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_port_mappings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_custom_routing_port_mappings_request) =
    let input = Json_serializers.list_custom_routing_port_mappings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingPortMappings" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_custom_routing_port_mappings_response_of_yojson
      ~error_deserializer
end

module ListCustomRoutingPortMappingsByDestination = struct
  let error_to_string = function
    | `EndpointNotFoundException _ -> "com.amazonaws.globalaccelerator#EndpointNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "EndpointNotFoundException" ->
          `EndpointNotFoundException
            (Json_deserializers.endpoint_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_custom_routing_port_mappings_by_destination_request) =
    let input =
      Json_serializers.list_custom_routing_port_mappings_by_destination_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingPortMappingsByDestination" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_custom_routing_port_mappings_by_destination_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_custom_routing_port_mappings_by_destination_request) =
    let input =
      Json_serializers.list_custom_routing_port_mappings_by_destination_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListCustomRoutingPortMappingsByDestination" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_custom_routing_port_mappings_by_destination_response_of_yojson
      ~error_deserializer
end

module ListEndpointGroups = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_endpoint_groups_request) =
    let input = Json_serializers.list_endpoint_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.ListEndpointGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoint_groups_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_endpoint_groups_request) =
    let input = Json_serializers.list_endpoint_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListEndpointGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_endpoint_groups_response_of_yojson
      ~error_deserializer
end

module ListListeners = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidNextTokenException _ -> "com.amazonaws.globalaccelerator#InvalidNextTokenException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_listeners_request) =
    let input = Json_serializers.list_listeners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.ListListeners"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_listeners_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_listeners_request) =
    let input = Json_serializers.list_listeners_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListListeners" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_listeners_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AttachmentNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AttachmentNotFoundException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AttachmentNotFoundException" ->
          `AttachmentNotFoundException
            (Json_deserializers.attachment_not_found_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ProvisionByoipCidr = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `IncorrectCidrStateException _ ->
        "com.amazonaws.globalaccelerator#IncorrectCidrStateException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "IncorrectCidrStateException" ->
          `IncorrectCidrStateException
            (Json_deserializers.incorrect_cidr_state_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : provision_byoip_cidr_request) =
    let input = Json_serializers.provision_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.ProvisionByoipCidr"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_byoip_cidr_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : provision_byoip_cidr_request) =
    let input = Json_serializers.provision_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.ProvisionByoipCidr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_byoip_cidr_response_of_yojson
      ~error_deserializer
end

module RemoveCustomRoutingEndpoints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.globalaccelerator#ConflictException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `EndpointNotFoundException _ -> "com.amazonaws.globalaccelerator#EndpointNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "EndpointNotFoundException" ->
          `EndpointNotFoundException
            (Json_deserializers.endpoint_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_custom_routing_endpoints_request) =
    let input = Json_serializers.remove_custom_routing_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.RemoveCustomRoutingEndpoints" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_custom_routing_endpoints_request) =
    let input = Json_serializers.remove_custom_routing_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.RemoveCustomRoutingEndpoints" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module RemoveEndpoints = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_endpoints_request) =
    let input = Json_serializers.remove_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.RemoveEndpoints"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_endpoints_request) =
    let input = Json_serializers.remove_endpoints_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.RemoveEndpoints" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.globalaccelerator#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_accelerator_request) =
    let input = Json_serializers.update_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.UpdateAccelerator"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_accelerator_request) =
    let input = Json_serializers.update_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateAccelerator" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_accelerator_response_of_yojson
      ~error_deserializer
end

module UpdateAcceleratorAttributes = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_accelerator_attributes_request) =
    let input = Json_serializers.update_accelerator_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateAcceleratorAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_accelerator_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_accelerator_attributes_request) =
    let input = Json_serializers.update_accelerator_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateAcceleratorAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_accelerator_attributes_response_of_yojson
      ~error_deserializer
end

module UpdateCrossAccountAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `AttachmentNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AttachmentNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "AttachmentNotFoundException" ->
          `AttachmentNotFoundException
            (Json_deserializers.attachment_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_cross_account_attachment_request) =
    let input = Json_serializers.update_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_cross_account_attachment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_cross_account_attachment_request) =
    let input = Json_serializers.update_cross_account_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCrossAccountAttachment" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_cross_account_attachment_response_of_yojson
      ~error_deserializer
end

module UpdateCustomRoutingAccelerator = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `ConflictException _ -> "com.amazonaws.globalaccelerator#ConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_custom_routing_accelerator_request) =
    let input = Json_serializers.update_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_custom_routing_accelerator_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_custom_routing_accelerator_request) =
    let input = Json_serializers.update_custom_routing_accelerator_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingAccelerator" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.update_custom_routing_accelerator_response_of_yojson
      ~error_deserializer
end

module UpdateCustomRoutingAcceleratorAttributes = struct
  let error_to_string = function
    | `AcceleratorNotFoundException _ ->
        "com.amazonaws.globalaccelerator#AcceleratorNotFoundException"
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `TransactionInProgressException _ ->
        "com.amazonaws.globalaccelerator#TransactionInProgressException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AcceleratorNotFoundException" ->
          `AcceleratorNotFoundException
            (Json_deserializers.accelerator_not_found_exception_of_yojson tree path)
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "TransactionInProgressException" ->
          `TransactionInProgressException
            (Json_deserializers.transaction_in_progress_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_custom_routing_accelerator_attributes_request) =
    let input =
      Json_serializers.update_custom_routing_accelerator_attributes_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingAcceleratorAttributes" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_custom_routing_accelerator_attributes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_custom_routing_accelerator_attributes_request)
      =
    let input =
      Json_serializers.update_custom_routing_accelerator_attributes_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingAcceleratorAttributes" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_custom_routing_accelerator_attributes_response_of_yojson
      ~error_deserializer
end

module UpdateCustomRoutingListener = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidPortRangeException _ -> "com.amazonaws.globalaccelerator#InvalidPortRangeException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidPortRangeException" ->
          `InvalidPortRangeException
            (Json_deserializers.invalid_port_range_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_custom_routing_listener_request) =
    let input = Json_serializers.update_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_custom_routing_listener_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_custom_routing_listener_request) =
    let input = Json_serializers.update_custom_routing_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateCustomRoutingListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_custom_routing_listener_response_of_yojson
      ~error_deserializer
end

module UpdateEndpointGroup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `EndpointGroupNotFoundException _ ->
        "com.amazonaws.globalaccelerator#EndpointGroupNotFoundException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "EndpointGroupNotFoundException" ->
          `EndpointGroupNotFoundException
            (Json_deserializers.endpoint_group_not_found_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_endpoint_group_request) =
    let input = Json_serializers.update_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"GlobalAccelerator_V20180706.UpdateEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_group_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_endpoint_group_request) =
    let input = Json_serializers.update_endpoint_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateEndpointGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_endpoint_group_response_of_yojson
      ~error_deserializer
end

module UpdateListener = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | `InvalidPortRangeException _ -> "com.amazonaws.globalaccelerator#InvalidPortRangeException"
    | `LimitExceededException _ -> "com.amazonaws.globalaccelerator#LimitExceededException"
    | `ListenerNotFoundException _ -> "com.amazonaws.globalaccelerator#ListenerNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _, "InvalidPortRangeException" ->
          `InvalidPortRangeException
            (Json_deserializers.invalid_port_range_exception_of_yojson tree path)
      | _, "LimitExceededException" ->
          `LimitExceededException (Json_deserializers.limit_exceeded_exception_of_yojson tree path)
      | _, "ListenerNotFoundException" ->
          `ListenerNotFoundException
            (Json_deserializers.listener_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_listener_request) =
    let input = Json_serializers.update_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.UpdateListener"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_listener_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_listener_request) =
    let input = Json_serializers.update_listener_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.UpdateListener" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_listener_response_of_yojson ~error_deserializer
end

module WithdrawByoipCidr = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.globalaccelerator#AccessDeniedException"
    | `ByoipCidrNotFoundException _ -> "com.amazonaws.globalaccelerator#ByoipCidrNotFoundException"
    | `IncorrectCidrStateException _ ->
        "com.amazonaws.globalaccelerator#IncorrectCidrStateException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.globalaccelerator#InternalServiceErrorException"
    | `InvalidArgumentException _ -> "com.amazonaws.globalaccelerator#InvalidArgumentException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ByoipCidrNotFoundException" ->
          `ByoipCidrNotFoundException
            (Json_deserializers.byoip_cidr_not_found_exception_of_yojson tree path)
      | _, "IncorrectCidrStateException" ->
          `IncorrectCidrStateException
            (Json_deserializers.incorrect_cidr_state_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidArgumentException" ->
          `InvalidArgumentException
            (Json_deserializers.invalid_argument_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : withdraw_byoip_cidr_request) =
    let input = Json_serializers.withdraw_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"GlobalAccelerator_V20180706.WithdrawByoipCidr"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.withdraw_byoip_cidr_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : withdraw_byoip_cidr_request) =
    let input = Json_serializers.withdraw_byoip_cidr_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"GlobalAccelerator_V20180706.WithdrawByoipCidr" ~service ~context ~input
      ~output_deserializer:Json_deserializers.withdraw_byoip_cidr_response_of_yojson
      ~error_deserializer
end
