open Types
module GetRoutingControlState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "EndpointTemporarilyUnavailableException") ->
              `EndpointTemporarilyUnavailableException
                (endpoint_temporarily_unavailable_exception_of_yojson tree
                   path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_routing_control_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_routing_control_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ToggleCustomerAPIGetRoutingControlState" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_routing_control_state_response_of_yojson
            ~error_deserializer
  end
module ListRoutingControls =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "EndpointTemporarilyUnavailableException") ->
              `EndpointTemporarilyUnavailableException
                (endpoint_temporarily_unavailable_exception_of_yojson tree
                   path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_routing_controls_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_routing_controls_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ToggleCustomerAPIListRoutingControls" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_routing_controls_response_of_yojson
            ~error_deserializer
  end
module UpdateRoutingControlState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EndpointTemporarilyUnavailableException") ->
              `EndpointTemporarilyUnavailableException
                (endpoint_temporarily_unavailable_exception_of_yojson tree
                   path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_routing_control_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_routing_control_state_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ToggleCustomerAPIUpdateRoutingControlState" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_routing_control_state_response_of_yojson
            ~error_deserializer
  end
module UpdateRoutingControlStates =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "ConflictException") ->
              `ConflictException (conflict_exception_of_yojson tree path)
          | (_, "EndpointTemporarilyUnavailableException") ->
              `EndpointTemporarilyUnavailableException
                (endpoint_temporarily_unavailable_exception_of_yojson tree
                   path)
          | (_, "InternalServerException") ->
              `InternalServerException
                (internal_server_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | (_, "ServiceLimitExceededException") ->
              `ServiceLimitExceededException
                (service_limit_exceeded_exception_of_yojson tree path)
          | (_, "ThrottlingException") ->
              `ThrottlingException (throttling_exception_of_yojson tree path)
          | (_, "ValidationException") ->
              `ValidationException (validation_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_routing_control_states_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_routing_control_states_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"ToggleCustomerAPIUpdateRoutingControlStates"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_routing_control_states_response_of_yojson
            ~error_deserializer
  end