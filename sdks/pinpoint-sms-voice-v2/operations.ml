open Types
open Service_metadata

module AssociateOriginationIdentity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : associate_origination_identity_request) =
    let input = Json_serializers.associate_origination_identity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.AssociateOriginationIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_origination_identity_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_origination_identity_request) =
    let input = Json_serializers.associate_origination_identity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.AssociateOriginationIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_origination_identity_result_of_yojson
      ~error_deserializer
end

module AssociateProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : associate_protect_configuration_request) =
    let input = Json_serializers.associate_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.AssociateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_protect_configuration_request) =
    let input = Json_serializers.associate_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.AssociateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_protect_configuration_result_of_yojson
      ~error_deserializer
end

module CarrierLookup = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : carrier_lookup_request) =
    let input = Json_serializers.carrier_lookup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CarrierLookup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.carrier_lookup_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : carrier_lookup_request) =
    let input = Json_serializers.carrier_lookup_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.CarrierLookup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.carrier_lookup_result_of_yojson ~error_deserializer
end

module CreateConfigurationSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_configuration_set_request) =
    let input = Json_serializers.create_configuration_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateConfigurationSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_configuration_set_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_configuration_set_request) =
    let input = Json_serializers.create_configuration_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateConfigurationSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_configuration_set_result_of_yojson
      ~error_deserializer
end

module CreateEventDestination = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_event_destination_request) =
    let input = Json_serializers.create_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateEventDestination"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_destination_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_event_destination_request) =
    let input = Json_serializers.create_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateEventDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_event_destination_result_of_yojson
      ~error_deserializer
end

module CreateNotifyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_notify_configuration_request) =
    let input = Json_serializers.create_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateNotifyConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notify_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_notify_configuration_request) =
    let input = Json_serializers.create_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateNotifyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notify_configuration_result_of_yojson
      ~error_deserializer
end

module CreateOptOutList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_opt_out_list_request) =
    let input = Json_serializers.create_opt_out_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateOptOutList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_opt_out_list_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_opt_out_list_request) =
    let input = Json_serializers.create_opt_out_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateOptOutList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_opt_out_list_result_of_yojson
      ~error_deserializer
end

module CreatePool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_pool_request) =
    let input = Json_serializers.create_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreatePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_pool_request) =
    let input = Json_serializers.create_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.CreatePool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_pool_result_of_yojson
      ~error_deserializer
end

module CreateProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_protect_configuration_request) =
    let input = Json_serializers.create_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateProtectConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_protect_configuration_request) =
    let input = Json_serializers.create_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_protect_configuration_result_of_yojson
      ~error_deserializer
end

module CreateRcsAgent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_rcs_agent_request) =
    let input = Json_serializers.create_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateRcsAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_rcs_agent_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rcs_agent_request) =
    let input = Json_serializers.create_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateRcsAgent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rcs_agent_result_of_yojson ~error_deserializer
end

module CreateRegistration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_registration_request) =
    let input = Json_serializers.create_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateRegistration" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_registration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_registration_request) =
    let input = Json_serializers.create_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_result_of_yojson
      ~error_deserializer
end

module CreateRegistrationAssociation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_registration_association_request) =
    let input = Json_serializers.create_registration_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_association_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_registration_association_request) =
    let input = Json_serializers.create_registration_association_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationAssociation" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_association_result_of_yojson
      ~error_deserializer
end

module CreateRegistrationAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_registration_attachment_request) =
    let input = Json_serializers.create_registration_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_attachment_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_registration_attachment_request) =
    let input = Json_serializers.create_registration_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_attachment_result_of_yojson
      ~error_deserializer
end

module CreateRegistrationVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_registration_version_request) =
    let input = Json_serializers.create_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_registration_version_request) =
    let input = Json_serializers.create_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateRegistrationVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_registration_version_result_of_yojson
      ~error_deserializer
end

module CreateVerifiedDestinationNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : create_verified_destination_number_request) =
    let input = Json_serializers.create_verified_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.CreateVerifiedDestinationNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_verified_destination_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_verified_destination_number_request) =
    let input = Json_serializers.create_verified_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.CreateVerifiedDestinationNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_verified_destination_number_result_of_yojson
      ~error_deserializer
end

module DeleteAccountDefaultProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_account_default_protect_configuration_request) =
    let input =
      Json_serializers.delete_account_default_protect_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteAccountDefaultProtectConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_account_default_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_account_default_protect_configuration_request)
      =
    let input =
      Json_serializers.delete_account_default_protect_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteAccountDefaultProtectConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_account_default_protect_configuration_result_of_yojson
      ~error_deserializer
end

module DeleteConfigurationSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_configuration_set_request) =
    let input = Json_serializers.delete_configuration_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteConfigurationSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_configuration_set_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_configuration_set_request) =
    let input = Json_serializers.delete_configuration_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteConfigurationSet" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_configuration_set_result_of_yojson
      ~error_deserializer
end

module DeleteDefaultMessageType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_default_message_type_request) =
    let input = Json_serializers.delete_default_message_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteDefaultMessageType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_default_message_type_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_default_message_type_request) =
    let input = Json_serializers.delete_default_message_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteDefaultMessageType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_default_message_type_result_of_yojson
      ~error_deserializer
end

module DeleteDefaultSenderId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_default_sender_id_request) =
    let input = Json_serializers.delete_default_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteDefaultSenderId"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_default_sender_id_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_default_sender_id_request) =
    let input = Json_serializers.delete_default_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteDefaultSenderId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_default_sender_id_result_of_yojson
      ~error_deserializer
end

module DeleteEventDestination = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_event_destination_request) =
    let input = Json_serializers.delete_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteEventDestination"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_destination_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_event_destination_request) =
    let input = Json_serializers.delete_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteEventDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_event_destination_result_of_yojson
      ~error_deserializer
end

module DeleteKeyword = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_keyword_request) =
    let input = Json_serializers.delete_keyword_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteKeyword" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_keyword_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_keyword_request) =
    let input = Json_serializers.delete_keyword_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.DeleteKeyword"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_keyword_result_of_yojson ~error_deserializer
end

module DeleteMediaMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_media_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_media_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteMediaMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_media_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_media_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_media_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteMediaMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_media_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module DeleteNotifyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_notify_configuration_request) =
    let input = Json_serializers.delete_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteNotifyConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_notify_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notify_configuration_request) =
    let input = Json_serializers.delete_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteNotifyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_notify_configuration_result_of_yojson
      ~error_deserializer
end

module DeleteNotifyMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_notify_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_notify_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteNotifyMessageSpendLimitOverride" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_notify_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notify_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_notify_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteNotifyMessageSpendLimitOverride" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.delete_notify_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module DeleteOptedOutNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_opted_out_number_request) =
    let input = Json_serializers.delete_opted_out_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteOptedOutNumber"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_opted_out_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_opted_out_number_request) =
    let input = Json_serializers.delete_opted_out_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteOptedOutNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_opted_out_number_result_of_yojson
      ~error_deserializer
end

module DeleteOptOutList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_opt_out_list_request) =
    let input = Json_serializers.delete_opt_out_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteOptOutList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_opt_out_list_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_opt_out_list_request) =
    let input = Json_serializers.delete_opt_out_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteOptOutList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_opt_out_list_result_of_yojson
      ~error_deserializer
end

module DeletePool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_pool_request) =
    let input = Json_serializers.delete_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeletePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_pool_request) =
    let input = Json_serializers.delete_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.DeletePool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_pool_result_of_yojson
      ~error_deserializer
end

module DeleteProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_protect_configuration_request) =
    let input = Json_serializers.delete_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteProtectConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_protect_configuration_request) =
    let input = Json_serializers.delete_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_protect_configuration_result_of_yojson
      ~error_deserializer
end

module DeleteProtectConfigurationRuleSetNumberOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_protect_configuration_rule_set_number_override_request) =
    let input =
      Json_serializers.delete_protect_configuration_rule_set_number_override_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteProtectConfigurationRuleSetNumberOverride" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_protect_configuration_rule_set_number_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : delete_protect_configuration_rule_set_number_override_request) =
    let input =
      Json_serializers.delete_protect_configuration_rule_set_number_override_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteProtectConfigurationRuleSetNumberOverride" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_protect_configuration_rule_set_number_override_result_of_yojson
      ~error_deserializer
end

module DeleteRcsAgent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_rcs_agent_request) =
    let input = Json_serializers.delete_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteRcsAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_rcs_agent_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rcs_agent_request) =
    let input = Json_serializers.delete_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteRcsAgent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rcs_agent_result_of_yojson ~error_deserializer
end

module DeleteRcsMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_rcs_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_rcs_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteRcsMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_rcs_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rcs_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_rcs_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteRcsMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_rcs_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module DeleteRegistration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_registration_request) =
    let input = Json_serializers.delete_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteRegistration" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_registration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_registration_request) =
    let input = Json_serializers.delete_registration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteRegistration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_registration_result_of_yojson
      ~error_deserializer
end

module DeleteRegistrationAttachment = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_registration_attachment_request) =
    let input = Json_serializers.delete_registration_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteRegistrationAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_registration_attachment_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_registration_attachment_request) =
    let input = Json_serializers.delete_registration_attachment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteRegistrationAttachment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_registration_attachment_result_of_yojson
      ~error_deserializer
end

module DeleteRegistrationFieldValue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_registration_field_value_request) =
    let input = Json_serializers.delete_registration_field_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteRegistrationFieldValue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_registration_field_value_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_registration_field_value_request) =
    let input = Json_serializers.delete_registration_field_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteRegistrationFieldValue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_registration_field_value_result_of_yojson
      ~error_deserializer
end

module DeleteResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DeleteResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_resource_policy_request) =
    let input = Json_serializers.delete_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_resource_policy_result_of_yojson
      ~error_deserializer
end

module DeleteTextMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_text_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_text_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteTextMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_text_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_text_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_text_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteTextMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_text_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module DeleteVerifiedDestinationNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_verified_destination_number_request) =
    let input = Json_serializers.delete_verified_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteVerifiedDestinationNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_verified_destination_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_verified_destination_number_request) =
    let input = Json_serializers.delete_verified_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteVerifiedDestinationNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_verified_destination_number_result_of_yojson
      ~error_deserializer
end

module DeleteVoiceMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : delete_voice_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_voice_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DeleteVoiceMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_voice_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_voice_message_spend_limit_override_request) =
    let input =
      Json_serializers.delete_voice_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DeleteVoiceMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_voice_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module DescribeAccountAttributes = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_account_attributes_request) =
    let input = Json_serializers.describe_account_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeAccountAttributes"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_attributes_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_attributes_request) =
    let input = Json_serializers.describe_account_attributes_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeAccountAttributes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_attributes_result_of_yojson
      ~error_deserializer
end

module DescribeAccountLimits = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_account_limits_request) =
    let input = Json_serializers.describe_account_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeAccountLimits"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_limits_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_account_limits_request) =
    let input = Json_serializers.describe_account_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeAccountLimits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_account_limits_result_of_yojson
      ~error_deserializer
end

module DescribeConfigurationSets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_configuration_sets_request) =
    let input = Json_serializers.describe_configuration_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeConfigurationSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_sets_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_configuration_sets_request) =
    let input = Json_serializers.describe_configuration_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeConfigurationSets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_configuration_sets_result_of_yojson
      ~error_deserializer
end

module DescribeKeywords = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_keywords_request) =
    let input = Json_serializers.describe_keywords_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeKeywords" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_keywords_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_keywords_request) =
    let input = Json_serializers.describe_keywords_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeKeywords" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_keywords_result_of_yojson ~error_deserializer
end

module DescribeNotifyConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_notify_configurations_request) =
    let input = Json_serializers.describe_notify_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeNotifyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notify_configurations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notify_configurations_request) =
    let input = Json_serializers.describe_notify_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeNotifyConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notify_configurations_result_of_yojson
      ~error_deserializer
end

module DescribeNotifyTemplates = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_notify_templates_request) =
    let input = Json_serializers.describe_notify_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeNotifyTemplates"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notify_templates_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notify_templates_request) =
    let input = Json_serializers.describe_notify_templates_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeNotifyTemplates" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notify_templates_result_of_yojson
      ~error_deserializer
end

module DescribeOptedOutNumbers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_opted_out_numbers_request) =
    let input = Json_serializers.describe_opted_out_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeOptedOutNumbers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_opted_out_numbers_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_opted_out_numbers_request) =
    let input = Json_serializers.describe_opted_out_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeOptedOutNumbers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_opted_out_numbers_result_of_yojson
      ~error_deserializer
end

module DescribeOptOutLists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_opt_out_lists_request) =
    let input = Json_serializers.describe_opt_out_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeOptOutLists"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_opt_out_lists_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_opt_out_lists_request) =
    let input = Json_serializers.describe_opt_out_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeOptOutLists" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_opt_out_lists_result_of_yojson
      ~error_deserializer
end

module DescribePhoneNumbers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_phone_numbers_request) =
    let input = Json_serializers.describe_phone_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribePhoneNumbers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_phone_numbers_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_phone_numbers_request) =
    let input = Json_serializers.describe_phone_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribePhoneNumbers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_phone_numbers_result_of_yojson
      ~error_deserializer
end

module DescribePools = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_pools_request) =
    let input = Json_serializers.describe_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribePools" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_pools_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_pools_request) =
    let input = Json_serializers.describe_pools_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.DescribePools"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_pools_result_of_yojson ~error_deserializer
end

module DescribeProtectConfigurations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_protect_configurations_request) =
    let input = Json_serializers.describe_protect_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeProtectConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_protect_configurations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_protect_configurations_request) =
    let input = Json_serializers.describe_protect_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeProtectConfigurations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_protect_configurations_result_of_yojson
      ~error_deserializer
end

module DescribeRcsAgentCountryLaunchStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_rcs_agent_country_launch_status_request) =
    let input =
      Json_serializers.describe_rcs_agent_country_launch_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRcsAgentCountryLaunchStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_rcs_agent_country_launch_status_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rcs_agent_country_launch_status_request) =
    let input =
      Json_serializers.describe_rcs_agent_country_launch_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRcsAgentCountryLaunchStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_rcs_agent_country_launch_status_result_of_yojson
      ~error_deserializer
end

module DescribeRcsAgents = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_rcs_agents_request) =
    let input = Json_serializers.describe_rcs_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeRcsAgents" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_rcs_agents_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_rcs_agents_request) =
    let input = Json_serializers.describe_rcs_agents_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRcsAgents" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_rcs_agents_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationAttachments = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_attachments_request) =
    let input = Json_serializers.describe_registration_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationAttachments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_attachments_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_attachments_request) =
    let input = Json_serializers.describe_registration_attachments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationAttachments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_attachments_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationFieldDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_field_definitions_request) =
    let input =
      Json_serializers.describe_registration_field_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationFieldDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_field_definitions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_field_definitions_request) =
    let input =
      Json_serializers.describe_registration_field_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationFieldDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_field_definitions_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationFieldValues = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_field_values_request) =
    let input = Json_serializers.describe_registration_field_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationFieldValues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_field_values_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_field_values_request) =
    let input = Json_serializers.describe_registration_field_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationFieldValues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_field_values_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registrations_request) =
    let input = Json_serializers.describe_registrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registrations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registrations_request) =
    let input = Json_serializers.describe_registrations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registrations_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationSectionDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_section_definitions_request) =
    let input =
      Json_serializers.describe_registration_section_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationSectionDefinitions" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_section_definitions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_section_definitions_request) =
    let input =
      Json_serializers.describe_registration_section_definitions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationSectionDefinitions" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_section_definitions_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationTypeDefinitions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_type_definitions_request) =
    let input = Json_serializers.describe_registration_type_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationTypeDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_type_definitions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_type_definitions_request) =
    let input = Json_serializers.describe_registration_type_definitions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationTypeDefinitions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.describe_registration_type_definitions_result_of_yojson
      ~error_deserializer
end

module DescribeRegistrationVersions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_registration_versions_request) =
    let input = Json_serializers.describe_registration_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_versions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_registration_versions_request) =
    let input = Json_serializers.describe_registration_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeRegistrationVersions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_registration_versions_result_of_yojson
      ~error_deserializer
end

module DescribeSenderIds = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_sender_ids_request) =
    let input = Json_serializers.describe_sender_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeSenderIds" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_sender_ids_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_sender_ids_request) =
    let input = Json_serializers.describe_sender_ids_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeSenderIds" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_sender_ids_result_of_yojson
      ~error_deserializer
end

module DescribeSpendLimits = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_spend_limits_request) =
    let input = Json_serializers.describe_spend_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DescribeSpendLimits"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_spend_limits_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_spend_limits_request) =
    let input = Json_serializers.describe_spend_limits_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeSpendLimits" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_spend_limits_result_of_yojson
      ~error_deserializer
end

module DescribeVerifiedDestinationNumbers = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : describe_verified_destination_numbers_request) =
    let input = Json_serializers.describe_verified_destination_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DescribeVerifiedDestinationNumbers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_verified_destination_numbers_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_verified_destination_numbers_request) =
    let input = Json_serializers.describe_verified_destination_numbers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DescribeVerifiedDestinationNumbers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_verified_destination_numbers_result_of_yojson
      ~error_deserializer
end

module DisassociateOriginationIdentity = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : disassociate_origination_identity_request) =
    let input = Json_serializers.disassociate_origination_identity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DisassociateOriginationIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_origination_identity_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_origination_identity_request) =
    let input = Json_serializers.disassociate_origination_identity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DisassociateOriginationIdentity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_origination_identity_result_of_yojson
      ~error_deserializer
end

module DisassociateProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : disassociate_protect_configuration_request) =
    let input = Json_serializers.disassociate_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.DisassociateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_protect_configuration_request) =
    let input = Json_serializers.disassociate_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DisassociateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_protect_configuration_result_of_yojson
      ~error_deserializer
end

module DiscardRegistrationVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : discard_registration_version_request) =
    let input = Json_serializers.discard_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.DiscardRegistrationVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.discard_registration_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : discard_registration_version_request) =
    let input = Json_serializers.discard_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.DiscardRegistrationVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.discard_registration_version_result_of_yojson
      ~error_deserializer
end

module GetProtectConfigurationCountryRuleSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : get_protect_configuration_country_rule_set_request) =
    let input =
      Json_serializers.get_protect_configuration_country_rule_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.GetProtectConfigurationCountryRuleSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_protect_configuration_country_rule_set_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_protect_configuration_country_rule_set_request) =
    let input =
      Json_serializers.get_protect_configuration_country_rule_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.GetProtectConfigurationCountryRuleSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.get_protect_configuration_country_rule_set_result_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.GetResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_resource_policy_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.GetResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_result_of_yojson
      ~error_deserializer
end

module ListNotifyCountries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : list_notify_countries_request) =
    let input = Json_serializers.list_notify_countries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.ListNotifyCountries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notify_countries_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_notify_countries_request) =
    let input = Json_serializers.list_notify_countries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ListNotifyCountries" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_notify_countries_result_of_yojson
      ~error_deserializer
end

module ListPoolOriginationIdentities = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : list_pool_origination_identities_request) =
    let input = Json_serializers.list_pool_origination_identities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.ListPoolOriginationIdentities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pool_origination_identities_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pool_origination_identities_request) =
    let input = Json_serializers.list_pool_origination_identities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ListPoolOriginationIdentities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pool_origination_identities_result_of_yojson
      ~error_deserializer
end

module ListProtectConfigurationRuleSetNumberOverrides = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : list_protect_configuration_rule_set_number_overrides_request) =
    let input =
      Json_serializers.list_protect_configuration_rule_set_number_overrides_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.ListProtectConfigurationRuleSetNumberOverrides" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_protect_configuration_rule_set_number_overrides_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : list_protect_configuration_rule_set_number_overrides_request) =
    let input =
      Json_serializers.list_protect_configuration_rule_set_number_overrides_request_to_yojson
        request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ListProtectConfigurationRuleSetNumberOverrides" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_protect_configuration_rule_set_number_overrides_result_of_yojson
      ~error_deserializer
end

module ListRegistrationAssociations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : list_registration_associations_request) =
    let input = Json_serializers.list_registration_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.ListRegistrationAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_registration_associations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_registration_associations_request) =
    let input = Json_serializers.list_registration_associations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ListRegistrationAssociations" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_registration_associations_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module PutKeyword = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_keyword_request) =
    let input = Json_serializers.put_keyword_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.PutKeyword" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_keyword_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_keyword_request) =
    let input = Json_serializers.put_keyword_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.PutKeyword"
      ~service ~context ~input ~output_deserializer:Json_deserializers.put_keyword_result_of_yojson
      ~error_deserializer
end

module PutMessageFeedback = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_message_feedback_request) =
    let input = Json_serializers.put_message_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.PutMessageFeedback" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_message_feedback_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_message_feedback_request) =
    let input = Json_serializers.put_message_feedback_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.PutMessageFeedback" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_message_feedback_result_of_yojson
      ~error_deserializer
end

module PutOptedOutNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_opted_out_number_request) =
    let input = Json_serializers.put_opted_out_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.PutOptedOutNumber" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_opted_out_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_opted_out_number_request) =
    let input = Json_serializers.put_opted_out_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.PutOptedOutNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_opted_out_number_result_of_yojson
      ~error_deserializer
end

module PutProtectConfigurationRuleSetNumberOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_protect_configuration_rule_set_number_override_request) =
    let input =
      Json_serializers.put_protect_configuration_rule_set_number_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.PutProtectConfigurationRuleSetNumberOverride" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.put_protect_configuration_rule_set_number_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : put_protect_configuration_rule_set_number_override_request) =
    let input =
      Json_serializers.put_protect_configuration_rule_set_number_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.PutProtectConfigurationRuleSetNumberOverride" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.put_protect_configuration_rule_set_number_override_result_of_yojson
      ~error_deserializer
end

module PutRegistrationFieldValue = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_registration_field_value_request) =
    let input = Json_serializers.put_registration_field_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.PutRegistrationFieldValue"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registration_field_value_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_registration_field_value_request) =
    let input = Json_serializers.put_registration_field_value_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.PutRegistrationFieldValue" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_registration_field_value_result_of_yojson
      ~error_deserializer
end

module PutResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.PutResourcePolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.put_resource_policy_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_resource_policy_request) =
    let input = Json_serializers.put_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.PutResourcePolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_resource_policy_result_of_yojson
      ~error_deserializer
end

module ReleasePhoneNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : release_phone_number_request) =
    let input = Json_serializers.release_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.ReleasePhoneNumber" ~service
      ~context ~input ~output_deserializer:Json_deserializers.release_phone_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : release_phone_number_request) =
    let input = Json_serializers.release_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ReleasePhoneNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.release_phone_number_result_of_yojson
      ~error_deserializer
end

module ReleaseSenderId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : release_sender_id_request) =
    let input = Json_serializers.release_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.ReleaseSenderId" ~service
      ~context ~input ~output_deserializer:Json_deserializers.release_sender_id_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : release_sender_id_request) =
    let input = Json_serializers.release_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.ReleaseSenderId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.release_sender_id_result_of_yojson ~error_deserializer
end

module RequestPhoneNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : request_phone_number_request) =
    let input = Json_serializers.request_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.RequestPhoneNumber" ~service
      ~context ~input ~output_deserializer:Json_deserializers.request_phone_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : request_phone_number_request) =
    let input = Json_serializers.request_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.RequestPhoneNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.request_phone_number_result_of_yojson
      ~error_deserializer
end

module RequestSenderId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : request_sender_id_request) =
    let input = Json_serializers.request_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.RequestSenderId" ~service
      ~context ~input ~output_deserializer:Json_deserializers.request_sender_id_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : request_sender_id_request) =
    let input = Json_serializers.request_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.RequestSenderId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.request_sender_id_result_of_yojson ~error_deserializer
end

module SendDestinationNumberVerificationCode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_destination_number_verification_code_request) =
    let input =
      Json_serializers.send_destination_number_verification_code_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SendDestinationNumberVerificationCode" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.send_destination_number_verification_code_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_destination_number_verification_code_request) =
    let input =
      Json_serializers.send_destination_number_verification_code_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendDestinationNumberVerificationCode" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.send_destination_number_verification_code_result_of_yojson
      ~error_deserializer
end

module SendMediaMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_media_message_request) =
    let input = Json_serializers.send_media_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendMediaMessage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_media_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_media_message_request) =
    let input = Json_serializers.send_media_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendMediaMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_media_message_result_of_yojson
      ~error_deserializer
end

module SendNotifyTextMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_notify_text_message_request) =
    let input = Json_serializers.send_notify_text_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendNotifyTextMessage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_notify_text_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_notify_text_message_request) =
    let input = Json_serializers.send_notify_text_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendNotifyTextMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_notify_text_message_result_of_yojson
      ~error_deserializer
end

module SendNotifyVoiceMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_notify_voice_message_request) =
    let input = Json_serializers.send_notify_voice_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendNotifyVoiceMessage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_notify_voice_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_notify_voice_message_request) =
    let input = Json_serializers.send_notify_voice_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendNotifyVoiceMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_notify_voice_message_result_of_yojson
      ~error_deserializer
end

module SendRcsMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_rcs_message_request) =
    let input = Json_serializers.send_rcs_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendRcsMessage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_rcs_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_rcs_message_request) =
    let input = Json_serializers.send_rcs_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendRcsMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_rcs_message_result_of_yojson ~error_deserializer
end

module SendTextMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_text_message_request) =
    let input = Json_serializers.send_text_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendTextMessage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_text_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_text_message_request) =
    let input = Json_serializers.send_text_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendTextMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_text_message_result_of_yojson ~error_deserializer
end

module SendVoiceMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : send_voice_message_request) =
    let input = Json_serializers.send_voice_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SendVoiceMessage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_voice_message_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_voice_message_request) =
    let input = Json_serializers.send_voice_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SendVoiceMessage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_voice_message_result_of_yojson
      ~error_deserializer
end

module SetAccountDefaultProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_account_default_protect_configuration_request) =
    let input =
      Json_serializers.set_account_default_protect_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetAccountDefaultProtectConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.set_account_default_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_account_default_protect_configuration_request) =
    let input =
      Json_serializers.set_account_default_protect_configuration_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetAccountDefaultProtectConfiguration" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.set_account_default_protect_configuration_result_of_yojson
      ~error_deserializer
end

module SetDefaultMessageFeedbackEnabled = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_default_message_feedback_enabled_request) =
    let input = Json_serializers.set_default_message_feedback_enabled_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetDefaultMessageFeedbackEnabled" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_default_message_feedback_enabled_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_default_message_feedback_enabled_request) =
    let input = Json_serializers.set_default_message_feedback_enabled_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetDefaultMessageFeedbackEnabled" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_default_message_feedback_enabled_result_of_yojson
      ~error_deserializer
end

module SetDefaultMessageType = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_default_message_type_request) =
    let input = Json_serializers.set_default_message_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SetDefaultMessageType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_default_message_type_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_default_message_type_request) =
    let input = Json_serializers.set_default_message_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetDefaultMessageType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_default_message_type_result_of_yojson
      ~error_deserializer
end

module SetDefaultSenderId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_default_sender_id_request) =
    let input = Json_serializers.set_default_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SetDefaultSenderId" ~service
      ~context ~input ~output_deserializer:Json_deserializers.set_default_sender_id_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_default_sender_id_request) =
    let input = Json_serializers.set_default_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetDefaultSenderId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_default_sender_id_result_of_yojson
      ~error_deserializer
end

module SetMediaMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_media_message_spend_limit_override_request) =
    let input = Json_serializers.set_media_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetMediaMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_media_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_media_message_spend_limit_override_request) =
    let input = Json_serializers.set_media_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetMediaMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_media_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module SetNotifyMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_notify_message_spend_limit_override_request) =
    let input =
      Json_serializers.set_notify_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetNotifyMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_notify_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_notify_message_spend_limit_override_request) =
    let input =
      Json_serializers.set_notify_message_spend_limit_override_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetNotifyMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_notify_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module SetRcsMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_rcs_message_spend_limit_override_request) =
    let input = Json_serializers.set_rcs_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetRcsMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_rcs_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_rcs_message_spend_limit_override_request) =
    let input = Json_serializers.set_rcs_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetRcsMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_rcs_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module SetTextMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_text_message_spend_limit_override_request) =
    let input = Json_serializers.set_text_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetTextMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_text_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_text_message_spend_limit_override_request) =
    let input = Json_serializers.set_text_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetTextMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.set_text_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module SetVoiceMessageSpendLimitOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : set_voice_message_spend_limit_override_request) =
    let input = Json_serializers.set_voice_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.SetVoiceMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_voice_message_spend_limit_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : set_voice_message_spend_limit_override_request) =
    let input = Json_serializers.set_voice_message_spend_limit_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SetVoiceMessageSpendLimitOverride" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.set_voice_message_spend_limit_override_result_of_yojson
      ~error_deserializer
end

module SubmitRegistrationVersion = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : submit_registration_version_request) =
    let input = Json_serializers.submit_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.SubmitRegistrationVersion"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.submit_registration_version_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : submit_registration_version_request) =
    let input = Json_serializers.submit_registration_version_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.SubmitRegistrationVersion" ~service ~context ~input
      ~output_deserializer:Json_deserializers.submit_registration_version_result_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.pinpointsmsvoicev2#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.TagResource"
      ~service ~context ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson ~error_deserializer
end

module UpdateEventDestination = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_event_destination_request) =
    let input = Json_serializers.update_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdateEventDestination"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_event_destination_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_event_destination_request) =
    let input = Json_serializers.update_event_destination_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateEventDestination" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_event_destination_result_of_yojson
      ~error_deserializer
end

module UpdateNotifyConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_notify_configuration_request) =
    let input = Json_serializers.update_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdateNotifyConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notify_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notify_configuration_request) =
    let input = Json_serializers.update_notify_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateNotifyConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notify_configuration_result_of_yojson
      ~error_deserializer
end

module UpdatePhoneNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_phone_number_request) =
    let input = Json_serializers.update_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdatePhoneNumber" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_phone_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_phone_number_request) =
    let input = Json_serializers.update_phone_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdatePhoneNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_phone_number_result_of_yojson
      ~error_deserializer
end

module UpdatePool = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_pool_request) =
    let input = Json_serializers.update_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdatePool" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_pool_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_pool_request) =
    let input = Json_serializers.update_pool_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"PinpointSMSVoiceV2.UpdatePool"
      ~service ~context ~input ~output_deserializer:Json_deserializers.update_pool_result_of_yojson
      ~error_deserializer
end

module UpdateProtectConfiguration = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_protect_configuration_request) =
    let input = Json_serializers.update_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdateProtectConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_protect_configuration_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_protect_configuration_request) =
    let input = Json_serializers.update_protect_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateProtectConfiguration" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_protect_configuration_result_of_yojson
      ~error_deserializer
end

module UpdateProtectConfigurationCountryRuleSet = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_protect_configuration_country_rule_set_request) =
    let input =
      Json_serializers.update_protect_configuration_country_rule_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"PinpointSMSVoiceV2.UpdateProtectConfigurationCountryRuleSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_protect_configuration_country_rule_set_result_of_yojson
      ~error_deserializer

  let request_with_metadata context
      (request : update_protect_configuration_country_rule_set_request) =
    let input =
      Json_serializers.update_protect_configuration_country_rule_set_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateProtectConfigurationCountryRuleSet" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_protect_configuration_country_rule_set_result_of_yojson
      ~error_deserializer
end

module UpdateRcsAgent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_rcs_agent_request) =
    let input = Json_serializers.update_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdateRcsAgent" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_rcs_agent_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rcs_agent_request) =
    let input = Json_serializers.update_rcs_agent_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateRcsAgent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rcs_agent_result_of_yojson ~error_deserializer
end

module UpdateSenderId = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : update_sender_id_request) =
    let input = Json_serializers.update_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.UpdateSenderId" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_sender_id_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_sender_id_request) =
    let input = Json_serializers.update_sender_id_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.UpdateSenderId" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_sender_id_result_of_yojson ~error_deserializer
end

module VerifyDestinationNumber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pinpointsmsvoicev2#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.pinpointsmsvoicev2#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.pinpointsmsvoicev2#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pinpointsmsvoicev2#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pinpointsmsvoicev2#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.pinpointsmsvoicev2#ValidationException"
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

  let request context (request : verify_destination_number_request) =
    let input = Json_serializers.verify_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"PinpointSMSVoiceV2.VerifyDestinationNumber"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_destination_number_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : verify_destination_number_request) =
    let input = Json_serializers.verify_destination_number_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"PinpointSMSVoiceV2.VerifyDestinationNumber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.verify_destination_number_result_of_yojson
      ~error_deserializer
end
