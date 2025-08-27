open Types
open Service_metadata
module AssociateWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : associate_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.associate_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729AssociateWebACL"
            ~service ~config:context.config ~input
            ~output_deserializer:associate_web_acl_response_of_yojson
            ~error_deserializer
  end
module CheckCapacity =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFExpiredManagedRuleGroupVersionException") ->
              `WAFExpiredManagedRuleGroupVersionException
                (waf_expired_managed_rule_group_version_exception_of_yojson
                   tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFSubscriptionNotFoundException") ->
              `WAFSubscriptionNotFoundException
                (waf_subscription_not_found_exception_of_yojson tree path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : check_capacity_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.check_capacity_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729CheckCapacity"
            ~service ~config:context.config ~input
            ~output_deserializer:check_capacity_response_of_yojson
            ~error_deserializer
  end
module CreateAPIKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_api_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_api_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729CreateAPIKey"
            ~service ~config:context.config ~input
            ~output_deserializer:create_api_key_response_of_yojson
            ~error_deserializer
  end
module CreateIPSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_ip_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_ip_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729CreateIPSet"
            ~service ~config:context.config ~input
            ~output_deserializer:create_ip_set_response_of_yojson
            ~error_deserializer
  end
module CreateRegexPatternSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_regex_pattern_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.create_regex_pattern_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729CreateRegexPatternSet" ~service
            ~config:context.config ~input
            ~output_deserializer:create_regex_pattern_set_response_of_yojson
            ~error_deserializer
  end
module CreateRuleGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFSubscriptionNotFoundException") ->
              `WAFSubscriptionNotFoundException
                (waf_subscription_not_found_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_rule_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_rule_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729CreateRuleGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:create_rule_group_response_of_yojson
            ~error_deserializer
  end
module CreateWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFConfigurationWarningException") ->
              `WAFConfigurationWarningException
                (waf_configuration_warning_exception_of_yojson tree path)
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFExpiredManagedRuleGroupVersionException") ->
              `WAFExpiredManagedRuleGroupVersionException
                (waf_expired_managed_rule_group_version_exception_of_yojson
                   tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFSubscriptionNotFoundException") ->
              `WAFSubscriptionNotFoundException
                (waf_subscription_not_found_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : create_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.create_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729CreateWebACL"
            ~service ~config:context.config ~input
            ~output_deserializer:create_web_acl_response_of_yojson
            ~error_deserializer
  end
module DeleteAPIKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_api_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_api_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729DeleteAPIKey"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_api_key_response_of_yojson
            ~error_deserializer
  end
module DeleteFirewallManagerRuleGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : delete_firewall_manager_rule_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_firewall_manager_rule_groups_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DeleteFirewallManagerRuleGroups"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_firewall_manager_rule_groups_response_of_yojson
            ~error_deserializer
  end
module DeleteIPSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFAssociatedItemException") ->
              `WAFAssociatedItemException
                (waf_associated_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_ip_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_ip_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729DeleteIPSet"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_ip_set_response_of_yojson
            ~error_deserializer
  end
module DeleteLoggingConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_logging_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_logging_configuration_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DeleteLoggingConfiguration" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_logging_configuration_response_of_yojson
            ~error_deserializer
  end
module DeletePermissionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_permission_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_permission_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DeletePermissionPolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_permission_policy_response_of_yojson
            ~error_deserializer
  end
module DeleteRegexPatternSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFAssociatedItemException") ->
              `WAFAssociatedItemException
                (waf_associated_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_regex_pattern_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.delete_regex_pattern_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DeleteRegexPatternSet" ~service
            ~config:context.config ~input
            ~output_deserializer:delete_regex_pattern_set_response_of_yojson
            ~error_deserializer
  end
module DeleteRuleGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFAssociatedItemException") ->
              `WAFAssociatedItemException
                (waf_associated_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_rule_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_rule_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729DeleteRuleGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_rule_group_response_of_yojson
            ~error_deserializer
  end
module DeleteWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFAssociatedItemException") ->
              `WAFAssociatedItemException
                (waf_associated_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : delete_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.delete_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729DeleteWebACL"
            ~service ~config:context.config ~input
            ~output_deserializer:delete_web_acl_response_of_yojson
            ~error_deserializer
  end
module DescribeAllManagedProducts =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_all_managed_products_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_all_managed_products_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DescribeAllManagedProducts" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_all_managed_products_response_of_yojson
            ~error_deserializer
  end
module DescribeManagedProductsByVendor =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : describe_managed_products_by_vendor_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_managed_products_by_vendor_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DescribeManagedProductsByVendor"
            ~service ~config:context.config ~input
            ~output_deserializer:describe_managed_products_by_vendor_response_of_yojson
            ~error_deserializer
  end
module DescribeManagedRuleGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFExpiredManagedRuleGroupVersionException") ->
              `WAFExpiredManagedRuleGroupVersionException
                (waf_expired_managed_rule_group_version_exception_of_yojson
                   tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : describe_managed_rule_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.describe_managed_rule_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DescribeManagedRuleGroup" ~service
            ~config:context.config ~input
            ~output_deserializer:describe_managed_rule_group_response_of_yojson
            ~error_deserializer
  end
module DisassociateWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : disassociate_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.disassociate_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729DisassociateWebACL" ~service
            ~config:context.config ~input
            ~output_deserializer:disassociate_web_acl_response_of_yojson
            ~error_deserializer
  end
module GenerateMobileSdkReleaseUrl =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : generate_mobile_sdk_release_url_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.generate_mobile_sdk_release_url_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GenerateMobileSdkReleaseUrl" ~service
            ~config:context.config ~input
            ~output_deserializer:generate_mobile_sdk_release_url_response_of_yojson
            ~error_deserializer
  end
module GetDecryptedAPIKey =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_decrypted_api_key_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_decrypted_api_key_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetDecryptedAPIKey" ~service
            ~config:context.config ~input
            ~output_deserializer:get_decrypted_api_key_response_of_yojson
            ~error_deserializer
  end
module GetIPSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_ip_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_ip_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729GetIPSet" ~service
            ~config:context.config ~input
            ~output_deserializer:get_ip_set_response_of_yojson
            ~error_deserializer
  end
module GetLoggingConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_logging_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_logging_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetLoggingConfiguration" ~service
            ~config:context.config ~input
            ~output_deserializer:get_logging_configuration_response_of_yojson
            ~error_deserializer
  end
module GetManagedRuleSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_managed_rule_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_managed_rule_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729GetManagedRuleSet"
            ~service ~config:context.config ~input
            ~output_deserializer:get_managed_rule_set_response_of_yojson
            ~error_deserializer
  end
module GetMobileSdkRelease =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_mobile_sdk_release_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_mobile_sdk_release_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetMobileSdkRelease" ~service
            ~config:context.config ~input
            ~output_deserializer:get_mobile_sdk_release_response_of_yojson
            ~error_deserializer
  end
module GetPermissionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_permission_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_permission_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetPermissionPolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:get_permission_policy_response_of_yojson
            ~error_deserializer
  end
module GetRateBasedStatementManagedKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFUnsupportedAggregateKeyTypeException") ->
              `WAFUnsupportedAggregateKeyTypeException
                (waf_unsupported_aggregate_key_type_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : get_rate_based_statement_managed_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_rate_based_statement_managed_keys_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetRateBasedStatementManagedKeys"
            ~service ~config:context.config ~input
            ~output_deserializer:get_rate_based_statement_managed_keys_response_of_yojson
            ~error_deserializer
  end
module GetRegexPatternSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_regex_pattern_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_regex_pattern_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetRegexPatternSet" ~service
            ~config:context.config ~input
            ~output_deserializer:get_regex_pattern_set_response_of_yojson
            ~error_deserializer
  end
module GetRuleGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_rule_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_rule_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729GetRuleGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:get_rule_group_response_of_yojson
            ~error_deserializer
  end
module GetSampledRequests =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_sampled_requests_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_sampled_requests_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetSampledRequests" ~service
            ~config:context.config ~input
            ~output_deserializer:get_sampled_requests_response_of_yojson
            ~error_deserializer
  end
module GetWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.get_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729GetWebACL"
            ~service ~config:context.config ~input
            ~output_deserializer:get_web_acl_response_of_yojson
            ~error_deserializer
  end
module GetWebACLForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : get_web_acl_for_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.get_web_acl_for_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729GetWebACLForResource" ~service
            ~config:context.config ~input
            ~output_deserializer:get_web_acl_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListAPIKeys =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_api_keys_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_api_keys_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729ListAPIKeys"
            ~service ~config:context.config ~input
            ~output_deserializer:list_api_keys_response_of_yojson
            ~error_deserializer
  end
module ListAvailableManagedRuleGroupVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_available_managed_rule_group_versions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_available_managed_rule_group_versions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListAvailableManagedRuleGroupVersions"
            ~service ~config:context.config ~input
            ~output_deserializer:list_available_managed_rule_group_versions_response_of_yojson
            ~error_deserializer
  end
module ListAvailableManagedRuleGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : list_available_managed_rule_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_available_managed_rule_groups_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListAvailableManagedRuleGroups"
            ~service ~config:context.config ~input
            ~output_deserializer:list_available_managed_rule_groups_response_of_yojson
            ~error_deserializer
  end
module ListIPSets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_ip_sets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_ip_sets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729ListIPSets"
            ~service ~config:context.config ~input
            ~output_deserializer:list_ip_sets_response_of_yojson
            ~error_deserializer
  end
module ListLoggingConfigurations =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_logging_configurations_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_logging_configurations_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListLoggingConfigurations" ~service
            ~config:context.config ~input
            ~output_deserializer:list_logging_configurations_response_of_yojson
            ~error_deserializer
  end
module ListManagedRuleSets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_managed_rule_sets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_managed_rule_sets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListManagedRuleSets" ~service
            ~config:context.config ~input
            ~output_deserializer:list_managed_rule_sets_response_of_yojson
            ~error_deserializer
  end
module ListMobileSdkReleases =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_mobile_sdk_releases_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_mobile_sdk_releases_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListMobileSdkReleases" ~service
            ~config:context.config ~input
            ~output_deserializer:list_mobile_sdk_releases_response_of_yojson
            ~error_deserializer
  end
module ListRegexPatternSets =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_regex_pattern_sets_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_regex_pattern_sets_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListRegexPatternSets" ~service
            ~config:context.config ~input
            ~output_deserializer:list_regex_pattern_sets_response_of_yojson
            ~error_deserializer
  end
module ListResourcesForWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_resources_for_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.list_resources_for_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListResourcesForWebACL" ~service
            ~config:context.config ~input
            ~output_deserializer:list_resources_for_web_acl_response_of_yojson
            ~error_deserializer
  end
module ListRuleGroups =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_rule_groups_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_rule_groups_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729ListRuleGroups"
            ~service ~config:context.config ~input
            ~output_deserializer:list_rule_groups_response_of_yojson
            ~error_deserializer
  end
module ListTagsForResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
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
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729ListTagsForResource" ~service
            ~config:context.config ~input
            ~output_deserializer:list_tags_for_resource_response_of_yojson
            ~error_deserializer
  end
module ListWebACLs =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : list_web_ac_ls_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.list_web_ac_ls_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729ListWebACLs"
            ~service ~config:context.config ~input
            ~output_deserializer:list_web_ac_ls_response_of_yojson
            ~error_deserializer
  end
module PutLoggingConfiguration =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFLogDestinationPermissionIssueException") ->
              `WAFLogDestinationPermissionIssueException
                (waf_log_destination_permission_issue_exception_of_yojson
                   tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFServiceLinkedRoleErrorException") ->
              `WAFServiceLinkedRoleErrorException
                (waf_service_linked_role_error_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_logging_configuration_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_logging_configuration_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729PutLoggingConfiguration" ~service
            ~config:context.config ~input
            ~output_deserializer:put_logging_configuration_response_of_yojson
            ~error_deserializer
  end
module PutManagedRuleSetVersions =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_managed_rule_set_versions_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_managed_rule_set_versions_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729PutManagedRuleSetVersions" ~service
            ~config:context.config ~input
            ~output_deserializer:put_managed_rule_set_versions_response_of_yojson
            ~error_deserializer
  end
module PutPermissionPolicy =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidPermissionPolicyException") ->
              `WAFInvalidPermissionPolicyException
                (waf_invalid_permission_policy_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : put_permission_policy_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.put_permission_policy_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729PutPermissionPolicy" ~service
            ~config:context.config ~input
            ~output_deserializer:put_permission_policy_response_of_yojson
            ~error_deserializer
  end
module TagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : tag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.tag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729TagResource"
            ~service ~config:context.config ~input
            ~output_deserializer:tag_resource_response_of_yojson
            ~error_deserializer
  end
module UntagResource =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFTagOperationException") ->
              `WAFTagOperationException
                (waf_tag_operation_exception_of_yojson tree path)
          | (_, "WAFTagOperationInternalErrorException") ->
              `WAFTagOperationInternalErrorException
                (waf_tag_operation_internal_error_exception_of_yojson tree
                   path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : untag_resource_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.untag_resource_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729UntagResource"
            ~service ~config:context.config ~input
            ~output_deserializer:untag_resource_response_of_yojson
            ~error_deserializer
  end
module UpdateIPSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_ip_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_ip_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729UpdateIPSet"
            ~service ~config:context.config ~input
            ~output_deserializer:update_ip_set_response_of_yojson
            ~error_deserializer
  end
module UpdateManagedRuleSetVersionExpiryDate =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context
      (request : update_managed_rule_set_version_expiry_date_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_managed_rule_set_version_expiry_date_request_to_yojson
              request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729UpdateManagedRuleSetVersionExpiryDate"
            ~service ~config:context.config ~input
            ~output_deserializer:update_managed_rule_set_version_expiry_date_response_of_yojson
            ~error_deserializer
  end
module UpdateRegexPatternSet =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_regex_pattern_set_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input =
            Serializers.update_regex_pattern_set_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http
            ~shape_name:"AWSWAF_20190729UpdateRegexPatternSet" ~service
            ~config:context.config ~input
            ~output_deserializer:update_regex_pattern_set_response_of_yojson
            ~error_deserializer
  end
module UpdateRuleGroup =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFConfigurationWarningException") ->
              `WAFConfigurationWarningException
                (waf_configuration_warning_exception_of_yojson tree path)
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFSubscriptionNotFoundException") ->
              `WAFSubscriptionNotFoundException
                (waf_subscription_not_found_exception_of_yojson tree path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_rule_group_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_rule_group_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729UpdateRuleGroup"
            ~service ~config:context.config ~input
            ~output_deserializer:update_rule_group_response_of_yojson
            ~error_deserializer
  end
module UpdateWebACL =
  struct
    let error_deserializer tree path =
      let open Deserializers in
        let handler handler tree path =
          function
          | (_, "WAFConfigurationWarningException") ->
              `WAFConfigurationWarningException
                (waf_configuration_warning_exception_of_yojson tree path)
          | (_, "WAFDuplicateItemException") ->
              `WAFDuplicateItemException
                (waf_duplicate_item_exception_of_yojson tree path)
          | (_, "WAFExpiredManagedRuleGroupVersionException") ->
              `WAFExpiredManagedRuleGroupVersionException
                (waf_expired_managed_rule_group_version_exception_of_yojson
                   tree path)
          | (_, "WAFInternalErrorException") ->
              `WAFInternalErrorException
                (waf_internal_error_exception_of_yojson tree path)
          | (_, "WAFInvalidOperationException") ->
              `WAFInvalidOperationException
                (waf_invalid_operation_exception_of_yojson tree path)
          | (_, "WAFInvalidParameterException") ->
              `WAFInvalidParameterException
                (waf_invalid_parameter_exception_of_yojson tree path)
          | (_, "WAFInvalidResourceException") ->
              `WAFInvalidResourceException
                (waf_invalid_resource_exception_of_yojson tree path)
          | (_, "WAFLimitsExceededException") ->
              `WAFLimitsExceededException
                (waf_limits_exceeded_exception_of_yojson tree path)
          | (_, "WAFNonexistentItemException") ->
              `WAFNonexistentItemException
                (waf_nonexistent_item_exception_of_yojson tree path)
          | (_, "WAFOptimisticLockException") ->
              `WAFOptimisticLockException
                (waf_optimistic_lock_exception_of_yojson tree path)
          | (_, "WAFSubscriptionNotFoundException") ->
              `WAFSubscriptionNotFoundException
                (waf_subscription_not_found_exception_of_yojson tree path)
          | (_, "WAFUnavailableEntityException") ->
              `WAFUnavailableEntityException
                (waf_unavailable_entity_exception_of_yojson tree path)
          | _type -> handler tree path _type in
        Smaws_Lib.Protocols.AwsJson.(error_deserializer
                                       (handler
                                          Smaws_Lib.Protocols.AwsJson.Errors.default_handler)
                                       tree path)
    let request context (request : update_web_acl_request) =
      let open Smaws_Lib.Context in
        let open Deserializers in
          let input = Serializers.update_web_acl_request_to_yojson request in
          Smaws_Lib.Protocols.AwsJson.request_with_http_module
            ~http_module:(Smaws_Lib.Context.http_module context)
            ~http:context.http ~shape_name:"AWSWAF_20190729UpdateWebACL"
            ~service ~config:context.config ~input
            ~output_deserializer:update_web_acl_response_of_yojson
            ~error_deserializer
  end