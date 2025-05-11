open Types
module AssociateDRTLogBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedForDependencyException") ->
              `AccessDeniedForDependencyException
                (access_denied_for_dependency_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitsExceededException") ->
              `LimitsExceededException
                (limits_exceeded_exception_of_yojson tree path)
          | (_, "NoAssociatedRoleException") ->
              `NoAssociatedRoleException
                (no_associated_role_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_drt_log_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_drt_log_bucket_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616AssociateDRTLogBucket" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_drt_log_bucket_response_of_yojson
            ~error_deserializer
  end
module AssociateDRTRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedForDependencyException") ->
              `AccessDeniedForDependencyException
                (access_denied_for_dependency_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_drt_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_drt_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616AssociateDRTRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_drt_role_response_of_yojson
            ~error_deserializer
  end
module AssociateHealthCheck =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "LimitsExceededException") ->
              `LimitsExceededException
                (limits_exceeded_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_health_check_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_health_check_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616AssociateHealthCheck" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_health_check_response_of_yojson
            ~error_deserializer
  end
module AssociateProactiveEngagementDetails =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : associate_proactive_engagement_details_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.associate_proactive_engagement_details_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616AssociateProactiveEngagementDetails"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:associate_proactive_engagement_details_response_of_yojson
            ~error_deserializer
  end
module CreateProtection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "LimitsExceededException") ->
              `LimitsExceededException
                (limits_exceeded_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_protection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_protection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616CreateProtection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_protection_response_of_yojson
            ~error_deserializer
  end
module CreateProtectionGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitsExceededException") ->
              `LimitsExceededException
                (limits_exceeded_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_protection_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_protection_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616CreateProtectionGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_protection_group_response_of_yojson
            ~error_deserializer
  end
module CreateSubscription =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceAlreadyExistsException") ->
              `ResourceAlreadyExistsException
                (resource_already_exists_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_subscription_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_subscription_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616CreateSubscription" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:create_subscription_response_of_yojson
            ~error_deserializer
  end
module DeleteProtection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_protection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_protection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DeleteProtection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_protection_response_of_yojson
            ~error_deserializer
  end
module DeleteProtectionGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_protection_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_protection_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DeleteProtectionGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_protection_group_response_of_yojson
            ~error_deserializer
  end
module DeleteSubscription =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "LockedSubscriptionException") ->
              `LockedSubscriptionException
                (locked_subscription_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_subscription_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_subscription_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DeleteSubscription" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:delete_subscription_response_of_yojson
            ~error_deserializer
  end
module DescribeAttack =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedException") ->
              `AccessDeniedException
                (access_denied_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_attack_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.describe_attack_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeAttack" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_attack_response_of_yojson
            ~error_deserializer
  end
module DescribeAttackStatistics =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_attack_statistics_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_attack_statistics_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeAttackStatistics" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_attack_statistics_response_of_yojson
            ~error_deserializer
  end
module DescribeDRTAccess =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_drt_access_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_drt_access_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeDRTAccess" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_drt_access_response_of_yojson
            ~error_deserializer
  end
module DescribeEmergencyContactSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_emergency_contact_settings_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_emergency_contact_settings_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeEmergencyContactSettings"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_emergency_contact_settings_response_of_yojson
            ~error_deserializer
  end
module DescribeProtection =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_protection_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_protection_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeProtection" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_protection_response_of_yojson
            ~error_deserializer
  end
module DescribeProtectionGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_protection_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_protection_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeProtectionGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_protection_group_response_of_yojson
            ~error_deserializer
  end
module DescribeSubscription =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_subscription_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_subscription_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DescribeSubscription" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:describe_subscription_response_of_yojson
            ~error_deserializer
  end
module DisableApplicationLayerAutomaticResponse =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : disable_application_layer_automatic_response_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disable_application_layer_automatic_response_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DisableApplicationLayerAutomaticResponse"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disable_application_layer_automatic_response_response_of_yojson
            ~error_deserializer
  end
module DisableProactiveEngagement =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disable_proactive_engagement_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disable_proactive_engagement_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DisableProactiveEngagement"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:disable_proactive_engagement_response_of_yojson
            ~error_deserializer
  end
module DisassociateDRTLogBucket =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "AccessDeniedForDependencyException") ->
              `AccessDeniedForDependencyException
                (access_denied_for_dependency_exception_of_yojson tree path)
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "NoAssociatedRoleException") ->
              `NoAssociatedRoleException
                (no_associated_role_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_drt_log_bucket_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_drt_log_bucket_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DisassociateDRTLogBucket" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_drt_log_bucket_response_of_yojson
            ~error_deserializer
  end
module DisassociateDRTRole =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_drt_role_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_drt_role_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DisassociateDRTRole" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_drt_role_response_of_yojson
            ~error_deserializer
  end
module DisassociateHealthCheck =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_health_check_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_health_check_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616DisassociateHealthCheck" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:disassociate_health_check_response_of_yojson
            ~error_deserializer
  end
module EnableApplicationLayerAutomaticResponse =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LimitsExceededException") ->
              `LimitsExceededException
                (limits_exceeded_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : enable_application_layer_automatic_response_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.enable_application_layer_automatic_response_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616EnableApplicationLayerAutomaticResponse"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:enable_application_layer_automatic_response_response_of_yojson
            ~error_deserializer
  end
module EnableProactiveEngagement =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : enable_proactive_engagement_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.enable_proactive_engagement_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616EnableProactiveEngagement"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:enable_proactive_engagement_response_of_yojson
            ~error_deserializer
  end
module GetSubscriptionState =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_subscription_state_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_subscription_state_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616GetSubscriptionState" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:get_subscription_state_response_of_yojson
            ~error_deserializer
  end
module ListAttacks =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_attacks_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_attacks_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616ListAttacks" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_attacks_response_of_yojson
            ~error_deserializer
  end
module ListProtectionGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidPaginationTokenException") ->
              `InvalidPaginationTokenException
                (invalid_pagination_token_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_protection_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_protection_groups_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616ListProtectionGroups" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_protection_groups_response_of_yojson
            ~error_deserializer
  end
module ListProtections =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidPaginationTokenException") ->
              `InvalidPaginationTokenException
                (invalid_pagination_token_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_protections_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_protections_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616ListProtections" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_protections_response_of_yojson
            ~error_deserializer
  end
module ListResourcesInProtectionGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidPaginationTokenException") ->
              `InvalidPaginationTokenException
                (invalid_pagination_token_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_resources_in_protection_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resources_in_protection_group_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616ListResourcesInProtectionGroup"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_resources_in_protection_group_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_tags_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_tags_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616ListTagsForResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616TagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "InvalidResourceException") ->
              `InvalidResourceException
                (invalid_resource_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616UntagResource" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateApplicationLayerAutomaticResponse =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidOperationException") ->
              `InvalidOperationException
                (invalid_operation_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_application_layer_automatic_response_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_application_layer_automatic_response_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616UpdateApplicationLayerAutomaticResponse"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_application_layer_automatic_response_response_of_yojson
            ~error_deserializer
  end
module UpdateEmergencyContactSettings =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_emergency_contact_settings_request)
      =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_emergency_contact_settings_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616UpdateEmergencyContactSettings"
            ~service ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_emergency_contact_settings_response_of_yojson
            ~error_deserializer
  end
module UpdateProtectionGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_protection_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_protection_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616UpdateProtectionGroup" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_protection_group_response_of_yojson
            ~error_deserializer
  end
module UpdateSubscription =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "InternalErrorException") ->
              `InternalErrorException
                (internal_error_exception_of_yojson tree path)
          | (_, "InvalidParameterException") ->
              `InvalidParameterException
                (invalid_parameter_exception_of_yojson tree path)
          | (_, "LockedSubscriptionException") ->
              `LockedSubscriptionException
                (locked_subscription_exception_of_yojson tree path)
          | (_, "OptimisticLockException") ->
              `OptimisticLockException
                (optimistic_lock_exception_of_yojson tree path)
          | (_, "ResourceNotFoundException") ->
              `ResourceNotFoundException
                (resource_not_found_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_subscription_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_subscription_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request
            ~shape_name:"AWSShield_20160616UpdateSubscription" ~service
            ~config:context.config ~http:context.http ~input
            ~output_deserializer:update_subscription_response_of_yojson
            ~error_deserializer
  end