open Types
open Service_metadata

module ListRecommendedActions = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.bcmrecommendedactions#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.bcmrecommendedactions#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.bcmrecommendedactions#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.bcmrecommendedactions#ValidationException"
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

  let request context (request : list_recommended_actions_request) =
    let input = Json_serializers.list_recommended_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBillingAndCostManagementRecommendedActions.ListRecommendedActions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_recommended_actions_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_recommended_actions_request) =
    let input = Json_serializers.list_recommended_actions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBillingAndCostManagementRecommendedActions.ListRecommendedActions" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_recommended_actions_response_of_yojson
      ~error_deserializer
end
