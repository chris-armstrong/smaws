open Types
open Service_metadata

module GetEntitlements = struct
  let error_to_string = function
    | `InternalServiceErrorException _ ->
        "com.amazonaws.marketplaceentitlementservice#InternalServiceErrorException"
    | `InvalidParameterException _ ->
        "com.amazonaws.marketplaceentitlementservice#InvalidParameterException"
    | `ThrottlingException _ -> "com.amazonaws.marketplaceentitlementservice#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalServiceErrorException" ->
          `InternalServiceErrorException
            (Json_deserializers.internal_service_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_entitlements_request) =
    let input = Json_serializers.get_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSMPEntitlementService.GetEntitlements"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entitlements_result_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_entitlements_request) =
    let input = Json_serializers.get_entitlements_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSMPEntitlementService.GetEntitlements" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_entitlements_result_of_yojson ~error_deserializer
end
