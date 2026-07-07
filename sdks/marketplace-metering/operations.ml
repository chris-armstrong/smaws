open Types
open Service_metadata

module BatchMeterUsage = struct
  let error_to_string = function
    | `DisabledApiException _ -> "com.amazonaws.marketplacemetering#DisabledApiException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.marketplacemetering#InternalServiceErrorException"
    | `InvalidCustomerIdentifierException _ ->
        "com.amazonaws.marketplacemetering#InvalidCustomerIdentifierException"
    | `InvalidLicenseException _ -> "com.amazonaws.marketplacemetering#InvalidLicenseException"
    | `InvalidProductCodeException _ ->
        "com.amazonaws.marketplacemetering#InvalidProductCodeException"
    | `InvalidTagException _ -> "com.amazonaws.marketplacemetering#InvalidTagException"
    | `InvalidUsageAllocationsException _ ->
        "com.amazonaws.marketplacemetering#InvalidUsageAllocationsException"
    | `InvalidUsageDimensionException _ ->
        "com.amazonaws.marketplacemetering#InvalidUsageDimensionException"
    | `ThrottlingException _ -> "com.amazonaws.marketplacemetering#ThrottlingException"
    | `TimestampOutOfBoundsException _ ->
        "com.amazonaws.marketplacemetering#TimestampOutOfBoundsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DisabledApiException" ->
          `DisabledApiException (Json_deserializers.disabled_api_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidCustomerIdentifierException" ->
          `InvalidCustomerIdentifierException
            (Json_deserializers.invalid_customer_identifier_exception_of_yojson tree path)
      | _, "InvalidLicenseException" ->
          `InvalidLicenseException
            (Json_deserializers.invalid_license_exception_of_yojson tree path)
      | _, "InvalidProductCodeException" ->
          `InvalidProductCodeException
            (Json_deserializers.invalid_product_code_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "InvalidUsageAllocationsException" ->
          `InvalidUsageAllocationsException
            (Json_deserializers.invalid_usage_allocations_exception_of_yojson tree path)
      | _, "InvalidUsageDimensionException" ->
          `InvalidUsageDimensionException
            (Json_deserializers.invalid_usage_dimension_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TimestampOutOfBoundsException" ->
          `TimestampOutOfBoundsException
            (Json_deserializers.timestamp_out_of_bounds_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : batch_meter_usage_request) =
    let input = Json_serializers.batch_meter_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPMeteringService.BatchMeterUsage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.batch_meter_usage_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : batch_meter_usage_request) =
    let input = Json_serializers.batch_meter_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPMeteringService.BatchMeterUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.batch_meter_usage_result_of_yojson ~error_deserializer
end

module MeterUsage = struct
  let error_to_string = function
    | `CustomerNotEntitledException _ ->
        "com.amazonaws.marketplacemetering#CustomerNotEntitledException"
    | `DuplicateRequestException _ -> "com.amazonaws.marketplacemetering#DuplicateRequestException"
    | `IdempotencyConflictException _ ->
        "com.amazonaws.marketplacemetering#IdempotencyConflictException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.marketplacemetering#InternalServiceErrorException"
    | `InvalidEndpointRegionException _ ->
        "com.amazonaws.marketplacemetering#InvalidEndpointRegionException"
    | `InvalidProductCodeException _ ->
        "com.amazonaws.marketplacemetering#InvalidProductCodeException"
    | `InvalidTagException _ -> "com.amazonaws.marketplacemetering#InvalidTagException"
    | `InvalidUsageAllocationsException _ ->
        "com.amazonaws.marketplacemetering#InvalidUsageAllocationsException"
    | `InvalidUsageDimensionException _ ->
        "com.amazonaws.marketplacemetering#InvalidUsageDimensionException"
    | `ThrottlingException _ -> "com.amazonaws.marketplacemetering#ThrottlingException"
    | `TimestampOutOfBoundsException _ ->
        "com.amazonaws.marketplacemetering#TimestampOutOfBoundsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CustomerNotEntitledException" ->
          `CustomerNotEntitledException
            (Json_deserializers.customer_not_entitled_exception_of_yojson tree path)
      | _, "DuplicateRequestException" ->
          `DuplicateRequestException
            (Json_deserializers.duplicate_request_exception_of_yojson tree path)
      | _, "IdempotencyConflictException" ->
          `IdempotencyConflictException
            (Json_deserializers.idempotency_conflict_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidEndpointRegionException" ->
          `InvalidEndpointRegionException
            (Json_deserializers.invalid_endpoint_region_exception_of_yojson tree path)
      | _, "InvalidProductCodeException" ->
          `InvalidProductCodeException
            (Json_deserializers.invalid_product_code_exception_of_yojson tree path)
      | _, "InvalidTagException" ->
          `InvalidTagException (Json_deserializers.invalid_tag_exception_of_yojson tree path)
      | _, "InvalidUsageAllocationsException" ->
          `InvalidUsageAllocationsException
            (Json_deserializers.invalid_usage_allocations_exception_of_yojson tree path)
      | _, "InvalidUsageDimensionException" ->
          `InvalidUsageDimensionException
            (Json_deserializers.invalid_usage_dimension_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _, "TimestampOutOfBoundsException" ->
          `TimestampOutOfBoundsException
            (Json_deserializers.timestamp_out_of_bounds_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : meter_usage_request) =
    let input = Json_serializers.meter_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPMeteringService.MeterUsage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.meter_usage_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : meter_usage_request) =
    let input = Json_serializers.meter_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSMPMeteringService.MeterUsage"
      ~service ~context ~input ~output_deserializer:Json_deserializers.meter_usage_result_of_yojson
      ~error_deserializer
end

module RegisterUsage = struct
  let error_to_string = function
    | `CustomerNotEntitledException _ ->
        "com.amazonaws.marketplacemetering#CustomerNotEntitledException"
    | `DisabledApiException _ -> "com.amazonaws.marketplacemetering#DisabledApiException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.marketplacemetering#InternalServiceErrorException"
    | `InvalidProductCodeException _ ->
        "com.amazonaws.marketplacemetering#InvalidProductCodeException"
    | `InvalidPublicKeyVersionException _ ->
        "com.amazonaws.marketplacemetering#InvalidPublicKeyVersionException"
    | `InvalidRegionException _ -> "com.amazonaws.marketplacemetering#InvalidRegionException"
    | `PlatformNotSupportedException _ ->
        "com.amazonaws.marketplacemetering#PlatformNotSupportedException"
    | `ThrottlingException _ -> "com.amazonaws.marketplacemetering#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "CustomerNotEntitledException" ->
          `CustomerNotEntitledException
            (Json_deserializers.customer_not_entitled_exception_of_yojson tree path)
      | _, "DisabledApiException" ->
          `DisabledApiException (Json_deserializers.disabled_api_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidProductCodeException" ->
          `InvalidProductCodeException
            (Json_deserializers.invalid_product_code_exception_of_yojson tree path)
      | _, "InvalidPublicKeyVersionException" ->
          `InvalidPublicKeyVersionException
            (Json_deserializers.invalid_public_key_version_exception_of_yojson tree path)
      | _, "InvalidRegionException" ->
          `InvalidRegionException (Json_deserializers.invalid_region_exception_of_yojson tree path)
      | _, "PlatformNotSupportedException" ->
          `PlatformNotSupportedException
            (Json_deserializers.platform_not_supported_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : register_usage_request) =
    let input = Json_serializers.register_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPMeteringService.RegisterUsage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.register_usage_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : register_usage_request) =
    let input = Json_serializers.register_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPMeteringService.RegisterUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.register_usage_result_of_yojson ~error_deserializer
end

module ResolveCustomer = struct
  let error_to_string = function
    | `DisabledApiException _ -> "com.amazonaws.marketplacemetering#DisabledApiException"
    | `ExpiredTokenException _ -> "com.amazonaws.marketplacemetering#ExpiredTokenException"
    | `InternalServiceErrorException _ ->
        "com.amazonaws.marketplacemetering#InternalServiceErrorException"
    | `InvalidTokenException _ -> "com.amazonaws.marketplacemetering#InvalidTokenException"
    | `ThrottlingException _ -> "com.amazonaws.marketplacemetering#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "DisabledApiException" ->
          `DisabledApiException (Json_deserializers.disabled_api_exception_of_yojson tree path)
      | _, "ExpiredTokenException" ->
          `ExpiredTokenException (Json_deserializers.expired_token_exception_of_yojson tree path)
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidTokenException" ->
          `InvalidTokenException (Json_deserializers.invalid_token_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : resolve_customer_request) =
    let input = Json_serializers.resolve_customer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPMeteringService.ResolveCustomer" ~service
      ~context ~input ~output_deserializer:Json_deserializers.resolve_customer_result_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : resolve_customer_request) =
    let input = Json_serializers.resolve_customer_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPMeteringService.ResolveCustomer" ~service ~context ~input
      ~output_deserializer:Json_deserializers.resolve_customer_result_of_yojson ~error_deserializer
end
