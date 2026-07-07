open Types
open Service_metadata

module AddKeyReplicationRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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

  let request context (request : add_key_replication_regions_input) =
    let input = Json_serializers.add_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.AddKeyReplicationRegions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_key_replication_regions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : add_key_replication_regions_input) =
    let input = Json_serializers.add_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.AddKeyReplicationRegions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.add_key_replication_regions_output_of_yojson
      ~error_deserializer
end

module CreateAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_alias_input) =
    let input = Json_serializers.create_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.CreateAlias"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_alias_input) =
    let input = Json_serializers.create_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.CreateAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_alias_output_of_yojson ~error_deserializer
end

module CreateKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_key_input) =
    let input = Json_serializers.create_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.CreateKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_key_input) =
    let input = Json_serializers.create_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.CreateKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_key_output_of_yojson ~error_deserializer
end

module DeleteAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_alias_input) =
    let input = Json_serializers.delete_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.DeleteAlias"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_alias_input) =
    let input = Json_serializers.delete_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.DeleteAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_alias_output_of_yojson ~error_deserializer
end

module DeleteKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_key_input) =
    let input = Json_serializers.delete_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.DeleteKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_key_input) =
    let input = Json_serializers.delete_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.DeleteKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_key_output_of_yojson ~error_deserializer
end

module GetAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_alias_input) =
    let input = Json_serializers.get_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.GetAlias"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_alias_input) =
    let input = Json_serializers.get_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_alias_output_of_yojson ~error_deserializer
end

module GetKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_key_input) =
    let input = Json_serializers.get_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.GetKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.get_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_key_input) =
    let input = Json_serializers.get_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_key_output_of_yojson ~error_deserializer
end

module ListAliases = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_aliases_input) =
    let input = Json_serializers.list_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.ListAliases"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_aliases_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_aliases_input) =
    let input = Json_serializers.list_aliases_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.ListAliases" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_aliases_output_of_yojson ~error_deserializer
end

module ListKeys = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_keys_input) =
    let input = Json_serializers.list_keys_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.ListKeys"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_keys_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_keys_input) =
    let input = Json_serializers.list_keys_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.ListKeys" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_keys_output_of_yojson ~error_deserializer
end

module AssociateMpaTeam = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_mpa_team_input) =
    let input = Json_serializers.associate_mpa_team_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.AssociateMpaTeam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_mpa_team_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_mpa_team_input) =
    let input = Json_serializers.associate_mpa_team_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.AssociateMpaTeam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_mpa_team_output_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_resource_policy_input) =
    let input = Json_serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_input) =
    let input = Json_serializers.delete_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_output_of_yojson
      ~error_deserializer
end

module DisableDefaultKeyReplicationRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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

  let request context (request : disable_default_key_replication_regions_input) =
    let input = Json_serializers.disable_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.DisableDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disable_default_key_replication_regions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disable_default_key_replication_regions_input) =
    let input = Json_serializers.disable_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.DisableDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disable_default_key_replication_regions_output_of_yojson
      ~error_deserializer
end

module DisassociateMpaTeam = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_mpa_team_input) =
    let input = Json_serializers.disassociate_mpa_team_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.DisassociateMpaTeam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_mpa_team_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_mpa_team_input) =
    let input = Json_serializers.disassociate_mpa_team_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.DisassociateMpaTeam" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_mpa_team_output_of_yojson
      ~error_deserializer
end

module EnableDefaultKeyReplicationRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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

  let request context (request : enable_default_key_replication_regions_input) =
    let input = Json_serializers.enable_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.EnableDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.enable_default_key_replication_regions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : enable_default_key_replication_regions_input) =
    let input = Json_serializers.enable_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.EnableDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.enable_default_key_replication_regions_output_of_yojson
      ~error_deserializer
end

module ExportKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : export_key_input) =
    let input = Json_serializers.export_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.ExportKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.export_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : export_key_input) =
    let input = Json_serializers.export_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.ExportKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.export_key_output_of_yojson ~error_deserializer
end

module GetCertificateSigningRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_certificate_signing_request_input) =
    let input = Json_serializers.get_certificate_signing_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetCertificateSigningRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_certificate_signing_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_certificate_signing_request_input) =
    let input = Json_serializers.get_certificate_signing_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetCertificateSigningRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_certificate_signing_request_output_of_yojson
      ~error_deserializer
end

module GetDefaultKeyReplicationRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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

  let request context (request : get_default_key_replication_regions_input) =
    let input = Json_serializers.get_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_default_key_replication_regions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_default_key_replication_regions_input) =
    let input = Json_serializers.get_default_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetDefaultKeyReplicationRegions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_default_key_replication_regions_output_of_yojson
      ~error_deserializer
end

module GetMpaTeamAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mpa_team_association_input) =
    let input = Json_serializers.get_mpa_team_association_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetMpaTeamAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_mpa_team_association_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_mpa_team_association_input) =
    let input = Json_serializers.get_mpa_team_association_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetMpaTeamAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_mpa_team_association_output_of_yojson
      ~error_deserializer
end

module GetParametersForExport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameters_for_export_input) =
    let input = Json_serializers.get_parameters_for_export_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetParametersForExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parameters_for_export_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_parameters_for_export_input) =
    let input = Json_serializers.get_parameters_for_export_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetParametersForExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parameters_for_export_output_of_yojson
      ~error_deserializer
end

module GetParametersForImport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_parameters_for_import_input) =
    let input = Json_serializers.get_parameters_for_import_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetParametersForImport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parameters_for_import_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_parameters_for_import_input) =
    let input = Json_serializers.get_parameters_for_import_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetParametersForImport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_parameters_for_import_output_of_yojson
      ~error_deserializer
end

module GetPublicKeyCertificate = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_public_key_certificate_input) =
    let input = Json_serializers.get_public_key_certificate_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetPublicKeyCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_public_key_certificate_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_public_key_certificate_input) =
    let input = Json_serializers.get_public_key_certificate_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetPublicKeyCertificate" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_public_key_certificate_output_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_resource_policy_input) =
    let input = Json_serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_input) =
    let input = Json_serializers.get_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_output_of_yojson
      ~error_deserializer
end

module ImportKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : import_key_input) =
    let input = Json_serializers.import_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.ImportKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.import_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : import_key_input) =
    let input = Json_serializers.import_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.ImportKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.import_key_output_of_yojson ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_input) =
    let input = Json_serializers.list_tags_for_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_output_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `PublicPolicyException _ -> "com.amazonaws.paymentcryptography#PublicPolicyException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "PublicPolicyException" ->
          `PublicPolicyException (Json_deserializers.public_policy_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_resource_policy_input) =
    let input = Json_serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_input) =
    let input = Json_serializers.put_resource_policy_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_output_of_yojson
      ~error_deserializer
end

module RemoveKeyReplicationRegions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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

  let request context (request : remove_key_replication_regions_input) =
    let input = Json_serializers.remove_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PaymentCryptographyControlPlane.RemoveKeyReplicationRegions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.remove_key_replication_regions_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : remove_key_replication_regions_input) =
    let input = Json_serializers.remove_key_replication_regions_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.RemoveKeyReplicationRegions" ~service ~context
      ~input ~output_deserializer:Json_deserializers.remove_key_replication_regions_output_of_yojson
      ~error_deserializer
end

module RestoreKey = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : restore_key_input) =
    let input = Json_serializers.restore_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.RestoreKey"
      ~service ~context ~input ~output_deserializer:Json_deserializers.restore_key_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : restore_key_input) =
    let input = Json_serializers.restore_key_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.RestoreKey" ~service ~context ~input
      ~output_deserializer:Json_deserializers.restore_key_output_of_yojson ~error_deserializer
end

module StartKeyUsage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : start_key_usage_input) =
    let input = Json_serializers.start_key_usage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.StartKeyUsage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_key_usage_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : start_key_usage_input) =
    let input = Json_serializers.start_key_usage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.StartKeyUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_key_usage_output_of_yojson ~error_deserializer
end

module StopKeyUsage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_key_usage_input) =
    let input = Json_serializers.stop_key_usage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.StopKeyUsage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_key_usage_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : stop_key_usage_input) =
    let input = Json_serializers.stop_key_usage_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.StopKeyUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_key_usage_output_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.paymentcryptography#ServiceQuotaExceededException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_input) =
    let input = Json_serializers.tag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_output_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_input) =
    let input = Json_serializers.untag_resource_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_output_of_yojson ~error_deserializer
end

module UpdateAlias = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.paymentcryptography#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.paymentcryptography#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.paymentcryptography#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.paymentcryptography#ResourceNotFoundException"
    | `ServiceUnavailableException _ ->
        "com.amazonaws.paymentcryptography#ServiceUnavailableException"
    | `ThrottlingException _ -> "com.amazonaws.paymentcryptography#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.paymentcryptography#ValidationException"
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
      | _, "ServiceUnavailableException" ->
          `ServiceUnavailableException
            (Json_deserializers.service_unavailable_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_alias_input) =
    let input = Json_serializers.update_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PaymentCryptographyControlPlane.UpdateAlias"
      ~service ~context ~input ~output_deserializer:Json_deserializers.update_alias_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_alias_input) =
    let input = Json_serializers.update_alias_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PaymentCryptographyControlPlane.UpdateAlias" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_alias_output_of_yojson ~error_deserializer
end
