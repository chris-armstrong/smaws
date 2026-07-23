open Types
open Service_metadata

module SendActivationCode = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : send_activation_code_request) =
    let input = Json_serializers.send_activation_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.SendActivationCode" ~service
      ~context ~input ~output_deserializer:Json_deserializers.send_activation_code_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_activation_code_request) =
    let input = Json_serializers.send_activation_code_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.SendActivationCode"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_activation_code_result_of_yojson
      ~error_deserializer
end

module StartEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : start_engagement_request) =
    let input = Json_serializers.start_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.StartEngagement" ~service ~context
      ~input ~output_deserializer:Json_deserializers.start_engagement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_engagement_request) =
    let input = Json_serializers.start_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.StartEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_engagement_result_of_yojson ~error_deserializer
end

module StopEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : stop_engagement_request) =
    let input = Json_serializers.stop_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.StopEngagement" ~service ~context
      ~input ~output_deserializer:Json_deserializers.stop_engagement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_engagement_request) =
    let input = Json_serializers.stop_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.StopEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_engagement_result_of_yojson ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_result_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_result_of_yojson ~error_deserializer
end

module UpdateContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : update_contact_request) =
    let input = Json_serializers.update_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.UpdateContact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_contact_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_contact_request) =
    let input = Json_serializers.update_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.UpdateContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_contact_result_of_yojson ~error_deserializer
end

module UpdateContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : update_contact_channel_request) =
    let input = Json_serializers.update_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.UpdateContactChannel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_contact_channel_request) =
    let input = Json_serializers.update_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.UpdateContactChannel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_contact_channel_result_of_yojson
      ~error_deserializer
end

module UpdateRotation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : update_rotation_request) =
    let input = Json_serializers.update_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.UpdateRotation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_rotation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rotation_request) =
    let input = Json_serializers.update_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.UpdateRotation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rotation_result_of_yojson ~error_deserializer
end

module PutContactPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : put_contact_policy_request) =
    let input = Json_serializers.put_contact_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.PutContactPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.put_contact_policy_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_contact_policy_request) =
    let input = Json_serializers.put_contact_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.PutContactPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_contact_policy_result_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_result_of_yojson
      ~error_deserializer
end

module ListRotations = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_rotations_request) =
    let input = Json_serializers.list_rotations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListRotations" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_rotations_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rotations_request) =
    let input = Json_serializers.list_rotations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListRotations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rotations_result_of_yojson ~error_deserializer
end

module ListRotationShifts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_rotation_shifts_request) =
    let input = Json_serializers.list_rotation_shifts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListRotationShifts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_rotation_shifts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rotation_shifts_request) =
    let input = Json_serializers.list_rotation_shifts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListRotationShifts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rotation_shifts_result_of_yojson
      ~error_deserializer
end

module ListRotationOverrides = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_rotation_overrides_request) =
    let input = Json_serializers.list_rotation_overrides_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListRotationOverrides" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_rotation_overrides_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rotation_overrides_request) =
    let input = Json_serializers.list_rotation_overrides_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.ListRotationOverrides" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rotation_overrides_result_of_yojson
      ~error_deserializer
end

module ListPreviewRotationShifts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_preview_rotation_shifts_request) =
    let input = Json_serializers.list_preview_rotation_shifts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListPreviewRotationShifts" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_preview_rotation_shifts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_preview_rotation_shifts_request) =
    let input = Json_serializers.list_preview_rotation_shifts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.ListPreviewRotationShifts" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_preview_rotation_shifts_result_of_yojson
      ~error_deserializer
end

module ListPagesByEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_pages_by_engagement_request) =
    let input = Json_serializers.list_pages_by_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListPagesByEngagement" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_pages_by_engagement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pages_by_engagement_request) =
    let input = Json_serializers.list_pages_by_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.ListPagesByEngagement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pages_by_engagement_result_of_yojson
      ~error_deserializer
end

module ListPagesByContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_pages_by_contact_request) =
    let input = Json_serializers.list_pages_by_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListPagesByContact" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_pages_by_contact_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_pages_by_contact_request) =
    let input = Json_serializers.list_pages_by_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListPagesByContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_pages_by_contact_result_of_yojson
      ~error_deserializer
end

module ListPageResolutions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_page_resolutions_request) =
    let input = Json_serializers.list_page_resolutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListPageResolutions" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_page_resolutions_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_page_resolutions_request) =
    let input = Json_serializers.list_page_resolutions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListPageResolutions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_page_resolutions_result_of_yojson
      ~error_deserializer
end

module ListPageReceipts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_page_receipts_request) =
    let input = Json_serializers.list_page_receipts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListPageReceipts" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_page_receipts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_page_receipts_request) =
    let input = Json_serializers.list_page_receipts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListPageReceipts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_page_receipts_result_of_yojson
      ~error_deserializer
end

module ListEngagements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_engagements_request) =
    let input = Json_serializers.list_engagements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListEngagements" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_engagements_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_engagements_request) =
    let input = Json_serializers.list_engagements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListEngagements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_engagements_result_of_yojson ~error_deserializer
end

module ListContacts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : list_contacts_request) =
    let input = Json_serializers.list_contacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListContacts" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_contacts_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_contacts_request) =
    let input = Json_serializers.list_contacts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListContacts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_contacts_result_of_yojson ~error_deserializer
end

module ListContactChannels = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : list_contact_channels_request) =
    let input = Json_serializers.list_contact_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ListContactChannels" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_contact_channels_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_contact_channels_request) =
    let input = Json_serializers.list_contact_channels_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.ListContactChannels"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_contact_channels_result_of_yojson
      ~error_deserializer
end

module GetRotationOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : get_rotation_override_request) =
    let input = Json_serializers.get_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.GetRotationOverride" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_rotation_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rotation_override_request) =
    let input = Json_serializers.get_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.GetRotationOverride"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rotation_override_result_of_yojson
      ~error_deserializer
end

module GetRotation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : get_rotation_request) =
    let input = Json_serializers.get_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.GetRotation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_rotation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rotation_request) =
    let input = Json_serializers.get_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.GetRotation" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_rotation_result_of_yojson
      ~error_deserializer
end

module GetContactPolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : get_contact_policy_request) =
    let input = Json_serializers.get_contact_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.GetContactPolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_contact_policy_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_contact_policy_request) =
    let input = Json_serializers.get_contact_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.GetContactPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_contact_policy_result_of_yojson
      ~error_deserializer
end

module GetContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : get_contact_channel_request) =
    let input = Json_serializers.get_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.GetContactChannel" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_contact_channel_request) =
    let input = Json_serializers.get_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.GetContactChannel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_contact_channel_result_of_yojson
      ~error_deserializer
end

module GetContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : get_contact_request) =
    let input = Json_serializers.get_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.GetContact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_contact_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_contact_request) =
    let input = Json_serializers.get_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.GetContact" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_contact_result_of_yojson
      ~error_deserializer
end

module DescribePage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : describe_page_request) =
    let input = Json_serializers.describe_page_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DescribePage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.describe_page_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_page_request) =
    let input = Json_serializers.describe_page_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.DescribePage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_page_result_of_yojson ~error_deserializer
end

module DescribeEngagement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : describe_engagement_request) =
    let input = Json_serializers.describe_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DescribeEngagement" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_engagement_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_engagement_request) =
    let input = Json_serializers.describe_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.DescribeEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_engagement_result_of_yojson
      ~error_deserializer
end

module DeleteRotationOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : delete_rotation_override_request) =
    let input = Json_serializers.delete_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DeleteRotationOverride" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_rotation_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rotation_override_request) =
    let input = Json_serializers.delete_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.DeleteRotationOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rotation_override_result_of_yojson
      ~error_deserializer
end

module DeleteRotation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : delete_rotation_request) =
    let input = Json_serializers.delete_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DeleteRotation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_rotation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rotation_request) =
    let input = Json_serializers.delete_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.DeleteRotation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rotation_result_of_yojson ~error_deserializer
end

module DeleteContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : delete_contact_channel_request) =
    let input = Json_serializers.delete_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DeleteContactChannel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_contact_channel_request) =
    let input = Json_serializers.delete_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.DeleteContactChannel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_contact_channel_result_of_yojson
      ~error_deserializer
end

module DeleteContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : delete_contact_request) =
    let input = Json_serializers.delete_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DeleteContact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_contact_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_contact_request) =
    let input = Json_serializers.delete_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.DeleteContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_contact_result_of_yojson ~error_deserializer
end

module DeactivateContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : deactivate_contact_channel_request) =
    let input = Json_serializers.deactivate_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.DeactivateContactChannel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.deactivate_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deactivate_contact_channel_request) =
    let input = Json_serializers.deactivate_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.DeactivateContactChannel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deactivate_contact_channel_result_of_yojson
      ~error_deserializer
end

module CreateRotationOverride = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : create_rotation_override_request) =
    let input = Json_serializers.create_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.CreateRotationOverride" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_rotation_override_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rotation_override_request) =
    let input = Json_serializers.create_rotation_override_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.CreateRotationOverride" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rotation_override_result_of_yojson
      ~error_deserializer
end

module CreateRotation = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : create_rotation_request) =
    let input = Json_serializers.create_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.CreateRotation" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_rotation_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rotation_request) =
    let input = Json_serializers.create_rotation_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.CreateRotation"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rotation_result_of_yojson ~error_deserializer
end

module CreateContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : create_contact_channel_request) =
    let input = Json_serializers.create_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.CreateContactChannel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_contact_channel_request) =
    let input = Json_serializers.create_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.CreateContactChannel"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_contact_channel_result_of_yojson
      ~error_deserializer
end

module CreateContact = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.ssmcontacts#ConflictException"
    | `DataEncryptionException _ -> "com.amazonaws.ssmcontacts#DataEncryptionException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.ssmcontacts#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "DataEncryptionException" ->
          `DataEncryptionException
            (Json_deserializers.data_encryption_exception_of_yojson tree path)
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

  let request context (request : create_contact_request) =
    let input = Json_serializers.create_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.CreateContact" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_contact_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_contact_request) =
    let input = Json_serializers.create_contact_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.CreateContact"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_contact_result_of_yojson ~error_deserializer
end

module ActivateContactChannel = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : activate_contact_channel_request) =
    let input = Json_serializers.activate_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.ActivateContactChannel" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.activate_contact_channel_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : activate_contact_channel_request) =
    let input = Json_serializers.activate_contact_channel_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"SSMContacts.ActivateContactChannel" ~service ~context ~input
      ~output_deserializer:Json_deserializers.activate_contact_channel_result_of_yojson
      ~error_deserializer
end

module AcceptPage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.ssmcontacts#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.ssmcontacts#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.ssmcontacts#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.ssmcontacts#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.ssmcontacts#ValidationException"
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

  let request context (request : accept_page_request) =
    let input = Json_serializers.accept_page_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"SSMContacts.AcceptPage" ~service ~context
      ~input ~output_deserializer:Json_deserializers.accept_page_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_page_request) =
    let input = Json_serializers.accept_page_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"SSMContacts.AcceptPage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.accept_page_result_of_yojson
      ~error_deserializer
end
