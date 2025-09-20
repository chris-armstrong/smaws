open Types
open Service_metadata

module AssociateWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_web_acl_request) =
    let input = Json_serializers.associate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.AssociateWebACL" ~service
      ~context ~input ~output_deserializer:Json_deserializers.associate_web_acl_response_of_yojson
      ~error_deserializer
end

module CheckCapacity = struct
  let error_to_string = function
    | `WAFExpiredManagedRuleGroupVersionException _ ->
        "com.amazonaws.wafv2#WAFExpiredManagedRuleGroupVersionException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFSubscriptionNotFoundException _ -> "com.amazonaws.wafv2#WAFSubscriptionNotFoundException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFExpiredManagedRuleGroupVersionException" ->
          `WAFExpiredManagedRuleGroupVersionException
            (Json_deserializers.waf_expired_managed_rule_group_version_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : check_capacity_request) =
    let input = Json_serializers.check_capacity_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CheckCapacity" ~service
      ~context ~input ~output_deserializer:Json_deserializers.check_capacity_response_of_yojson
      ~error_deserializer
end

module CreateAPIKey = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_api_key_request) =
    let input = Json_serializers.create_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CreateAPIKey" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_api_key_response_of_yojson
      ~error_deserializer
end

module CreateIPSet = struct
  let error_to_string = function
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_ip_set_request) =
    let input = Json_serializers.create_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CreateIPSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_ip_set_response_of_yojson
      ~error_deserializer
end

module CreateRegexPatternSet = struct
  let error_to_string = function
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_regex_pattern_set_request) =
    let input = Json_serializers.create_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CreateRegexPatternSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.create_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module CreateRuleGroup = struct
  let error_to_string = function
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFSubscriptionNotFoundException _ -> "com.amazonaws.wafv2#WAFSubscriptionNotFoundException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_rule_group_request) =
    let input = Json_serializers.create_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CreateRuleGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.create_rule_group_response_of_yojson
      ~error_deserializer
end

module CreateWebACL = struct
  let error_to_string = function
    | `WAFConfigurationWarningException _ -> "com.amazonaws.wafv2#WAFConfigurationWarningException"
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFExpiredManagedRuleGroupVersionException _ ->
        "com.amazonaws.wafv2#WAFExpiredManagedRuleGroupVersionException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFSubscriptionNotFoundException _ -> "com.amazonaws.wafv2#WAFSubscriptionNotFoundException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFConfigurationWarningException" ->
          `WAFConfigurationWarningException
            (Json_deserializers.waf_configuration_warning_exception_of_yojson tree path)
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFExpiredManagedRuleGroupVersionException" ->
          `WAFExpiredManagedRuleGroupVersionException
            (Json_deserializers.waf_expired_managed_rule_group_version_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_web_acl_request) =
    let input = Json_serializers.create_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.CreateWebACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.create_web_acl_response_of_yojson
      ~error_deserializer
end

module DeleteAPIKey = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_api_key_request) =
    let input = Json_serializers.delete_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteAPIKey" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_api_key_response_of_yojson
      ~error_deserializer
end

module DeleteFirewallManagerRuleGroups = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_firewall_manager_rule_groups_request) =
    let input = Json_serializers.delete_firewall_manager_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_20190729.DeleteFirewallManagerRuleGroups" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_firewall_manager_rule_groups_response_of_yojson
      ~error_deserializer
end

module DeleteIPSet = struct
  let error_to_string = function
    | `WAFAssociatedItemException _ -> "com.amazonaws.wafv2#WAFAssociatedItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFAssociatedItemException" ->
          `WAFAssociatedItemException
            (Json_deserializers.waf_associated_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_ip_set_request) =
    let input = Json_serializers.delete_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteIPSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_ip_set_response_of_yojson
      ~error_deserializer
end

module DeleteLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_logging_configuration_request) =
    let input = Json_serializers.delete_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteLoggingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_logging_configuration_response_of_yojson
      ~error_deserializer
end

module DeletePermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_permission_policy_request) =
    let input = Json_serializers.delete_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeletePermissionPolicy"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_permission_policy_response_of_yojson
      ~error_deserializer
end

module DeleteRegexPatternSet = struct
  let error_to_string = function
    | `WAFAssociatedItemException _ -> "com.amazonaws.wafv2#WAFAssociatedItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFAssociatedItemException" ->
          `WAFAssociatedItemException
            (Json_deserializers.waf_associated_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_regex_pattern_set_request) =
    let input = Json_serializers.delete_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteRegexPatternSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.delete_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module DeleteRuleGroup = struct
  let error_to_string = function
    | `WAFAssociatedItemException _ -> "com.amazonaws.wafv2#WAFAssociatedItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFAssociatedItemException" ->
          `WAFAssociatedItemException
            (Json_deserializers.waf_associated_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_rule_group_request) =
    let input = Json_serializers.delete_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteRuleGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.delete_rule_group_response_of_yojson
      ~error_deserializer
end

module DeleteWebACL = struct
  let error_to_string = function
    | `WAFAssociatedItemException _ -> "com.amazonaws.wafv2#WAFAssociatedItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFAssociatedItemException" ->
          `WAFAssociatedItemException
            (Json_deserializers.waf_associated_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_web_acl_request) =
    let input = Json_serializers.delete_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DeleteWebACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.delete_web_acl_response_of_yojson
      ~error_deserializer
end

module DescribeAllManagedProducts = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_all_managed_products_request) =
    let input = Json_serializers.describe_all_managed_products_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DescribeAllManagedProducts"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_all_managed_products_response_of_yojson
      ~error_deserializer
end

module DescribeManagedProductsByVendor = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_managed_products_by_vendor_request) =
    let input = Json_serializers.describe_managed_products_by_vendor_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_20190729.DescribeManagedProductsByVendor" ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_managed_products_by_vendor_response_of_yojson
      ~error_deserializer
end

module DescribeManagedRuleGroup = struct
  let error_to_string = function
    | `WAFExpiredManagedRuleGroupVersionException _ ->
        "com.amazonaws.wafv2#WAFExpiredManagedRuleGroupVersionException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFExpiredManagedRuleGroupVersionException" ->
          `WAFExpiredManagedRuleGroupVersionException
            (Json_deserializers.waf_expired_managed_rule_group_version_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : describe_managed_rule_group_request) =
    let input = Json_serializers.describe_managed_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DescribeManagedRuleGroup"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.describe_managed_rule_group_response_of_yojson
      ~error_deserializer
end

module DisassociateWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_web_acl_request) =
    let input = Json_serializers.disassociate_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.DisassociateWebACL" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.disassociate_web_acl_response_of_yojson
      ~error_deserializer
end

module GenerateMobileSdkReleaseUrl = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : generate_mobile_sdk_release_url_request) =
    let input = Json_serializers.generate_mobile_sdk_release_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GenerateMobileSdkReleaseUrl"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.generate_mobile_sdk_release_url_response_of_yojson
      ~error_deserializer
end

module GetDecryptedAPIKey = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_decrypted_api_key_request) =
    let input = Json_serializers.get_decrypted_api_key_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetDecryptedAPIKey" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_decrypted_api_key_response_of_yojson
      ~error_deserializer
end

module GetIPSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_ip_set_request) =
    let input = Json_serializers.get_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetIPSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_ip_set_response_of_yojson
      ~error_deserializer
end

module GetLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_logging_configuration_request) =
    let input = Json_serializers.get_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetLoggingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_logging_configuration_response_of_yojson
      ~error_deserializer
end

module GetManagedRuleSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_managed_rule_set_request) =
    let input = Json_serializers.get_managed_rule_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetManagedRuleSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_managed_rule_set_response_of_yojson
      ~error_deserializer
end

module GetMobileSdkRelease = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_mobile_sdk_release_request) =
    let input = Json_serializers.get_mobile_sdk_release_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetMobileSdkRelease" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_mobile_sdk_release_response_of_yojson
      ~error_deserializer
end

module GetPermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_permission_policy_request) =
    let input = Json_serializers.get_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetPermissionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_permission_policy_response_of_yojson
      ~error_deserializer
end

module GetRateBasedStatementManagedKeys = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFUnsupportedAggregateKeyTypeException _ ->
        "com.amazonaws.wafv2#WAFUnsupportedAggregateKeyTypeException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFUnsupportedAggregateKeyTypeException" ->
          `WAFUnsupportedAggregateKeyTypeException
            (Json_deserializers.waf_unsupported_aggregate_key_type_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rate_based_statement_managed_keys_request) =
    let input = Json_serializers.get_rate_based_statement_managed_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_20190729.GetRateBasedStatementManagedKeys" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.get_rate_based_statement_managed_keys_response_of_yojson
      ~error_deserializer
end

module GetRegexPatternSet = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_regex_pattern_set_request) =
    let input = Json_serializers.get_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetRegexPatternSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module GetRuleGroup = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_rule_group_request) =
    let input = Json_serializers.get_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetRuleGroup" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_rule_group_response_of_yojson
      ~error_deserializer
end

module GetSampledRequests = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_sampled_requests_request) =
    let input = Json_serializers.get_sampled_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetSampledRequests" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_sampled_requests_response_of_yojson
      ~error_deserializer
end

module GetWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_web_acl_request) =
    let input = Json_serializers.get_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetWebACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.get_web_acl_response_of_yojson
      ~error_deserializer
end

module GetWebACLForResource = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_web_acl_for_resource_request) =
    let input = Json_serializers.get_web_acl_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.GetWebACLForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.get_web_acl_for_resource_response_of_yojson
      ~error_deserializer
end

module ListAPIKeys = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_api_keys_request) =
    let input = Json_serializers.list_api_keys_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListAPIKeys" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_api_keys_response_of_yojson
      ~error_deserializer
end

module ListAvailableManagedRuleGroupVersions = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_managed_rule_group_versions_request) =
    let input =
      Json_serializers.list_available_managed_rule_group_versions_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_20190729.ListAvailableManagedRuleGroupVersions" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.list_available_managed_rule_group_versions_response_of_yojson
      ~error_deserializer
end

module ListAvailableManagedRuleGroups = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_available_managed_rule_groups_request) =
    let input = Json_serializers.list_available_managed_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListAvailableManagedRuleGroups"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_available_managed_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListIPSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_ip_sets_request) =
    let input = Json_serializers.list_ip_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListIPSets" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_ip_sets_response_of_yojson
      ~error_deserializer
end

module ListLoggingConfigurations = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_logging_configurations_request) =
    let input = Json_serializers.list_logging_configurations_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListLoggingConfigurations"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_logging_configurations_response_of_yojson
      ~error_deserializer
end

module ListManagedRuleSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_managed_rule_sets_request) =
    let input = Json_serializers.list_managed_rule_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListManagedRuleSets" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_managed_rule_sets_response_of_yojson
      ~error_deserializer
end

module ListMobileSdkReleases = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_mobile_sdk_releases_request) =
    let input = Json_serializers.list_mobile_sdk_releases_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListMobileSdkReleases" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_mobile_sdk_releases_response_of_yojson
      ~error_deserializer
end

module ListRegexPatternSets = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_regex_pattern_sets_request) =
    let input = Json_serializers.list_regex_pattern_sets_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListRegexPatternSets" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_regex_pattern_sets_response_of_yojson
      ~error_deserializer
end

module ListResourcesForWebACL = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_resources_for_web_acl_request) =
    let input = Json_serializers.list_resources_for_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListResourcesForWebACL"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_resources_for_web_acl_response_of_yojson
      ~error_deserializer
end

module ListRuleGroups = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_rule_groups_request) =
    let input = Json_serializers.list_rule_groups_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListRuleGroups" ~service
      ~context ~input ~output_deserializer:Json_deserializers.list_rule_groups_response_of_yojson
      ~error_deserializer
end

module ListTagsForResource = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_tags_for_resource_request) =
    let input = Json_serializers.list_tags_for_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListTagsForResource" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.list_tags_for_resource_response_of_yojson
      ~error_deserializer
end

module ListWebACLs = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_web_ac_ls_request) =
    let input = Json_serializers.list_web_ac_ls_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.ListWebACLs" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_web_ac_ls_response_of_yojson
      ~error_deserializer
end

module PutLoggingConfiguration = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFLogDestinationPermissionIssueException _ ->
        "com.amazonaws.wafv2#WAFLogDestinationPermissionIssueException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFServiceLinkedRoleErrorException _ ->
        "com.amazonaws.wafv2#WAFServiceLinkedRoleErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFLogDestinationPermissionIssueException" ->
          `WAFLogDestinationPermissionIssueException
            (Json_deserializers.waf_log_destination_permission_issue_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFServiceLinkedRoleErrorException" ->
          `WAFServiceLinkedRoleErrorException
            (Json_deserializers.waf_service_linked_role_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_logging_configuration_request) =
    let input = Json_serializers.put_logging_configuration_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.PutLoggingConfiguration"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_logging_configuration_response_of_yojson
      ~error_deserializer
end

module PutManagedRuleSetVersions = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_managed_rule_set_versions_request) =
    let input = Json_serializers.put_managed_rule_set_versions_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.PutManagedRuleSetVersions"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.put_managed_rule_set_versions_response_of_yojson
      ~error_deserializer
end

module PutPermissionPolicy = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidPermissionPolicyException _ ->
        "com.amazonaws.wafv2#WAFInvalidPermissionPolicyException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidPermissionPolicyException" ->
          `WAFInvalidPermissionPolicyException
            (Json_deserializers.waf_invalid_permission_policy_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : put_permission_policy_request) =
    let input = Json_serializers.put_permission_policy_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.PutPermissionPolicy" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.put_permission_policy_response_of_yojson
      ~error_deserializer
end

module TagResource = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : tag_resource_request) =
    let input = Json_serializers.tag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.TagResource" ~service ~context
      ~input ~output_deserializer:Json_deserializers.tag_resource_response_of_yojson
      ~error_deserializer
end

module UntagResource = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFTagOperationException _ -> "com.amazonaws.wafv2#WAFTagOperationException"
    | `WAFTagOperationInternalErrorException _ ->
        "com.amazonaws.wafv2#WAFTagOperationInternalErrorException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFTagOperationException" ->
          `WAFTagOperationException
            (Json_deserializers.waf_tag_operation_exception_of_yojson tree path)
      | _, "WAFTagOperationInternalErrorException" ->
          `WAFTagOperationInternalErrorException
            (Json_deserializers.waf_tag_operation_internal_error_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : untag_resource_request) =
    let input = Json_serializers.untag_resource_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.UntagResource" ~service
      ~context ~input ~output_deserializer:Json_deserializers.untag_resource_response_of_yojson
      ~error_deserializer
end

module UpdateIPSet = struct
  let error_to_string = function
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_ip_set_request) =
    let input = Json_serializers.update_ip_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.UpdateIPSet" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_ip_set_response_of_yojson
      ~error_deserializer
end

module UpdateManagedRuleSetVersionExpiryDate = struct
  let error_to_string = function
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_managed_rule_set_version_expiry_date_request) =
    let input =
      Json_serializers.update_managed_rule_set_version_expiry_date_request_to_yojson request
    in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"AWSWAF_20190729.UpdateManagedRuleSetVersionExpiryDate" ~service ~context ~input
      ~output_deserializer:
        Json_deserializers.update_managed_rule_set_version_expiry_date_response_of_yojson
      ~error_deserializer
end

module UpdateRegexPatternSet = struct
  let error_to_string = function
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_regex_pattern_set_request) =
    let input = Json_serializers.update_regex_pattern_set_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.UpdateRegexPatternSet" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.update_regex_pattern_set_response_of_yojson
      ~error_deserializer
end

module UpdateRuleGroup = struct
  let error_to_string = function
    | `WAFConfigurationWarningException _ -> "com.amazonaws.wafv2#WAFConfigurationWarningException"
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFSubscriptionNotFoundException _ -> "com.amazonaws.wafv2#WAFSubscriptionNotFoundException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFConfigurationWarningException" ->
          `WAFConfigurationWarningException
            (Json_deserializers.waf_configuration_warning_exception_of_yojson tree path)
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_rule_group_request) =
    let input = Json_serializers.update_rule_group_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.UpdateRuleGroup" ~service
      ~context ~input ~output_deserializer:Json_deserializers.update_rule_group_response_of_yojson
      ~error_deserializer
end

module UpdateWebACL = struct
  let error_to_string = function
    | `WAFConfigurationWarningException _ -> "com.amazonaws.wafv2#WAFConfigurationWarningException"
    | `WAFDuplicateItemException _ -> "com.amazonaws.wafv2#WAFDuplicateItemException"
    | `WAFExpiredManagedRuleGroupVersionException _ ->
        "com.amazonaws.wafv2#WAFExpiredManagedRuleGroupVersionException"
    | `WAFInternalErrorException _ -> "com.amazonaws.wafv2#WAFInternalErrorException"
    | `WAFInvalidOperationException _ -> "com.amazonaws.wafv2#WAFInvalidOperationException"
    | `WAFInvalidParameterException _ -> "com.amazonaws.wafv2#WAFInvalidParameterException"
    | `WAFInvalidResourceException _ -> "com.amazonaws.wafv2#WAFInvalidResourceException"
    | `WAFLimitsExceededException _ -> "com.amazonaws.wafv2#WAFLimitsExceededException"
    | `WAFNonexistentItemException _ -> "com.amazonaws.wafv2#WAFNonexistentItemException"
    | `WAFOptimisticLockException _ -> "com.amazonaws.wafv2#WAFOptimisticLockException"
    | `WAFSubscriptionNotFoundException _ -> "com.amazonaws.wafv2#WAFSubscriptionNotFoundException"
    | `WAFUnavailableEntityException _ -> "com.amazonaws.wafv2#WAFUnavailableEntityException"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "WAFConfigurationWarningException" ->
          `WAFConfigurationWarningException
            (Json_deserializers.waf_configuration_warning_exception_of_yojson tree path)
      | _, "WAFDuplicateItemException" ->
          `WAFDuplicateItemException
            (Json_deserializers.waf_duplicate_item_exception_of_yojson tree path)
      | _, "WAFExpiredManagedRuleGroupVersionException" ->
          `WAFExpiredManagedRuleGroupVersionException
            (Json_deserializers.waf_expired_managed_rule_group_version_exception_of_yojson tree path)
      | _, "WAFInternalErrorException" ->
          `WAFInternalErrorException
            (Json_deserializers.waf_internal_error_exception_of_yojson tree path)
      | _, "WAFInvalidOperationException" ->
          `WAFInvalidOperationException
            (Json_deserializers.waf_invalid_operation_exception_of_yojson tree path)
      | _, "WAFInvalidParameterException" ->
          `WAFInvalidParameterException
            (Json_deserializers.waf_invalid_parameter_exception_of_yojson tree path)
      | _, "WAFInvalidResourceException" ->
          `WAFInvalidResourceException
            (Json_deserializers.waf_invalid_resource_exception_of_yojson tree path)
      | _, "WAFLimitsExceededException" ->
          `WAFLimitsExceededException
            (Json_deserializers.waf_limits_exceeded_exception_of_yojson tree path)
      | _, "WAFNonexistentItemException" ->
          `WAFNonexistentItemException
            (Json_deserializers.waf_nonexistent_item_exception_of_yojson tree path)
      | _, "WAFOptimisticLockException" ->
          `WAFOptimisticLockException
            (Json_deserializers.waf_optimistic_lock_exception_of_yojson tree path)
      | _, "WAFSubscriptionNotFoundException" ->
          `WAFSubscriptionNotFoundException
            (Json_deserializers.waf_subscription_not_found_exception_of_yojson tree path)
      | _, "WAFUnavailableEntityException" ->
          `WAFUnavailableEntityException
            (Json_deserializers.waf_unavailable_entity_exception_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_web_acl_request) =
    let input = Json_serializers.update_web_acl_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"AWSWAF_20190729.UpdateWebACL" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_web_acl_response_of_yojson
      ~error_deserializer
end
