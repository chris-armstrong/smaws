open Types
module AssociateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_web_acl_request ->
        (associate_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Associates a web ACL with a resource, to protect the resource. \n\n Use this for all resource types except for Amazon CloudFront distributions. For Amazon CloudFront, call [UpdateDistribution] for the distribution and provide the Amazon Resource Name (ARN) of the web ACL in the web ACL ID. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront Developer Guide}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-AssociateWebACL}Permissions for AssociateWebACL} in the {i WAF Developer Guide}. \n   \n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module CheckCapacity :
sig
  val request :
    Smaws_Lib.Context.t ->
      check_capacity_request ->
        (check_capacity_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Returns the web ACL capacity unit (WCU) requirements for a specified scope and set of rules. You can use this to check the capacity requirements for the rules you want to use in a [RuleGroup] or [WebACL]. \n\n WAF uses WCUs to calculate and control the operating resources that are used to run your rules, rule groups, and web ACLs. WAF calculates capacity differently for each rule type, to reflect the relative cost of each rule. Simple rules that cost little to run use fewer WCUs than more complex rules that use more processing power. Rule group capacity is fixed at creation, which helps users plan their web ACL WCU usage when they use a rule group. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/aws-waf-capacity-units.html}WAF web ACL capacity units (WCU)} in the {i WAF Developer Guide}. \n "]
module CreateAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_key_request ->
        (create_api_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception ])
          result
end[@@ocaml.doc
     "Creates an API key that contains a set of token domains.\n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n \n  You can use a single key for up to 5 domains. After you generate a key, you can copy it for use in your JavaScript integration. \n  "]
module CreateIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_ip_set_request ->
        (create_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Creates an [IPSet], which you use to identify web requests that originate from specific IP addresses or ranges of IP addresses. For example, if you're receiving a lot of requests from a ranges of IP addresses, you can configure WAF to block them using an IPSet that lists those IP addresses. \n"]
module CreateRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_regex_pattern_set_request ->
        (create_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Creates a [RegexPatternSet], which you reference in a [RegexPatternSetReferenceStatement], to have WAF inspect a web request component for the specified patterns.\n"]
module CreateRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_rule_group_request ->
        (create_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Creates a [RuleGroup] per the specifications provided. \n\n  A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n "]
module CreateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_web_acl_request ->
        (create_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Creates a [WebACL] per the specifications provided.\n\n  A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web Services Verified Access instance. \n "]
module DeleteAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_key_request ->
        (delete_api_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified API key. \n\n After you delete a key, it can take up to 24 hours for WAF to disallow use of the key in all regions. \n "]
module DeleteFirewallManagerRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_firewall_manager_rule_groups_request ->
        (delete_firewall_manager_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes all rule groups that are managed by Firewall Manager from the specified [WebACL]. \n\n You can only use this if [ManagedByFirewallManager] and [RetrofittedByFirewallManager] are both false in the web ACL. \n "]
module DeleteIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_ip_set_request ->
        (delete_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [IPSet]. \n"]
module DeleteLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_logging_configuration_request ->
        (delete_logging_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Deletes the [LoggingConfiguration] from the specified web ACL.\n"]
module DeletePermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_permission_policy_request ->
        (delete_permission_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Permanently deletes an IAM policy from the specified rule group.\n\n You must be the owner of the rule group to perform this operation.\n "]
module DeleteRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_regex_pattern_set_request ->
        (delete_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [RegexPatternSet].\n"]
module DeleteRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_group_request ->
        (delete_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc "Deletes the specified [RuleGroup].\n"]
module DeleteWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_web_acl_request ->
        (delete_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFAssociatedItemException of waf_associated_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified [WebACL]. \n\n You can only use this if [ManagedByFirewallManager] is false in the web ACL. \n \n   Before deleting any web ACL, first disassociate it from all resources.\n   \n    {ul\n          {-  To retrieve a list of the resources that are associated with a web ACL, use the following calls:\n              \n               {ul\n                     {-  For Amazon CloudFront distributions, use the CloudFront call [ListDistributionsByWebACLId]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} in the {i Amazon CloudFront API Reference}. \n                         \n                          }\n                     {-  For all other resources, call [ListResourcesForWebACL].\n                         \n                          }\n                     \n           }\n            }\n          {-  To disassociate a resource from a web ACL, use the following calls:\n              \n               {ul\n                     {-  For Amazon CloudFront distributions, provide an empty web ACL ID in the CloudFront call [UpdateDistribution]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront API Reference}. \n                         \n                          }\n                     {-  For all other resources, call [DisassociateWebACL].\n                         \n                          }\n                     \n           }\n            }\n          }\n   "]
module DescribeAllManagedProducts :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_all_managed_products_request ->
        (describe_all_managed_products_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for the Amazon Web Services Managed Rules rule groups and Amazon Web Services Marketplace managed rule groups. \n"]
module DescribeManagedProductsByVendor :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_products_by_vendor_request ->
        (describe_managed_products_by_vendor_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for the managed rule groups owned by a specific vendor. \n"]
module DescribeManagedRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_managed_rule_group_request ->
        (describe_managed_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Provides high-level information for a managed rule group, including descriptions of the rules. \n"]
module DisassociateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_web_acl_request ->
        (disassociate_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Disassociates the specified resource from its web ACL association, if it has one. \n\n Use this for all resource types except for Amazon CloudFront distributions. For Amazon CloudFront, call [UpdateDistribution] for the distribution and provide an empty web ACL ID. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_UpdateDistribution.html}UpdateDistribution} in the {i Amazon CloudFront API Reference}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-DisassociateWebACL}Permissions for DisassociateWebACL} in the {i WAF Developer Guide}.\n   "]
module GenerateMobileSdkReleaseUrl :
sig
  val request :
    Smaws_Lib.Context.t ->
      generate_mobile_sdk_release_url_request ->
        (generate_mobile_sdk_release_url_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Generates a presigned download URL for the specified release of the mobile SDK.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetDecryptedAPIKey :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_decrypted_api_key_request ->
        (get_decrypted_api_key_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns your API key in decrypted form. Use this to check the token domains that you have defined for the key. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_ip_set_request ->
        (get_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [IPSet].\n"]
module GetLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_logging_configuration_request ->
        (get_logging_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns the [LoggingConfiguration] for the specified web ACL.\n"]
module GetManagedRuleSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_managed_rule_set_request ->
        (get_managed_rule_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves the specified managed rule set. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module GetMobileSdkRelease :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_mobile_sdk_release_request ->
        (get_mobile_sdk_release_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves information for the specified mobile SDK release, including release notes and tags.\n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module GetPermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_permission_policy_request ->
        (get_permission_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns the IAM policy that is attached to the specified rule group.\n\n You must be the owner of the rule group to perform this operation.\n "]
module GetRateBasedStatementManagedKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_rate_based_statement_managed_keys_request ->
        (get_rate_based_statement_managed_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnsupportedAggregateKeyTypeException of
              waf_unsupported_aggregate_key_type_exception ])
          result
end[@@ocaml.doc
     "Retrieves the IP addresses that are currently blocked by a rate-based rule instance. This is only available for rate-based rules that aggregate solely on the IP address or on the forwarded IP address. \n\n The maximum number of addresses that can be blocked for a single rate-based rule instance is 10,000. If more than 10,000 addresses exceed the rate limit, those with the highest rates are blocked.\n \n  For a rate-based rule that you've defined inside a rule group, provide the name of the rule group reference statement in your request, in addition to the rate-based rule name and the web ACL name. \n  \n   WAF monitors web requests and manages keys independently for each unique combination of web ACL, optional rule group, and rate-based rule. For example, if you define a rate-based rule inside a rule group, and then use the rule group in a web ACL, WAF monitors web requests and manages keys for that web ACL, rule group reference statement, and rate-based rule instance. If you use the same rule group in a second web ACL, WAF monitors web requests and manages keys for this second usage completely independent of your first. \n   "]
module GetRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_regex_pattern_set_request ->
        (get_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [RegexPatternSet].\n"]
module GetRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_rule_group_request ->
        (get_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [RuleGroup].\n"]
module GetSampledRequests :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_sampled_requests_request ->
        (get_sampled_requests_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Gets detailed information about a specified number of requests--a sample--that WAF randomly selects from among the first 5,000 requests that your Amazon Web Services resource received during a time range that you choose. You can specify a sample size of up to 500 requests, and you can specify any time range in the previous three hours.\n\n  [GetSampledRequests] returns a time range, which is usually the time range that you specified. However, if your resource (such as a CloudFront distribution) received 5,000 requests before the specified time range elapsed, [GetSampledRequests] returns an updated time range. This new time range indicates the actual period during which WAF selected the requests in the sample.\n "]
module GetWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_request ->
        (get_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc "Retrieves the specified [WebACL].\n"]
module GetWebACLForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_web_acl_for_resource_request ->
        (get_web_acl_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [WebACL] for the specified resource. \n\n This call uses [GetWebACL], to verify that your account has permission to access the retrieved web ACL. If you get an error that indicates that your account isn't authorized to perform [wafv2:GetWebACL] on the resource, that error won't be included in your CloudTrail event history. \n \n  For Amazon CloudFront, don't use this call. Instead, call the CloudFront action [GetDistributionConfig]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_GetDistributionConfig.html}GetDistributionConfig} in the {i Amazon CloudFront API Reference}. \n  \n    {b Required permissions for customer-managed IAM policies} \n   \n    This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-GetWebACLForResource}Permissions for GetWebACLForResource} in the {i WAF Developer Guide}.\n    "]
module ListAPIKeys :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_keys_request ->
        (list_api_keys_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception ])
          result
end[@@ocaml.doc
     "Retrieves a list of the API keys that you've defined for the specified scope. \n\n API keys are required for the integration of the CAPTCHA API in your JavaScript client applications. The API lets you customize the placement and characteristics of the CAPTCHA puzzle for your end users. For more information about the CAPTCHA JavaScript integration, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module ListAvailableManagedRuleGroupVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_group_versions_request ->
        (list_available_managed_rule_group_versions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Returns a list of the available versions for the specified managed rule group. \n"]
module ListAvailableManagedRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_available_managed_rule_groups_request ->
        (list_available_managed_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of managed rule groups that are available for you to use. This list includes all Amazon Web Services Managed Rules rule groups and all of the Amazon Web Services Marketplace managed rule groups that you're subscribed to.\n"]
module ListIPSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_ip_sets_request ->
        (list_ip_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [IPSetSummary] objects for the IP sets that you manage.\n"]
module ListLoggingConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_logging_configurations_request ->
        (list_logging_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of your [LoggingConfiguration] objects.\n"]
module ListManagedRuleSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_managed_rule_sets_request ->
        (list_managed_rule_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves the managed rule sets that you own. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module ListMobileSdkReleases :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_mobile_sdk_releases_request ->
        (list_mobile_sdk_releases_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves a list of the available releases for the mobile SDK and the specified device platform. \n\n The mobile SDK is not generally available. Customers who have access to the mobile SDK can use it to establish and manage WAF tokens for use in HTTP(S) requests from a mobile device to WAF. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/waf-application-integration.html}WAF client application integration} in the {i WAF Developer Guide}.\n "]
module ListRegexPatternSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_regex_pattern_sets_request ->
        (list_regex_pattern_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [RegexPatternSetSummary] objects for the regex pattern sets that you manage.\n"]
module ListResourcesForWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_for_web_acl_request ->
        (list_resources_for_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of the Amazon Resource Names (ARNs) for the resources that are associated with the specified web ACL. \n\n For Amazon CloudFront, don't use this call. Instead, use the CloudFront call [ListDistributionsByWebACLId]. For information, see {{:https://docs.aws.amazon.com/cloudfront/latest/APIReference/API_ListDistributionsByWebACLId.html}ListDistributionsByWebACLId} in the {i Amazon CloudFront API Reference}. \n \n   {b Required permissions for customer-managed IAM policies} \n  \n   This call requires permissions that are specific to the protected resource type. For details, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/security_iam_service-with-iam.html#security_iam_action-ListResourcesForWebACL}Permissions for ListResourcesForWebACL} in the {i WAF Developer Guide}.\n   "]
module ListRuleGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_groups_request ->
        (list_rule_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [RuleGroupSummary] objects for the rule groups that you manage. \n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Retrieves the [TagInfoForResource] for the specified resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
module ListWebACLs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_web_ac_ls_request ->
        (list_web_ac_ls_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Retrieves an array of [WebACLSummary] objects for the web ACLs that you manage.\n"]
module PutLoggingConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_logging_configuration_request ->
        (put_logging_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFLogDestinationPermissionIssueException of
              waf_log_destination_permission_issue_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFServiceLinkedRoleErrorException of
              waf_service_linked_role_error_exception ])
          result
end[@@ocaml.doc
     "Enables the specified [LoggingConfiguration], to start logging from a web ACL, according to the configuration provided. \n\n If you configure data protection for the web ACL, the protection applies to the data that WAF sends to the logs. \n \n   This operation completely replaces any mutable specifications that you already have for a logging configuration with the ones that you provide to this call. \n   \n    To modify an existing logging configuration, do the following: \n    \n     {ol\n           {-  Retrieve it by calling [GetLoggingConfiguration] \n               \n                }\n           {-  Update its settings as needed\n               \n                }\n           {-  Provide the complete logging configuration specification to this call\n               \n                }\n           }\n     You can define one logging destination per web ACL.\n     \n       You can access information about the traffic that WAF inspects using the following steps:\n       \n        {ol\n              {-  Create your logging destination. You can use an Amazon CloudWatch Logs log group, an Amazon Simple Storage Service (Amazon S3) bucket, or an Amazon Kinesis Data Firehose. \n                  \n                   The name that you give the destination must start with [aws-waf-logs-]. Depending on the type of destination, you might need to configure additional settings or permissions. \n                   \n                    For configuration requirements and pricing information for each destination type, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic} in the {i WAF Developer Guide}.\n                    \n                     }\n              {-  Associate your logging destination to your web ACL using a [PutLoggingConfiguration] request.\n                  \n                   }\n              }\n   When you successfully enable logging using a [PutLoggingConfiguration] request, WAF creates an additional role or policy that is required to write logs to the logging destination. For an Amazon CloudWatch Logs log group, WAF creates a resource policy on the log group. For an Amazon S3 bucket, WAF creates a bucket policy. For an Amazon Kinesis Data Firehose, WAF creates a service-linked role.\n   \n    For additional information about web ACL logging, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/logging.html}Logging web ACL traffic information} in the {i WAF Developer Guide}.\n    "]
module PutManagedRuleSetVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_managed_rule_set_versions_request ->
        (put_managed_rule_set_versions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Defines the versions of your managed rule set that you are offering to the customers. Customers see your offerings as managed rule groups with versioning.\n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n     Customers retrieve their managed rule group list by calling [ListAvailableManagedRuleGroups]. The name that you provide here for your managed rule set is the name the customer sees for the corresponding managed rule group. Customers can retrieve the available versions for a managed rule group by calling [ListAvailableManagedRuleGroupVersions]. You provide a rule group specification for each version. For each managed rule set, you must specify a version that you recommend using. \n     \n      To initiate the expiration of a managed rule group version, use [UpdateManagedRuleSetVersionExpiryDate].\n      "]
module PutPermissionPolicy :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_policy_request ->
        (put_permission_policy_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidPermissionPolicyException of
              waf_invalid_permission_policy_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception ])
          result
end[@@ocaml.doc
     "Use this to share a rule group with other accounts.\n\n This action attaches an IAM policy to the specified resource. You must be the owner of the rule group to perform this operation.\n \n  This action is subject to the following restrictions:\n  \n   {ul\n         {-  You can attach only one policy with each [PutPermissionPolicy] request.\n             \n              }\n         {-  The ARN in the request must be a valid WAF [RuleGroup] ARN and the rule group must exist in the same Region.\n             \n              }\n         {-  The user making the request must be the owner of the rule group.\n             \n              }\n         }\n   If a rule group has been shared with your account, you can access it through the call [GetRuleGroup], and you can reference it in [CreateWebACL] and [UpdateWebACL]. Rule groups that are shared with you don't appear in your WAF console rule groups listing. \n   "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Associates tags with the specified Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing. For example, you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n\n You can tag the Amazon Web Services resources that you manage through WAF: web ACLs, rule groups, IP sets, and regex pattern sets. You can't manage or view tags through the WAF console. \n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFTagOperationException of waf_tag_operation_exception 
          | `WAFTagOperationInternalErrorException of
              waf_tag_operation_internal_error_exception ])
          result
end[@@ocaml.doc
     "Disassociates tags from an Amazon Web Services resource. Tags are key:value pairs that you can associate with Amazon Web Services resources. For example, the tag key might be \"customer\" and the tag value might be \"companyA.\" You can specify one or more tags to add to each container. You can add up to 50 tags to each Amazon Web Services resource.\n"]
module UpdateIPSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_ip_set_request ->
        (update_ip_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [IPSet]. \n\n  This operation completely replaces the mutable specifications that you already have for the IP set with the ones that you provide to this call. \n  \n   To modify an IP set, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetIPSet] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete IP set specification to this call\n              \n               }\n          }\n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module UpdateManagedRuleSetVersionExpiryDate :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_managed_rule_set_version_expiry_date_request ->
        (update_managed_rule_set_version_expiry_date_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the expiration information for your managed rule set. Use this to initiate the expiration of a managed rule group version. After you initiate expiration for a version, WAF excludes it from the response to [ListAvailableManagedRuleGroupVersions] for the managed rule group. \n\n  This is intended for use only by vendors of managed rule sets. Vendors are Amazon Web Services and Amazon Web Services Marketplace sellers. \n  \n   Vendors, you can use the managed rule set APIs to provide controlled rollout of your versioned managed rule group offerings for your customers. The APIs are [ListManagedRuleSets], [GetManagedRuleSet], [PutManagedRuleSetVersions], and [UpdateManagedRuleSetVersionExpiryDate].\n   \n    "]
module UpdateRegexPatternSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_regex_pattern_set_request ->
        (update_regex_pattern_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [RegexPatternSet].\n\n  This operation completely replaces the mutable specifications that you already have for the regex pattern set with the ones that you provide to this call. \n  \n   To modify a regex pattern set, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetRegexPatternSet] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete regex pattern set specification to this call\n              \n               }\n          }\n     {b Temporary inconsistencies during updates} \n    \n     When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n     \n      The following are examples of the temporary inconsistencies that you might notice during change propagation: \n      \n       {ul\n             {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                 \n                  }\n             {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                 \n                  }\n             {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                 \n                  }\n             {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                 \n                  }\n             }\n  "]
module UpdateRuleGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_rule_group_request ->
        (update_rule_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [RuleGroup].\n\n  This operation completely replaces the mutable specifications that you already have for the rule group with the ones that you provide to this call. \n  \n   To modify a rule group, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetRuleGroup] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete rule group specification to this call\n              \n               }\n          }\n     A rule group defines a collection of rules to inspect and control web requests that you can use in a [WebACL]. When you create a rule group, you define an immutable capacity limit. If you update a rule group, you must stay within the capacity. This allows others to reuse the rule group with confidence in its capacity requirements. \n    \n      {b Temporary inconsistencies during updates} \n     \n      When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n      \n       The following are examples of the temporary inconsistencies that you might notice during change propagation: \n       \n        {ul\n              {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                  \n                   }\n              {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                  \n                   }\n              {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                  \n                   }\n              {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                  \n                   }\n              }\n  "]
module UpdateWebACL :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_web_acl_request ->
        (update_web_acl_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `WAFConfigurationWarningException of
              waf_configuration_warning_exception 
          | `WAFDuplicateItemException of waf_duplicate_item_exception 
          | `WAFExpiredManagedRuleGroupVersionException of
              waf_expired_managed_rule_group_version_exception 
          | `WAFInternalErrorException of waf_internal_error_exception 
          | `WAFInvalidOperationException of waf_invalid_operation_exception 
          | `WAFInvalidParameterException of waf_invalid_parameter_exception 
          | `WAFInvalidResourceException of waf_invalid_resource_exception 
          | `WAFLimitsExceededException of waf_limits_exceeded_exception 
          | `WAFNonexistentItemException of waf_nonexistent_item_exception 
          | `WAFOptimisticLockException of waf_optimistic_lock_exception 
          | `WAFSubscriptionNotFoundException of
              waf_subscription_not_found_exception 
          | `WAFUnavailableEntityException of
              waf_unavailable_entity_exception ])
          result
end[@@ocaml.doc
     "Updates the specified [WebACL]. While updating a web ACL, WAF provides continuous coverage to the resources that you have associated with the web ACL. \n\n  This operation completely replaces the mutable specifications that you already have for the web ACL with the ones that you provide to this call. \n  \n   To modify a web ACL, do the following: \n   \n    {ol\n          {-  Retrieve it by calling [GetWebACL] \n              \n               }\n          {-  Update its settings as needed\n              \n               }\n          {-  Provide the complete web ACL specification to this call\n              \n               }\n          }\n     A web ACL defines a collection of rules to use to inspect and control web requests. Each rule has a statement that defines what to look for in web requests and an action that WAF applies to requests that match the statement. In the web ACL, you assign a default action to take (allow, block) for any request that does not match any of the rules. The rules in a web ACL can be a combination of the types [Rule], [RuleGroup], and managed rule group. You can associate a web ACL with one or more Amazon Web Services resources to protect. The resource types include Amazon CloudFront distribution, Amazon API Gateway REST API, Application Load Balancer, AppSync GraphQL API, Amazon Cognito user pool, App Runner service, Amplify application, and Amazon Web Services Verified Access instance. \n    \n      {b Temporary inconsistencies during updates} \n     \n      When you create or change a web ACL or other WAF resources, the changes take a small amount of time to propagate to all areas where the resources are stored. The propagation time can be from a few seconds to a number of minutes. \n      \n       The following are examples of the temporary inconsistencies that you might notice during change propagation: \n       \n        {ul\n              {-  After you create a web ACL, if you try to associate it with a resource, you might get an exception indicating that the web ACL is unavailable. \n                  \n                   }\n              {-  After you add a rule group to a web ACL, the new rule group rules might be in effect in one area where the web ACL is used and not in another.\n                  \n                   }\n              {-  After you change a rule action setting, you might see the old action in some places and the new action in others. \n                  \n                   }\n              {-  After you add an IP address to an IP set that is in use in a blocking rule, the new address might be blocked in one area while still allowed in another.\n                  \n                   }\n              }\n  "]