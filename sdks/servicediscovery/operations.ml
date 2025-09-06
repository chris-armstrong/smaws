open Types
open Service_metadata

module CreateHttpNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceAlreadyExists" ->
          `NamespaceAlreadyExists (Json_deserializers.namespace_already_exists_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_http_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314CreateHttpNamespace"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_http_namespace_response_of_yojson
      ~error_deserializer
end

module CreatePrivateDnsNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceAlreadyExists" ->
          `NamespaceAlreadyExists (Json_deserializers.namespace_already_exists_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_private_dns_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314CreatePrivateDnsNamespace" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_private_dns_namespace_response_of_yojson
      ~error_deserializer
end

module CreatePublicDnsNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceAlreadyExists" ->
          `NamespaceAlreadyExists (Json_deserializers.namespace_already_exists_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_public_dns_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314CreatePublicDnsNamespace" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_public_dns_namespace_response_of_yojson
      ~error_deserializer
end

module CreateService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ServiceAlreadyExists" ->
          `ServiceAlreadyExists (Json_deserializers.service_already_exists_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314CreateService"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.create_service_response_of_yojson ~error_deserializer
end

module DeleteNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314DeleteNamespace"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer
end

module DeleteService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314DeleteService"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_service_response_of_yojson ~error_deserializer
end

module DeleteServiceAttributes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_service_attributes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.delete_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314DeleteServiceAttributes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.delete_service_attributes_response_of_yojson
      ~error_deserializer
end

module DeregisterInstance = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InstanceNotFound" ->
          `InstanceNotFound (Json_deserializers.instance_not_found_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : deregister_instance_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.deregister_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314DeregisterInstance"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.deregister_instance_response_of_yojson
      ~error_deserializer
end

module DiscoverInstances = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "RequestLimitExceeded" ->
          `RequestLimitExceeded (Json_deserializers.request_limit_exceeded_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : discover_instances_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.discover_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314DiscoverInstances"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.discover_instances_response_of_yojson
      ~error_deserializer
end

module DiscoverInstancesRevision = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "RequestLimitExceeded" ->
          `RequestLimitExceeded (Json_deserializers.request_limit_exceeded_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : discover_instances_revision_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.discover_instances_revision_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314DiscoverInstancesRevision" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.discover_instances_revision_response_of_yojson
      ~error_deserializer
end

module GetInstance = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceNotFound" ->
          `InstanceNotFound (Json_deserializers.instance_not_found_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instance_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314GetInstance"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_instance_response_of_yojson ~error_deserializer
end

module GetInstancesHealthStatus = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InstanceNotFound" ->
          `InstanceNotFound (Json_deserializers.instance_not_found_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_instances_health_status_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_instances_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314GetInstancesHealthStatus" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_instances_health_status_response_of_yojson
      ~error_deserializer
end

module GetNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314GetNamespace"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_namespace_response_of_yojson ~error_deserializer
end

module GetOperation = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "OperationNotFound" ->
          `OperationNotFound (Json_deserializers.operation_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_operation_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314GetOperation"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_operation_response_of_yojson ~error_deserializer
end

module GetService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314GetService" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_service_response_of_yojson ~error_deserializer
end

module GetServiceAttributes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_service_attributes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314GetServiceAttributes" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_service_attributes_response_of_yojson
      ~error_deserializer
end

module ListInstances = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instances_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314ListInstances"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_instances_response_of_yojson ~error_deserializer
end

module ListNamespaces = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_namespaces_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_namespaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314ListNamespaces"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_namespaces_response_of_yojson ~error_deserializer
end

module ListOperations = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_operations_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314ListOperations"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_operations_response_of_yojson ~error_deserializer
end

module ListServices = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314ListServices"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314ListTagsForResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RegisterInstance = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _, "ResourceLimitExceeded" ->
          `ResourceLimitExceeded (Json_deserializers.resource_limit_exceeded_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_instance_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.register_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314RegisterInstance"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.register_instance_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "TooManyTagsException" ->
          `TooManyTagsException (Json_deserializers.too_many_tags_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314TagResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314UntagResource"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateHttpNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_http_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314UpdateHttpNamespace"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_http_namespace_response_of_yojson
      ~error_deserializer
end

module UpdateInstanceCustomHealthStatus = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CustomHealthNotFound" ->
          `CustomHealthNotFound (Json_deserializers.custom_health_not_found_of_yojson tree path)
      | _, "InstanceNotFound" ->
          `InstanceNotFound (Json_deserializers.instance_not_found_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_instance_custom_health_status_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_instance_custom_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314UpdateInstanceCustomHealthStatus" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdatePrivateDnsNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_private_dns_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314UpdatePrivateDnsNamespace" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_private_dns_namespace_response_of_yojson
      ~error_deserializer
end

module UpdatePublicDnsNamespace = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "NamespaceNotFound" ->
          `NamespaceNotFound (Json_deserializers.namespace_not_found_of_yojson tree path)
      | _, "ResourceInUse" ->
          `ResourceInUse (Json_deserializers.resource_in_use_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_public_dns_namespace_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314UpdatePublicDnsNamespace" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_public_dns_namespace_response_of_yojson
      ~error_deserializer
end

module UpdateService = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DuplicateRequest" ->
          `DuplicateRequest (Json_deserializers.duplicate_request_of_yojson tree path)
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314UpdateService"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_service_response_of_yojson ~error_deserializer
end

module UpdateServiceAttributes = struct
  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _, "ServiceAttributesLimitExceededException" ->
          `ServiceAttributesLimitExceededException
            (Json_deserializers.service_attributes_limit_exceeded_exception_of_yojson tree path)
      | _, "ServiceNotFound" ->
          `ServiceNotFound (Json_deserializers.service_not_found_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_service_attributes_request) =
    let open Smaws_Lib.Context in
    let input = Json_serializers.update_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314UpdateServiceAttributes" ~service
      ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.update_service_attributes_response_of_yojson
      ~error_deserializer
end
