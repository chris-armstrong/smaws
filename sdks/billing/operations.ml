open Types
open Service_metadata

module AssociateSourceViews = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.billing#BillingViewHealthStatusException"
    | `ConflictException _ -> "com.amazonaws.billing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.billing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
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

  let request context (request : associate_source_views_request) =
    let input = Json_serializers.associate_source_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.AssociateSourceViews" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_source_views_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_source_views_request) =
    let input = Json_serializers.associate_source_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.AssociateSourceViews"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_source_views_response_of_yojson
      ~error_deserializer
end

module CreateBillingView = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.billing#BillingViewHealthStatusException"
    | `ConflictException _ -> "com.amazonaws.billing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.billing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
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

  let request context (request : create_billing_view_request) =
    let input = Json_serializers.create_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.CreateBillingView" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_billing_view_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_billing_view_request) =
    let input = Json_serializers.create_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.CreateBillingView"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_billing_view_response_of_yojson
      ~error_deserializer
end

module DeleteBillingView = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.billing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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

  let request context (request : delete_billing_view_request) =
    let input = Json_serializers.delete_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.DeleteBillingView" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_billing_view_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_billing_view_request) =
    let input = Json_serializers.delete_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.DeleteBillingView"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_billing_view_response_of_yojson
      ~error_deserializer
end

module DisassociateSourceViews = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.billing#BillingViewHealthStatusException"
    | `ConflictException _ -> "com.amazonaws.billing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
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

  let request context (request : disassociate_source_views_request) =
    let input = Json_serializers.disassociate_source_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.DisassociateSourceViews" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_source_views_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_source_views_request) =
    let input = Json_serializers.disassociate_source_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBilling.DisassociateSourceViews" ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_source_views_response_of_yojson
      ~error_deserializer
end

module GetBillingView = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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

  let request context (request : get_billing_view_request) =
    let input = Json_serializers.get_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.GetBillingView" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_billing_view_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_billing_view_request) =
    let input = Json_serializers.get_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.GetBillingView"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_billing_view_response_of_yojson
      ~error_deserializer
end

module GetResourcePolicy = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.GetResourcePolicy" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_resource_policy_request) =
    let input = Json_serializers.get_resource_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.GetResourcePolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_resource_policy_response_of_yojson
      ~error_deserializer
end

module ListBillingViews = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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

  let request context (request : list_billing_views_request) =
    let input = Json_serializers.list_billing_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.ListBillingViews" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_billing_views_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_billing_views_request) =
    let input = Json_serializers.list_billing_views_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.ListBillingViews"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_billing_views_response_of_yojson
      ~error_deserializer
end

module ListSourceViewsForBillingView = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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

  let request context (request : list_source_views_for_billing_view_request) =
    let input = Json_serializers.list_source_views_for_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.ListSourceViewsForBillingView"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_source_views_for_billing_view_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_source_views_for_billing_view_request) =
    let input = Json_serializers.list_source_views_for_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBilling.ListSourceViewsForBillingView" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_source_views_for_billing_view_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.UntagResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateBillingView = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.billing#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.billing#BillingViewHealthStatusException"
    | `ConflictException _ -> "com.amazonaws.billing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.billing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.billing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.billing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.billing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.billing#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
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

  let request context (request : update_billing_view_request) =
    let input = Json_serializers.update_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBilling.UpdateBillingView" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_billing_view_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_billing_view_request) =
    let input = Json_serializers.update_billing_view_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSBilling.UpdateBillingView"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_billing_view_response_of_yojson
      ~error_deserializer
end
