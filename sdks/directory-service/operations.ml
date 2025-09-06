open Types
open Service_metadata

module AcceptSharedDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryAlreadySharedException" ->
          `DirectoryAlreadySharedException
            (Json_deserializers.directory_already_shared_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_shared_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.accept_shared_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416AcceptSharedDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.accept_shared_directory_result_of_yojson
      ~error_deserializer
end

module AddIpRoutes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "IpRouteLimitExceededException" ->
          `IpRouteLimitExceededException
            (Json_deserializers.ip_route_limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_ip_routes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.add_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416AddIpRoutes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.add_ip_routes_result_of_yojson ~error_deserializer
end

module AddRegion = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryAlreadyInRegionException" ->
          `DirectoryAlreadyInRegionException
            (Json_deserializers.directory_already_in_region_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "RegionLimitExceededException" ->
          `RegionLimitExceededException
            (Json_deserializers.region_limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_region_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.add_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416AddRegion" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.add_region_result_of_yojson ~error_deserializer
end

module AddTagsToResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "TagLimitExceededException" ->
          `TagLimitExceededException
            (Json_deserializers.tag_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : add_tags_to_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.add_tags_to_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416AddTagsToResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.add_tags_to_resource_result_of_yojson
      ~error_deserializer
end

module CancelSchemaExtension = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : cancel_schema_extension_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.cancel_schema_extension_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CancelSchemaExtension"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.cancel_schema_extension_result_of_yojson
      ~error_deserializer
end

module ConnectDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryLimitExceededException" ->
          `DirectoryLimitExceededException
            (Json_deserializers.directory_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : connect_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.connect_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ConnectDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.connect_directory_result_of_yojson ~error_deserializer
end

module CreateAlias = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_alias_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_alias_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateAlias" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_alias_result_of_yojson ~error_deserializer
end

module CreateComputer = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthenticationFailedException" ->
          `AuthenticationFailedException
            (Json_deserializers.authentication_failed_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_computer_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_computer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateComputer"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_computer_result_of_yojson ~error_deserializer
end

module CreateConditionalForwarder = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_conditional_forwarder_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416CreateConditionalForwarder" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_conditional_forwarder_result_of_yojson
      ~error_deserializer
end

module CreateDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryLimitExceededException" ->
          `DirectoryLimitExceededException
            (Json_deserializers.directory_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_directory_result_of_yojson ~error_deserializer
end

module CreateLogSubscription = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_log_subscription_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_log_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateLogSubscription"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_log_subscription_result_of_yojson
      ~error_deserializer
end

module CreateMicrosoftAD = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryLimitExceededException" ->
          `DirectoryLimitExceededException
            (Json_deserializers.directory_limit_exceeded_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_microsoft_ad_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_microsoft_ad_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateMicrosoftAD"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_microsoft_ad_result_of_yojson
      ~error_deserializer
end

module CreateSnapshot = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "SnapshotLimitExceededException" ->
          `SnapshotLimitExceededException
            (Json_deserializers.snapshot_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_snapshot_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateSnapshot"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_snapshot_result_of_yojson ~error_deserializer
end

module CreateTrust = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_trust_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416CreateTrust" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_trust_result_of_yojson ~error_deserializer
end

module DeleteConditionalForwarder = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_conditional_forwarder_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DeleteConditionalForwarder" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_conditional_forwarder_result_of_yojson
      ~error_deserializer
end

module DeleteDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeleteDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_directory_result_of_yojson ~error_deserializer
end

module DeleteLogSubscription = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_log_subscription_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_log_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeleteLogSubscription"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_log_subscription_result_of_yojson
      ~error_deserializer
end

module DeleteSnapshot = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_snapshot_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeleteSnapshot"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_snapshot_result_of_yojson ~error_deserializer
end

module DeleteTrust = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_trust_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeleteTrust" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_trust_result_of_yojson ~error_deserializer
end

module DeregisterCertificate = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CertificateDoesNotExistException" ->
          `CertificateDoesNotExistException
            (Json_deserializers.certificate_does_not_exist_exception_of_yojson tree path)
      | _, "CertificateInUseException" ->
          `CertificateInUseException
            (Json_deserializers.certificate_in_use_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_certificate_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deregister_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeregisterCertificate"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.deregister_certificate_result_of_yojson
      ~error_deserializer
end

module DeregisterEventTopic = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_event_topic_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deregister_event_topic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DeregisterEventTopic"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.deregister_event_topic_result_of_yojson
      ~error_deserializer
end

module DescribeCertificate = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CertificateDoesNotExistException" ->
          `CertificateDoesNotExistException
            (Json_deserializers.certificate_does_not_exist_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_certificate_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeCertificate"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_certificate_result_of_yojson
      ~error_deserializer
end

module DescribeClientAuthenticationSettings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_client_authentication_settings_request) =
    let open Smaws_Lib.Context in
    let input =
      Json_serializers.describe_client_authentication_settings_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeClientAuthenticationSettings" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:
        Json_deserializers.describe_client_authentication_settings_result_of_yojson
      ~error_deserializer
end

module DescribeConditionalForwarders = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_conditional_forwarders_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_conditional_forwarders_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeConditionalForwarders" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_conditional_forwarders_result_of_yojson
      ~error_deserializer
end

module DescribeDirectories = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_directories_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeDirectories"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_directories_result_of_yojson
      ~error_deserializer
end

module DescribeDirectoryDataAccess = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_directory_data_access_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_directory_data_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeDirectoryDataAccess" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_directory_data_access_result_of_yojson
      ~error_deserializer
end

module DescribeDomainControllers = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_domain_controllers_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_domain_controllers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeDomainControllers" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_domain_controllers_result_of_yojson
      ~error_deserializer
end

module DescribeEventTopics = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_event_topics_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_event_topics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeEventTopics"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_event_topics_result_of_yojson
      ~error_deserializer
end

module DescribeLDAPSSettings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_ldaps_settings_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_ldaps_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeLDAPSSettings"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_ldaps_settings_result_of_yojson
      ~error_deserializer
end

module DescribeRegions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_regions_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeRegions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_regions_result_of_yojson ~error_deserializer
end

module DescribeSettings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_settings_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeSettings"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_settings_result_of_yojson ~error_deserializer
end

module DescribeSharedDirectories = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_shared_directories_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_shared_directories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeSharedDirectories" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_shared_directories_result_of_yojson
      ~error_deserializer
end

module DescribeSnapshots = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_snapshots_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_snapshots_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeSnapshots"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_snapshots_result_of_yojson
      ~error_deserializer
end

module DescribeTrusts = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_trusts_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_trusts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DescribeTrusts"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_trusts_result_of_yojson ~error_deserializer
end

module DescribeUpdateDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_update_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_update_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DescribeUpdateDirectory" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_update_directory_result_of_yojson
      ~error_deserializer
end

module DisableClientAuthentication = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidClientAuthStatusException" ->
          `InvalidClientAuthStatusException
            (Json_deserializers.invalid_client_auth_status_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_client_authentication_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disable_client_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DisableClientAuthentication" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disable_client_authentication_result_of_yojson
      ~error_deserializer
end

module DisableDirectoryDataAccess = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryInDesiredStateException" ->
          `DirectoryInDesiredStateException
            (Json_deserializers.directory_in_desired_state_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_directory_data_access_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disable_directory_data_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416DisableDirectoryDataAccess" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disable_directory_data_access_result_of_yojson
      ~error_deserializer
end

module DisableLDAPS = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidLDAPSStatusException" ->
          `InvalidLDAPSStatusException
            (Json_deserializers.invalid_ldaps_status_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_ldaps_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disable_ldaps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DisableLDAPS" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disable_ldaps_result_of_yojson ~error_deserializer
end

module DisableRadius = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_radius_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disable_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DisableRadius"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disable_radius_result_of_yojson ~error_deserializer
end

module DisableSso = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthenticationFailedException" ->
          `AuthenticationFailedException
            (Json_deserializers.authentication_failed_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_sso_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.disable_sso_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416DisableSso" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.disable_sso_result_of_yojson ~error_deserializer
end

module EnableClientAuthentication = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidClientAuthStatusException" ->
          `InvalidClientAuthStatusException
            (Json_deserializers.invalid_client_auth_status_exception_of_yojson tree path)
      | _, "NoAvailableCertificateException" ->
          `NoAvailableCertificateException
            (Json_deserializers.no_available_certificate_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_client_authentication_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.enable_client_authentication_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416EnableClientAuthentication" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.enable_client_authentication_result_of_yojson
      ~error_deserializer
end

module EnableDirectoryDataAccess = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryInDesiredStateException" ->
          `DirectoryInDesiredStateException
            (Json_deserializers.directory_in_desired_state_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_directory_data_access_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.enable_directory_data_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416EnableDirectoryDataAccess" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.enable_directory_data_access_result_of_yojson
      ~error_deserializer
end

module EnableLDAPS = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidLDAPSStatusException" ->
          `InvalidLDAPSStatusException
            (Json_deserializers.invalid_ldaps_status_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NoAvailableCertificateException" ->
          `NoAvailableCertificateException
            (Json_deserializers.no_available_certificate_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_ldaps_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.enable_ldaps_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416EnableLDAPS" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.enable_ldaps_result_of_yojson ~error_deserializer
end

module EnableRadius = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityAlreadyExistsException" ->
          `EntityAlreadyExistsException
            (Json_deserializers.entity_already_exists_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_radius_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.enable_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416EnableRadius" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.enable_radius_result_of_yojson ~error_deserializer
end

module EnableSso = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AuthenticationFailedException" ->
          `AuthenticationFailedException
            (Json_deserializers.authentication_failed_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InsufficientPermissionsException" ->
          `InsufficientPermissionsException
            (Json_deserializers.insufficient_permissions_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_sso_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.enable_sso_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416EnableSso" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.enable_sso_result_of_yojson ~error_deserializer
end

module GetDirectoryLimits = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_directory_limits_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_directory_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416GetDirectoryLimits"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_directory_limits_result_of_yojson
      ~error_deserializer
end

module GetSnapshotLimits = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_snapshot_limits_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_snapshot_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416GetSnapshotLimits"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_snapshot_limits_result_of_yojson
      ~error_deserializer
end

module ListCertificates = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_certificates_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_certificates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ListCertificates"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_certificates_result_of_yojson ~error_deserializer
end

module ListIpRoutes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ip_routes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ListIpRoutes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_ip_routes_result_of_yojson ~error_deserializer
end

module ListLogSubscriptions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_log_subscriptions_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_log_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ListLogSubscriptions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_log_subscriptions_result_of_yojson
      ~error_deserializer
end

module ListSchemaExtensions = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_schema_extensions_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_schema_extensions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ListSchemaExtensions"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_schema_extensions_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module RegisterCertificate = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CertificateAlreadyExistsException" ->
          `CertificateAlreadyExistsException
            (Json_deserializers.certificate_already_exists_exception_of_yojson tree path)
      | _, "CertificateLimitExceededException" ->
          `CertificateLimitExceededException
            (Json_deserializers.certificate_limit_exceeded_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidCertificateException" ->
          `InvalidCertificateException
            (Json_deserializers.invalid_certificate_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_certificate_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_certificate_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RegisterCertificate"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.register_certificate_result_of_yojson
      ~error_deserializer
end

module RegisterEventTopic = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_event_topic_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_event_topic_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RegisterEventTopic"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.register_event_topic_result_of_yojson
      ~error_deserializer
end

module RejectSharedDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryAlreadySharedException" ->
          `DirectoryAlreadySharedException
            (Json_deserializers.directory_already_shared_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_shared_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.reject_shared_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RejectSharedDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.reject_shared_directory_result_of_yojson
      ~error_deserializer
end

module RemoveIpRoutes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_ip_routes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.remove_ip_routes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RemoveIpRoutes"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.remove_ip_routes_result_of_yojson ~error_deserializer
end

module RemoveRegion = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_region_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.remove_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RemoveRegion" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.remove_region_result_of_yojson ~error_deserializer
end

module RemoveTagsFromResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : remove_tags_from_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.remove_tags_from_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416RemoveTagsFromResource" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.remove_tags_from_resource_result_of_yojson
      ~error_deserializer
end

module ResetUserPassword = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidPasswordException" ->
          `InvalidPasswordException
            (Json_deserializers.invalid_password_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _, "UserDoesNotExistException" ->
          `UserDoesNotExistException
            (Json_deserializers.user_does_not_exist_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reset_user_password_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.reset_user_password_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ResetUserPassword"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.reset_user_password_result_of_yojson
      ~error_deserializer
end

module RestoreFromSnapshot = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_from_snapshot_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.restore_from_snapshot_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416RestoreFromSnapshot"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.restore_from_snapshot_result_of_yojson
      ~error_deserializer
end

module ShareDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryAlreadySharedException" ->
          `DirectoryAlreadySharedException
            (Json_deserializers.directory_already_shared_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidTargetException" ->
          `InvalidTargetException (Json_deserializers.invalid_target_exception_of_yojson tree path)
      | _, "OrganizationsException" ->
          `OrganizationsException (Json_deserializers.organizations_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "ShareLimitExceededException" ->
          `ShareLimitExceededException
            (Json_deserializers.share_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : share_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.share_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416ShareDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.share_directory_result_of_yojson ~error_deserializer
end

module StartSchemaExtension = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "SnapshotLimitExceededException" ->
          `SnapshotLimitExceededException
            (Json_deserializers.snapshot_limit_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_schema_extension_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.start_schema_extension_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416StartSchemaExtension"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.start_schema_extension_result_of_yojson
      ~error_deserializer
end

module UnshareDirectory = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryNotSharedException" ->
          `DirectoryNotSharedException
            (Json_deserializers.directory_not_shared_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidTargetException" ->
          `InvalidTargetException (Json_deserializers.invalid_target_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : unshare_directory_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.unshare_directory_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416UnshareDirectory"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.unshare_directory_result_of_yojson ~error_deserializer
end

module UpdateConditionalForwarder = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_conditional_forwarder_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_conditional_forwarder_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416UpdateConditionalForwarder" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_conditional_forwarder_result_of_yojson
      ~error_deserializer
end

module UpdateDirectorySetup = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryInDesiredStateException" ->
          `DirectoryInDesiredStateException
            (Json_deserializers.directory_in_desired_state_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "SnapshotLimitExceededException" ->
          `SnapshotLimitExceededException
            (Json_deserializers.snapshot_limit_exceeded_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_directory_setup_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_directory_setup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416UpdateDirectorySetup"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_directory_setup_result_of_yojson
      ~error_deserializer
end

module UpdateNumberOfDomainControllers = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "DomainControllerLimitExceededException" ->
          `DomainControllerLimitExceededException
            (Json_deserializers.domain_controller_limit_exceeded_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_number_of_domain_controllers_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_number_of_domain_controllers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"DirectoryService_20150416UpdateNumberOfDomainControllers" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_number_of_domain_controllers_result_of_yojson
      ~error_deserializer
end

module UpdateRadius = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_radius_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_radius_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416UpdateRadius" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_radius_result_of_yojson ~error_deserializer
end

module UpdateSettings = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "DirectoryDoesNotExistException" ->
          `DirectoryDoesNotExistException
            (Json_deserializers.directory_does_not_exist_exception_of_yojson tree path)
      | _, "DirectoryUnavailableException" ->
          `DirectoryUnavailableException
            (Json_deserializers.directory_unavailable_exception_of_yojson tree path)
      | _, "IncompatibleSettingsException" ->
          `IncompatibleSettingsException
            (Json_deserializers.incompatible_settings_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _, "UnsupportedSettingsException" ->
          `UnsupportedSettingsException
            (Json_deserializers.unsupported_settings_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_settings_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416UpdateSettings"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_settings_result_of_yojson ~error_deserializer
end

module UpdateTrust = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_trust_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416UpdateTrust" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_trust_result_of_yojson ~error_deserializer
end

module VerifyTrust = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ClientException" ->
          `ClientException (Json_deserializers.client_exception_of_yojson tree path)
      | _, "EntityDoesNotExistException" ->
          `EntityDoesNotExistException
            (Json_deserializers.entity_does_not_exist_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ServiceException" ->
          `ServiceException (Json_deserializers.service_exception_of_yojson tree path)
      | _, "UnsupportedOperationException" ->
          `UnsupportedOperationException
            (Json_deserializers.unsupported_operation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : verify_trust_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.verify_trust_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"DirectoryService_20150416VerifyTrust" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.verify_trust_result_of_yojson ~error_deserializer
end
