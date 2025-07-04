(** 
    Shield client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validation_exception_field =
  {
  message: string
    [@ocaml.doc
      "The message describing why the parameter failed validation.\n"];
  name: string
    [@ocaml.doc "The name of the parameter that failed validation.\n"]}
[@@ocaml.doc
  "Provides information about a particular parameter passed inside a request that resulted in an exception.\n"]
type nonrec auto_renew =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_subscription_request =
  {
  auto_renew: auto_renew option
    [@ocaml.doc
      "When you initally create a subscription, [AutoRenew] is set to [ENABLED]. If [ENABLED], the subscription will be automatically renewed at the end of the existing subscription period. You can change this by submitting an [UpdateSubscription] request. If the [UpdateSubscription] request does not included a value for [AutoRenew], the existing value for [AutoRenew] remains unchanged.\n"]}
[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  resource_type: string option [@ocaml.doc "Type of resource.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception indicating the specified resource does not exist. If available, this exception includes details in additional properties. \n"]
type nonrec optimistic_lock_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the resource state has been modified by another client. Retrieve the resource and then retry your request.\n"]
type nonrec locked_subscription_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You are trying to update a subscription that has not yet completed the 1-year commitment. You can change the [AutoRenew] parameter during the last 30 days of your subscription. This exception indicates that you are attempting to change [AutoRenew] prior to that period.\n"]
type nonrec invalid_parameter_exception =
  {
  fields: validation_exception_field list option
    [@ocaml.doc "Fields that caused the exception.\n"];
  reason: validation_exception_reason option
    [@ocaml.doc "Additional information about the exception.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the parameters passed to the API are invalid. If available, this exception includes details in additional properties. \n"]
type nonrec internal_error_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that a problem occurred with the service infrastructure. You can retry the request.\n"]
type nonrec protection_group_aggregation =
  | MAX [@ocaml.doc ""]
  | MEAN [@ocaml.doc ""]
  | SUM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec protection_group_pattern =
  | BY_RESOURCE_TYPE [@ocaml.doc ""]
  | ARBITRARY [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec protected_resource_type =
  | GLOBAL_ACCELERATOR [@ocaml.doc ""]
  | APPLICATION_LOAD_BALANCER [@ocaml.doc ""]
  | CLASSIC_LOAD_BALANCER [@ocaml.doc ""]
  | ELASTIC_IP_ALLOCATION [@ocaml.doc ""]
  | ROUTE_53_HOSTED_ZONE [@ocaml.doc ""]
  | CLOUDFRONT_DISTRIBUTION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_protection_group_request =
  {
  members: string list option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting. \n"];
  resource_type: protected_resource_type option
    [@ocaml.doc
      "The resource type to include in the protection group. All protected resources of this type are included in the protection group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting. \n"];
  pattern: protection_group_pattern
    [@ocaml.doc
      "The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or include all resources of a specified resource type.\n"];
  aggregation: protection_group_aggregation
    [@ocaml.doc
      "Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.\n\n {ul\n       {-  Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.\n           \n            }\n       {-  Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.\n           \n            }\n       {-  Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources for CloudFront distributions.\n           \n            }\n       }\n  "];
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc ""]
type nonrec emergency_contact =
  {
  contact_notes: string option
    [@ocaml.doc "Additional notes regarding the contact. \n"];
  phone_number: string option
    [@ocaml.doc "The phone number for the contact.\n"];
  email_address: string [@ocaml.doc "The email address for the contact.\n"]}
[@@ocaml.doc
  "Contact information that the SRT can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n"]
type nonrec update_emergency_contact_settings_request =
  {
  emergency_contact_list: emergency_contact list option
    [@ocaml.doc
      "A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n\n If you have proactive engagement enabled, the contact list must include at least one phone number.\n "]}
[@@ocaml.doc ""]
type nonrec response_action =
  {
  count: unit option
    [@ocaml.doc
      "Specifies that Shield Advanced should configure its WAF rules with the WAF [Count] action. \n\n You must specify exactly one action, either [Block] or [Count].\n "];
  block: unit option
    [@ocaml.doc
      "Specifies that Shield Advanced should configure its WAF rules with the WAF [Block] action. \n\n You must specify exactly one action, either [Block] or [Count].\n "]}
[@@ocaml.doc
  "Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource. \n"]
type nonrec update_application_layer_automatic_response_request =
  {
  action: response_action
    [@ocaml.doc
      "Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource. \n"];
  resource_arn: string
    [@ocaml.doc "The ARN (Amazon Resource Name) of the resource.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_operation_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the operation would not cause any change to occur.\n"]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc
      "The tag key for each tag that you want to remove from the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that you want to remove tags from.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_resource_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the resource is invalid. You might not have access to the resource, or the resource might not exist.\n"]
type nonrec unit_ =
  | REQUESTS [@ocaml.doc ""]
  | PACKETS [@ocaml.doc ""]
  | BYTES [@ocaml.doc ""]
  | BITS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec contributor =
  {
  value: int option
    [@ocaml.doc
      "The contribution of this contributor expressed in [Protection] units. For example [10,000].\n"];
  name: string option
    [@ocaml.doc
      "The name of the contributor. The type of name that you'll find here depends on the [AttackPropertyIdentifier] setting in the [AttackProperty] where this contributor is defined. For example, if the [AttackPropertyIdentifier] is [SOURCE_COUNTRY], the [Name] could be [United States].\n"]}
[@@ocaml.doc "A contributor to the attack and their contribution. \n"]
type nonrec time_range =
  {
  to_exclusive: CoreTypes.Timestamp.t option
    [@ocaml.doc "The end time, in Unix time in seconds. \n"];
  from_inclusive: CoreTypes.Timestamp.t option
    [@ocaml.doc "The start time, in Unix time in seconds. \n"]}[@@ocaml.doc
                                                                 "The time range. \n"]
type nonrec tag =
  {
  value: string option
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag value to describe a specific value within a category, such as \"companyA\" or \"companyB.\" Tag values are case-sensitive.\n"];
  key: string option
    [@ocaml.doc
      "Part of the key:value pair that defines a tag. You can use a tag key to describe a category of information, such as \"customer.\" Tag keys are case-sensitive.\n"]}
[@@ocaml.doc
  "A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n"]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc "The tags that you want to modify or add to the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource that you want to add or update tags for.\n"]}
[@@ocaml.doc ""]
type nonrec summarized_counter =
  {
  unit_: string option [@ocaml.doc "The unit of the counters.\n"];
  n: int option
    [@ocaml.doc "The number of counters for a specified time period.\n"];
  sum: float option
    [@ocaml.doc "The total of counter values for a specified time period.\n"];
  average: float option
    [@ocaml.doc
      "The average value of the counter for a specified time period.\n"];
  max: float option
    [@ocaml.doc
      "The maximum value of the counter for a specified time period.\n"];
  name: string option [@ocaml.doc "The counter name.\n"]}[@@ocaml.doc
                                                           "The counter that describes a DDoS attack.\n"]
type nonrec summarized_attack_vector =
  {
  vector_counters: summarized_counter list option
    [@ocaml.doc
      "The list of counters that describe the details of the attack.\n"];
  vector_type: string
    [@ocaml.doc
      "The attack type, for example, SNMP reflection or SYN flood.\n"]}
[@@ocaml.doc "A summary of information about the attack.\n"]
type nonrec subscription_state =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec limit =
  {
  max: int option
    [@ocaml.doc
      "The maximum number of protections that can be created for the specified [Type].\n"];
  type_: string option [@ocaml.doc "The type of protection.\n"]}[@@ocaml.doc
                                                                  "Specifies how many protections of a given type you can create.\n"]
type nonrec protection_limits =
  {
  protected_resource_type_limits: limit list
    [@ocaml.doc
      "The maximum number of resource types that you can specify in a protection.\n"]}
[@@ocaml.doc "Limits settings on protections for your subscription. \n"]
type nonrec protection_group_arbitrary_pattern_limits =
  {
  max_members: int
    [@ocaml.doc
      "The maximum number of resources you can specify for a single arbitrary pattern in a protection group.\n"]}
[@@ocaml.doc
  "Limits settings on protection groups with arbitrary pattern type. \n"]
type nonrec protection_group_pattern_type_limits =
  {
  arbitrary_pattern_limits: protection_group_arbitrary_pattern_limits
    [@ocaml.doc
      "Limits settings on protection groups with arbitrary pattern type. \n"]}
[@@ocaml.doc
  "Limits settings by pattern type in the protection groups for your subscription. \n"]
type nonrec protection_group_limits =
  {
  pattern_type_limits: protection_group_pattern_type_limits
    [@ocaml.doc
      "Limits settings by pattern type in the protection groups for your subscription. \n"];
  max_protection_groups: int
    [@ocaml.doc
      "The maximum number of protection groups that you can have at one time. \n"]}
[@@ocaml.doc
  "Limits settings on protection groups for your subscription. \n"]
type nonrec subscription_limits =
  {
  protection_group_limits: protection_group_limits
    [@ocaml.doc
      "Limits settings on protection groups for your subscription. \n"];
  protection_limits: protection_limits
    [@ocaml.doc "Limits settings on protections for your subscription. \n"]}
[@@ocaml.doc "Limits settings for your subscription. \n"]
type nonrec proactive_engagement_status =
  | PENDING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec subscription =
  {
  subscription_arn: string option
    [@ocaml.doc "The ARN (Amazon Resource Name) of the subscription.\n"];
  subscription_limits: subscription_limits
    [@ocaml.doc "Limits settings for your subscription. \n"];
  proactive_engagement_status: proactive_engagement_status option
    [@ocaml.doc
      "If [ENABLED], the Shield Response Team (SRT) will use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.\n\n If [PENDING], you have requested proactive engagement and the request is pending. The status changes to [ENABLED] when your request is fully processed.\n \n  If [DISABLED], the SRT will not proactively notify contacts about escalations or to initiate proactive customer support. \n  "];
  limits: limit list option
    [@ocaml.doc
      "Specifies how many protections of a given type you can create.\n"];
  auto_renew: auto_renew option
    [@ocaml.doc
      "If [ENABLED], the subscription will be automatically renewed at the end of the existing subscription period.\n\n When you initally create a subscription, [AutoRenew] is set to [ENABLED]. You can change this by submitting an [UpdateSubscription] request. If the [UpdateSubscription] request does not included a value for [AutoRenew], the existing value for [AutoRenew] remains unchanged.\n "];
  time_commitment_in_seconds: int option
    [@ocaml.doc
      "The length, in seconds, of the Shield Advanced subscription for the account.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time your subscription will end.\n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The start time of the subscription, in Unix time in seconds. \n"]}
[@@ocaml.doc
  "Information about the Shield Advanced subscription for an account.\n"]
type nonrec sub_resource_type =
  | URL [@ocaml.doc ""]
  | IP [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sub_resource_summary =
  {
  counters: summarized_counter list option
    [@ocaml.doc "The counters that describe the details of the attack.\n"];
  attack_vectors: summarized_attack_vector list option
    [@ocaml.doc "The list of attack types and associated counters.\n"];
  id: string option
    [@ocaml.doc "The unique identifier (ID) of the [SubResource].\n"];
  type_: sub_resource_type option [@ocaml.doc "The [SubResource] type.\n"]}
[@@ocaml.doc "The attack information for the specified SubResource.\n"]
type nonrec resource_already_exists_exception =
  {
  resource_type: string option
    [@ocaml.doc "The type of resource that already exists.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception indicating the specified resource already exists. If available, this exception includes details in additional properties. \n"]
type nonrec application_layer_automatic_response_status =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec application_layer_automatic_response_configuration =
  {
  action: response_action
    [@ocaml.doc
      "Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource. \n"];
  status: application_layer_automatic_response_status
    [@ocaml.doc
      "Indicates whether automatic application layer DDoS mitigation is enabled for the protection. \n"]}
[@@ocaml.doc
  "The automatic application layer DDoS mitigation settings for a [Protection]. This configuration determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to application layer events that Shield Advanced determines to be DDoS attacks. \n"]
type nonrec protection =
  {
  application_layer_automatic_response_configuration:
    application_layer_automatic_response_configuration option
    [@ocaml.doc
      "The automatic application layer DDoS mitigation settings for the protection. This configuration determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to application layer events that Shield Advanced determines to be DDoS attacks. \n"];
  protection_arn: string option
    [@ocaml.doc "The ARN (Amazon Resource Name) of the protection.\n"];
  health_check_ids: string list option
    [@ocaml.doc
      "The unique identifier (ID) for the Route\194\16053 health check that's associated with the protection. \n"];
  resource_arn: string option
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the Amazon Web Services resource that is protected.\n"];
  name: string option
    [@ocaml.doc
      "The name of the protection. For example, [My CloudFront distributions].\n"];
  id: string option
    [@ocaml.doc "The unique identifier (ID) of the protection.\n"]}[@@ocaml.doc
                                                                    "An object that represents a resource that is under DDoS protection.\n"]
type nonrec protection_group =
  {
  protection_group_arn: string option
    [@ocaml.doc "The ARN (Amazon Resource Name) of the protection group.\n"];
  members: string list
    [@ocaml.doc
      "The ARNs (Amazon Resource Names) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting. \n"];
  resource_type: protected_resource_type option
    [@ocaml.doc
      "The resource type to include in the protection group. All protected resources of this type are included in the protection group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting. \n"];
  pattern: protection_group_pattern
    [@ocaml.doc
      "The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource ARNs (Amazon Resource Names), or include all resources of a specified resource type.\n"];
  aggregation: protection_group_aggregation
    [@ocaml.doc
      "Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.\n\n {ul\n       {-  Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.\n           \n            }\n       {-  Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.\n           \n            }\n       {-  Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront distributions and origin resources for CloudFront distributions.\n           \n            }\n       }\n  "];
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc
  "A grouping of protected resources that you and Shield Advanced can monitor as a collective. This resource grouping improves the accuracy of detection and reduces false positives. \n"]
type nonrec no_associated_role_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The ARN of the role that you specified does not exist.\n"]
type nonrec mitigation =
  {
  mitigation_name: string option
    [@ocaml.doc "The name of the mitigation taken for this attack.\n"]}
[@@ocaml.doc "The mitigation applied to a DDoS attack.\n"]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option
    [@ocaml.doc
      "A list of tag key and value pairs associated with the specified resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the resource to get tags for.\n"]}
[@@ocaml.doc ""]
type nonrec list_resources_in_protection_group_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  "];
  resource_arns: string list
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) of the resources that are included in the protection group.\n"]}
[@@ocaml.doc ""]
type nonrec list_resources_in_protection_group_request =
  {
  max_results: int option
    [@ocaml.doc
      "The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.\n\n The default setting is 20.\n "];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  \n   On your first call to a list operation, leave this setting empty.\n   "];
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc ""]
type nonrec invalid_pagination_token_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the [NextToken] specified in the request is invalid. Submit the request using the [NextToken] value that was returned in the prior response.\n"]
type nonrec list_protections_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  "];
  protections: protection list option
    [@ocaml.doc "The array of enabled [Protection] objects.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec inclusion_protection_filters =
  {
  resource_types: protected_resource_type list option
    [@ocaml.doc
      "The type of protected resource whose protections you want to retrieve. \n"];
  protection_names: string list option
    [@ocaml.doc "The name of the protection that you want to retrieve. \n"];
  resource_arns: string list option
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the resource whose protection you want to retrieve. \n"]}
[@@ocaml.doc
  "Narrows the set of protections that the call retrieves. You can retrieve a single protection by providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also retrieve all protections for a specific resource type. You can provide up to one criteria per filter type. Shield Advanced returns protections that exactly match all of the filter criteria that you provide.\n"]
type nonrec list_protections_request =
  {
  inclusion_filters: inclusion_protection_filters option
    [@ocaml.doc
      "Narrows the set of protections that the call retrieves. You can retrieve a single protection by providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also retrieve all protections for a specific resource type. You can provide up to one criteria per filter type. Shield Advanced returns protections that exactly match all of the filter criteria that you provide.\n"];
  max_results: int option
    [@ocaml.doc
      "The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.\n\n The default setting is 20.\n "];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  \n   On your first call to a list operation, leave this setting empty.\n   "]}
[@@ocaml.doc ""]
type nonrec list_protection_groups_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  "];
  protection_groups: protection_group list [@ocaml.doc "\n"]}[@@ocaml.doc ""]
type nonrec inclusion_protection_group_filters =
  {
  aggregations: protection_group_aggregation list option
    [@ocaml.doc
      "The aggregation setting of the protection groups that you want to retrieve. \n"];
  resource_types: protected_resource_type list option
    [@ocaml.doc
      "The resource type configuration of the protection groups that you want to retrieve. In the protection group configuration, you specify the resource type when you set the group's [Pattern] to [BY_RESOURCE_TYPE]. \n"];
  patterns: protection_group_pattern list option
    [@ocaml.doc
      "The pattern specification of the protection groups that you want to retrieve. \n"];
  protection_group_ids: string list option
    [@ocaml.doc
      "The ID of the protection group that you want to retrieve. \n"]}
[@@ocaml.doc
  "Narrows the set of protection groups that the call retrieves. You can retrieve a single protection group by its name and you can retrieve all protection groups that are configured with a specific pattern, aggregation, or resource type. You can provide up to one criteria per filter type. Shield Advanced returns the protection groups that exactly match all of the search criteria that you provide.\n"]
type nonrec list_protection_groups_request =
  {
  inclusion_filters: inclusion_protection_group_filters option
    [@ocaml.doc
      "Narrows the set of protection groups that the call retrieves. You can retrieve a single protection group by its name and you can retrieve all protection groups that are configured with specific pattern or aggregation settings. You can provide up to one criteria per filter type. Shield Advanced returns the protection groups that exactly match all of the search criteria that you provide.\n"];
  max_results: int option
    [@ocaml.doc
      "The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.\n\n The default setting is 20.\n "];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  \n   On your first call to a list operation, leave this setting empty.\n   "]}
[@@ocaml.doc ""]
type nonrec attack_vector_description =
  {
  vector_type: string
    [@ocaml.doc
      "The attack type. Valid values:\n\n {ul\n       {-  UDP_TRAFFIC\n           \n            }\n       {-  UDP_FRAGMENT\n           \n            }\n       {-  GENERIC_UDP_REFLECTION\n           \n            }\n       {-  DNS_REFLECTION\n           \n            }\n       {-  NTP_REFLECTION\n           \n            }\n       {-  CHARGEN_REFLECTION\n           \n            }\n       {-  SSDP_REFLECTION\n           \n            }\n       {-  PORT_MAPPER\n           \n            }\n       {-  RIP_REFLECTION\n           \n            }\n       {-  SNMP_REFLECTION\n           \n            }\n       {-  MSSQL_REFLECTION\n           \n            }\n       {-  NET_BIOS_REFLECTION\n           \n            }\n       {-  SYN_FLOOD\n           \n            }\n       {-  ACK_FLOOD\n           \n            }\n       {-  REQUEST_FLOOD\n           \n            }\n       {-  HTTP_REFLECTION\n           \n            }\n       {-  UDS_REFLECTION\n           \n            }\n       {-  MEMCACHED_REFLECTION\n           \n            }\n       }\n  "]}
[@@ocaml.doc "Describes the attack.\n"]
type nonrec attack_summary =
  {
  attack_vectors: attack_vector_description list option
    [@ocaml.doc "The list of attacks for a specified time period.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The end time of the attack, in Unix time in seconds. \n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The start time of the attack, in Unix time in seconds. \n"];
  resource_arn: string option
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the resource that was attacked.\n"];
  attack_id: string option
    [@ocaml.doc "The unique identifier (ID) of the attack.\n"]}[@@ocaml.doc
                                                                 "Summarizes all DDoS attacks for a specified time period.\n"]
type nonrec list_attacks_response =
  {
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  "];
  attack_summaries: attack_summary list option
    [@ocaml.doc "The attack information for the specified time range.\n"]}
[@@ocaml.doc ""]
type nonrec list_attacks_request =
  {
  max_results: int option
    [@ocaml.doc
      "The greatest number of objects that you want Shield Advanced to return to the list request. Shield Advanced might return fewer objects than you indicate in this setting, even if more objects are available. If there are more objects remaining, Shield Advanced will always also return a [NextToken] value in the response.\n\n The default setting is 20.\n "];
  next_token: string option
    [@ocaml.doc
      "When you request a list of objects from Shield Advanced, if the response does not include all of the remaining available objects, Shield Advanced includes a [NextToken] value in the response. You can retrieve the next batch of objects by requesting the list again and providing the token that was returned by the prior call in your request. \n\n You can indicate the maximum number of objects that you want Shield Advanced to return for a single call with the [MaxResults] setting. Shield Advanced will not return more than [MaxResults] objects, but may return fewer, even if more objects are still available.\n \n  Whenever more objects remain that Shield Advanced has not yet returned to you, the response will include a [NextToken] value.\n  \n   On your first call to a list operation, leave this setting empty.\n   "];
  end_time: time_range option
    [@ocaml.doc
      "The end of the time period for the attacks. This is a [timestamp] type. The request syntax listing for this call indicates a [number] type, but you can provide the time in any valid {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp}timestamp format} setting. \n"];
  start_time: time_range option
    [@ocaml.doc
      "The start of the time period for the attacks. This is a [timestamp] type. The request syntax listing for this call indicates a [number] type, but you can provide the time in any valid {{:https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp}timestamp format} setting. \n"];
  resource_arns: string list option
    [@ocaml.doc
      "The ARNs (Amazon Resource Names) of the resources that were attacked. If you leave this blank, all applicable resources for this account will be included.\n"]}
[@@ocaml.doc ""]
type nonrec limits_exceeded_exception =
  {
  limit: int option [@ocaml.doc "The threshold that would be exceeded.\n"];
  type_: string option
    [@ocaml.doc "The type of limit that would be exceeded.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates that the operation would exceed a limit.\n"]
type nonrec get_subscription_state_response =
  {
  subscription_state: subscription_state
    [@ocaml.doc "The status of the subscription.\n"]}[@@ocaml.doc ""]
type nonrec enable_application_layer_automatic_response_request =
  {
  action: response_action
    [@ocaml.doc
      "Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource. \n"];
  resource_arn: string
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the protected resource.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_health_check_request =
  {
  health_check_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the health check that is associated with the protection.\n"];
  protection_id: string
    [@ocaml.doc
      "The unique identifier (ID) for the [Protection] object to remove the health check association from. \n"]}
[@@ocaml.doc ""]
type nonrec disassociate_drt_log_bucket_request =
  {
  log_bucket: string
    [@ocaml.doc
      "The Amazon S3 bucket that contains the logs that you want to share.\n"]}
[@@ocaml.doc ""]
type nonrec access_denied_for_dependency_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "In order to grant the necessary access to the Shield Response Team (SRT) the user submitting the request must have the [iam:PassRole] permission. This error indicates the user did not have the appropriate permissions. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a User Permissions to Pass a Role to an Amazon Web Services Service}. \n"]
type nonrec disable_application_layer_automatic_response_request =
  {
  resource_arn: string
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the protected resource.\n"]}
[@@ocaml.doc ""]
type nonrec describe_subscription_response =
  {
  subscription: subscription option
    [@ocaml.doc "The Shield Advanced subscription details for an account.\n"]}
[@@ocaml.doc ""]
type nonrec describe_protection_response =
  {
  protection: protection option
    [@ocaml.doc "The [Protection] that you requested. \n"]}[@@ocaml.doc ""]
type nonrec describe_protection_request =
  {
  resource_arn: string option
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the protected Amazon Web Services resource. You must provide either the [ResourceArn] of the protected resource or the [ProtectionID] of the protection, but not both.\n"];
  protection_id: string option
    [@ocaml.doc
      "The unique identifier (ID) for the [Protection] object to describe. You must provide either the [ResourceArn] of the protected resource or the [ProtectionID] of the protection, but not both.\n"]}
[@@ocaml.doc ""]
type nonrec describe_protection_group_response =
  {
  protection_group: protection_group
    [@ocaml.doc
      "A grouping of protected resources that you and Shield Advanced can monitor as a collective. This resource grouping improves the accuracy of detection and reduces false positives. \n"]}
[@@ocaml.doc ""]
type nonrec describe_protection_group_request =
  {
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc ""]
type nonrec describe_emergency_contact_settings_response =
  {
  emergency_contact_list: emergency_contact list option
    [@ocaml.doc
      "A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n"]}
[@@ocaml.doc ""]
type nonrec describe_drt_access_response =
  {
  log_bucket_list: string list option
    [@ocaml.doc "The list of Amazon S3 buckets accessed by the SRT.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the role the SRT used to access your Amazon Web Services account.\n"]}
[@@ocaml.doc ""]
type nonrec attack_volume_statistics =
  {
  max: float
    [@ocaml.doc "The maximum attack volume observed for the given unit.\n"]}
[@@ocaml.doc
  "Statistics objects for the various data types in [AttackVolume]. \n"]
type nonrec attack_volume =
  {
  requests_per_second: attack_volume_statistics option
    [@ocaml.doc
      "A statistics object that uses requests per second as the unit. This is included for application level attacks, and is only available for accounts that are subscribed to Shield Advanced.\n"];
  packets_per_second: attack_volume_statistics option
    [@ocaml.doc
      "A statistics object that uses packets per second as the unit. This is included for network level attacks. \n"];
  bits_per_second: attack_volume_statistics option
    [@ocaml.doc
      "A statistics object that uses bits per second as the unit. This is included for network level attacks. \n"]}
[@@ocaml.doc
  "Information about the volume of attacks during the time period, included in an [AttackStatisticsDataItem]. If the accompanying [AttackCount] in the statistics object is zero, this setting might be empty.\n"]
type nonrec attack_statistics_data_item =
  {
  attack_count: int
    [@ocaml.doc
      "The number of attacks detected during the time period. This is always present, but might be zero. \n"];
  attack_volume: attack_volume option
    [@ocaml.doc
      "Information about the volume of attacks during the time period. If the accompanying [AttackCount] is zero, this setting might be empty.\n"]}
[@@ocaml.doc
  "A single attack statistics data record. This is returned by [DescribeAttackStatistics] along with a time range indicating the time period that the attack statistics apply to. \n"]
type nonrec describe_attack_statistics_response =
  {
  data_items: attack_statistics_data_item list
    [@ocaml.doc
      "The data that describes the attacks detected during the time period.\n"];
  time_range: time_range [@ocaml.doc "The time range of the attack.\n"]}
[@@ocaml.doc ""]
type nonrec attack_layer =
  | APPLICATION [@ocaml.doc ""]
  | NETWORK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attack_property_identifier =
  | WORDPRESS_PINGBACK_SOURCE [@ocaml.doc ""]
  | WORDPRESS_PINGBACK_REFLECTOR [@ocaml.doc ""]
  | SOURCE_USER_AGENT [@ocaml.doc ""]
  | SOURCE_IP_ADDRESS [@ocaml.doc ""]
  | SOURCE_COUNTRY [@ocaml.doc ""]
  | SOURCE_ASN [@ocaml.doc ""]
  | REFERRER [@ocaml.doc ""]
  | DESTINATION_URL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attack_property =
  {
  total: int option
    [@ocaml.doc
      "The total contributions made to this Shield event by all contributors.\n"];
  unit_: unit_ option
    [@ocaml.doc "The unit used for the [Contributor] [Value] property. \n"];
  top_contributors: contributor list option
    [@ocaml.doc
      "Contributor objects for the top five contributors to a Shield event. A contributor is a source of traffic that Shield Advanced identifies as responsible for some or all of an event.\n"];
  attack_property_identifier: attack_property_identifier option
    [@ocaml.doc
      "Defines the Shield event property information that is provided. The [WORDPRESS_PINGBACK_REFLECTOR] and [WORDPRESS_PINGBACK_SOURCE] values are valid only for WordPress reflective pingback events.\n"];
  attack_layer: attack_layer option
    [@ocaml.doc
      "The type of Shield event that was observed. [NETWORK] indicates layer 3 and layer 4 events and [APPLICATION] indicates layer 7 events.\n\n For infrastructure layer events (L3 and L4 events), you can view metrics for top contributors in Amazon CloudWatch metrics. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms}Shield metrics and alarms} in the {i WAF Developer Guide}. \n "]}
[@@ocaml.doc
  "Details of a Shield event. This is provided as part of an [AttackDetail].\n"]
type nonrec attack_detail =
  {
  mitigations: mitigation list option
    [@ocaml.doc "List of mitigation actions taken for the attack.\n"];
  attack_properties: attack_property list option
    [@ocaml.doc
      "The array of objects that provide details of the Shield event. \n\n For infrastructure layer events (L3 and L4 events), you can view metrics for top contributors in Amazon CloudWatch metrics. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/monitoring-cloudwatch.html#set-ddos-alarms}Shield metrics and alarms} in the {i WAF Developer Guide}. \n "];
  attack_counters: summarized_counter list option
    [@ocaml.doc
      "List of counters that describe the attack for the specified time period.\n"];
  end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the attack ended, in Unix time in seconds. \n"];
  start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the attack started, in Unix time in seconds. \n"];
  sub_resources: sub_resource_summary list option
    [@ocaml.doc
      "If applicable, additional detail about the resource being attacked, for example, IP address or URL.\n"];
  resource_arn: string option
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the resource that was attacked.\n"];
  attack_id: string option
    [@ocaml.doc "The unique identifier (ID) of the attack.\n"]}[@@ocaml.doc
                                                                 "The details of a DDoS attack.\n"]
type nonrec describe_attack_response =
  {
  attack: attack_detail option
    [@ocaml.doc "The attack that you requested. \n"]}[@@ocaml.doc ""]
type nonrec describe_attack_request =
  {
  attack_id: string
    [@ocaml.doc "The unique identifier (ID) for the attack.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec access_denied_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Exception that indicates the specified [AttackId] does not exist, or the requester does not have the appropriate permissions to access the [AttackId].\n"]
type nonrec delete_protection_request =
  {
  protection_id: string
    [@ocaml.doc
      "The unique identifier (ID) for the [Protection] object to be deleted.\n"]}
[@@ocaml.doc ""]
type nonrec delete_protection_group_request =
  {
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc ""]
type nonrec create_protection_response =
  {
  protection_id: string option
    [@ocaml.doc
      "The unique identifier (ID) for the [Protection] object that is created.\n"]}
[@@ocaml.doc ""]
type nonrec create_protection_request =
  {
  tags: tag list option
    [@ocaml.doc
      "One or more tag key-value pairs for the [Protection] object that is created.\n"];
  resource_arn: string
    [@ocaml.doc
      "The ARN (Amazon Resource Name) of the resource to be protected.\n\n The ARN should be in one of the following formats:\n \n  {ul\n        {-  For an Application Load Balancer: \n            {[\n            arn:aws:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/app/{i load-balancer-name}/{i load-balancer-id} \n            ]}\n             \n            \n             }\n        {-  For an Elastic Load Balancer (Classic Load Balancer): \n            {[\n            arn:aws:elasticloadbalancing:{i region}:{i account-id}:loadbalancer/{i load-balancer-name} \n            ]}\n             \n            \n             }\n        {-  For an Amazon CloudFront distribution: \n            {[\n            arn:aws:cloudfront::{i account-id}:distribution/{i distribution-id} \n            ]}\n             \n            \n             }\n        {-  For an Global Accelerator standard accelerator: \n            {[\n            arn:aws:globalaccelerator::{i account-id}:accelerator/{i accelerator-id} \n            ]}\n             \n            \n             }\n        {-  For Amazon Route\194\16053: \n            {[\n            arn:aws:route53:::hostedzone/{i hosted-zone-id} \n            ]}\n             \n            \n             }\n        {-  For an Elastic IP address: \n            {[\n            arn:aws:ec2:{i region}:{i account-id}:eip-allocation/{i allocation-id} \n            ]}\n             \n            \n             }\n        }\n  "];
  name: string
    [@ocaml.doc "Friendly name for the [Protection] you are creating.\n"]}
[@@ocaml.doc ""]
type nonrec create_protection_group_request =
  {
  tags: tag list option
    [@ocaml.doc
      "One or more tag key-value pairs for the protection group.\n"];
  members: string list option
    [@ocaml.doc
      "The Amazon Resource Names (ARNs) of the resources to include in the protection group. You must set this when you set [Pattern] to [ARBITRARY] and you must not set it for any other [Pattern] setting. \n"];
  resource_type: protected_resource_type option
    [@ocaml.doc
      "The resource type to include in the protection group. All protected resources of this type are included in the protection group. Newly protected resources of this type are automatically added to the group. You must set this when you set [Pattern] to [BY_RESOURCE_TYPE] and you must not set it for any other [Pattern] setting. \n"];
  pattern: protection_group_pattern
    [@ocaml.doc
      "The criteria to use to choose the protected resources for inclusion in the group. You can include all resources that have protections, provide a list of resource Amazon Resource Names (ARNs), or include all resources of a specified resource type. \n"];
  aggregation: protection_group_aggregation
    [@ocaml.doc
      "Defines how Shield combines resource data for the group in order to detect, mitigate, and report events.\n\n {ul\n       {-  Sum - Use the total traffic across the group. This is a good choice for most cases. Examples include Elastic IP addresses for EC2 instances that scale manually or automatically.\n           \n            }\n       {-  Mean - Use the average of the traffic across the group. This is a good choice for resources that share traffic uniformly. Examples include accelerators and load balancers.\n           \n            }\n       {-  Max - Use the highest traffic from each resource. This is useful for resources that don't share traffic and for resources that share that traffic in a non-uniform way. Examples include Amazon CloudFront and origin resources for CloudFront distributions.\n           \n            }\n       }\n  "];
  protection_group_id: string
    [@ocaml.doc
      "The name of the protection group. You use this to identify the protection group in lists and to manage the protection group, for example to update, delete, or describe it. \n"]}
[@@ocaml.doc ""]
type nonrec associate_proactive_engagement_details_request =
  {
  emergency_contact_list: emergency_contact list
    [@ocaml.doc
      "A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you for escalations to the SRT and to initiate proactive customer support. \n\n To enable proactive engagement, the contact list must include at least one phone number.\n \n   The contacts that you provide here replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using [DescribeEmergencyContactSettings] and then provide it here. \n   \n    "]}
[@@ocaml.doc ""]
type nonrec associate_health_check_request =
  {
  health_check_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the health check to associate with the protection.\n"];
  protection_id: string
    [@ocaml.doc
      "The unique identifier (ID) for the [Protection] object to add the health check association to. \n"]}
[@@ocaml.doc ""]
type nonrec associate_drt_role_request =
  {
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the role the SRT will use to access your Amazon Web Services account.\n\n Prior to making the [AssociateDRTRole] request, you must attach the {{:https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy}AWSShieldDRTAccessPolicy} managed policy to this role. For more information see {{: https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html}Attaching and Detaching IAM Policies}.\n "]}
[@@ocaml.doc ""]
type nonrec associate_drt_log_bucket_request =
  {
  log_bucket: string
    [@ocaml.doc
      "The Amazon S3 bucket that contains the logs that you want to share.\n"]}
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_validation_exception_field :
  message:string -> name:string -> unit -> validation_exception_field
val make_update_subscription_response : unit -> unit
val make_update_subscription_request :
  ?auto_renew:auto_renew -> unit -> update_subscription_request
val make_update_protection_group_response : unit -> unit
val make_update_protection_group_request :
  ?members:string list ->
    ?resource_type:protected_resource_type ->
      pattern:protection_group_pattern ->
        aggregation:protection_group_aggregation ->
          protection_group_id:string ->
            unit -> update_protection_group_request
val make_update_emergency_contact_settings_response : unit -> unit
val make_emergency_contact :
  ?contact_notes:string ->
    ?phone_number:string -> email_address:string -> unit -> emergency_contact
val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact list ->
    unit -> update_emergency_contact_settings_request
val make_update_application_layer_automatic_response_response : unit -> unit
val make_block_action : unit -> unit
val make_count_action : unit -> unit
val make_response_action :
  ?count:unit -> ?block:unit -> unit -> response_action
val make_update_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:string ->
      unit -> update_application_layer_automatic_response_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_contributor : ?value:int -> ?name:string -> unit -> contributor
val make_time_range :
  ?to_exclusive:CoreTypes.Timestamp.t ->
    ?from_inclusive:CoreTypes.Timestamp.t -> unit -> time_range
val make_tag_resource_response : unit -> unit
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_summarized_counter :
  ?unit_:string ->
    ?n:int ->
      ?sum:float ->
        ?average:float ->
          ?max:float -> ?name:string -> unit -> summarized_counter
val make_summarized_attack_vector :
  ?vector_counters:summarized_counter list ->
    vector_type:string -> unit -> summarized_attack_vector
val make_limit : ?max:int -> ?type_:string -> unit -> limit
val make_protection_limits :
  protected_resource_type_limits:limit list -> unit -> protection_limits
val make_protection_group_arbitrary_pattern_limits :
  max_members:int -> unit -> protection_group_arbitrary_pattern_limits
val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits ->
    unit -> protection_group_pattern_type_limits
val make_protection_group_limits :
  pattern_type_limits:protection_group_pattern_type_limits ->
    max_protection_groups:int -> unit -> protection_group_limits
val make_subscription_limits :
  protection_group_limits:protection_group_limits ->
    protection_limits:protection_limits -> unit -> subscription_limits
val make_subscription :
  ?subscription_arn:string ->
    ?proactive_engagement_status:proactive_engagement_status ->
      ?limits:limit list ->
        ?auto_renew:auto_renew ->
          ?time_commitment_in_seconds:int ->
            ?end_time:CoreTypes.Timestamp.t ->
              ?start_time:CoreTypes.Timestamp.t ->
                subscription_limits:subscription_limits ->
                  unit -> subscription
val make_sub_resource_summary :
  ?counters:summarized_counter list ->
    ?attack_vectors:summarized_attack_vector list ->
      ?id:string -> ?type_:sub_resource_type -> unit -> sub_resource_summary
val make_application_layer_automatic_response_configuration :
  action:response_action ->
    status:application_layer_automatic_response_status ->
      unit -> application_layer_automatic_response_configuration
val make_protection :
  ?application_layer_automatic_response_configuration:application_layer_automatic_response_configuration
    ->
    ?protection_arn:string ->
      ?health_check_ids:string list ->
        ?resource_arn:string ->
          ?name:string -> ?id:string -> unit -> protection
val make_protection_group :
  ?protection_group_arn:string ->
    ?resource_type:protected_resource_type ->
      members:string list ->
        pattern:protection_group_pattern ->
          aggregation:protection_group_aggregation ->
            protection_group_id:string -> unit -> protection_group
val make_mitigation : ?mitigation_name:string -> unit -> mitigation
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_resources_in_protection_group_response :
  ?next_token:string ->
    resource_arns:string list ->
      unit -> list_resources_in_protection_group_response
val make_list_resources_in_protection_group_request :
  ?max_results:int ->
    ?next_token:string ->
      protection_group_id:string ->
        unit -> list_resources_in_protection_group_request
val make_list_protections_response :
  ?next_token:string ->
    ?protections:protection list -> unit -> list_protections_response
val make_inclusion_protection_filters :
  ?resource_types:protected_resource_type list ->
    ?protection_names:string list ->
      ?resource_arns:string list -> unit -> inclusion_protection_filters
val make_list_protections_request :
  ?inclusion_filters:inclusion_protection_filters ->
    ?max_results:int ->
      ?next_token:string -> unit -> list_protections_request
val make_list_protection_groups_response :
  ?next_token:string ->
    protection_groups:protection_group list ->
      unit -> list_protection_groups_response
val make_inclusion_protection_group_filters :
  ?aggregations:protection_group_aggregation list ->
    ?resource_types:protected_resource_type list ->
      ?patterns:protection_group_pattern list ->
        ?protection_group_ids:string list ->
          unit -> inclusion_protection_group_filters
val make_list_protection_groups_request :
  ?inclusion_filters:inclusion_protection_group_filters ->
    ?max_results:int ->
      ?next_token:string -> unit -> list_protection_groups_request
val make_attack_vector_description :
  vector_type:string -> unit -> attack_vector_description
val make_attack_summary :
  ?attack_vectors:attack_vector_description list ->
    ?end_time:CoreTypes.Timestamp.t ->
      ?start_time:CoreTypes.Timestamp.t ->
        ?resource_arn:string -> ?attack_id:string -> unit -> attack_summary
val make_list_attacks_response :
  ?next_token:string ->
    ?attack_summaries:attack_summary list -> unit -> list_attacks_response
val make_list_attacks_request :
  ?max_results:int ->
    ?next_token:string ->
      ?end_time:time_range ->
        ?start_time:time_range ->
          ?resource_arns:string list -> unit -> list_attacks_request
val make_get_subscription_state_response :
  subscription_state:subscription_state ->
    unit -> get_subscription_state_response
val make_get_subscription_state_request : unit -> unit
val make_enable_proactive_engagement_response : unit -> unit
val make_enable_proactive_engagement_request : unit -> unit
val make_enable_application_layer_automatic_response_response : unit -> unit
val make_enable_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:string ->
      unit -> enable_application_layer_automatic_response_request
val make_disassociate_health_check_response : unit -> unit
val make_disassociate_health_check_request :
  health_check_arn:string ->
    protection_id:string -> unit -> disassociate_health_check_request
val make_disassociate_drt_role_response : unit -> unit
val make_disassociate_drt_role_request : unit -> unit
val make_disassociate_drt_log_bucket_response : unit -> unit
val make_disassociate_drt_log_bucket_request :
  log_bucket:string -> unit -> disassociate_drt_log_bucket_request
val make_disable_proactive_engagement_response : unit -> unit
val make_disable_proactive_engagement_request : unit -> unit
val make_disable_application_layer_automatic_response_response : unit -> unit
val make_disable_application_layer_automatic_response_request :
  resource_arn:string ->
    unit -> disable_application_layer_automatic_response_request
val make_describe_subscription_response :
  ?subscription:subscription -> unit -> describe_subscription_response
val make_describe_subscription_request : unit -> unit
val make_describe_protection_response :
  ?protection:protection -> unit -> describe_protection_response
val make_describe_protection_request :
  ?resource_arn:string ->
    ?protection_id:string -> unit -> describe_protection_request
val make_describe_protection_group_response :
  protection_group:protection_group ->
    unit -> describe_protection_group_response
val make_describe_protection_group_request :
  protection_group_id:string -> unit -> describe_protection_group_request
val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact list ->
    unit -> describe_emergency_contact_settings_response
val make_describe_emergency_contact_settings_request : unit -> unit
val make_describe_drt_access_response :
  ?log_bucket_list:string list ->
    ?role_arn:string -> unit -> describe_drt_access_response
val make_describe_drt_access_request : unit -> unit
val make_attack_volume_statistics :
  max:float -> unit -> attack_volume_statistics
val make_attack_volume :
  ?requests_per_second:attack_volume_statistics ->
    ?packets_per_second:attack_volume_statistics ->
      ?bits_per_second:attack_volume_statistics -> unit -> attack_volume
val make_attack_statistics_data_item :
  ?attack_volume:attack_volume ->
    attack_count:int -> unit -> attack_statistics_data_item
val make_describe_attack_statistics_response :
  data_items:attack_statistics_data_item list ->
    time_range:time_range -> unit -> describe_attack_statistics_response
val make_describe_attack_statistics_request : unit -> unit
val make_attack_property :
  ?total:int ->
    ?unit_:unit_ ->
      ?top_contributors:contributor list ->
        ?attack_property_identifier:attack_property_identifier ->
          ?attack_layer:attack_layer -> unit -> attack_property
val make_attack_detail :
  ?mitigations:mitigation list ->
    ?attack_properties:attack_property list ->
      ?attack_counters:summarized_counter list ->
        ?end_time:CoreTypes.Timestamp.t ->
          ?start_time:CoreTypes.Timestamp.t ->
            ?sub_resources:sub_resource_summary list ->
              ?resource_arn:string ->
                ?attack_id:string -> unit -> attack_detail
val make_describe_attack_response :
  ?attack:attack_detail -> unit -> describe_attack_response
val make_describe_attack_request :
  attack_id:string -> unit -> describe_attack_request
val make_delete_subscription_response : unit -> unit
val make_delete_subscription_request : unit -> unit
val make_delete_protection_response : unit -> unit
val make_delete_protection_request :
  protection_id:string -> unit -> delete_protection_request
val make_delete_protection_group_response : unit -> unit
val make_delete_protection_group_request :
  protection_group_id:string -> unit -> delete_protection_group_request
val make_create_subscription_response : unit -> unit
val make_create_subscription_request : unit -> unit
val make_create_protection_response :
  ?protection_id:string -> unit -> create_protection_response
val make_create_protection_request :
  ?tags:tag list ->
    resource_arn:string -> name:string -> unit -> create_protection_request
val make_create_protection_group_response : unit -> unit
val make_create_protection_group_request :
  ?tags:tag list ->
    ?members:string list ->
      ?resource_type:protected_resource_type ->
        pattern:protection_group_pattern ->
          aggregation:protection_group_aggregation ->
            protection_group_id:string ->
              unit -> create_protection_group_request
val make_associate_proactive_engagement_details_response : unit -> unit
val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact list ->
    unit -> associate_proactive_engagement_details_request
val make_associate_health_check_response : unit -> unit
val make_associate_health_check_request :
  health_check_arn:string ->
    protection_id:string -> unit -> associate_health_check_request
val make_associate_drt_role_response : unit -> unit
val make_associate_drt_role_request :
  role_arn:string -> unit -> associate_drt_role_request
val make_associate_drt_log_bucket_response : unit -> unit
val make_associate_drt_log_bucket_request :
  log_bucket:string -> unit -> associate_drt_log_bucket_request(** {1:operations Operations} *)

module AssociateDRTLogBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_log_bucket_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedForDependencyException of
              access_denied_for_dependency_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitsExceededException of limits_exceeded_exception 
          | `NoAssociatedRoleException of no_associated_role_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Authorizes the Shield Response Team (SRT) to access the specified Amazon S3 bucket containing log data such as Application Load Balancer access logs, CloudFront logs, or logs from third party sources. You can associate up to 10 Amazon S3 buckets with your subscription.\n\n To use the services of the SRT and make an [AssociateDRTLogBucket] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.\n "]
module AssociateDRTRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_role_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedForDependencyException of
              access_denied_for_dependency_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Authorizes the Shield Response Team (SRT) using the specified role, to access your Amazon Web Services account to assist with DDoS attack mitigation during potential attacks. This enables the SRT to inspect your WAF configuration and create or update WAF rules and web ACLs.\n\n You can associate only one [RoleArn] with your subscription. If you submit an [AssociateDRTRole] request for an account that already has an associated role, the new [RoleArn] will replace the existing [RoleArn]. \n \n  Prior to making the [AssociateDRTRole] request, you must attach the [AWSShieldDRTAccessPolicy] managed policy to the role that you'll specify in the request. You can access this policy in the IAM console at {{:https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy}AWSShieldDRTAccessPolicy}. For more information see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html}Adding and removing IAM identity permissions}. The role must also trust the service principal [drt.shield.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html}IAM JSON policy elements: Principal}.\n  \n   The SRT will have access only to your WAF and Shield resources. By submitting this request, you authorize the SRT to inspect your WAF and Shield configuration and create and update WAF rules and web ACLs on your behalf. The SRT takes these actions only if explicitly authorized by you.\n   \n    You must have the [iam:PassRole] permission to make an [AssociateDRTRole] request. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a user permissions to pass a role to an Amazon Web Services service}. \n    \n     To use the services of the SRT and make an [AssociateDRTRole] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.\n     "]
module AssociateHealthCheck :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_health_check_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `LimitsExceededException of limits_exceeded_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response. \n\n You define the health check in Route\194\16053 and then associate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}. \n "]
module AssociateProactiveEngagementDetails :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_proactive_engagement_details_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Initializes proactive engagement and sets the list of contacts for the Shield Response Team (SRT) to use. You must provide at least one phone number in the emergency contact list. \n\n After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls [DisableProactiveEngagement] and [EnableProactiveEngagement]. \n \n   This call defines the list of email addresses and phone numbers that the SRT can use to contact you for escalations to the SRT and to initiate proactive customer support.\n   \n    The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using [DescribeEmergencyContactSettings] and then provide it to this call. \n    \n     "]
module CreateProtection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_request ->
        (create_protection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `LimitsExceededException of limits_exceeded_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enables Shield Advanced for a specific Amazon Web Services resource. The resource can be an Amazon CloudFront distribution, Amazon Route\194\16053 hosted zone, Global Accelerator standard accelerator, Elastic IP Address, Application Load Balancer, or a Classic Load Balancer. You can protect Amazon EC2 instances and Network Load Balancers by association with protected Amazon EC2 Elastic IP addresses.\n\n You can add protection to only a single resource with each [CreateProtection] request. You can add protection to multiple resources at once through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html}Adding Shield Advanced protection to Amazon Web Services resources}.\n "]
module CreateProtectionGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_group_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitsExceededException of limits_exceeded_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives. \n"]
module CreateSubscription :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Activates Shield Advanced for an account.\n\n  For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed. \n  \n    When you initially create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an [UpdateSubscription] request. \n    "]
module DeleteProtection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes an Shield Advanced [Protection].\n"]
module DeleteProtectionGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_group_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Removes the specified protection group.\n"]
module DeleteSubscription :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `LockedSubscriptionException of locked_subscription_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes Shield Advanced from an account. Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment. \n"]
module DescribeAttack :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_request ->
        (describe_attack_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalErrorException of internal_error_exception ]) result
end[@@ocaml.doc "Describes the details of a DDoS attack. \n"]
module DescribeAttackStatistics :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_attack_statistics_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception ]) result
end[@@ocaml.doc
     "Provides information about the number and type of attacks Shield has detected in the last year for all resources that belong to your account, regardless of whether you've defined Shield protections for them. This operation is available to Shield customers as well as to Shield Advanced customers.\n\n The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today. For example, if the current time is [2020-10-26 15:39:32 PDT], equal to [2020-10-26 22:39:32 UTC], then the time range for the attack data returned is from [2019-10-26 00:00:00 UTC] to [2020-10-26 00:00:00 UTC]. \n \n  The time range indicates the period covered by the attack statistics data items.\n  "]
module DescribeDRTAccess :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_drt_access_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns the current role and list of Amazon S3 log buckets used by the Shield Response Team (SRT) to access your Amazon Web Services account while assisting with attack mitigation.\n"]
module DescribeEmergencyContactSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_emergency_contact_settings_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n"]
module DescribeProtection :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_request ->
        (describe_protection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Lists the details of a [Protection] object.\n"]
module DescribeProtectionGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_group_request ->
        (describe_protection_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Returns the specification for the specified protection group.\n"]
module DescribeSubscription :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (describe_subscription_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Provides details about the Shield Advanced subscription for an account.\n"]
module DisableApplicationLayerAutomaticResponse :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_application_layer_automatic_response_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disable the Shield Advanced automatic application layer DDoS mitigation feature for the protected resource. This stops Shield Advanced from creating, verifying, and applying WAF rules for attacks that it detects for the resource. \n"]
module DisableProactiveEngagement :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes authorization from the Shield Response Team (SRT) to notify contacts about escalations to the SRT and to initiate proactive customer support.\n"]
module DisassociateDRTLogBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_log_bucket_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedForDependencyException of
              access_denied_for_dependency_exception 
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `NoAssociatedRoleException of no_associated_role_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes the Shield Response Team's (SRT) access to the specified Amazon S3 bucket containing the logs that you shared previously.\n"]
module DisassociateDRTRole :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes the Shield Response Team's (SRT) access to your Amazon Web Services account.\n"]
module DisassociateHealthCheck :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_health_check_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response. \n\n You define the health check in Route\194\16053 and then associate or disassociate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}. \n "]
module EnableApplicationLayerAutomaticResponse :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_application_layer_automatic_response_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LimitsExceededException of limits_exceeded_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enable the Shield Advanced automatic application layer DDoS mitigation for the protected resource. \n\n  This feature is available for Amazon CloudFront distributions and Application Load Balancers only.\n  \n    This causes Shield Advanced to create, verify, and apply WAF rules for DDoS attacks that it detects for the resource. Shield Advanced applies the rules in a Shield rule group inside the web ACL that you've associated with the resource. For information about how automatic mitigation works and the requirements for using it, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-automatic-app-layer-response.html}Shield Advanced automatic application layer DDoS mitigation}.\n    \n      Don't use this action to make changes to automatic mitigation settings when it's already enabled for a resource. Instead, use [UpdateApplicationLayerAutomaticResponse].\n      \n        To use this feature, you must associate a web ACL with the protected resource. The web ACL must be created using the latest version of WAF (v2). You can associate the web ACL through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced}. You can also associate the web ACL to the resource through the WAF console or the WAF API, but you must manage Shield Advanced automatic mitigation through Shield Advanced. For information about WAF, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/}WAF Developer Guide}.\n        "]
module EnableProactiveEngagement :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Authorizes the Shield Response Team (SRT) to use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.\n"]
module GetSubscriptionState :
sig
  val request :
    Smaws_Lib.Context.t ->
      unit ->
        (get_subscription_state_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception ]) result
end[@@ocaml.doc
     "Returns the [SubscriptionState], either [Active] or [Inactive].\n"]
module ListAttacks :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_attacks_request ->
        (list_attacks_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception ])
          result
end[@@ocaml.doc
     "Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.\n"]
module ListProtectionGroups :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_protection_groups_request ->
        (list_protection_groups_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidPaginationTokenException of
              invalid_pagination_token_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves [ProtectionGroup] objects for the account. You can retrieve all protection groups or you can provide filtering criteria and retrieve just the subset of protection groups that match the criteria. \n"]
module ListProtections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_protections_request ->
        (list_protections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidPaginationTokenException of
              invalid_pagination_token_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves [Protection] objects for the account. You can retrieve all protections or you can provide filtering criteria and retrieve just the subset of protections that match the criteria. \n"]
module ListResourcesInProtectionGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_in_protection_group_request ->
        (list_resources_in_protection_group_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidPaginationTokenException of
              invalid_pagination_token_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves the resources that are included in the protection group. \n"]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in Shield.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Adds or updates tags for a resource in Shield.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `InvalidResourceException of invalid_resource_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Removes tags from a resource in Shield.\n"]
module UpdateApplicationLayerAutomaticResponse :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_layer_automatic_response_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidOperationException of invalid_operation_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates an existing Shield Advanced automatic application layer DDoS mitigation configuration for the specified resource.\n"]
module UpdateEmergencyContactSettings :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_emergency_contact_settings_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the details of the list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n"]
module UpdateProtectionGroup :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_protection_group_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates an existing protection group. A protection group is a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives. \n"]
module UpdateSubscription :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_subscription_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LockedSubscriptionException of locked_subscription_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.\n\n  For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed. \n  \n   "]