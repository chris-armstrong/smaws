open Types
open Service_metadata

module CreateDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : create_domain_request) =
    let input = Json_serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.CreateDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_domain_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_domain_request) =
    let input = Json_serializers.create_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.CreateDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_domain_response_of_yojson
      ~error_deserializer
end

module DeleteDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DeleteDomain" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_domain_request) =
    let input = Json_serializers.delete_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DeleteDomain" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_domain_request) =
    let input = Json_serializers.describe_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeDomain" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_domain_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_domain_request) =
    let input = Json_serializers.describe_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DescribeDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_domain_response_of_yojson
      ~error_deserializer
end

module ListDomains = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListDomains" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_domains_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_domains_request) =
    let input = Json_serializers.list_domains_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.ListDomains" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_domains_response_of_yojson
      ~error_deserializer
end

module UpdateDomain = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : update_domain_request) =
    let input = Json_serializers.update_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.UpdateDomain" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_domain_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : update_domain_request) =
    let input = Json_serializers.update_domain_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.UpdateDomain" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_domain_response_of_yojson
      ~error_deserializer
end

module AssociateFraudster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : associate_fraudster_request) =
    let input = Json_serializers.associate_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.AssociateFraudster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.associate_fraudster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_fraudster_request) =
    let input = Json_serializers.associate_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.AssociateFraudster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_fraudster_response_of_yojson
      ~error_deserializer
end

module CreateWatchlist = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : create_watchlist_request) =
    let input = Json_serializers.create_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.CreateWatchlist" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_watchlist_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_watchlist_request) =
    let input = Json_serializers.create_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.CreateWatchlist" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_watchlist_response_of_yojson
      ~error_deserializer
end

module DeleteFraudster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : delete_fraudster_request) =
    let input = Json_serializers.delete_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DeleteFraudster" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_fraudster_request) =
    let input = Json_serializers.delete_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DeleteFraudster" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteSpeaker = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : delete_speaker_request) =
    let input = Json_serializers.delete_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DeleteSpeaker" ~service ~context ~input
      ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_speaker_request) =
    let input = Json_serializers.delete_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DeleteSpeaker" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DeleteWatchlist = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : delete_watchlist_request) =
    let input = Json_serializers.delete_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DeleteWatchlist" ~service ~context
      ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_watchlist_request) =
    let input = Json_serializers.delete_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DeleteWatchlist" ~service
      ~context ~input ~output_deserializer:Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson
      ~error_deserializer
end

module DescribeFraudster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_fraudster_request) =
    let input = Json_serializers.describe_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeFraudster" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_fraudster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fraudster_request) =
    let input = Json_serializers.describe_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DescribeFraudster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fraudster_response_of_yojson
      ~error_deserializer
end

module DescribeFraudsterRegistrationJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_fraudster_registration_job_request) =
    let input = Json_serializers.describe_fraudster_registration_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeFraudsterRegistrationJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fraudster_registration_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_fraudster_registration_job_request) =
    let input = Json_serializers.describe_fraudster_registration_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.DescribeFraudsterRegistrationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_fraudster_registration_job_response_of_yojson
      ~error_deserializer
end

module DescribeSpeaker = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_speaker_request) =
    let input = Json_serializers.describe_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeSpeaker" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_speaker_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_speaker_request) =
    let input = Json_serializers.describe_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DescribeSpeaker" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_speaker_response_of_yojson
      ~error_deserializer
end

module DescribeSpeakerEnrollmentJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_speaker_enrollment_job_request) =
    let input = Json_serializers.describe_speaker_enrollment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeSpeakerEnrollmentJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.describe_speaker_enrollment_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_speaker_enrollment_job_request) =
    let input = Json_serializers.describe_speaker_enrollment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.DescribeSpeakerEnrollmentJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_speaker_enrollment_job_response_of_yojson
      ~error_deserializer
end

module DescribeWatchlist = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : describe_watchlist_request) =
    let input = Json_serializers.describe_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DescribeWatchlist" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_watchlist_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_watchlist_request) =
    let input = Json_serializers.describe_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DescribeWatchlist"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_watchlist_response_of_yojson
      ~error_deserializer
end

module DisassociateFraudster = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : disassociate_fraudster_request) =
    let input = Json_serializers.disassociate_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.DisassociateFraudster" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_fraudster_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_fraudster_request) =
    let input = Json_serializers.disassociate_fraudster_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.DisassociateFraudster"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_fraudster_response_of_yojson
      ~error_deserializer
end

module EvaluateSession = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : evaluate_session_request) =
    let input = Json_serializers.evaluate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.EvaluateSession" ~service ~context
      ~input ~output_deserializer:Json_deserializers.evaluate_session_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : evaluate_session_request) =
    let input = Json_serializers.evaluate_session_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.EvaluateSession" ~service
      ~context ~input ~output_deserializer:Json_deserializers.evaluate_session_response_of_yojson
      ~error_deserializer
end

module ListFraudsterRegistrationJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_fraudster_registration_jobs_request) =
    let input = Json_serializers.list_fraudster_registration_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListFraudsterRegistrationJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_fraudster_registration_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fraudster_registration_jobs_request) =
    let input = Json_serializers.list_fraudster_registration_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.ListFraudsterRegistrationJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_fraudster_registration_jobs_response_of_yojson
      ~error_deserializer
end

module ListFraudsters = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_fraudsters_request) =
    let input = Json_serializers.list_fraudsters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListFraudsters" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_fraudsters_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_fraudsters_request) =
    let input = Json_serializers.list_fraudsters_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.ListFraudsters" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_fraudsters_response_of_yojson
      ~error_deserializer
end

module ListSpeakerEnrollmentJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_speaker_enrollment_jobs_request) =
    let input = Json_serializers.list_speaker_enrollment_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListSpeakerEnrollmentJobs" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_speaker_enrollment_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_speaker_enrollment_jobs_request) =
    let input = Json_serializers.list_speaker_enrollment_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.ListSpeakerEnrollmentJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_speaker_enrollment_jobs_response_of_yojson
      ~error_deserializer
end

module ListSpeakers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_speakers_request) =
    let input = Json_serializers.list_speakers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListSpeakers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_speakers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : list_speakers_request) =
    let input = Json_serializers.list_speakers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.ListSpeakers" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_speakers_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListTagsForResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWatchlists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : list_watchlists_request) =
    let input = Json_serializers.list_watchlists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.ListWatchlists" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_watchlists_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_watchlists_request) =
    let input = Json_serializers.list_watchlists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.ListWatchlists" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_watchlists_response_of_yojson
      ~error_deserializer
end

module OptOutSpeaker = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : opt_out_speaker_request) =
    let input = Json_serializers.opt_out_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.OptOutSpeaker" ~service ~context ~input
      ~output_deserializer:Json_deserializers.opt_out_speaker_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : opt_out_speaker_request) =
    let input = Json_serializers.opt_out_speaker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.OptOutSpeaker" ~service
      ~context ~input ~output_deserializer:Json_deserializers.opt_out_speaker_response_of_yojson
      ~error_deserializer
end

module StartFraudsterRegistrationJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : start_fraudster_registration_job_request) =
    let input = Json_serializers.start_fraudster_registration_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.StartFraudsterRegistrationJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_fraudster_registration_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_fraudster_registration_job_request) =
    let input = Json_serializers.start_fraudster_registration_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.StartFraudsterRegistrationJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_fraudster_registration_job_response_of_yojson
      ~error_deserializer
end

module StartSpeakerEnrollmentJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.voiceid#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : start_speaker_enrollment_job_request) =
    let input = Json_serializers.start_speaker_enrollment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.StartSpeakerEnrollmentJob" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_speaker_enrollment_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_speaker_enrollment_job_request) =
    let input = Json_serializers.start_speaker_enrollment_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"VoiceID.StartSpeakerEnrollmentJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_speaker_enrollment_job_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateWatchlist = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.voiceid#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.voiceid#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.voiceid#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.voiceid#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.voiceid#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.voiceid#ValidationException"
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

  let request context (request : update_watchlist_request) =
    let input = Json_serializers.update_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"VoiceID.UpdateWatchlist" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_watchlist_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_watchlist_request) =
    let input = Json_serializers.update_watchlist_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"VoiceID.UpdateWatchlist" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_watchlist_response_of_yojson
      ~error_deserializer
end
