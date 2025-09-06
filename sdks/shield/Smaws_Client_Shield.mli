(** 
    Shield client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validation_exception_field :
  message:string_ -> name:string_ -> unit -> validation_exception_field
val make_update_subscription_response : unit -> unit
val make_update_subscription_request :
  ?auto_renew:auto_renew -> unit -> update_subscription_request
val make_update_protection_group_response : unit -> unit
val make_update_protection_group_request :
  ?members:protection_group_members ->
    ?resource_type:protected_resource_type ->
      pattern:protection_group_pattern ->
        aggregation:protection_group_aggregation ->
          protection_group_id:protection_group_id ->
            unit -> update_protection_group_request
val make_update_emergency_contact_settings_response : unit -> unit
val make_emergency_contact :
  ?contact_notes:contact_notes ->
    ?phone_number:phone_number ->
      email_address:email_address -> unit -> emergency_contact
val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact_list ->
    unit -> update_emergency_contact_settings_request
val make_update_application_layer_automatic_response_response : unit -> unit
val make_block_action : unit -> unit
val make_count_action : unit -> unit
val make_response_action :
  ?count:count_action -> ?block:block_action -> unit -> response_action
val make_update_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:resource_arn ->
      unit -> update_application_layer_automatic_response_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:resource_arn -> unit -> untag_resource_request
val make_contributor : ?value:long -> ?name:string_ -> unit -> contributor
val make_time_range :
  ?to_exclusive:timestamp -> ?from_inclusive:timestamp -> unit -> time_range
val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:resource_arn -> unit -> tag_resource_request
val make_summarized_counter :
  ?unit_:string_ ->
    ?n:integer ->
      ?sum:double ->
        ?average:double ->
          ?max:double -> ?name:string_ -> unit -> summarized_counter
val make_summarized_attack_vector :
  ?vector_counters:summarized_counter_list ->
    vector_type:string_ -> unit -> summarized_attack_vector
val make_limit : ?max:long -> ?type_:string_ -> unit -> limit
val make_protection_limits :
  protected_resource_type_limits:limits -> unit -> protection_limits
val make_protection_group_arbitrary_pattern_limits :
  max_members:long -> unit -> protection_group_arbitrary_pattern_limits
val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits ->
    unit -> protection_group_pattern_type_limits
val make_protection_group_limits :
  pattern_type_limits:protection_group_pattern_type_limits ->
    max_protection_groups:long -> unit -> protection_group_limits
val make_subscription_limits :
  protection_group_limits:protection_group_limits ->
    protection_limits:protection_limits -> unit -> subscription_limits
val make_subscription :
  ?subscription_arn:resource_arn ->
    ?proactive_engagement_status:proactive_engagement_status ->
      ?limits:limits ->
        ?auto_renew:auto_renew ->
          ?time_commitment_in_seconds:duration_in_seconds ->
            ?end_time:timestamp ->
              ?start_time:timestamp ->
                subscription_limits:subscription_limits ->
                  unit -> subscription
val make_sub_resource_summary :
  ?counters:summarized_counter_list ->
    ?attack_vectors:summarized_attack_vector_list ->
      ?id:string_ -> ?type_:sub_resource_type -> unit -> sub_resource_summary
val make_application_layer_automatic_response_configuration :
  action:response_action ->
    status:application_layer_automatic_response_status ->
      unit -> application_layer_automatic_response_configuration
val make_protection :
  ?application_layer_automatic_response_configuration:application_layer_automatic_response_configuration
    ->
    ?protection_arn:resource_arn ->
      ?health_check_ids:health_check_ids ->
        ?resource_arn:resource_arn ->
          ?name:protection_name -> ?id:protection_id -> unit -> protection
val make_protection_group :
  ?protection_group_arn:resource_arn ->
    ?resource_type:protected_resource_type ->
      members:protection_group_members ->
        pattern:protection_group_pattern ->
          aggregation:protection_group_aggregation ->
            protection_group_id:protection_group_id ->
              unit -> protection_group
val make_mitigation : ?mitigation_name:string_ -> unit -> mitigation
val make_list_tags_for_resource_response :
  ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:resource_arn -> unit -> list_tags_for_resource_request
val make_list_resources_in_protection_group_response :
  ?next_token:token ->
    resource_arns:resource_arn_list ->
      unit -> list_resources_in_protection_group_response
val make_list_resources_in_protection_group_request :
  ?max_results:max_results ->
    ?next_token:token ->
      protection_group_id:protection_group_id ->
        unit -> list_resources_in_protection_group_request
val make_list_protections_response :
  ?next_token:token ->
    ?protections:protections -> unit -> list_protections_response
val make_inclusion_protection_filters :
  ?resource_types:protected_resource_type_filters ->
    ?protection_names:protection_name_filters ->
      ?resource_arns:resource_arn_filters ->
        unit -> inclusion_protection_filters
val make_list_protections_request :
  ?inclusion_filters:inclusion_protection_filters ->
    ?max_results:max_results ->
      ?next_token:token -> unit -> list_protections_request
val make_list_protection_groups_response :
  ?next_token:token ->
    protection_groups:protection_groups ->
      unit -> list_protection_groups_response
val make_inclusion_protection_group_filters :
  ?aggregations:protection_group_aggregation_filters ->
    ?resource_types:protected_resource_type_filters ->
      ?patterns:protection_group_pattern_filters ->
        ?protection_group_ids:protection_group_id_filters ->
          unit -> inclusion_protection_group_filters
val make_list_protection_groups_request :
  ?inclusion_filters:inclusion_protection_group_filters ->
    ?max_results:max_results ->
      ?next_token:token -> unit -> list_protection_groups_request
val make_attack_vector_description :
  vector_type:string_ -> unit -> attack_vector_description
val make_attack_summary :
  ?attack_vectors:attack_vector_description_list ->
    ?end_time:attack_timestamp ->
      ?start_time:attack_timestamp ->
        ?resource_arn:string_ -> ?attack_id:string_ -> unit -> attack_summary
val make_list_attacks_response :
  ?next_token:token ->
    ?attack_summaries:attack_summaries -> unit -> list_attacks_response
val make_list_attacks_request :
  ?max_results:max_results ->
    ?next_token:token ->
      ?end_time:time_range ->
        ?start_time:time_range ->
          ?resource_arns:resource_arn_filter_list ->
            unit -> list_attacks_request
val make_get_subscription_state_response :
  subscription_state:subscription_state ->
    unit -> get_subscription_state_response
val make_get_subscription_state_request : unit -> unit
val make_enable_proactive_engagement_response : unit -> unit
val make_enable_proactive_engagement_request : unit -> unit
val make_enable_application_layer_automatic_response_response : unit -> unit
val make_enable_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:resource_arn ->
      unit -> enable_application_layer_automatic_response_request
val make_disassociate_health_check_response : unit -> unit
val make_disassociate_health_check_request :
  health_check_arn:health_check_arn ->
    protection_id:protection_id -> unit -> disassociate_health_check_request
val make_disassociate_drt_role_response : unit -> unit
val make_disassociate_drt_role_request : unit -> unit
val make_disassociate_drt_log_bucket_response : unit -> unit
val make_disassociate_drt_log_bucket_request :
  log_bucket:log_bucket -> unit -> disassociate_drt_log_bucket_request
val make_disable_proactive_engagement_response : unit -> unit
val make_disable_proactive_engagement_request : unit -> unit
val make_disable_application_layer_automatic_response_response : unit -> unit
val make_disable_application_layer_automatic_response_request :
  resource_arn:resource_arn ->
    unit -> disable_application_layer_automatic_response_request
val make_describe_subscription_response :
  ?subscription:subscription -> unit -> describe_subscription_response
val make_describe_subscription_request : unit -> unit
val make_describe_protection_response :
  ?protection:protection -> unit -> describe_protection_response
val make_describe_protection_request :
  ?resource_arn:resource_arn ->
    ?protection_id:protection_id -> unit -> describe_protection_request
val make_describe_protection_group_response :
  protection_group:protection_group ->
    unit -> describe_protection_group_response
val make_describe_protection_group_request :
  protection_group_id:protection_group_id ->
    unit -> describe_protection_group_request
val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact_list ->
    unit -> describe_emergency_contact_settings_response
val make_describe_emergency_contact_settings_request : unit -> unit
val make_describe_drt_access_response :
  ?log_bucket_list:log_bucket_list ->
    ?role_arn:role_arn -> unit -> describe_drt_access_response
val make_describe_drt_access_request : unit -> unit
val make_attack_volume_statistics :
  max:double -> unit -> attack_volume_statistics
val make_attack_volume :
  ?requests_per_second:attack_volume_statistics ->
    ?packets_per_second:attack_volume_statistics ->
      ?bits_per_second:attack_volume_statistics -> unit -> attack_volume
val make_attack_statistics_data_item :
  ?attack_volume:attack_volume ->
    attack_count:long -> unit -> attack_statistics_data_item
val make_describe_attack_statistics_response :
  data_items:attack_statistics_data_list ->
    time_range:time_range -> unit -> describe_attack_statistics_response
val make_describe_attack_statistics_request : unit -> unit
val make_attack_property :
  ?total:long ->
    ?unit_:unit_ ->
      ?top_contributors:top_contributors ->
        ?attack_property_identifier:attack_property_identifier ->
          ?attack_layer:attack_layer -> unit -> attack_property
val make_attack_detail :
  ?mitigations:mitigation_list ->
    ?attack_properties:attack_properties ->
      ?attack_counters:summarized_counter_list ->
        ?end_time:attack_timestamp ->
          ?start_time:attack_timestamp ->
            ?sub_resources:sub_resource_summary_list ->
              ?resource_arn:resource_arn ->
                ?attack_id:attack_id -> unit -> attack_detail
val make_describe_attack_response :
  ?attack:attack_detail -> unit -> describe_attack_response
val make_describe_attack_request :
  attack_id:attack_id -> unit -> describe_attack_request
val make_delete_subscription_response : unit -> unit
val make_delete_subscription_request : unit -> unit
val make_delete_protection_response : unit -> unit
val make_delete_protection_request :
  protection_id:protection_id -> unit -> delete_protection_request
val make_delete_protection_group_response : unit -> unit
val make_delete_protection_group_request :
  protection_group_id:protection_group_id ->
    unit -> delete_protection_group_request
val make_create_subscription_response : unit -> unit
val make_create_subscription_request : unit -> unit
val make_create_protection_response :
  ?protection_id:protection_id -> unit -> create_protection_response
val make_create_protection_request :
  ?tags:tag_list ->
    resource_arn:resource_arn ->
      name:protection_name -> unit -> create_protection_request
val make_create_protection_group_response : unit -> unit
val make_create_protection_group_request :
  ?tags:tag_list ->
    ?members:protection_group_members ->
      ?resource_type:protected_resource_type ->
        pattern:protection_group_pattern ->
          aggregation:protection_group_aggregation ->
            protection_group_id:protection_group_id ->
              unit -> create_protection_group_request
val make_associate_proactive_engagement_details_response : unit -> unit
val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact_list ->
    unit -> associate_proactive_engagement_details_request
val make_associate_health_check_response : unit -> unit
val make_associate_health_check_request :
  health_check_arn:health_check_arn ->
    protection_id:protection_id -> unit -> associate_health_check_request
val make_associate_drt_role_response : unit -> unit
val make_associate_drt_role_request :
  role_arn:role_arn -> unit -> associate_drt_role_request
val make_associate_drt_log_bucket_response : unit -> unit
val make_associate_drt_log_bucket_request :
  log_bucket:log_bucket -> unit -> associate_drt_log_bucket_request
(** {1:operations Operations} *)

module AssociateDRTLogBucket :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_log_bucket_request ->
        (associate_drt_log_bucket_response,
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
        (associate_drt_role_response,
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
        (associate_health_check_response,
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
        (associate_proactive_engagement_details_response,
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
        (create_protection_group_response,
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
      create_subscription_request ->
        (create_subscription_response,
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
        (delete_protection_response,
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
        (delete_protection_group_response,
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
      delete_subscription_request ->
        (delete_subscription_response,
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
      describe_attack_statistics_request ->
        (describe_attack_statistics_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception ]) result
end[@@ocaml.doc
     "Provides information about the number and type of attacks Shield has detected in the last year for all resources that belong to your account, regardless of whether you've defined Shield protections for them. This operation is available to Shield customers as well as to Shield Advanced customers.\n\n The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today. For example, if the current time is [2020-10-26 15:39:32 PDT], equal to [2020-10-26 22:39:32 UTC], then the time range for the attack data returned is from [2019-10-26 00:00:00 UTC] to [2020-10-26 00:00:00 UTC]. \n \n  The time range indicates the period covered by the attack statistics data items.\n  "]
module DescribeDRTAccess :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_drt_access_request ->
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
      describe_emergency_contact_settings_request ->
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
      describe_subscription_request ->
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
        (disable_application_layer_automatic_response_response,
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
      disable_proactive_engagement_request ->
        (disable_proactive_engagement_response,
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
        (disassociate_drt_log_bucket_response,
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
      disassociate_drt_role_request ->
        (disassociate_drt_role_response,
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
        (disassociate_health_check_response,
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
        (enable_application_layer_automatic_response_response,
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
      enable_proactive_engagement_request ->
        (enable_proactive_engagement_response,
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
      get_subscription_state_request ->
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
        (tag_resource_response,
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
        (untag_resource_response,
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
        (update_application_layer_automatic_response_response,
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
        (update_emergency_contact_settings_response,
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
        (update_protection_group_response,
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
        (update_subscription_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalErrorException of internal_error_exception 
          | `InvalidParameterException of invalid_parameter_exception 
          | `LockedSubscriptionException of locked_subscription_exception 
          | `OptimisticLockException of optimistic_lock_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.\n\n  For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed. \n  \n   "](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
