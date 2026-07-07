open Types
open Service_metadata

module CreateAddonInstance = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_addon_instance_request) =
    let input = Json_serializers.create_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateAddonInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_addon_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_addon_instance_request) =
    let input = Json_serializers.create_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.CreateAddonInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_addon_instance_response_of_yojson
      ~error_deserializer
end

module CreateAddonSubscription = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_addon_subscription_request) =
    let input = Json_serializers.create_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateAddonSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_addon_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_addon_subscription_request) =
    let input = Json_serializers.create_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.CreateAddonSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_addon_subscription_response_of_yojson
      ~error_deserializer
end

module CreateAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_address_list_request) =
    let input = Json_serializers.create_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateAddressList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_address_list_request) =
    let input = Json_serializers.create_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.CreateAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_address_list_response_of_yojson
      ~error_deserializer
end

module CreateArchive = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : create_archive_request) =
    let input = Json_serializers.create_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_archive_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_archive_request) =
    let input = Json_serializers.create_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.CreateArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_archive_response_of_yojson ~error_deserializer
end

module CreateIngressPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ingress_point_request) =
    let input = Json_serializers.create_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateIngressPoint" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_ingress_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_ingress_point_request) =
    let input = Json_serializers.create_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.CreateIngressPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_ingress_point_response_of_yojson
      ~error_deserializer
end

module CreateRelay = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_relay_request) =
    let input = Json_serializers.create_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateRelay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_relay_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_relay_request) =
    let input = Json_serializers.create_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.CreateRelay"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_relay_response_of_yojson ~error_deserializer
end

module CreateRuleSet = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rule_set_request) =
    let input = Json_serializers.create_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateRuleSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_rule_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_rule_set_request) =
    let input = Json_serializers.create_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.CreateRuleSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_rule_set_response_of_yojson ~error_deserializer
end

module CreateTrafficPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_traffic_policy_request) =
    let input = Json_serializers.create_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateTrafficPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_traffic_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_traffic_policy_request) =
    let input = Json_serializers.create_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.CreateTrafficPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_traffic_policy_response_of_yojson
      ~error_deserializer
end

module DeleteAddonInstance = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_addon_instance_request) =
    let input = Json_serializers.delete_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteAddonInstance" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_addon_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_addon_instance_request) =
    let input = Json_serializers.delete_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.DeleteAddonInstance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_addon_instance_response_of_yojson
      ~error_deserializer
end

module DeleteAddonSubscription = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_addon_subscription_request) =
    let input = Json_serializers.delete_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteAddonSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_addon_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_addon_subscription_request) =
    let input = Json_serializers.delete_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.DeleteAddonSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_addon_subscription_response_of_yojson
      ~error_deserializer
end

module DeleteAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_address_list_request) =
    let input = Json_serializers.delete_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteAddressList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_address_list_request) =
    let input = Json_serializers.delete_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.DeleteAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_address_list_response_of_yojson
      ~error_deserializer
end

module DeleteArchive = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_archive_request) =
    let input = Json_serializers.delete_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_archive_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_archive_request) =
    let input = Json_serializers.delete_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.DeleteArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_archive_response_of_yojson ~error_deserializer
end

module DeleteIngressPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ingress_point_request) =
    let input = Json_serializers.delete_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteIngressPoint" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_ingress_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_ingress_point_request) =
    let input = Json_serializers.delete_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.DeleteIngressPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_ingress_point_response_of_yojson
      ~error_deserializer
end

module DeleteRelay = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_relay_request) =
    let input = Json_serializers.delete_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteRelay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_relay_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_relay_request) =
    let input = Json_serializers.delete_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.DeleteRelay"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_relay_response_of_yojson ~error_deserializer
end

module DeleteRuleSet = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_set_request) =
    let input = Json_serializers.delete_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteRuleSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_rule_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_rule_set_request) =
    let input = Json_serializers.delete_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.DeleteRuleSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_rule_set_response_of_yojson ~error_deserializer
end

module DeleteTrafficPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_traffic_policy_request) =
    let input = Json_serializers.delete_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeleteTrafficPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_traffic_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_traffic_policy_request) =
    let input = Json_serializers.delete_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.DeleteTrafficPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_traffic_policy_response_of_yojson
      ~error_deserializer
end

module GetAddonInstance = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_addon_instance_request) =
    let input = Json_serializers.get_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetAddonInstance" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_addon_instance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_addon_instance_request) =
    let input = Json_serializers.get_addon_instance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetAddonInstance"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_addon_instance_response_of_yojson
      ~error_deserializer
end

module GetAddonSubscription = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_addon_subscription_request) =
    let input = Json_serializers.get_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetAddonSubscription" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_addon_subscription_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_addon_subscription_request) =
    let input = Json_serializers.get_addon_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.GetAddonSubscription" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_addon_subscription_response_of_yojson
      ~error_deserializer
end

module GetAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_address_list_request) =
    let input = Json_serializers.get_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetAddressList" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_address_list_request) =
    let input = Json_serializers.get_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_address_list_response_of_yojson
      ~error_deserializer
end

module GetArchive = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_archive_request) =
    let input = Json_serializers.get_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_archive_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_request) =
    let input = Json_serializers.get_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_response_of_yojson ~error_deserializer
end

module GetIngressPoint = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ingress_point_request) =
    let input = Json_serializers.get_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetIngressPoint" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_ingress_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_ingress_point_request) =
    let input = Json_serializers.get_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetIngressPoint"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_ingress_point_response_of_yojson
      ~error_deserializer
end

module GetRelay = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_relay_request) =
    let input = Json_serializers.get_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetRelay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_relay_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_relay_request) =
    let input = Json_serializers.get_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetRelay" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_relay_response_of_yojson
      ~error_deserializer
end

module GetRuleSet = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rule_set_request) =
    let input = Json_serializers.get_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetRuleSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_rule_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_rule_set_request) =
    let input = Json_serializers.get_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetRuleSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_rule_set_response_of_yojson ~error_deserializer
end

module GetTrafficPolicy = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_traffic_policy_request) =
    let input = Json_serializers.get_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetTrafficPolicy" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_traffic_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_traffic_policy_request) =
    let input = Json_serializers.get_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetTrafficPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_traffic_policy_response_of_yojson
      ~error_deserializer
end

module ListAddonInstances = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_addon_instances_request) =
    let input = Json_serializers.list_addon_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListAddonInstances" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_addon_instances_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_addon_instances_request) =
    let input = Json_serializers.list_addon_instances_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListAddonInstances" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_addon_instances_response_of_yojson
      ~error_deserializer
end

module ListAddonSubscriptions = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_addon_subscriptions_request) =
    let input = Json_serializers.list_addon_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListAddonSubscriptions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_addon_subscriptions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_addon_subscriptions_request) =
    let input = Json_serializers.list_addon_subscriptions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListAddonSubscriptions" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_addon_subscriptions_response_of_yojson
      ~error_deserializer
end

module ListAddressLists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_address_lists_request) =
    let input = Json_serializers.list_address_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListAddressLists" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_address_lists_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_address_lists_request) =
    let input = Json_serializers.list_address_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.ListAddressLists"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_address_lists_response_of_yojson
      ~error_deserializer
end

module ListArchives = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_archives_request) =
    let input = Json_serializers.list_archives_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListArchives" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_archives_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_archives_request) =
    let input = Json_serializers.list_archives_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.ListArchives"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_archives_response_of_yojson ~error_deserializer
end

module ListIngressPoints = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ingress_points_request) =
    let input = Json_serializers.list_ingress_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListIngressPoints" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_ingress_points_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_ingress_points_request) =
    let input = Json_serializers.list_ingress_points_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.ListIngressPoints"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_ingress_points_response_of_yojson
      ~error_deserializer
end

module ListRelays = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_relays_request) =
    let input = Json_serializers.list_relays_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListRelays" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_relays_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_relays_request) =
    let input = Json_serializers.list_relays_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.ListRelays"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_relays_response_of_yojson ~error_deserializer
end

module ListRuleSets = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_sets_request) =
    let input = Json_serializers.list_rule_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListRuleSets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_rule_sets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_rule_sets_request) =
    let input = Json_serializers.list_rule_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.ListRuleSets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_rule_sets_response_of_yojson ~error_deserializer
end

module ListTrafficPolicies = struct
  let error_to_string = function
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_traffic_policies_request) =
    let input = Json_serializers.list_traffic_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListTrafficPolicies" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_traffic_policies_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_traffic_policies_request) =
    let input = Json_serializers.list_traffic_policies_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListTrafficPolicies" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_traffic_policies_response_of_yojson
      ~error_deserializer
end

module CreateAddressListImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : create_address_list_import_job_request) =
    let input = Json_serializers.create_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.CreateAddressListImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_address_list_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_address_list_import_job_request) =
    let input = Json_serializers.create_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.CreateAddressListImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_address_list_import_job_response_of_yojson
      ~error_deserializer
end

module DeregisterMemberFromAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : deregister_member_from_address_list_request) =
    let input = Json_serializers.deregister_member_from_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.DeregisterMemberFromAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_member_from_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : deregister_member_from_address_list_request) =
    let input = Json_serializers.deregister_member_from_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.DeregisterMemberFromAddressList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.deregister_member_from_address_list_response_of_yojson
      ~error_deserializer
end

module GetAddressListImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_address_list_import_job_request) =
    let input = Json_serializers.get_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetAddressListImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_address_list_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_address_list_import_job_request) =
    let input = Json_serializers.get_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.GetAddressListImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_address_list_import_job_response_of_yojson
      ~error_deserializer
end

module GetArchiveExport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_archive_export_request) =
    let input = Json_serializers.get_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchiveExport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_archive_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_export_request) =
    let input = Json_serializers.get_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetArchiveExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_export_response_of_yojson
      ~error_deserializer
end

module GetArchiveMessage = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_archive_message_request) =
    let input = Json_serializers.get_archive_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchiveMessage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_archive_message_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_message_request) =
    let input = Json_serializers.get_archive_message_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetArchiveMessage"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_message_response_of_yojson
      ~error_deserializer
end

module GetArchiveMessageContent = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_archive_message_content_request) =
    let input = Json_serializers.get_archive_message_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchiveMessageContent"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_message_content_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_message_content_request) =
    let input = Json_serializers.get_archive_message_content_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.GetArchiveMessageContent" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_message_content_response_of_yojson
      ~error_deserializer
end

module GetArchiveSearch = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_archive_search_request) =
    let input = Json_serializers.get_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchiveSearch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_archive_search_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_search_request) =
    let input = Json_serializers.get_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.GetArchiveSearch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_search_response_of_yojson
      ~error_deserializer
end

module GetArchiveSearchResults = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_archive_search_results_request) =
    let input = Json_serializers.get_archive_search_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetArchiveSearchResults"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_search_results_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_archive_search_results_request) =
    let input = Json_serializers.get_archive_search_results_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.GetArchiveSearchResults" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_archive_search_results_response_of_yojson
      ~error_deserializer
end

module GetMemberOfAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : get_member_of_address_list_request) =
    let input = Json_serializers.get_member_of_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.GetMemberOfAddressList" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_member_of_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_member_of_address_list_request) =
    let input = Json_serializers.get_member_of_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.GetMemberOfAddressList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_member_of_address_list_response_of_yojson
      ~error_deserializer
end

module ListAddressListImportJobs = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_address_list_import_jobs_request) =
    let input = Json_serializers.list_address_list_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListAddressListImportJobs"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_address_list_import_jobs_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_address_list_import_jobs_request) =
    let input = Json_serializers.list_address_list_import_jobs_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListAddressListImportJobs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_address_list_import_jobs_response_of_yojson
      ~error_deserializer
end

module ListArchiveExports = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_archive_exports_request) =
    let input = Json_serializers.list_archive_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListArchiveExports" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_archive_exports_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_archive_exports_request) =
    let input = Json_serializers.list_archive_exports_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListArchiveExports" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_archive_exports_response_of_yojson
      ~error_deserializer
end

module ListArchiveSearches = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_archive_searches_request) =
    let input = Json_serializers.list_archive_searches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListArchiveSearches" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_archive_searches_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_archive_searches_request) =
    let input = Json_serializers.list_archive_searches_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListArchiveSearches" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_archive_searches_response_of_yojson
      ~error_deserializer
end

module ListMembersOfAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : list_members_of_address_list_request) =
    let input = Json_serializers.list_members_of_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListMembersOfAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_members_of_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_members_of_address_list_request) =
    let input = Json_serializers.list_members_of_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListMembersOfAddressList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_members_of_address_list_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module RegisterMemberToAddressList = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : register_member_to_address_list_request) =
    let input = Json_serializers.register_member_to_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.RegisterMemberToAddressList"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_member_to_address_list_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_member_to_address_list_request) =
    let input = Json_serializers.register_member_to_address_list_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.RegisterMemberToAddressList" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_member_to_address_list_response_of_yojson
      ~error_deserializer
end

module StartAddressListImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : start_address_list_import_job_request) =
    let input = Json_serializers.start_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StartAddressListImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_address_list_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_address_list_import_job_request) =
    let input = Json_serializers.start_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.StartAddressListImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_address_list_import_job_response_of_yojson
      ~error_deserializer
end

module StartArchiveExport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : start_archive_export_request) =
    let input = Json_serializers.start_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StartArchiveExport" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_archive_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_archive_export_request) =
    let input = Json_serializers.start_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.StartArchiveExport" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_archive_export_response_of_yojson
      ~error_deserializer
end

module StartArchiveSearch = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : start_archive_search_request) =
    let input = Json_serializers.start_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StartArchiveSearch" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.start_archive_search_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : start_archive_search_request) =
    let input = Json_serializers.start_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.StartArchiveSearch" ~service ~context ~input
      ~output_deserializer:Json_deserializers.start_archive_search_response_of_yojson
      ~error_deserializer
end

module StopAddressListImportJob = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : stop_address_list_import_job_request) =
    let input = Json_serializers.stop_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StopAddressListImportJob"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_address_list_import_job_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_address_list_import_job_request) =
    let input = Json_serializers.stop_address_list_import_job_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.StopAddressListImportJob" ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_address_list_import_job_response_of_yojson
      ~error_deserializer
end

module StopArchiveExport = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_archive_export_request) =
    let input = Json_serializers.stop_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StopArchiveExport" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_archive_export_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_archive_export_request) =
    let input = Json_serializers.stop_archive_export_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.StopArchiveExport"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_archive_export_response_of_yojson
      ~error_deserializer
end

module StopArchiveSearch = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : stop_archive_search_request) =
    let input = Json_serializers.stop_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.StopArchiveSearch" ~service
      ~context ~input ~output_deserializer:Json_deserializers.stop_archive_search_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : stop_archive_search_request) =
    let input = Json_serializers.stop_archive_search_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.StopArchiveSearch"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.stop_archive_search_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.TagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateArchive = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.mailmanager#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.mailmanager#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.mailmanager#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
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

  let request context (request : update_archive_request) =
    let input = Json_serializers.update_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UpdateArchive" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_archive_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_archive_request) =
    let input = Json_serializers.update_archive_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.UpdateArchive"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_archive_response_of_yojson ~error_deserializer
end

module UpdateIngressPoint = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ingress_point_request) =
    let input = Json_serializers.update_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UpdateIngressPoint" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_ingress_point_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_ingress_point_request) =
    let input = Json_serializers.update_ingress_point_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.UpdateIngressPoint" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_ingress_point_response_of_yojson
      ~error_deserializer
end

module UpdateRelay = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_relay_request) =
    let input = Json_serializers.update_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UpdateRelay" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_relay_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_relay_request) =
    let input = Json_serializers.update_relay_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.UpdateRelay"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_relay_response_of_yojson ~error_deserializer
end

module UpdateRuleSet = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rule_set_request) =
    let input = Json_serializers.update_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UpdateRuleSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_rule_set_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_rule_set_request) =
    let input = Json_serializers.update_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"MailManagerSvc.UpdateRuleSet"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_rule_set_response_of_yojson ~error_deserializer
end

module UpdateTrafficPolicy = struct
  let error_to_string = function
    | `ConflictException _ -> "com.amazonaws.mailmanager#ConflictException"
    | `ResourceNotFoundException _ -> "com.amazonaws.mailmanager#ResourceNotFoundException"
    | `ValidationException _ -> "com.amazonaws.mailmanager#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "ConflictException" ->
          `ConflictException (Json_deserializers.conflict_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ValidationException" ->
          `ValidationException (Json_deserializers.validation_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_traffic_policy_request) =
    let input = Json_serializers.update_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MailManagerSvc.UpdateTrafficPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_traffic_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_traffic_policy_request) =
    let input = Json_serializers.update_traffic_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MailManagerSvc.UpdateTrafficPolicy" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_traffic_policy_response_of_yojson
      ~error_deserializer
end
