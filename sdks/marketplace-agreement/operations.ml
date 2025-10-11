open Types
open Service_metadata

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
end
