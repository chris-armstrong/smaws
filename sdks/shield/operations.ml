open Types
open Service_metadata

module AssociateDRTLogBucket = struct
  let error_to_string = function
    | `AccessDeniedForDependencyException _ ->
        "com.amazonaws.shield#AccessDeniedForDependencyException"
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `LimitsExceededException _ -> "com.amazonaws.shield#LimitsExceededException"
    | `NoAssociatedRoleException _ -> "com.amazonaws.shield#NoAssociatedRoleException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedForDependencyException" ->
          `AccessDeniedForDependencyException
            (Json_deserializers.access_denied_for_dependency_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitsExceededException" ->
          `LimitsExceededException
            (Json_deserializers.limits_exceeded_exception_of_yojson tree path)
      | _, "NoAssociatedRoleException" ->
          `NoAssociatedRoleException
            (Json_deserializers.no_associated_role_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_drt_log_bucket_request) =
    let input = Json_serializers.associate_drt_log_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.AssociateDRTLogBucket"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_drt_log_bucket_response_of_yojson
      ~error_deserializer
end

module AssociateDRTRole = struct
  let error_to_string = function
    | `AccessDeniedForDependencyException _ ->
        "com.amazonaws.shield#AccessDeniedForDependencyException"
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedForDependencyException" ->
          `AccessDeniedForDependencyException
            (Json_deserializers.access_denied_for_dependency_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_drt_role_request) =
    let input = Json_serializers.associate_drt_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.AssociateDRTRole" ~service
      ~context ~input ~output_deserializer:Json_deserializers.associate_drt_role_response_of_yojson
      ~error_deserializer
end

module AssociateHealthCheck = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `LimitsExceededException _ -> "com.amazonaws.shield#LimitsExceededException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "LimitsExceededException" ->
          `LimitsExceededException
            (Json_deserializers.limits_exceeded_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_health_check_request) =
    let input = Json_serializers.associate_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.AssociateHealthCheck"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.associate_health_check_response_of_yojson
      ~error_deserializer
end

module AssociateProactiveEngagementDetails = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_proactive_engagement_details_request) =
    let input = Json_serializers.associate_proactive_engagement_details_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.AssociateProactiveEngagementDetails" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.associate_proactive_engagement_details_response_of_yojson
      ~error_deserializer
end

module CreateProtection = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `LimitsExceededException _ -> "com.amazonaws.shield#LimitsExceededException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.shield#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "LimitsExceededException" ->
          `LimitsExceededException
            (Json_deserializers.limits_exceeded_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_protection_request) =
    let input = Json_serializers.create_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.CreateProtection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_protection_response_of_yojson
      ~error_deserializer
end

module CreateProtectionGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `LimitsExceededException _ -> "com.amazonaws.shield#LimitsExceededException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.shield#ResourceAlreadyExistsException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitsExceededException" ->
          `LimitsExceededException
            (Json_deserializers.limits_exceeded_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_protection_group_request) =
    let input = Json_serializers.create_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.CreateProtectionGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_protection_group_response_of_yojson
      ~error_deserializer
end

module CreateSubscription = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `ResourceAlreadyExistsException _ -> "com.amazonaws.shield#ResourceAlreadyExistsException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceAlreadyExistsException" ->
          `ResourceAlreadyExistsException
            (Json_deserializers.resource_already_exists_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_subscription_request) =
    let input = Json_serializers.create_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.CreateSubscription" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_subscription_response_of_yojson
      ~error_deserializer
end

module DeleteProtection = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_protection_request) =
    let input = Json_serializers.delete_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DeleteProtection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_protection_response_of_yojson
      ~error_deserializer
end

module DeleteProtectionGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_protection_group_request) =
    let input = Json_serializers.delete_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DeleteProtectionGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_protection_group_response_of_yojson
      ~error_deserializer
end

module DeleteSubscription = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `LockedSubscriptionException _ -> "com.amazonaws.shield#LockedSubscriptionException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "LockedSubscriptionException" ->
          `LockedSubscriptionException
            (Json_deserializers.locked_subscription_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_subscription_request) =
    let input = Json_serializers.delete_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DeleteSubscription" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_subscription_response_of_yojson
      ~error_deserializer
end

module DescribeAttack = struct
  let error_to_string = function
    | `AccessDeniedException _ -> "com.amazonaws.shield#AccessDeniedException"
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedException" ->
          `AccessDeniedException (Json_deserializers.access_denied_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_attack_request) =
    let input = Json_serializers.describe_attack_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeAttack" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_attack_response_of_yojson
      ~error_deserializer
end

module DescribeAttackStatistics = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_attack_statistics_request) =
    let input = Json_serializers.describe_attack_statistics_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeAttackStatistics"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_attack_statistics_response_of_yojson
      ~error_deserializer
end

module DescribeDRTAccess = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_drt_access_request) =
    let input = Json_serializers.describe_drt_access_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeDRTAccess" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_drt_access_response_of_yojson
      ~error_deserializer
end

module DescribeEmergencyContactSettings = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_emergency_contact_settings_request) =
    let input = Json_serializers.describe_emergency_contact_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.DescribeEmergencyContactSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_emergency_contact_settings_response_of_yojson
      ~error_deserializer
end

module DescribeProtection = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_protection_request) =
    let input = Json_serializers.describe_protection_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeProtection" ~service
      ~context ~input ~output_deserializer:Json_deserializers.describe_protection_response_of_yojson
      ~error_deserializer
end

module DescribeProtectionGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_protection_group_request) =
    let input = Json_serializers.describe_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeProtectionGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_protection_group_response_of_yojson
      ~error_deserializer
end

module DescribeSubscription = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_subscription_request) =
    let input = Json_serializers.describe_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DescribeSubscription"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_subscription_response_of_yojson
      ~error_deserializer
end

module DisableApplicationLayerAutomaticResponse = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_application_layer_automatic_response_request) =
    let input =
      Json_serializers.disable_application_layer_automatic_response_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.DisableApplicationLayerAutomaticResponse" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.disable_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
end

module DisableProactiveEngagement = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disable_proactive_engagement_request) =
    let input = Json_serializers.disable_proactive_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DisableProactiveEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disable_proactive_engagement_response_of_yojson
      ~error_deserializer
end

module DisassociateDRTLogBucket = struct
  let error_to_string = function
    | `AccessDeniedForDependencyException _ ->
        "com.amazonaws.shield#AccessDeniedForDependencyException"
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `NoAssociatedRoleException _ -> "com.amazonaws.shield#NoAssociatedRoleException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "AccessDeniedForDependencyException" ->
          `AccessDeniedForDependencyException
            (Json_deserializers.access_denied_for_dependency_exception_of_yojson tree path)
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "NoAssociatedRoleException" ->
          `NoAssociatedRoleException
            (Json_deserializers.no_associated_role_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_drt_log_bucket_request) =
    let input = Json_serializers.disassociate_drt_log_bucket_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DisassociateDRTLogBucket"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_drt_log_bucket_response_of_yojson
      ~error_deserializer
end

module DisassociateDRTRole = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_drt_role_request) =
    let input = Json_serializers.disassociate_drt_role_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DisassociateDRTRole"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_drt_role_response_of_yojson
      ~error_deserializer
end

module DisassociateHealthCheck = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_health_check_request) =
    let input = Json_serializers.disassociate_health_check_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.DisassociateHealthCheck"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_health_check_response_of_yojson
      ~error_deserializer
end

module EnableApplicationLayerAutomaticResponse = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `LimitsExceededException _ -> "com.amazonaws.shield#LimitsExceededException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LimitsExceededException" ->
          `LimitsExceededException
            (Json_deserializers.limits_exceeded_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_application_layer_automatic_response_request) =
    let input =
      Json_serializers.enable_application_layer_automatic_response_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.EnableApplicationLayerAutomaticResponse" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.enable_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
end

module EnableProactiveEngagement = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : enable_proactive_engagement_request) =
    let input = Json_serializers.enable_proactive_engagement_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.EnableProactiveEngagement"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.enable_proactive_engagement_response_of_yojson
      ~error_deserializer
end

module GetSubscriptionState = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_subscription_state_request) =
    let input = Json_serializers.get_subscription_state_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.GetSubscriptionState"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_subscription_state_response_of_yojson
      ~error_deserializer
end

module ListAttacks = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_attacks_request) =
    let input = Json_serializers.list_attacks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.ListAttacks" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_attacks_response_of_yojson
      ~error_deserializer
end

module ListProtectionGroups = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidPaginationTokenException _ -> "com.amazonaws.shield#InvalidPaginationTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_protection_groups_request) =
    let input = Json_serializers.list_protection_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.ListProtectionGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_protection_groups_response_of_yojson
      ~error_deserializer
end

module ListProtections = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidPaginationTokenException _ -> "com.amazonaws.shield#InvalidPaginationTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_protections_request) =
    let input = Json_serializers.list_protections_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.ListProtections" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_protections_response_of_yojson
      ~error_deserializer
end

module ListResourcesInProtectionGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidPaginationTokenException _ -> "com.amazonaws.shield#InvalidPaginationTokenException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidPaginationTokenException" ->
          `InvalidPaginationTokenException
            (Json_deserializers.invalid_pagination_token_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_in_protection_group_request) =
    let input = Json_serializers.list_resources_in_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.ListResourcesInProtectionGroup" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_in_protection_group_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.ListTagsForResource"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.TagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `InvalidResourceException _ -> "com.amazonaws.shield#InvalidResourceException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "InvalidResourceException" ->
          `InvalidResourceException
            (Json_deserializers.invalid_resource_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateApplicationLayerAutomaticResponse = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidOperationException _ -> "com.amazonaws.shield#InvalidOperationException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidOperationException" ->
          `InvalidOperationException
            (Json_deserializers.invalid_operation_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_application_layer_automatic_response_request) =
    let input =
      Json_serializers.update_application_layer_automatic_response_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.UpdateApplicationLayerAutomaticResponse" ~service ~context
      ~input
      ~output_deserializer:
        Json_deserializers.update_application_layer_automatic_response_response_of_yojson
      ~error_deserializer
end

module UpdateEmergencyContactSettings = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_emergency_contact_settings_request) =
    let input = Json_serializers.update_emergency_contact_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSShield_20160616.UpdateEmergencyContactSettings" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_emergency_contact_settings_response_of_yojson
      ~error_deserializer
end

module UpdateProtectionGroup = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_protection_group_request) =
    let input = Json_serializers.update_protection_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.UpdateProtectionGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_protection_group_response_of_yojson
      ~error_deserializer
end

module UpdateSubscription = struct
  let error_to_string = function
    | `InternalErrorException _ -> "com.amazonaws.shield#InternalErrorException"
    | `InvalidParameterException _ -> "com.amazonaws.shield#InvalidParameterException"
    | `LockedSubscriptionException _ -> "com.amazonaws.shield#LockedSubscriptionException"
    | `OptimisticLockException _ -> "com.amazonaws.shield#OptimisticLockException"
    | `ResourceNotFoundException _ -> "com.amazonaws.shield#ResourceNotFoundException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "InternalErrorException" ->
          `InternalErrorException (Json_deserializers.internal_error_exception_of_yojson tree path)
      | _, "InvalidParameterException" ->
          `InvalidParameterException
            (Json_deserializers.invalid_parameter_exception_of_yojson tree path)
      | _, "LockedSubscriptionException" ->
          `LockedSubscriptionException
            (Json_deserializers.locked_subscription_exception_of_yojson tree path)
      | _, "OptimisticLockException" ->
          `OptimisticLockException
            (Json_deserializers.optimistic_lock_exception_of_yojson tree path)
      | _, "ResourceNotFoundException" ->
          `ResourceNotFoundException
            (Json_deserializers.resource_not_found_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_subscription_request) =
    let input = Json_serializers.update_subscription_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSShield_20160616.UpdateSubscription" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_subscription_response_of_yojson
      ~error_deserializer
end
