open Types
open Service_metadata

module CreateCapability = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : create_capability_request) =
    let input = Json_serializers.create_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.CreateCapability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_capability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_capability_request) =
    let input = Json_serializers.create_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.CreateCapability" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_capability_response_of_yojson
      ~error_deserializer
end

module CreatePartnership = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : create_partnership_request) =
    let input = Json_serializers.create_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.CreatePartnership" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_partnership_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_partnership_request) =
    let input = Json_serializers.create_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.CreatePartnership" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_partnership_response_of_yojson
      ~error_deserializer
end

module CreateProfile = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : create_profile_request) =
    let input = Json_serializers.create_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.CreateProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_profile_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_profile_request) =
    let input = Json_serializers.create_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.CreateProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_profile_response_of_yojson
      ~error_deserializer
end

module CreateStarterMappingTemplate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_starter_mapping_template_request) =
    let input = Json_serializers.create_starter_mapping_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.CreateStarterMappingTemplate" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_starter_mapping_template_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_starter_mapping_template_request) =
    let input = Json_serializers.create_starter_mapping_template_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"B2BI.CreateStarterMappingTemplate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_starter_mapping_template_response_of_yojson
      ~error_deserializer
end

module CreateTransformer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : create_transformer_request) =
    let input = Json_serializers.create_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.CreateTransformer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_transformer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_transformer_request) =
    let input = Json_serializers.create_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.CreateTransformer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_transformer_response_of_yojson
      ~error_deserializer
end

module DeleteCapability = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : delete_capability_request) =
    let input = Json_serializers.delete_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.DeleteCapability" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_capability_request) =
    let input = Json_serializers.delete_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.DeleteCapability" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeletePartnership = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : delete_partnership_request) =
    let input = Json_serializers.delete_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.DeletePartnership" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_partnership_request) =
    let input = Json_serializers.delete_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.DeletePartnership" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteProfile = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : delete_profile_request) =
    let input = Json_serializers.delete_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.DeleteProfile" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_profile_request) =
    let input = Json_serializers.delete_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.DeleteProfile" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteTransformer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : delete_transformer_request) =
    let input = Json_serializers.delete_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.DeleteTransformer" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_transformer_request) =
    let input = Json_serializers.delete_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.DeleteTransformer" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module GenerateMapping = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : generate_mapping_request) =
    let input = Json_serializers.generate_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GenerateMapping" ~service ~context ~input
      ~output_deserializer:Json_deserializers.generate_mapping_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : generate_mapping_request) =
    let input = Json_serializers.generate_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GenerateMapping" ~service
      ~context ~input ~output_deserializer:Json_deserializers.generate_mapping_response_of_yojson
      ~error_deserializer
end

module GetCapability = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : get_capability_request) =
    let input = Json_serializers.get_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GetCapability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_capability_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_capability_request) =
    let input = Json_serializers.get_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GetCapability" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_capability_response_of_yojson
      ~error_deserializer
end

module GetPartnership = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : get_partnership_request) =
    let input = Json_serializers.get_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GetPartnership" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_partnership_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_partnership_request) =
    let input = Json_serializers.get_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GetPartnership" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_partnership_response_of_yojson
      ~error_deserializer
end

module GetProfile = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : get_profile_request) =
    let input = Json_serializers.get_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GetProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_profile_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_profile_request) =
    let input = Json_serializers.get_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GetProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_profile_response_of_yojson
      ~error_deserializer
end

module GetTransformer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : get_transformer_request) =
    let input = Json_serializers.get_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GetTransformer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_transformer_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_transformer_request) =
    let input = Json_serializers.get_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GetTransformer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_transformer_response_of_yojson
      ~error_deserializer
end

module GetTransformerJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : get_transformer_job_request) =
    let input = Json_serializers.get_transformer_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.GetTransformerJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_transformer_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_transformer_job_request) =
    let input = Json_serializers.get_transformer_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.GetTransformerJob" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_transformer_job_response_of_yojson
      ~error_deserializer
end

module ListCapabilities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : list_capabilities_request) =
    let input = Json_serializers.list_capabilities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.ListCapabilities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_capabilities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_capabilities_request) =
    let input = Json_serializers.list_capabilities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.ListCapabilities" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_capabilities_response_of_yojson
      ~error_deserializer
end

module ListPartnerships = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : list_partnerships_request) =
    let input = Json_serializers.list_partnerships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.ListPartnerships" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_partnerships_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_partnerships_request) =
    let input = Json_serializers.list_partnerships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.ListPartnerships" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_partnerships_response_of_yojson
      ~error_deserializer
end

module ListProfiles = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : list_profiles_request) =
    let input = Json_serializers.list_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.ListProfiles" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_profiles_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_profiles_request) =
    let input = Json_serializers.list_profiles_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.ListProfiles" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_profiles_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListTransformers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : list_transformers_request) =
    let input = Json_serializers.list_transformers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.ListTransformers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_transformers_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_transformers_request) =
    let input = Json_serializers.list_transformers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.ListTransformers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_transformers_response_of_yojson
      ~error_deserializer
end

module StartTransformerJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : start_transformer_job_request) =
    let input = Json_serializers.start_transformer_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.StartTransformerJob" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_transformer_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_transformer_job_request) =
    let input = Json_serializers.start_transformer_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.StartTransformerJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_transformer_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.TagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.TagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module TestConversion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : test_conversion_request) =
    let input = Json_serializers.test_conversion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.TestConversion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_conversion_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : test_conversion_request) =
    let input = Json_serializers.test_conversion_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.TestConversion" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_conversion_response_of_yojson
      ~error_deserializer
end

module TestMapping = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : test_mapping_request) =
    let input = Json_serializers.test_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.TestMapping" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_mapping_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : test_mapping_request) =
    let input = Json_serializers.test_mapping_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.TestMapping" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_mapping_response_of_yojson
      ~error_deserializer
end

module TestParsing = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : test_parsing_request) =
    let input = Json_serializers.test_parsing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.TestParsing" ~service ~context ~input
      ~output_deserializer:Json_deserializers.test_parsing_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : test_parsing_request) =
    let input = Json_serializers.test_parsing_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.TestParsing" ~service
      ~context ~input ~output_deserializer:Json_deserializers.test_parsing_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServerException" ->
          `InternalServerException
            (Json_deserializers.internal_server_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.UntagResource" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.UntagResource" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module UpdateCapability = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : update_capability_request) =
    let input = Json_serializers.update_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.UpdateCapability" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_capability_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_capability_request) =
    let input = Json_serializers.update_capability_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.UpdateCapability" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_capability_response_of_yojson
      ~error_deserializer
end

module UpdatePartnership = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : update_partnership_request) =
    let input = Json_serializers.update_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.UpdatePartnership" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_partnership_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_partnership_request) =
    let input = Json_serializers.update_partnership_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.UpdatePartnership" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_partnership_response_of_yojson
      ~error_deserializer
end

module UpdateProfile = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : update_profile_request) =
    let input = Json_serializers.update_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.UpdateProfile" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_profile_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_profile_request) =
    let input = Json_serializers.update_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.UpdateProfile" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_profile_response_of_yojson
      ~error_deserializer
end

module UpdateTransformer = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.b2bi#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.b2bi#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.b2bi#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.b2bi#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.b2bi#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.b2bi#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.b2bi#ValidationException"
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

  let request context (request : update_transformer_request) =
    let input = Json_serializers.update_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"B2BI.UpdateTransformer" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_transformer_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_transformer_request) =
    let input = Json_serializers.update_transformer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"B2BI.UpdateTransformer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_transformer_response_of_yojson
      ~error_deserializer
end
