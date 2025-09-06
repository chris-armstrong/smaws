open Types
open Service_metadata

module DescribeAgreement = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.describe_agreement_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301DescribeAgreement" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.describe_agreement_output_of_yojson
      ~error_deserializer
end

module GetAgreementTerms = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.get_agreement_terms_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSMPCommerceService_v20200301GetAgreementTerms" ~service ~config:context.config
      ~http:context.http ~input
      ~output_deserializer:Json_deserializers.get_agreement_terms_output_of_yojson
      ~error_deserializer
end

module SearchAgreements = struct
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
    let open Smaws_Lib.Context in
    let input = Json_serializers.search_agreements_input_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPCommerceService_v20200301SearchAgreements"
      ~service ~config:context.config ~http:context.http ~input
      ~output_deserializer:Json_deserializers.search_agreements_output_of_yojson ~error_deserializer
end
