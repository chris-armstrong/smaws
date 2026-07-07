open Types
open Service_metadata

module CreateBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.budgets#BillingViewHealthStatusException"
    | `CreationLimitExceededException _ -> "com.amazonaws.budgets#CreationLimitExceededException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.budgets#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "CreationLimitExceededException" ->
          `CreationLimitExceededException
            (Json_deserializers.creation_limit_exceeded_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_budget_request) =
    let input = Json_serializers.create_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.CreateBudget" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_budget_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_budget_request) =
    let input = Json_serializers.create_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.CreateBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_budget_response_of_yojson ~error_deserializer
end

module CreateBudgetAction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `CreationLimitExceededException _ -> "com.amazonaws.budgets#CreationLimitExceededException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.budgets#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "CreationLimitExceededException" ->
          `CreationLimitExceededException
            (Json_deserializers.creation_limit_exceeded_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_budget_action_request) =
    let input = Json_serializers.create_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.CreateBudgetAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_budget_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_budget_action_request) =
    let input = Json_serializers.create_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.CreateBudgetAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_budget_action_response_of_yojson
      ~error_deserializer
end

module CreateNotification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `CreationLimitExceededException _ -> "com.amazonaws.budgets#CreationLimitExceededException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "CreationLimitExceededException" ->
          `CreationLimitExceededException
            (Json_deserializers.creation_limit_exceeded_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
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

  let request context (request : create_notification_request) =
    let input = Json_serializers.create_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.CreateNotification"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_notification_request) =
    let input = Json_serializers.create_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.CreateNotification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_notification_response_of_yojson
      ~error_deserializer
end

module CreateSubscriber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `CreationLimitExceededException _ -> "com.amazonaws.budgets#CreationLimitExceededException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "CreationLimitExceededException" ->
          `CreationLimitExceededException
            (Json_deserializers.creation_limit_exceeded_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
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

  let request context (request : create_subscriber_request) =
    let input = Json_serializers.create_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.CreateSubscriber"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_subscriber_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_subscriber_request) =
    let input = Json_serializers.create_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.CreateSubscriber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_subscriber_response_of_yojson
      ~error_deserializer
end

module DeleteBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_budget_request) =
    let input = Json_serializers.delete_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DeleteBudget" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_budget_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_budget_request) =
    let input = Json_serializers.delete_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DeleteBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_budget_response_of_yojson ~error_deserializer
end

module DeleteBudgetAction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ResourceLockedException _ -> "com.amazonaws.budgets#ResourceLockedException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ResourceLockedException" ->
          `ResourceLockedException
            (Json_deserializers.resource_locked_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_budget_action_request) =
    let input = Json_serializers.delete_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DeleteBudgetAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_budget_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_budget_action_request) =
    let input = Json_serializers.delete_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DeleteBudgetAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_budget_action_response_of_yojson
      ~error_deserializer
end

module DeleteNotification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_notification_request) =
    let input = Json_serializers.delete_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DeleteNotification"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_notification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_notification_request) =
    let input = Json_serializers.delete_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DeleteNotification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_notification_response_of_yojson
      ~error_deserializer
end

module DeleteSubscriber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_subscriber_request) =
    let input = Json_serializers.delete_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DeleteSubscriber"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_subscriber_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_subscriber_request) =
    let input = Json_serializers.delete_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DeleteSubscriber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_subscriber_response_of_yojson
      ~error_deserializer
end

module DescribeBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_budget_request) =
    let input = Json_serializers.describe_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DescribeBudget"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : describe_budget_request) =
    let input = Json_serializers.describe_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_response_of_yojson ~error_deserializer
end

module DescribeBudgetAction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_budget_action_request) =
    let input = Json_serializers.describe_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_action_request) =
    let input = Json_serializers.describe_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_action_response_of_yojson
      ~error_deserializer
end

module DescribeBudgetActionHistories = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_budget_action_histories_request) =
    let input = Json_serializers.describe_budget_action_histories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionHistories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_action_histories_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_action_histories_request) =
    let input = Json_serializers.describe_budget_action_histories_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionHistories" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_action_histories_response_of_yojson
      ~error_deserializer
end

module DescribeBudgetActionsForAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidNextTokenException" ->
          `InvalidNextTokenException
            (Json_deserializers.invalid_next_token_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_budget_actions_for_account_request) =
    let input = Json_serializers.describe_budget_actions_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionsForAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_actions_for_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_actions_for_account_request) =
    let input = Json_serializers.describe_budget_actions_for_account_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionsForAccount" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_actions_for_account_response_of_yojson
      ~error_deserializer
end

module DescribeBudgetActionsForBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
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

  let request context (request : describe_budget_actions_for_budget_request) =
    let input = Json_serializers.describe_budget_actions_for_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionsForBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_actions_for_budget_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_actions_for_budget_request) =
    let input = Json_serializers.describe_budget_actions_for_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetActionsForBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budget_actions_for_budget_response_of_yojson
      ~error_deserializer
end

module DescribeBudgetNotificationsForAccount = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.budgets#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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

  let request context (request : describe_budget_notifications_for_account_request) =
    let input =
      Json_serializers.describe_budget_notifications_for_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetNotificationsForAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_budget_notifications_for_account_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_notifications_for_account_request) =
    let input =
      Json_serializers.describe_budget_notifications_for_account_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetNotificationsForAccount" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_budget_notifications_for_account_response_of_yojson
      ~error_deserializer
end

module DescribeBudgetPerformanceHistory = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.budgets#BillingViewHealthStatusException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.budgets#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
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

  let request context (request : describe_budget_performance_history_request) =
    let input = Json_serializers.describe_budget_performance_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetPerformanceHistory" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_budget_performance_history_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budget_performance_history_request) =
    let input = Json_serializers.describe_budget_performance_history_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgetPerformanceHistory" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.describe_budget_performance_history_response_of_yojson
      ~error_deserializer
end

module DescribeBudgets = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.budgets#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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

  let request context (request : describe_budgets_request) =
    let input = Json_serializers.describe_budgets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.DescribeBudgets"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budgets_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_budgets_request) =
    let input = Json_serializers.describe_budgets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeBudgets" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_budgets_response_of_yojson
      ~error_deserializer
end

module DescribeNotificationsForBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.budgets#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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

  let request context (request : describe_notifications_for_budget_request) =
    let input = Json_serializers.describe_notifications_for_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeNotificationsForBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notifications_for_budget_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_notifications_for_budget_request) =
    let input = Json_serializers.describe_notifications_for_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeNotificationsForBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_notifications_for_budget_response_of_yojson
      ~error_deserializer
end

module DescribeSubscribersForNotification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `ExpiredNextTokenException _ -> "com.amazonaws.budgets#ExpiredNextTokenException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidNextTokenException _ -> "com.amazonaws.budgets#InvalidNextTokenException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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

  let request context (request : describe_subscribers_for_notification_request) =
    let input = Json_serializers.describe_subscribers_for_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSBudgetServiceGateway.DescribeSubscribersForNotification" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_subscribers_for_notification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : describe_subscribers_for_notification_request) =
    let input = Json_serializers.describe_subscribers_for_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.DescribeSubscribersForNotification" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.describe_subscribers_for_notification_response_of_yojson
      ~error_deserializer
end

module ExecuteBudgetAction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ResourceLockedException _ -> "com.amazonaws.budgets#ResourceLockedException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ResourceLockedException" ->
          `ResourceLockedException
            (Json_deserializers.resource_locked_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : execute_budget_action_request) =
    let input = Json_serializers.execute_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.ExecuteBudgetAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_budget_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : execute_budget_action_request) =
    let input = Json_serializers.execute_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.ExecuteBudgetAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.execute_budget_action_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.ListTagsForResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.budgets#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.TagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.UntagResource" ~service ~context ~input
      ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson ~error_deserializer
end

module UpdateBudget = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `BillingViewHealthStatusException _ ->
        "com.amazonaws.budgets#BillingViewHealthStatusException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ServiceQuotaExceededException _ -> "com.amazonaws.budgets#ServiceQuotaExceededException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "BillingViewHealthStatusException" ->
          `BillingViewHealthStatusException
            (Json_deserializers.billing_view_health_status_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "NotFoundException" ->
          `NotFoundException (Json_deserializers.not_found_exception_of_yojson tree path)
      | _, "ServiceQuotaExceededException" ->
          `ServiceQuotaExceededException
            (Json_deserializers.service_quota_exceeded_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_budget_request) =
    let input = Json_serializers.update_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.UpdateBudget" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_budget_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_budget_request) =
    let input = Json_serializers.update_budget_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.UpdateBudget" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_budget_response_of_yojson ~error_deserializer
end

module UpdateBudgetAction = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ResourceLockedException _ -> "com.amazonaws.budgets#ResourceLockedException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
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
      | _, "ResourceLockedException" ->
          `ResourceLockedException
            (Json_deserializers.resource_locked_exception_of_yojson tree path)
      | _, "ThrottlingException" ->
          `ThrottlingException (Json_deserializers.throttling_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_budget_action_request) =
    let input = Json_serializers.update_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.UpdateBudgetAction"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_budget_action_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_budget_action_request) =
    let input = Json_serializers.update_budget_action_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.UpdateBudgetAction" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_budget_action_response_of_yojson
      ~error_deserializer
end

module UpdateNotification = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
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

  let request context (request : update_notification_request) =
    let input = Json_serializers.update_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.UpdateNotification"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notification_request) =
    let input = Json_serializers.update_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.UpdateNotification" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_notification_response_of_yojson
      ~error_deserializer
end

module UpdateSubscriber = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.budgets#AccessDeniedException"
    | `DuplicateRecordException _ -> "com.amazonaws.budgets#DuplicateRecordException"
    | `InternalErrorException _ -> "com.amazonaws.budgets#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.budgets#InvalidParameterException"
    | `NotFoundException _ -> "com.amazonaws.budgets#NotFoundException"
    | `ThrottlingException _ -> "com.amazonaws.budgets#ThrottlingException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "DuplicateRecordException" ->
          `DuplicateRecordException
            (Json_deserializers.duplicate_record_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
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

  let request context (request : update_subscriber_request) =
    let input = Json_serializers.update_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSBudgetServiceGateway.UpdateSubscriber"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_subscriber_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_subscriber_request) =
    let input = Json_serializers.update_subscriber_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"AWSBudgetServiceGateway.UpdateSubscriber" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_subscriber_response_of_yojson
      ~error_deserializer
end
