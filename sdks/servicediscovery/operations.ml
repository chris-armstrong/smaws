open Types
open Service_metadata

module CreateHttpNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceAlreadyExists _ -> "com.amazonaws.servicediscovery#NamespaceAlreadyExists"
    | `ResourceLimitExceeded _ -> "com.amazonaws.servicediscovery#ResourceLimitExceeded"
    | `TooManyTagsException _ -> "com.amazonaws.servicediscovery#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.create_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.CreateHttpNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_http_namespace_response_of_yojson
      ~error_deserializer
end

module CreatePrivateDnsNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceAlreadyExists _ -> "com.amazonaws.servicediscovery#NamespaceAlreadyExists"
    | `ResourceLimitExceeded _ -> "com.amazonaws.servicediscovery#ResourceLimitExceeded"
    | `TooManyTagsException _ -> "com.amazonaws.servicediscovery#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.create_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.CreatePrivateDnsNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_private_dns_namespace_response_of_yojson
      ~error_deserializer
end

module CreatePublicDnsNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceAlreadyExists _ -> "com.amazonaws.servicediscovery#NamespaceAlreadyExists"
    | `ResourceLimitExceeded _ -> "com.amazonaws.servicediscovery#ResourceLimitExceeded"
    | `TooManyTagsException _ -> "com.amazonaws.servicediscovery#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.create_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.CreatePublicDnsNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_public_dns_namespace_response_of_yojson
      ~error_deserializer
end

module CreateService = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `ResourceLimitExceeded _ -> "com.amazonaws.servicediscovery#ResourceLimitExceeded"
    | `ServiceAlreadyExists _ -> "com.amazonaws.servicediscovery#ServiceAlreadyExists"
    | `TooManyTagsException _ -> "com.amazonaws.servicediscovery#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.create_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.CreateService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_service_response_of_yojson ~error_deserializer
end

module DeleteNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.delete_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.DeleteNamespace"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_namespace_response_of_yojson
      ~error_deserializer
end

module DeleteService = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.delete_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.DeleteService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_response_of_yojson ~error_deserializer
end

module DeleteServiceAttributes = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.delete_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.DeleteServiceAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_service_attributes_response_of_yojson
      ~error_deserializer
end

module DeregisterInstance = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InstanceNotFound _ -> "com.amazonaws.servicediscovery#InstanceNotFound"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.deregister_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.DeregisterInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_instance_response_of_yojson
      ~error_deserializer
end

module DiscoverInstances = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `RequestLimitExceeded _ -> "com.amazonaws.servicediscovery#RequestLimitExceeded"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.discover_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.DiscoverInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_instances_response_of_yojson
      ~error_deserializer
end

module DiscoverInstancesRevision = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `RequestLimitExceeded _ -> "com.amazonaws.servicediscovery#RequestLimitExceeded"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.discover_instances_revision_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.DiscoverInstancesRevision" ~service ~context ~input
      ~output_deserializer:Json_deserializers.discover_instances_revision_response_of_yojson
      ~error_deserializer
end

module GetInstance = struct
  let error_to_string = function
    | `InstanceNotFound _ -> "com.amazonaws.servicediscovery#InstanceNotFound"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.GetInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instance_response_of_yojson ~error_deserializer
end

module GetInstancesHealthStatus = struct
  let error_to_string = function
    | `InstanceNotFound _ -> "com.amazonaws.servicediscovery#InstanceNotFound"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_instances_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.GetInstancesHealthStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_instances_health_status_response_of_yojson
      ~error_deserializer
end

module GetNamespace = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.GetNamespace"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_namespace_response_of_yojson ~error_deserializer
end

module GetOperation = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `OperationNotFound _ -> "com.amazonaws.servicediscovery#OperationNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_operation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.GetOperation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_operation_response_of_yojson ~error_deserializer
end

module GetService = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.GetService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_response_of_yojson ~error_deserializer
end

module GetServiceAttributes = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.get_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.GetServiceAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_service_attributes_response_of_yojson
      ~error_deserializer
end

module ListInstances = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.ListInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instances_response_of_yojson ~error_deserializer
end

module ListNamespaces = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_namespaces_request) =
    let input = Json_serializers.list_namespaces_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.ListNamespaces"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_namespaces_response_of_yojson ~error_deserializer
end

module ListOperations = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_operations_request) =
    let input = Json_serializers.list_operations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.ListOperations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_operations_response_of_yojson ~error_deserializer
end

module ListServices = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InvalidInput" -> `InvalidInput (Json_deserializers.invalid_input_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_services_request) =
    let input = Json_serializers.list_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.ListServices"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_services_response_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicediscovery#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RegisterInstance = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | `ResourceLimitExceeded _ -> "com.amazonaws.servicediscovery#ResourceLimitExceeded"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.register_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.RegisterInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_instance_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicediscovery#ResourceNotFoundException"
    | `TooManyTagsException _ -> "com.amazonaws.servicediscovery#TooManyTagsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ResourceNotFoundException _ -> "com.amazonaws.servicediscovery#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateHttpNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_http_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.UpdateHttpNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_http_namespace_response_of_yojson
      ~error_deserializer
end

module UpdateInstanceCustomHealthStatus = struct
  let error_to_string = function
    | `CustomHealthNotFound _ -> "com.amazonaws.servicediscovery#CustomHealthNotFound"
    | `InstanceNotFound _ -> "com.amazonaws.servicediscovery#InstanceNotFound"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_instance_custom_health_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.UpdateInstanceCustomHealthStatus" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdatePrivateDnsNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_private_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.UpdatePrivateDnsNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_private_dns_namespace_response_of_yojson
      ~error_deserializer
end

module UpdatePublicDnsNamespace = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `NamespaceNotFound _ -> "com.amazonaws.servicediscovery#NamespaceNotFound"
    | `ResourceInUse _ -> "com.amazonaws.servicediscovery#ResourceInUse"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_public_dns_namespace_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.UpdatePublicDnsNamespace" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_public_dns_namespace_response_of_yojson
      ~error_deserializer
end

module UpdateService = struct
  let error_to_string = function
    | `DuplicateRequest _ -> "com.amazonaws.servicediscovery#DuplicateRequest"
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_service_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Route53AutoNaming_v20170314.UpdateService"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_response_of_yojson ~error_deserializer
end

module UpdateServiceAttributes = struct
  let error_to_string = function
    | `InvalidInput _ -> "com.amazonaws.servicediscovery#InvalidInput"
    | `ServiceAttributesLimitExceededException _ ->
        "com.amazonaws.servicediscovery#ServiceAttributesLimitExceededException"
    | `ServiceNotFound _ -> "com.amazonaws.servicediscovery#ServiceNotFound"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

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
    let input = Json_serializers.update_service_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Route53AutoNaming_v20170314.UpdateServiceAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_service_attributes_response_of_yojson
      ~error_deserializer
end
