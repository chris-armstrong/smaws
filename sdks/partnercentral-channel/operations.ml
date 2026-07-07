open Types
open Service_metadata

module AcceptChannelHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : accept_channel_handshake_request) =
    let input = Json_serializers.accept_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.AcceptChannelHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_channel_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_channel_handshake_request) =
    let input = Json_serializers.accept_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.AcceptChannelHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_channel_handshake_response_of_yojson
      ~error_deserializer
end

module CancelChannelHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : cancel_channel_handshake_request) =
    let input = Json_serializers.cancel_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.CancelChannelHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_channel_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_channel_handshake_request) =
    let input = Json_serializers.cancel_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.CancelChannelHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_channel_handshake_response_of_yojson
      ~error_deserializer
end

module CreateChannelHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralchannel#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : create_channel_handshake_request) =
    let input = Json_serializers.create_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.CreateChannelHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_channel_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_channel_handshake_request) =
    let input = Json_serializers.create_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.CreateChannelHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_channel_handshake_response_of_yojson
      ~error_deserializer
end

module CreateProgramManagementAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralchannel#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : create_program_management_account_request) =
    let input = Json_serializers.create_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralChannel.CreateProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_program_management_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_program_management_account_request) =
    let input = Json_serializers.create_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.CreateProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_program_management_account_response_of_yojson
      ~error_deserializer
end

module CreateRelationship = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.partnercentralchannel#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : create_relationship_request) =
    let input = Json_serializers.create_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.CreateRelationship"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_relationship_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_relationship_request) =
    let input = Json_serializers.create_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.CreateRelationship" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_relationship_response_of_yojson
      ~error_deserializer
end

module DeleteProgramManagementAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : delete_program_management_account_request) =
    let input = Json_serializers.delete_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralChannel.DeleteProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_program_management_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_program_management_account_request) =
    let input = Json_serializers.delete_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.DeleteProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_program_management_account_response_of_yojson
      ~error_deserializer
end

module DeleteRelationship = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : delete_relationship_request) =
    let input = Json_serializers.delete_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.DeleteRelationship"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_relationship_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_relationship_request) =
    let input = Json_serializers.delete_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.DeleteRelationship" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_relationship_response_of_yojson
      ~error_deserializer
end

module GetRelationship = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : get_relationship_request) =
    let input = Json_serializers.get_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.GetRelationship" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_relationship_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_relationship_request) =
    let input = Json_serializers.get_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.GetRelationship" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_relationship_response_of_yojson
      ~error_deserializer
end

module ListChannelHandshakes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : list_channel_handshakes_request) =
    let input = Json_serializers.list_channel_handshakes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.ListChannelHandshakes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_channel_handshakes_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_channel_handshakes_request) =
    let input = Json_serializers.list_channel_handshakes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.ListChannelHandshakes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_channel_handshakes_response_of_yojson
      ~error_deserializer
end

module ListProgramManagementAccounts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : list_program_management_accounts_request) =
    let input = Json_serializers.list_program_management_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralChannel.ListProgramManagementAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_program_management_accounts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_program_management_accounts_request) =
    let input = Json_serializers.list_program_management_accounts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.ListProgramManagementAccounts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_program_management_accounts_response_of_yojson
      ~error_deserializer
end

module ListRelationships = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : list_relationships_request) =
    let input = Json_serializers.list_relationships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.ListRelationships"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_relationships_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_relationships_request) =
    let input = Json_serializers.list_relationships_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.ListRelationships" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_relationships_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RejectChannelHandshake = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : reject_channel_handshake_request) =
    let input = Json_serializers.reject_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.RejectChannelHandshake"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_channel_handshake_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_channel_handshake_request) =
    let input = Json_serializers.reject_channel_handshake_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.RejectChannelHandshake" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_channel_handshake_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateProgramManagementAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : update_program_management_account_request) =
    let input = Json_serializers.update_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PartnerCentralChannel.UpdateProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_program_management_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_program_management_account_request) =
    let input = Json_serializers.update_program_management_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.UpdateProgramManagementAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_program_management_account_response_of_yojson
      ~error_deserializer
end

module UpdateRelationship = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.partnercentralchannel#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.partnercentralchannel#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.partnercentralchannel#InternalServerException"
    | `ResourceNotFoundException _ ->
        "com.amazonaws.partnercentralchannel#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.partnercentralchannel#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.partnercentralchannel#ValidationException"
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

  let request context (request : update_relationship_request) =
    let input = Json_serializers.update_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PartnerCentralChannel.UpdateRelationship"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_relationship_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_relationship_request) =
    let input = Json_serializers.update_relationship_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PartnerCentralChannel.UpdateRelationship" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_relationship_response_of_yojson
      ~error_deserializer
end
