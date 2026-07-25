open Types
open Service_metadata

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.UpdateApplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_application_request) =
    let input = Json_serializers.update_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.UpdateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_application_response_of_yojson
      ~error_deserializer
end

module UpdateInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_instance_request) =
    let input = Json_serializers.update_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.UpdateInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_instance_request) =
    let input = Json_serializers.update_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.UpdateInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_instance_response_of_yojson ~error_deserializer
end

module UpdateInstanceAccessControlAttributeConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.update_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.UpdateInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : update_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.update_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.UpdateInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.update_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer
end

module UpdatePermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_permission_set_request) =
    let input = Json_serializers.update_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.UpdatePermissionSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_permission_set_request) =
    let input = Json_serializers.update_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.UpdatePermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_permission_set_response_of_yojson
      ~error_deserializer
end

module UpdateTrustedTokenIssuer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_trusted_token_issuer_request) =
    let input = Json_serializers.update_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.UpdateTrustedTokenIssuer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_trusted_token_issuer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_trusted_token_issuer_request) =
    let input = Json_serializers.update_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.UpdateTrustedTokenIssuer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_trusted_token_issuer_response_of_yojson
      ~error_deserializer
end

module RemoveRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : remove_region_request) =
    let input = Json_serializers.remove_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.RemoveRegion" ~service
      ~context ~input ~output_deserializer:Json_deserializers.remove_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_region_request) =
    let input = Json_serializers.remove_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.RemoveRegion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.remove_region_response_of_yojson ~error_deserializer
end

module PutPermissionsBoundaryToPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_permissions_boundary_to_permission_set_request) =
    let input =
      Json_serializers.put_permissions_boundary_to_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.PutPermissionsBoundaryToPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_permissions_boundary_to_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_permissions_boundary_to_permission_set_request) =
    let input =
      Json_serializers.put_permissions_boundary_to_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutPermissionsBoundaryToPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_permissions_boundary_to_permission_set_response_of_yojson
      ~error_deserializer
end

module PutInlinePolicyToPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : put_inline_policy_to_permission_set_request) =
    let input = Json_serializers.put_inline_policy_to_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.PutInlinePolicyToPermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_inline_policy_to_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_inline_policy_to_permission_set_request) =
    let input = Json_serializers.put_inline_policy_to_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutInlinePolicyToPermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_inline_policy_to_permission_set_response_of_yojson
      ~error_deserializer
end

module PutApplicationSessionConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_application_session_configuration_request) =
    let input = Json_serializers.put_application_session_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.PutApplicationSessionConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_application_session_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_application_session_configuration_request) =
    let input = Json_serializers.put_application_session_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutApplicationSessionConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.put_application_session_configuration_response_of_yojson
      ~error_deserializer
end

module PutApplicationGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_application_grant_request) =
    let input = Json_serializers.put_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.PutApplicationGrant"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_application_grant_request) =
    let input = Json_serializers.put_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutApplicationGrant" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutApplicationAuthenticationMethod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_application_authentication_method_request) =
    let input = Json_serializers.put_application_authentication_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.PutApplicationAuthenticationMethod" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_application_authentication_method_request) =
    let input = Json_serializers.put_application_authentication_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutApplicationAuthenticationMethod" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module PutApplicationAssignmentConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_application_assignment_configuration_request) =
    let input =
      Json_serializers.put_application_assignment_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.PutApplicationAssignmentConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_application_assignment_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_application_assignment_configuration_request) =
    let input =
      Json_serializers.put_application_assignment_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutApplicationAssignmentConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.put_application_assignment_configuration_response_of_yojson
      ~error_deserializer
end

module PutApplicationAccessScope = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : put_application_access_scope_request) =
    let input = Json_serializers.put_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.PutApplicationAccessScope"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_application_access_scope_request) =
    let input = Json_serializers.put_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.PutApplicationAccessScope" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module ProvisionPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : provision_permission_set_request) =
    let input = Json_serializers.provision_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ProvisionPermissionSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : provision_permission_set_request) =
    let input = Json_serializers.provision_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ProvisionPermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.provision_permission_set_response_of_yojson
      ~error_deserializer
end

module ListTrustedTokenIssuers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_trusted_token_issuers_request) =
    let input = Json_serializers.list_trusted_token_issuers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListTrustedTokenIssuers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_trusted_token_issuers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_trusted_token_issuers_request) =
    let input = Json_serializers.list_trusted_token_issuers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListTrustedTokenIssuers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_trusted_token_issuers_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_regions_request) =
    let input = Json_serializers.list_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListRegions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_regions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_regions_request) =
    let input = Json_serializers.list_regions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.ListRegions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_regions_response_of_yojson ~error_deserializer
end

module ListPermissionSetsProvisionedToAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_permission_sets_provisioned_to_account_request) =
    let input =
      Json_serializers.list_permission_sets_provisioned_to_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListPermissionSetsProvisionedToAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_permission_sets_provisioned_to_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_permission_sets_provisioned_to_account_request)
      =
    let input =
      Json_serializers.list_permission_sets_provisioned_to_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListPermissionSetsProvisionedToAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_permission_sets_provisioned_to_account_response_of_yojson
      ~error_deserializer
end

module ListPermissionSets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_permission_sets_request) =
    let input = Json_serializers.list_permission_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListPermissionSets" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_permission_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_permission_sets_request) =
    let input = Json_serializers.list_permission_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListPermissionSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_permission_sets_response_of_yojson
      ~error_deserializer
end

module ListPermissionSetProvisioningStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_permission_set_provisioning_status_request) =
    let input =
      Json_serializers.list_permission_set_provisioning_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListPermissionSetProvisioningStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_permission_set_provisioning_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_permission_set_provisioning_status_request) =
    let input =
      Json_serializers.list_permission_set_provisioning_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListPermissionSetProvisioningStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_permission_set_provisioning_status_response_of_yojson
      ~error_deserializer
end

module ListManagedPoliciesInPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_managed_policies_in_permission_set_request) =
    let input =
      Json_serializers.list_managed_policies_in_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListManagedPoliciesInPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_managed_policies_in_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_managed_policies_in_permission_set_request) =
    let input =
      Json_serializers.list_managed_policies_in_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListManagedPoliciesInPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_managed_policies_in_permission_set_response_of_yojson
      ~error_deserializer
end

module ListInstances = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_instances_request) =
    let input = Json_serializers.list_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListInstances" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_instances_request) =
    let input = Json_serializers.list_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.ListInstances"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_instances_response_of_yojson ~error_deserializer
end

module ListCustomerManagedPolicyReferencesInPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_customer_managed_policy_references_in_permission_set_request)
      =
    let input =
      Json_serializers.list_customer_managed_policy_references_in_permission_set_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListCustomerManagedPolicyReferencesInPermissionSet" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .list_customer_managed_policy_references_in_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_customer_managed_policy_references_in_permission_set_request) =
    let input =
      Json_serializers.list_customer_managed_policy_references_in_permission_set_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListCustomerManagedPolicyReferencesInPermissionSet" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .list_customer_managed_policy_references_in_permission_set_response_of_yojson
      ~error_deserializer
end

module ListApplications = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListApplications" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_applications_request) =
    let input = Json_serializers.list_applications_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplications" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_applications_response_of_yojson
      ~error_deserializer
end

module ListApplicationProviders = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_application_providers_request) =
    let input = Json_serializers.list_application_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListApplicationProviders"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_providers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_providers_request) =
    let input = Json_serializers.list_application_providers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationProviders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_providers_response_of_yojson
      ~error_deserializer
end

module ListApplicationGrants = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_application_grants_request) =
    let input = Json_serializers.list_application_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListApplicationGrants"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_grants_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_grants_request) =
    let input = Json_serializers.list_application_grants_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationGrants" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_grants_response_of_yojson
      ~error_deserializer
end

module ListApplicationAuthenticationMethods = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_application_authentication_methods_request) =
    let input =
      Json_serializers.list_application_authentication_methods_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListApplicationAuthenticationMethods" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_application_authentication_methods_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_authentication_methods_request) =
    let input =
      Json_serializers.list_application_authentication_methods_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationAuthenticationMethods" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_application_authentication_methods_response_of_yojson
      ~error_deserializer
end

module ListApplicationAssignmentsForPrincipal = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_application_assignments_for_principal_request) =
    let input =
      Json_serializers.list_application_assignments_for_principal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListApplicationAssignmentsForPrincipal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_application_assignments_for_principal_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_assignments_for_principal_request) =
    let input =
      Json_serializers.list_application_assignments_for_principal_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationAssignmentsForPrincipal" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_application_assignments_for_principal_response_of_yojson
      ~error_deserializer
end

module ListApplicationAssignments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_application_assignments_request) =
    let input = Json_serializers.list_application_assignments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListApplicationAssignments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_assignments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_assignments_request) =
    let input = Json_serializers.list_application_assignments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationAssignments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_assignments_response_of_yojson
      ~error_deserializer
end

module ListApplicationAccessScopes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_application_access_scopes_request) =
    let input = Json_serializers.list_application_access_scopes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListApplicationAccessScopes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_access_scopes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_application_access_scopes_request) =
    let input = Json_serializers.list_application_access_scopes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListApplicationAccessScopes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_application_access_scopes_response_of_yojson
      ~error_deserializer
end

module ListAccountsForProvisionedPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_accounts_for_provisioned_permission_set_request) =
    let input =
      Json_serializers.list_accounts_for_provisioned_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListAccountsForProvisionedPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_accounts_for_provisioned_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_accounts_for_provisioned_permission_set_request)
      =
    let input =
      Json_serializers.list_accounts_for_provisioned_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListAccountsForProvisionedPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.list_accounts_for_provisioned_permission_set_response_of_yojson
      ~error_deserializer
end

module ListAccountAssignmentsForPrincipal = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_account_assignments_for_principal_request) =
    let input = Json_serializers.list_account_assignments_for_principal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListAccountAssignmentsForPrincipal" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignments_for_principal_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_assignments_for_principal_request) =
    let input = Json_serializers.list_account_assignments_for_principal_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListAccountAssignmentsForPrincipal" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignments_for_principal_response_of_yojson
      ~error_deserializer
end

module ListAccountAssignments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_account_assignments_request) =
    let input = Json_serializers.list_account_assignments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.ListAccountAssignments"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_assignments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_assignments_request) =
    let input = Json_serializers.list_account_assignments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListAccountAssignments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_assignments_response_of_yojson
      ~error_deserializer
end

module ListAccountAssignmentDeletionStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_account_assignment_deletion_status_request) =
    let input =
      Json_serializers.list_account_assignment_deletion_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListAccountAssignmentDeletionStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignment_deletion_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_assignment_deletion_status_request) =
    let input =
      Json_serializers.list_account_assignment_deletion_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListAccountAssignmentDeletionStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignment_deletion_status_response_of_yojson
      ~error_deserializer
end

module ListAccountAssignmentCreationStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_account_assignment_creation_status_request) =
    let input =
      Json_serializers.list_account_assignment_creation_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.ListAccountAssignmentCreationStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignment_creation_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_assignment_creation_status_request) =
    let input =
      Json_serializers.list_account_assignment_creation_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.ListAccountAssignmentCreationStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_account_assignment_creation_status_response_of_yojson
      ~error_deserializer
end

module GetPermissionsBoundaryForPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_permissions_boundary_for_permission_set_request) =
    let input =
      Json_serializers.get_permissions_boundary_for_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.GetPermissionsBoundaryForPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_permissions_boundary_for_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_permissions_boundary_for_permission_set_request)
      =
    let input =
      Json_serializers.get_permissions_boundary_for_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetPermissionsBoundaryForPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_permissions_boundary_for_permission_set_response_of_yojson
      ~error_deserializer
end

module GetInlinePolicyForPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_inline_policy_for_permission_set_request) =
    let input = Json_serializers.get_inline_policy_for_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.GetInlinePolicyForPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_inline_policy_for_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_inline_policy_for_permission_set_request) =
    let input = Json_serializers.get_inline_policy_for_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetInlinePolicyForPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_inline_policy_for_permission_set_response_of_yojson
      ~error_deserializer
end

module GetApplicationSessionConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_application_session_configuration_request) =
    let input = Json_serializers.get_application_session_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.GetApplicationSessionConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_application_session_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_session_configuration_request) =
    let input = Json_serializers.get_application_session_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetApplicationSessionConfiguration" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_application_session_configuration_response_of_yojson
      ~error_deserializer
end

module GetApplicationGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_application_grant_request) =
    let input = Json_serializers.get_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.GetApplicationGrant"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_grant_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_grant_request) =
    let input = Json_serializers.get_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetApplicationGrant" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_grant_response_of_yojson
      ~error_deserializer
end

module GetApplicationAuthenticationMethod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_application_authentication_method_request) =
    let input = Json_serializers.get_application_authentication_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.GetApplicationAuthenticationMethod" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_application_authentication_method_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_authentication_method_request) =
    let input = Json_serializers.get_application_authentication_method_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetApplicationAuthenticationMethod" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_application_authentication_method_response_of_yojson
      ~error_deserializer
end

module GetApplicationAssignmentConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_application_assignment_configuration_request) =
    let input =
      Json_serializers.get_application_assignment_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.GetApplicationAssignmentConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_application_assignment_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_assignment_configuration_request) =
    let input =
      Json_serializers.get_application_assignment_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetApplicationAssignmentConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_application_assignment_configuration_response_of_yojson
      ~error_deserializer
end

module GetApplicationAccessScope = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_application_access_scope_request) =
    let input = Json_serializers.get_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.GetApplicationAccessScope"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_access_scope_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_application_access_scope_request) =
    let input = Json_serializers.get_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.GetApplicationAccessScope" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_application_access_scope_response_of_yojson
      ~error_deserializer
end

module DetachManagedPolicyFromPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : detach_managed_policy_from_permission_set_request) =
    let input =
      Json_serializers.detach_managed_policy_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DetachManagedPolicyFromPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.detach_managed_policy_from_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : detach_managed_policy_from_permission_set_request) =
    let input =
      Json_serializers.detach_managed_policy_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DetachManagedPolicyFromPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.detach_managed_policy_from_permission_set_response_of_yojson
      ~error_deserializer
end

module DetachCustomerManagedPolicyReferenceFromPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context
      (request : detach_customer_managed_policy_reference_from_permission_set_request) =
    let input =
      Json_serializers
      .detach_customer_managed_policy_reference_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DetachCustomerManagedPolicyReferenceFromPermissionSet"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .detach_customer_managed_policy_reference_from_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : detach_customer_managed_policy_reference_from_permission_set_request) =
    let input =
      Json_serializers
      .detach_customer_managed_policy_reference_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DetachCustomerManagedPolicyReferenceFromPermissionSet"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers
        .detach_customer_managed_policy_reference_from_permission_set_response_of_yojson
      ~error_deserializer
end

module DescribeTrustedTokenIssuer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_trusted_token_issuer_request) =
    let input = Json_serializers.describe_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribeTrustedTokenIssuer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_trusted_token_issuer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_trusted_token_issuer_request) =
    let input = Json_serializers.describe_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeTrustedTokenIssuer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_trusted_token_issuer_response_of_yojson
      ~error_deserializer
end

module DescribeRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_region_request) =
    let input = Json_serializers.describe_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribeRegion" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_region_request) =
    let input = Json_serializers.describe_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeRegion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_region_response_of_yojson ~error_deserializer
end

module DescribePermissionSetProvisioningStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_permission_set_provisioning_status_request) =
    let input =
      Json_serializers.describe_permission_set_provisioning_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DescribePermissionSetProvisioningStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_permission_set_provisioning_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_permission_set_provisioning_status_request)
      =
    let input =
      Json_serializers.describe_permission_set_provisioning_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribePermissionSetProvisioningStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_permission_set_provisioning_status_response_of_yojson
      ~error_deserializer
end

module DescribePermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_permission_set_request) =
    let input = Json_serializers.describe_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribePermissionSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_permission_set_request) =
    let input = Json_serializers.describe_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribePermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_permission_set_response_of_yojson
      ~error_deserializer
end

module DescribeInstanceAccessControlAttributeConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.describe_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DescribeInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .describe_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : describe_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.describe_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .describe_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer
end

module DescribeInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_instance_request) =
    let input = Json_serializers.describe_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribeInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_instance_request) =
    let input = Json_serializers.describe_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_instance_response_of_yojson
      ~error_deserializer
end

module DescribeApplicationProvider = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_application_provider_request) =
    let input = Json_serializers.describe_application_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribeApplicationProvider"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_provider_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_provider_request) =
    let input = Json_serializers.describe_application_provider_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeApplicationProvider" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_provider_response_of_yojson
      ~error_deserializer
end

module DescribeApplicationAssignment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_application_assignment_request) =
    let input = Json_serializers.describe_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DescribeApplicationAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_assignment_request) =
    let input = Json_serializers.describe_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeApplicationAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_assignment_response_of_yojson
      ~error_deserializer
end

module DescribeApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DescribeApplication"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_application_request) =
    let input = Json_serializers.describe_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_application_response_of_yojson
      ~error_deserializer
end

module DescribeAccountAssignmentDeletionStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_account_assignment_deletion_status_request) =
    let input =
      Json_serializers.describe_account_assignment_deletion_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DescribeAccountAssignmentDeletionStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_account_assignment_deletion_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_assignment_deletion_status_request)
      =
    let input =
      Json_serializers.describe_account_assignment_deletion_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeAccountAssignmentDeletionStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_account_assignment_deletion_status_response_of_yojson
      ~error_deserializer
end

module DescribeAccountAssignmentCreationStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_account_assignment_creation_status_request) =
    let input =
      Json_serializers.describe_account_assignment_creation_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DescribeAccountAssignmentCreationStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_account_assignment_creation_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_assignment_creation_status_request)
      =
    let input =
      Json_serializers.describe_account_assignment_creation_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DescribeAccountAssignmentCreationStatus" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_account_assignment_creation_status_response_of_yojson
      ~error_deserializer
end

module DeleteTrustedTokenIssuer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_trusted_token_issuer_request) =
    let input = Json_serializers.delete_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteTrustedTokenIssuer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_trusted_token_issuer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_trusted_token_issuer_request) =
    let input = Json_serializers.delete_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteTrustedTokenIssuer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_trusted_token_issuer_response_of_yojson
      ~error_deserializer
end

module DeletePermissionsBoundaryFromPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_permissions_boundary_from_permission_set_request) =
    let input =
      Json_serializers.delete_permissions_boundary_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DeletePermissionsBoundaryFromPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_permissions_boundary_from_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_permissions_boundary_from_permission_set_request) =
    let input =
      Json_serializers.delete_permissions_boundary_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeletePermissionsBoundaryFromPermissionSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_permissions_boundary_from_permission_set_response_of_yojson
      ~error_deserializer
end

module DeletePermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_permission_set_request) =
    let input = Json_serializers.delete_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeletePermissionSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_permission_set_request) =
    let input = Json_serializers.delete_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeletePermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_permission_set_response_of_yojson
      ~error_deserializer
end

module DeleteInstanceAccessControlAttributeConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.delete_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DeleteInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.delete_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer
end

module DeleteInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_instance_request) =
    let input = Json_serializers.delete_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_instance_request) =
    let input = Json_serializers.delete_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_instance_response_of_yojson ~error_deserializer
end

module DeleteInlinePolicyFromPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_inline_policy_from_permission_set_request) =
    let input =
      Json_serializers.delete_inline_policy_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DeleteInlinePolicyFromPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_inline_policy_from_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_inline_policy_from_permission_set_request) =
    let input =
      Json_serializers.delete_inline_policy_from_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteInlinePolicyFromPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_inline_policy_from_permission_set_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationGrant = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_application_grant_request) =
    let input = Json_serializers.delete_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteApplicationGrant"
      ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_grant_request) =
    let input = Json_serializers.delete_application_grant_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteApplicationGrant" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteApplicationAuthenticationMethod = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_application_authentication_method_request) =
    let input =
      Json_serializers.delete_application_authentication_method_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DeleteApplicationAuthenticationMethod" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_authentication_method_request) =
    let input =
      Json_serializers.delete_application_authentication_method_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteApplicationAuthenticationMethod" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteApplicationAssignment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_application_assignment_request) =
    let input = Json_serializers.delete_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteApplicationAssignment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_assignment_request) =
    let input = Json_serializers.delete_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteApplicationAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_assignment_response_of_yojson
      ~error_deserializer
end

module DeleteApplicationAccessScope = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_application_access_scope_request) =
    let input = Json_serializers.delete_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.DeleteApplicationAccessScope" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_access_scope_request) =
    let input = Json_serializers.delete_application_access_scope_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteApplicationAccessScope" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteApplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_application_request) =
    let input = Json_serializers.delete_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_application_response_of_yojson
      ~error_deserializer
end

module DeleteAccountAssignment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : delete_account_assignment_request) =
    let input = Json_serializers.delete_account_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.DeleteAccountAssignment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_account_assignment_request) =
    let input = Json_serializers.delete_account_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.DeleteAccountAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_account_assignment_response_of_yojson
      ~error_deserializer
end

module CreateTrustedTokenIssuer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_trusted_token_issuer_request) =
    let input = Json_serializers.create_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreateTrustedTokenIssuer"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_trusted_token_issuer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_trusted_token_issuer_request) =
    let input = Json_serializers.create_trusted_token_issuer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateTrustedTokenIssuer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_trusted_token_issuer_response_of_yojson
      ~error_deserializer
end

module CreatePermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_permission_set_request) =
    let input = Json_serializers.create_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreatePermissionSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_permission_set_request) =
    let input = Json_serializers.create_permission_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreatePermissionSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_permission_set_response_of_yojson
      ~error_deserializer
end

module CreateInstanceAccessControlAttributeConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.create_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.CreateInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.create_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : create_instance_access_control_attribute_configuration_request) =
    let input =
      Json_serializers.create_instance_access_control_attribute_configuration_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateInstanceAccessControlAttributeConfiguration" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.create_instance_access_control_attribute_configuration_response_of_yojson
      ~error_deserializer
end

module CreateInstance = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_instance_request) =
    let input = Json_serializers.create_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreateInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_instance_request) =
    let input = Json_serializers.create_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_instance_response_of_yojson ~error_deserializer
end

module CreateApplicationAssignment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_application_assignment_request) =
    let input = Json_serializers.create_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreateApplicationAssignment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_assignment_request) =
    let input = Json_serializers.create_application_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateApplicationAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_assignment_response_of_yojson
      ~error_deserializer
end

module CreateApplication = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreateApplication" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_application_request) =
    let input = Json_serializers.create_application_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateApplication" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_application_response_of_yojson
      ~error_deserializer
end

module CreateAccountAssignment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : create_account_assignment_request) =
    let input = Json_serializers.create_account_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.CreateAccountAssignment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_account_assignment_request) =
    let input = Json_serializers.create_account_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.CreateAccountAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_account_assignment_response_of_yojson
      ~error_deserializer
end

module AttachManagedPolicyToPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : attach_managed_policy_to_permission_set_request) =
    let input =
      Json_serializers.attach_managed_policy_to_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.AttachManagedPolicyToPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.attach_managed_policy_to_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : attach_managed_policy_to_permission_set_request) =
    let input =
      Json_serializers.attach_managed_policy_to_permission_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.AttachManagedPolicyToPermissionSet" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.attach_managed_policy_to_permission_set_response_of_yojson
      ~error_deserializer
end

module AttachCustomerManagedPolicyReferenceToPermissionSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssoadmin#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : attach_customer_managed_policy_reference_to_permission_set_request)
      =
    let input =
      Json_serializers.attach_customer_managed_policy_reference_to_permission_set_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"SWBExternalService.AttachCustomerManagedPolicyReferenceToPermissionSet" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .attach_customer_managed_policy_reference_to_permission_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : attach_customer_managed_policy_reference_to_permission_set_request) =
    let input =
      Json_serializers.attach_customer_managed_policy_reference_to_permission_set_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SWBExternalService.AttachCustomerManagedPolicyReferenceToPermissionSet" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers
        .attach_customer_managed_policy_reference_to_permission_set_response_of_yojson
      ~error_deserializer
end

module AddRegion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssoadmin#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssoadmin#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssoadmin#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssoadmin#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssoadmin#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssoadmin#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
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

  let request context (request : add_region_request) =
    let input = Json_serializers.add_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SWBExternalService.AddRegion" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_region_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_region_request) =
    let input = Json_serializers.add_region_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SWBExternalService.AddRegion"
      ~service ~context ~input ~output_deserializer:Json_deserializers.add_region_response_of_yojson
      ~error_deserializer
end
