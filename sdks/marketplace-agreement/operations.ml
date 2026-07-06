open Types
open Service_metadata

module AcceptAgreementCancellationRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : accept_agreement_cancellation_request_input) =
    let input = Json_serializers.accept_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.accept_agreement_cancellation_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_agreement_cancellation_request_input) =
    let input = Json_serializers.accept_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.accept_agreement_cancellation_request_output_of_yojson
      ~error_deserializer
end

module AcceptAgreementPaymentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : accept_agreement_payment_request_input) =
    let input = Json_serializers.accept_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.accept_agreement_payment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_agreement_payment_request_input) =
    let input = Json_serializers.accept_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.accept_agreement_payment_request_output_of_yojson
      ~error_deserializer
end

module AcceptAgreementRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : accept_agreement_request_input) =
    let input = Json_serializers.accept_agreement_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_agreement_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_agreement_request_input) =
    let input = Json_serializers.accept_agreement_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.AcceptAgreementRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.accept_agreement_request_output_of_yojson
      ~error_deserializer
end

module BatchCreateBillingAdjustmentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : batch_create_billing_adjustment_request_input) =
    let input = Json_serializers.batch_create_billing_adjustment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.BatchCreateBillingAdjustmentRequest" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_billing_adjustment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_create_billing_adjustment_request_input) =
    let input = Json_serializers.batch_create_billing_adjustment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.BatchCreateBillingAdjustmentRequest" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.batch_create_billing_adjustment_request_output_of_yojson
      ~error_deserializer
end

module CancelAgreement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : cancel_agreement_input) =
    let input = Json_serializers.cancel_agreement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : cancel_agreement_input) =
    let input = Json_serializers.cancel_agreement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_output_of_yojson ~error_deserializer
end

module CancelAgreementCancellationRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : cancel_agreement_cancellation_request_input) =
    let input = Json_serializers.cancel_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_cancellation_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_agreement_cancellation_request_input) =
    let input = Json_serializers.cancel_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_cancellation_request_output_of_yojson
      ~error_deserializer
end

module CancelAgreementPaymentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : cancel_agreement_payment_request_input) =
    let input = Json_serializers.cancel_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_payment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : cancel_agreement_payment_request_input) =
    let input = Json_serializers.cancel_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.CancelAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.cancel_agreement_payment_request_output_of_yojson
      ~error_deserializer
end

module CreateAgreementRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ServiceQuotaExceededException _ ->
        "com.amazonaws.marketplaceagreement#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : create_agreement_request_input) =
    let input = Json_serializers.create_agreement_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.CreateAgreementRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_agreement_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_agreement_request_input) =
    let input = Json_serializers.create_agreement_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.CreateAgreementRequest" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_agreement_request_output_of_yojson
      ~error_deserializer
end

module DescribeAgreement = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : describe_agreement_input) =
    let input = Json_serializers.describe_agreement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.DescribeAgreement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agreement_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_agreement_input) =
    let input = Json_serializers.describe_agreement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.DescribeAgreement" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_agreement_output_of_yojson
      ~error_deserializer
end

module GetAgreementCancellationRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : get_agreement_cancellation_request_input) =
    let input = Json_serializers.get_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementCancellationRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_agreement_cancellation_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_agreement_cancellation_request_input) =
    let input = Json_serializers.get_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementCancellationRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.get_agreement_cancellation_request_output_of_yojson
      ~error_deserializer
end

module GetAgreementEntitlements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : get_agreement_entitlements_input) =
    let input = Json_serializers.get_agreement_entitlements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementEntitlements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_agreement_entitlements_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_agreement_entitlements_input) =
    let input = Json_serializers.get_agreement_entitlements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementEntitlements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_agreement_entitlements_output_of_yojson
      ~error_deserializer
end

module GetAgreementPaymentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : get_agreement_payment_request_input) =
    let input = Json_serializers.get_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementPaymentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_agreement_payment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_agreement_payment_request_input) =
    let input = Json_serializers.get_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementPaymentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_agreement_payment_request_output_of_yojson
      ~error_deserializer
end

module GetAgreementTerms = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : get_agreement_terms_input) =
    let input = Json_serializers.get_agreement_terms_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_agreement_terms_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_agreement_terms_input) =
    let input = Json_serializers.get_agreement_terms_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.GetAgreementTerms" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_agreement_terms_output_of_yojson
      ~error_deserializer
end

module GetBillingAdjustmentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : get_billing_adjustment_request_input) =
    let input = Json_serializers.get_billing_adjustment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.GetBillingAdjustmentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_billing_adjustment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_billing_adjustment_request_input) =
    let input = Json_serializers.get_billing_adjustment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.GetBillingAdjustmentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_billing_adjustment_request_output_of_yojson
      ~error_deserializer
end

module ListAgreementCancellationRequests = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : list_agreement_cancellation_requests_input) =
    let input = Json_serializers.list_agreement_cancellation_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementCancellationRequests" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_agreement_cancellation_requests_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agreement_cancellation_requests_input) =
    let input = Json_serializers.list_agreement_cancellation_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementCancellationRequests" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_agreement_cancellation_requests_output_of_yojson
      ~error_deserializer
end

module ListAgreementCharges = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : list_agreement_charges_input) =
    let input = Json_serializers.list_agreement_charges_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementCharges" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_agreement_charges_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agreement_charges_input) =
    let input = Json_serializers.list_agreement_charges_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementCharges" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_agreement_charges_output_of_yojson
      ~error_deserializer
end

module ListAgreementInvoiceLineItems = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : list_agreement_invoice_line_items_input) =
    let input = Json_serializers.list_agreement_invoice_line_items_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementInvoiceLineItems" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_agreement_invoice_line_items_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agreement_invoice_line_items_input) =
    let input = Json_serializers.list_agreement_invoice_line_items_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementInvoiceLineItems" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_agreement_invoice_line_items_output_of_yojson
      ~error_deserializer
end

module ListAgreementPaymentRequests = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : list_agreement_payment_requests_input) =
    let input = Json_serializers.list_agreement_payment_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementPaymentRequests" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_agreement_payment_requests_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_agreement_payment_requests_input) =
    let input = Json_serializers.list_agreement_payment_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.ListAgreementPaymentRequests" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_agreement_payment_requests_output_of_yojson
      ~error_deserializer
end

module ListBillingAdjustmentRequests = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : list_billing_adjustment_requests_input) =
    let input = Json_serializers.list_billing_adjustment_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.ListBillingAdjustmentRequests" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_billing_adjustment_requests_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_billing_adjustment_requests_input) =
    let input = Json_serializers.list_billing_adjustment_requests_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.ListBillingAdjustmentRequests" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_billing_adjustment_requests_output_of_yojson
      ~error_deserializer
end

module RejectAgreementCancellationRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : reject_agreement_cancellation_request_input) =
    let input = Json_serializers.reject_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.RejectAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.reject_agreement_cancellation_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_agreement_cancellation_request_input) =
    let input = Json_serializers.reject_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.RejectAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.reject_agreement_cancellation_request_output_of_yojson
      ~error_deserializer
end

module RejectAgreementPaymentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : reject_agreement_payment_request_input) =
    let input = Json_serializers.reject_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.RejectAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.reject_agreement_payment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_agreement_payment_request_input) =
    let input = Json_serializers.reject_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.RejectAgreementPaymentRequest" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.reject_agreement_payment_request_output_of_yojson
      ~error_deserializer
end

module SearchAgreements = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : search_agreements_input) =
    let input = Json_serializers.search_agreements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.SearchAgreements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_agreements_output_of_yojson ~error_deserializer

  let request_with_metadata context (request : search_agreements_input) =
    let input = Json_serializers.search_agreements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.SearchAgreements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.search_agreements_output_of_yojson ~error_deserializer
end

module SendAgreementCancellationRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : send_agreement_cancellation_request_input) =
    let input = Json_serializers.send_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.SendAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.send_agreement_cancellation_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_agreement_cancellation_request_input) =
    let input = Json_serializers.send_agreement_cancellation_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.SendAgreementCancellationRequest" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.send_agreement_cancellation_request_output_of_yojson
      ~error_deserializer
end

module SendAgreementPaymentRequest = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : send_agreement_payment_request_input) =
    let input = Json_serializers.send_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.SendAgreementPaymentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.send_agreement_payment_request_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_agreement_payment_request_input) =
    let input = Json_serializers.send_agreement_payment_request_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.SendAgreementPaymentRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.send_agreement_payment_request_output_of_yojson
      ~error_deserializer
end

module UpdatePurchaseOrders = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.marketplaceagreement#AccessDeniedException"
    | `ConflictException _ -> "com.amazonaws.marketplaceagreement#ConflictException"
    | `InternalServerException _ -> "com.amazonaws.marketplaceagreement#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.marketplaceagreement#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceagreement#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.marketplaceagreement#ValidationException"
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

  let request context (request : update_purchase_orders_input) =
    let input = Json_serializers.update_purchase_orders_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301.UpdatePurchaseOrders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_purchase_orders_output_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_purchase_orders_input) =
    let input = Json_serializers.update_purchase_orders_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPCommerceService_v20200301.UpdatePurchaseOrders" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_purchase_orders_output_of_yojson
      ~error_deserializer
end
