open Types
open Service_metadata

module GetAccountActivity = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.freetier#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.freetier#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.freetier#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.freetier#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : get_account_activity_request) =
    let input = Json_serializers.get_account_activity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFreeTierService.GetAccountActivity" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_account_activity_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_activity_request) =
    let input = Json_serializers.get_account_activity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSFreeTierService.GetAccountActivity" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_activity_response_of_yojson
      ~error_deserializer
end

module GetAccountPlanState = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.freetier#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.freetier#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.freetier#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.freetier#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.freetier#ValidationException"
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

  let request context (request : get_account_plan_state_request) =
    let input = Json_serializers.get_account_plan_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFreeTierService.GetAccountPlanState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_plan_state_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_plan_state_request) =
    let input = Json_serializers.get_account_plan_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSFreeTierService.GetAccountPlanState" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_plan_state_response_of_yojson
      ~error_deserializer
end

module GetFreeTierUsage = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.freetier#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.freetier#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.freetier#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : get_free_tier_usage_request) =
    let input = Json_serializers.get_free_tier_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFreeTierService.GetFreeTierUsage" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_free_tier_usage_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_free_tier_usage_request) =
    let input = Json_serializers.get_free_tier_usage_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSFreeTierService.GetFreeTierUsage" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_free_tier_usage_response_of_yojson
      ~error_deserializer
end

module ListAccountActivities = struct
  let error_to_string = function
    | `InternalServerException _ -> "com.amazonaws.freetier#InternalServerException"
    | `ThrottlingException _ -> "com.amazonaws.freetier#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.freetier#ValidationException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
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

  let request context (request : list_account_activities_request) =
    let input = Json_serializers.list_account_activities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFreeTierService.ListAccountActivities"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_activities_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_account_activities_request) =
    let input = Json_serializers.list_account_activities_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSFreeTierService.ListAccountActivities" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_account_activities_response_of_yojson
      ~error_deserializer
end

module UpgradeAccountPlan = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.freetier#AccessDeniedException"
    | `InternalServerException _ -> "com.amazonaws.freetier#InternalServerException"
    | `ResourceNotFoundException _ -> "com.amazonaws.freetier#ResourceNotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.freetier#ThrottlingException"
    | `ValidationException _ -> "com.amazonaws.freetier#ValidationException"
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

  let request context (request : upgrade_account_plan_request) =
    let input = Json_serializers.upgrade_account_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSFreeTierService.UpgradeAccountPlan" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.upgrade_account_plan_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : upgrade_account_plan_request) =
    let input = Json_serializers.upgrade_account_plan_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSFreeTierService.UpgradeAccountPlan" ~service ~context ~input
      ~output_deserializer:Json_deserializers.upgrade_account_plan_response_of_yojson
      ~error_deserializer
end
