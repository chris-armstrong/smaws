open Types
open Service_metadata

module DescribeServices = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pricing#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.pricing#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.pricing#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.pricing#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.pricing#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.pricing#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pricing#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPriceListService.DescribeServices" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_services_request) =
    let input = Json_serializers.describe_services_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPriceListService.DescribeServices" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_services_response_of_yojson
      ~error_deserializer
end

module GetAttributeValues = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pricing#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.pricing#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.pricing#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.pricing#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.pricing#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.pricing#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pricing#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_attribute_values_request) =
    let input = Json_serializers.get_attribute_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPriceListService.GetAttributeValues"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_attribute_values_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_attribute_values_request) =
    let input = Json_serializers.get_attribute_values_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPriceListService.GetAttributeValues" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_attribute_values_response_of_yojson
      ~error_deserializer
end

module GetPriceListFileUrl = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pricing#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.pricing#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.pricing#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.pricing#NotFoundException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pricing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pricing#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_price_list_file_url_request) =
    let input = Json_serializers.get_price_list_file_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPriceListService.GetPriceListFileUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_price_list_file_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_price_list_file_url_request) =
    let input = Json_serializers.get_price_list_file_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPriceListService.GetPriceListFileUrl" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_price_list_file_url_response_of_yojson
      ~error_deserializer
end

module GetProducts = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pricing#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.pricing#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.pricing#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.pricing#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.pricing#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.pricing#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pricing#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_products_request) =
    let input = Json_serializers.get_products_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPriceListService.GetProducts" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_products_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_products_request) =
    let input = Json_serializers.get_products_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata ~shape_name:"AWSPriceListService.GetProducts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_products_response_of_yojson ~error_deserializer
end

module ListPriceLists = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.pricing#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.pricing#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.pricing#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.pricing#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.pricing#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.pricing#NotFoundException"
    | `ResourceNotFoundException _ -> "com.amazonaws.pricing#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.pricing#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "ExpiredNextTokenException" ->
          `ExpiredNextTokenException
            (Json_deserializers.expired_next_token_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_price_lists_request) =
    let input = Json_serializers.list_price_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSPriceListService.ListPriceLists" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_price_lists_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_price_lists_request) =
    let input = Json_serializers.list_price_lists_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSPriceListService.ListPriceLists" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_price_lists_response_of_yojson
      ~error_deserializer
end
