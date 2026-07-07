open Types
open Service_metadata

module BatchGetInvoiceProfile = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : batch_get_invoice_profile_request) =
    let input = Json_serializers.batch_get_invoice_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.BatchGetInvoiceProfile" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_invoice_profile_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_get_invoice_profile_request) =
    let input = Json_serializers.batch_get_invoice_profile_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.BatchGetInvoiceProfile"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_get_invoice_profile_response_of_yojson
      ~error_deserializer
end

module CreateInvoiceUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : create_invoice_unit_request) =
    let input = Json_serializers.create_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.CreateInvoiceUnit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_invoice_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_invoice_unit_request) =
    let input = Json_serializers.create_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.CreateInvoiceUnit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_invoice_unit_response_of_yojson
      ~error_deserializer
end

module CreateProcurementPortalPreference = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.invoicing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : create_procurement_portal_preference_request) =
    let input = Json_serializers.create_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.CreateProcurementPortalPreference"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_procurement_portal_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_procurement_portal_preference_request) =
    let input = Json_serializers.create_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.CreateProcurementPortalPreference" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.create_procurement_portal_preference_response_of_yojson
      ~error_deserializer
end

module DeleteInvoiceUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : delete_invoice_unit_request) =
    let input = Json_serializers.delete_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.DeleteInvoiceUnit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_invoice_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_invoice_unit_request) =
    let input = Json_serializers.delete_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.DeleteInvoiceUnit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_invoice_unit_response_of_yojson
      ~error_deserializer
end

module DeleteProcurementPortalPreference = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : delete_procurement_portal_preference_request) =
    let input = Json_serializers.delete_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.DeleteProcurementPortalPreference"
      ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_procurement_portal_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_procurement_portal_preference_request) =
    let input = Json_serializers.delete_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.DeleteProcurementPortalPreference" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.delete_procurement_portal_preference_response_of_yojson
      ~error_deserializer
end

module GetInvoicePDF = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : get_invoice_pdf_request) =
    let input = Json_serializers.get_invoice_pdf_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.GetInvoicePDF" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_invoice_pdf_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_invoice_pdf_request) =
    let input = Json_serializers.get_invoice_pdf_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.GetInvoicePDF" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_invoice_pdf_response_of_yojson
      ~error_deserializer
end

module GetInvoiceUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : get_invoice_unit_request) =
    let input = Json_serializers.get_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.GetInvoiceUnit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_invoice_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_invoice_unit_request) =
    let input = Json_serializers.get_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.GetInvoiceUnit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_invoice_unit_response_of_yojson
      ~error_deserializer
end

module GetProcurementPortalPreference = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.invoicing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : get_procurement_portal_preference_request) =
    let input = Json_serializers.get_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.GetProcurementPortalPreference"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_procurement_portal_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_procurement_portal_preference_request) =
    let input = Json_serializers.get_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.GetProcurementPortalPreference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_procurement_portal_preference_response_of_yojson
      ~error_deserializer
end

module ListInvoiceSummaries = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : list_invoice_summaries_request) =
    let input = Json_serializers.list_invoice_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.ListInvoiceSummaries" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_invoice_summaries_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_invoice_summaries_request) =
    let input = Json_serializers.list_invoice_summaries_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.ListInvoiceSummaries"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_invoice_summaries_response_of_yojson
      ~error_deserializer
end

module ListInvoiceUnits = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : list_invoice_units_request) =
    let input = Json_serializers.list_invoice_units_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.ListInvoiceUnits" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_invoice_units_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_invoice_units_request) =
    let input = Json_serializers.list_invoice_units_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.ListInvoiceUnits"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_invoice_units_response_of_yojson
      ~error_deserializer
end

module ListProcurementPortalPreferences = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.invoicing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : list_procurement_portal_preferences_request) =
    let input = Json_serializers.list_procurement_portal_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.ListProcurementPortalPreferences"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_procurement_portal_preferences_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_procurement_portal_preferences_request) =
    let input = Json_serializers.list_procurement_portal_preferences_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.ListProcurementPortalPreferences" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_procurement_portal_preferences_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module PutProcurementPortalPreference = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.invoicing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : put_procurement_portal_preference_request) =
    let input = Json_serializers.put_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.PutProcurementPortalPreference"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_procurement_portal_preference_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : put_procurement_portal_preference_request) =
    let input = Json_serializers.put_procurement_portal_preference_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.PutProcurementPortalPreference" ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_procurement_portal_preference_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.UntagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateInvoiceUnit = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : update_invoice_unit_request) =
    let input = Json_serializers.update_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"Invoicing.UpdateInvoiceUnit" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_invoice_unit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_invoice_unit_request) =
    let input = Json_serializers.update_invoice_unit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"Invoicing.UpdateInvoiceUnit"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_invoice_unit_response_of_yojson
      ~error_deserializer
end

module UpdateProcurementPortalPreferenceStatus = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.invoicing#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.invoicing#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.invoicing#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.invoicing#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.invoicing#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.invoicing#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.invoicing#ValidationException"
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

  let request context (request : update_procurement_portal_preference_status_request) =
    let input =
      Json_serializers.update_procurement_portal_preference_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"Invoicing.UpdateProcurementPortalPreferenceStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_procurement_portal_preference_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_procurement_portal_preference_status_request)
      =
    let input =
      Json_serializers.update_procurement_portal_preference_status_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"Invoicing.UpdateProcurementPortalPreferenceStatus" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_procurement_portal_preference_status_response_of_yojson
      ~error_deserializer
end
