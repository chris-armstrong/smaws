open Smaws_Lib
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
[@@ocaml.doc ""]