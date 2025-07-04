open Types
module ActivateEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidStateException") ->
              `InvalidStateException
                (invalid_state_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : activate_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.activate_event_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsActivateEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module CancelReplay =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "IllegalStatusException") ->
              `IllegalStatusException
                (illegal_status_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : cancel_replay_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.cancel_replay_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCancelReplay" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:cancel_replay_response_of_yojson
            ~error_deserializer
  end
module CreateApiDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_api_destination_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_api_destination_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreateApiDestination" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_api_destination_response_of_yojson
            ~error_deserializer
  end
module CreateArchive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidEventPatternException") ->
              `InvalidEventPatternException
                (invalid_event_pattern_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_archive_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_archive_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreateArchive" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_archive_response_of_yojson
            ~error_deserializer
  end
module CreateConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_connection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_connection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreateConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_connection_response_of_yojson
            ~error_deserializer
  end
module CreateEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreateEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_endpoint_response_of_yojson
            ~error_deserializer
  end
module CreateEventBus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidStateException") ->
              `InvalidStateException
                (invalid_state_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_event_bus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_event_bus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreateEventBus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_event_bus_response_of_yojson
            ~error_deserializer
  end
module CreatePartnerEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_partner_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_partner_event_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsCreatePartnerEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_partner_event_source_response_of_yojson
            ~error_deserializer
  end
module DeactivateEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidStateException") ->
              `InvalidStateException
                (invalid_state_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deactivate_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deactivate_event_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeactivateEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeauthorizeConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : deauthorize_connection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.deauthorize_connection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeauthorizeConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:deauthorize_connection_response_of_yojson
            ~error_deserializer
  end
module DeleteApiDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_api_destination_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_api_destination_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteApiDestination" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_api_destination_response_of_yojson
            ~error_deserializer
  end
module DeleteArchive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_archive_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_archive_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteArchive" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_archive_response_of_yojson
            ~error_deserializer
  end
module DeleteConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_connection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_connection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_connection_response_of_yojson
            ~error_deserializer
  end
module DeleteEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_endpoint_response_of_yojson
            ~error_deserializer
  end
module DeleteEventBus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_event_bus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_event_bus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteEventBus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeletePartnerEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_partner_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_partner_event_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeletePartnerEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DeleteRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDeleteRule" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module DescribeApiDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_api_destination_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_api_destination_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeApiDestination" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_api_destination_response_of_yojson
            ~error_deserializer
  end
module DescribeArchive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_archive_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_archive_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeArchive" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_archive_response_of_yojson
            ~error_deserializer
  end
module DescribeConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_connection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_connection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_connection_response_of_yojson
            ~error_deserializer
  end
module DescribeEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_endpoint_response_of_yojson
            ~error_deserializer
  end
module DescribeEventBus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_event_bus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_event_bus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeEventBus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_event_bus_response_of_yojson
            ~error_deserializer
  end
module DescribeEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_event_source_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_event_source_response_of_yojson
            ~error_deserializer
  end
module DescribePartnerEventSource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_partner_event_source_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_partner_event_source_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribePartnerEventSource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_partner_event_source_response_of_yojson
            ~error_deserializer
  end
module DescribeReplay =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_replay_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_replay_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeReplay" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_replay_response_of_yojson
            ~error_deserializer
  end
module DescribeRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDescribeRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_rule_response_of_yojson
            ~error_deserializer
  end
module DisableRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.disable_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsDisableRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module EnableRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.enable_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsEnableRule" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module ListApiDestinations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_api_destinations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_api_destinations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListApiDestinations" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_api_destinations_response_of_yojson
            ~error_deserializer
  end
module ListArchives =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_archives_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_archives_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListArchives" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_archives_response_of_yojson
            ~error_deserializer
  end
module ListConnections =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_connections_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_connections_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListConnections" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_connections_response_of_yojson
            ~error_deserializer
  end
module ListEndpoints =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_endpoints_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_endpoints_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListEndpoints" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_endpoints_response_of_yojson
            ~error_deserializer
  end
module ListEventBuses =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_event_buses_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_event_buses_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListEventBuses" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_event_buses_response_of_yojson
            ~error_deserializer
  end
module ListEventSources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_event_sources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_event_sources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListEventSources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_event_sources_response_of_yojson
            ~error_deserializer
  end
module ListPartnerEventSourceAccounts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_partner_event_source_accounts_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_partner_event_source_accounts_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListPartnerEventSourceAccounts" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_partner_event_source_accounts_response_of_yojson
            ~error_deserializer
  end
module ListPartnerEventSources =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_partner_event_sources_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_partner_event_sources_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListPartnerEventSources" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_partner_event_sources_response_of_yojson
            ~error_deserializer
  end
module ListReplays =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_replays_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_replays_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListReplays" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_replays_response_of_yojson
            ~error_deserializer
  end
module ListRuleNamesByTarget =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_rule_names_by_target_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_rule_names_by_target_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListRuleNamesByTarget" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_rule_names_by_target_response_of_yojson
            ~error_deserializer
  end
module ListRules =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_rules_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_rules_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListRules" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:list_rules_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
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
            ~shape_name:"AWSEventsListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListTargetsByRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_targets_by_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_targets_by_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsListTargetsByRule" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_targets_by_rule_response_of_yojson
            ~error_deserializer
  end
module PutEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_events_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsPutEvents" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:put_events_response_of_yojson
            ~error_deserializer
  end
module PutPartnerEvents =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_partner_events_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_partner_events_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsPutPartnerEvents" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_partner_events_response_of_yojson
            ~error_deserializer
  end
module PutPermission =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "PolicyLengthExceededException") ->
              `PolicyLengthExceededException
                (policy_length_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_permission_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_permission_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsPutPermission" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module PutRule =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidEventPatternException") ->
              `InvalidEventPatternException
                (invalid_event_pattern_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_rule_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_rule_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSEventsPutRule"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:put_rule_response_of_yojson
            ~error_deserializer
  end
module PutTargets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_targets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.put_targets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsPutTargets" ~service ~config:context.config
            ~http:context.http ~input
            ~output_deserializer:put_targets_response_of_yojson
            ~error_deserializer
  end
module RemovePermission =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_permission_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.remove_permission_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsRemovePermission" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:base_unit_of_yojson ~error_deserializer
  end
module RemoveTargets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : remove_targets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.remove_targets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsRemoveTargets" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:remove_targets_response_of_yojson
            ~error_deserializer
  end
module StartReplay =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidEventPatternException") ->
              `InvalidEventPatternException
                (invalid_event_pattern_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : start_replay_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.start_replay_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsStartReplay" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:start_replay_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
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
            ~shape_name:"AWSEventsTagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module TestEventPattern =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidEventPatternException") ->
              `InvalidEventPatternException
                (invalid_event_pattern_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : test_event_pattern_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.test_event_pattern_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsTestEventPattern" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:test_event_pattern_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ManagedRuleException") ->
              `ManagedRuleException
                (managed_rule_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
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
            ~shape_name:"AWSEventsUntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateApiDestination =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_api_destination_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_api_destination_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsUpdateApiDestination" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_api_destination_response_of_yojson
            ~error_deserializer
  end
module UpdateArchive =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "InvalidEventPatternException") ->
              `InvalidEventPatternException
                (invalid_event_pattern_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_archive_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_archive_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsUpdateArchive" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_archive_response_of_yojson
            ~error_deserializer
  end
module UpdateConnection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "LimitExceededException") ->
              `LimitExceededException
                (limit_exceeded_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_connection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_connection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsUpdateConnection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_connection_response_of_yojson
            ~error_deserializer
  end
module UpdateEndpoint =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_endpoint_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_endpoint_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsUpdateEndpoint" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_endpoint_response_of_yojson
            ~error_deserializer
  end
module UpdateEventBus =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "ConcurrentModificationException") ->
              `ConcurrentModificationException
                (concurrent_modification_exception_of_yojson tree path)
          | (_, "InternalException") ->
              `InternalException (internal_exception_of_yojson tree path)
          | (_, "OperationDisabledException") ->
              `OperationDisabledException
                (operation_disabled_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_event_bus_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_event_bus_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSEventsUpdateEventBus" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_event_bus_response_of_yojson
            ~error_deserializer
  end