open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "shield";
      endpointPrefix = "shield";
      version = "2016-06-02";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec validation_exception_reason =
  | OTHER 
  | FIELD_VALIDATION_FAILED [@@ocaml.doc ""]
type nonrec validation_exception_field = {
  message: string ;
  name: string }[@@ocaml.doc
                  "Provides information about a particular parameter passed inside a request that resulted in an exception.\n"]
type nonrec update_subscription_response = unit
type nonrec auto_renew =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec update_subscription_request = {
  auto_renew: auto_renew option }[@@ocaml.doc ""]
type nonrec resource_not_found_exception =
  {
  resource_type: string option ;
  message: string option }[@@ocaml.doc
                            "Exception indicating the specified resource does not exist. If available, this exception includes details in additional properties. \n"]
type nonrec optimistic_lock_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the resource state has been modified by another client. Retrieve the resource and then retry your request.\n"]
type nonrec locked_subscription_exception = {
  message: string option }[@@ocaml.doc
                            "You are trying to update a subscription that has not yet completed the 1-year commitment. You can change the [AutoRenew] parameter during the last 30 days of your subscription. This exception indicates that you are attempting to change [AutoRenew] prior to that period.\n"]
type nonrec invalid_parameter_exception =
  {
  fields: validation_exception_field list option ;
  reason: validation_exception_reason option ;
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the parameters passed to the API are invalid. If available, this exception includes details in additional properties. \n"]
type nonrec internal_error_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates that a problem occurred with the service infrastructure. You can retry the request.\n"]
type nonrec update_protection_group_response = unit
type nonrec protection_group_aggregation =
  | MAX 
  | MEAN 
  | SUM [@@ocaml.doc ""]
type nonrec protection_group_pattern =
  | BY_RESOURCE_TYPE 
  | ARBITRARY 
  | ALL [@@ocaml.doc ""]
type nonrec protected_resource_type =
  | GLOBAL_ACCELERATOR 
  | APPLICATION_LOAD_BALANCER 
  | CLASSIC_LOAD_BALANCER 
  | ELASTIC_IP_ALLOCATION 
  | ROUTE_53_HOSTED_ZONE 
  | CLOUDFRONT_DISTRIBUTION [@@ocaml.doc ""]
type nonrec update_protection_group_request =
  {
  members: string list option ;
  resource_type: protected_resource_type option ;
  pattern: protection_group_pattern ;
  aggregation: protection_group_aggregation ;
  protection_group_id: string }[@@ocaml.doc ""]
type nonrec update_emergency_contact_settings_response = unit
type nonrec emergency_contact =
  {
  contact_notes: string option ;
  phone_number: string option ;
  email_address: string }[@@ocaml.doc
                           "Contact information that the SRT can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.\n"]
type nonrec update_emergency_contact_settings_request =
  {
  emergency_contact_list: emergency_contact list option }[@@ocaml.doc ""]
type nonrec update_application_layer_automatic_response_response = unit
type nonrec block_action = unit
type nonrec count_action = unit
type nonrec response_action =
  {
  count: count_action option ;
  block: block_action option }[@@ocaml.doc
                                "Specifies the action setting that Shield Advanced should use in the WAF rules that it creates on behalf of the protected resource in response to DDoS attacks. You specify this as part of the configuration for the automatic application layer DDoS mitigation feature, when you enable or update automatic mitigation. Shield Advanced creates the WAF rules in a Shield Advanced-managed rule group, inside the web ACL that you have associated with the resource. \n"]
type nonrec update_application_layer_automatic_response_request =
  {
  action: response_action ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec invalid_operation_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the operation would not cause any change to occur.\n"]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec invalid_resource_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the resource is invalid. You might not have access to the resource, or the resource might not exist.\n"]
type nonrec unit_ =
  | REQUESTS 
  | PACKETS 
  | BYTES 
  | BITS [@@ocaml.doc ""]
type nonrec contributor = {
  value: int option ;
  name: string option }[@@ocaml.doc
                         "A contributor to the attack and their contribution. \n"]
type nonrec time_range =
  {
  to_exclusive: CoreTypes.Timestamp.t option ;
  from_inclusive: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                                  "The time range. \n"]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "A tag associated with an Amazon Web Services resource. Tags are key:value pairs that you can use to categorize and manage your resources, for purposes like billing or other management. Typically, the tag key represents a category, such as \"environment\", and the tag value represents a specific value within that category, such as \"test,\" \"development,\" or \"production\". Or you might set the tag key to \"customer\" and the value to the customer name or ID. You can specify one or more tags to add to each Amazon Web Services resource, up to 50 tags for a resource.\n"]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec summarized_counter =
  {
  unit_: string option ;
  n: int option ;
  sum: float option ;
  average: float option ;
  max: float option ;
  name: string option }[@@ocaml.doc
                         "The counter that describes a DDoS attack.\n"]
type nonrec summarized_attack_vector =
  {
  vector_counters: summarized_counter list option ;
  vector_type: string }[@@ocaml.doc
                         "A summary of information about the attack.\n"]
type nonrec subscription_state =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec limit = {
  max: int option ;
  type_: string option }[@@ocaml.doc
                          "Specifies how many protections of a given type you can create.\n"]
type nonrec protection_limits = {
  protected_resource_type_limits: limit list }[@@ocaml.doc
                                                "Limits settings on protections for your subscription. \n"]
type nonrec protection_group_arbitrary_pattern_limits = {
  max_members: int }[@@ocaml.doc
                      "Limits settings on protection groups with arbitrary pattern type. \n"]
type nonrec protection_group_pattern_type_limits =
  {
  arbitrary_pattern_limits: protection_group_arbitrary_pattern_limits }
[@@ocaml.doc
  "Limits settings by pattern type in the protection groups for your subscription. \n"]
type nonrec protection_group_limits =
  {
  pattern_type_limits: protection_group_pattern_type_limits ;
  max_protection_groups: int }[@@ocaml.doc
                                "Limits settings on protection groups for your subscription. \n"]
type nonrec subscription_limits =
  {
  protection_group_limits: protection_group_limits ;
  protection_limits: protection_limits }[@@ocaml.doc
                                          "Limits settings for your subscription. \n"]
type nonrec proactive_engagement_status =
  | PENDING 
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec subscription =
  {
  subscription_arn: string option ;
  subscription_limits: subscription_limits ;
  proactive_engagement_status: proactive_engagement_status option ;
  limits: limit list option ;
  auto_renew: auto_renew option ;
  time_commitment_in_seconds: int option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Information about the Shield Advanced subscription for an account.\n"]
type nonrec sub_resource_type =
  | URL 
  | IP [@@ocaml.doc ""]
type nonrec sub_resource_summary =
  {
  counters: summarized_counter list option ;
  attack_vectors: summarized_attack_vector list option ;
  id: string option ;
  type_: sub_resource_type option }[@@ocaml.doc
                                     "The attack information for the specified SubResource.\n"]
type nonrec resource_already_exists_exception =
  {
  resource_type: string option ;
  message: string option }[@@ocaml.doc
                            "Exception indicating the specified resource already exists. If available, this exception includes details in additional properties. \n"]
type nonrec application_layer_automatic_response_status =
  | DISABLED 
  | ENABLED [@@ocaml.doc ""]
type nonrec application_layer_automatic_response_configuration =
  {
  action: response_action ;
  status: application_layer_automatic_response_status }[@@ocaml.doc
                                                         "The automatic application layer DDoS mitigation settings for a [Protection]. This configuration determines whether Shield Advanced automatically manages rules in the web ACL in order to respond to application layer events that Shield Advanced determines to be DDoS attacks. \n"]
type nonrec protection =
  {
  application_layer_automatic_response_configuration:
    application_layer_automatic_response_configuration option ;
  protection_arn: string option ;
  health_check_ids: string list option ;
  resource_arn: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "An object that represents a resource that is under DDoS protection.\n"]
type nonrec protection_group =
  {
  protection_group_arn: string option ;
  members: string list ;
  resource_type: protected_resource_type option ;
  pattern: protection_group_pattern ;
  aggregation: protection_group_aggregation ;
  protection_group_id: string }[@@ocaml.doc
                                 "A grouping of protected resources that you and Shield Advanced can monitor as a collective. This resource grouping improves the accuracy of detection and reduces false positives. \n"]
type nonrec no_associated_role_exception = {
  message: string option }[@@ocaml.doc
                            "The ARN of the role that you specified does not exist.\n"]
type nonrec mitigation = {
  mitigation_name: string option }[@@ocaml.doc
                                    "The mitigation applied to a DDoS attack.\n"]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec list_resources_in_protection_group_response =
  {
  next_token: string option ;
  resource_arns: string list }[@@ocaml.doc ""]
type nonrec list_resources_in_protection_group_request =
  {
  max_results: int option ;
  next_token: string option ;
  protection_group_id: string }[@@ocaml.doc ""]
type nonrec invalid_pagination_token_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the [NextToken] specified in the request is invalid. Submit the request using the [NextToken] value that was returned in the prior response.\n"]
type nonrec list_protections_response =
  {
  next_token: string option ;
  protections: protection list option }[@@ocaml.doc ""]
type nonrec inclusion_protection_filters =
  {
  resource_types: protected_resource_type list option ;
  protection_names: string list option ;
  resource_arns: string list option }[@@ocaml.doc
                                       "Narrows the set of protections that the call retrieves. You can retrieve a single protection by providing its name or the ARN (Amazon Resource Name) of its protected resource. You can also retrieve all protections for a specific resource type. You can provide up to one criteria per filter type. Shield Advanced returns protections that exactly match all of the filter criteria that you provide.\n"]
type nonrec list_protections_request =
  {
  inclusion_filters: inclusion_protection_filters option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_protection_groups_response =
  {
  next_token: string option ;
  protection_groups: protection_group list }[@@ocaml.doc ""]
type nonrec inclusion_protection_group_filters =
  {
  aggregations: protection_group_aggregation list option ;
  resource_types: protected_resource_type list option ;
  patterns: protection_group_pattern list option ;
  protection_group_ids: string list option }[@@ocaml.doc
                                              "Narrows the set of protection groups that the call retrieves. You can retrieve a single protection group by its name and you can retrieve all protection groups that are configured with a specific pattern, aggregation, or resource type. You can provide up to one criteria per filter type. Shield Advanced returns the protection groups that exactly match all of the search criteria that you provide.\n"]
type nonrec list_protection_groups_request =
  {
  inclusion_filters: inclusion_protection_group_filters option ;
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec attack_vector_description = {
  vector_type: string }[@@ocaml.doc "Describes the attack.\n"]
type nonrec attack_summary =
  {
  attack_vectors: attack_vector_description list option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  resource_arn: string option ;
  attack_id: string option }[@@ocaml.doc
                              "Summarizes all DDoS attacks for a specified time period.\n"]
type nonrec list_attacks_response =
  {
  next_token: string option ;
  attack_summaries: attack_summary list option }[@@ocaml.doc ""]
type nonrec list_attacks_request =
  {
  max_results: int option ;
  next_token: string option ;
  end_time: time_range option ;
  start_time: time_range option ;
  resource_arns: string list option }[@@ocaml.doc ""]
type nonrec limits_exceeded_exception =
  {
  limit: int option ;
  type_: string option ;
  message: string option }[@@ocaml.doc
                            "Exception that indicates that the operation would exceed a limit.\n"]
type nonrec get_subscription_state_response =
  {
  subscription_state: subscription_state }[@@ocaml.doc ""]
type nonrec get_subscription_state_request = unit
type nonrec enable_proactive_engagement_response = unit
type nonrec enable_proactive_engagement_request = unit
type nonrec enable_application_layer_automatic_response_response = unit
type nonrec enable_application_layer_automatic_response_request =
  {
  action: response_action ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec disassociate_health_check_response = unit
type nonrec disassociate_health_check_request =
  {
  health_check_arn: string ;
  protection_id: string }[@@ocaml.doc ""]
type nonrec disassociate_drt_role_response = unit
type nonrec disassociate_drt_role_request = unit
type nonrec disassociate_drt_log_bucket_response = unit
type nonrec disassociate_drt_log_bucket_request = {
  log_bucket: string }[@@ocaml.doc ""]
type nonrec access_denied_for_dependency_exception =
  {
  message: string option }[@@ocaml.doc
                            "In order to grant the necessary access to the Shield Response Team (SRT) the user submitting the request must have the [iam:PassRole] permission. This error indicates the user did not have the appropriate permissions. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a User Permissions to Pass a Role to an Amazon Web Services Service}. \n"]
type nonrec disable_proactive_engagement_response = unit
type nonrec disable_proactive_engagement_request = unit
type nonrec disable_application_layer_automatic_response_response = unit
type nonrec disable_application_layer_automatic_response_request =
  {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec describe_subscription_response =
  {
  subscription: subscription option }[@@ocaml.doc ""]
type nonrec describe_subscription_request = unit
type nonrec describe_protection_response = {
  protection: protection option }[@@ocaml.doc ""]
type nonrec describe_protection_request =
  {
  resource_arn: string option ;
  protection_id: string option }[@@ocaml.doc ""]
type nonrec describe_protection_group_response =
  {
  protection_group: protection_group }[@@ocaml.doc ""]
type nonrec describe_protection_group_request =
  {
  protection_group_id: string }[@@ocaml.doc ""]
type nonrec describe_emergency_contact_settings_response =
  {
  emergency_contact_list: emergency_contact list option }[@@ocaml.doc ""]
type nonrec describe_emergency_contact_settings_request = unit
type nonrec describe_drt_access_response =
  {
  log_bucket_list: string list option ;
  role_arn: string option }[@@ocaml.doc ""]
type nonrec describe_drt_access_request = unit
type nonrec attack_volume_statistics = {
  max: float }[@@ocaml.doc
                "Statistics objects for the various data types in [AttackVolume]. \n"]
type nonrec attack_volume =
  {
  requests_per_second: attack_volume_statistics option ;
  packets_per_second: attack_volume_statistics option ;
  bits_per_second: attack_volume_statistics option }[@@ocaml.doc
                                                      "Information about the volume of attacks during the time period, included in an [AttackStatisticsDataItem]. If the accompanying [AttackCount] in the statistics object is zero, this setting might be empty.\n"]
type nonrec attack_statistics_data_item =
  {
  attack_count: int ;
  attack_volume: attack_volume option }[@@ocaml.doc
                                         "A single attack statistics data record. This is returned by [DescribeAttackStatistics] along with a time range indicating the time period that the attack statistics apply to. \n"]
type nonrec describe_attack_statistics_response =
  {
  data_items: attack_statistics_data_item list ;
  time_range: time_range }[@@ocaml.doc ""]
type nonrec describe_attack_statistics_request = unit
type nonrec attack_layer =
  | APPLICATION 
  | NETWORK [@@ocaml.doc ""]
type nonrec attack_property_identifier =
  | WORDPRESS_PINGBACK_SOURCE 
  | WORDPRESS_PINGBACK_REFLECTOR 
  | SOURCE_USER_AGENT 
  | SOURCE_IP_ADDRESS 
  | SOURCE_COUNTRY 
  | SOURCE_ASN 
  | REFERRER 
  | DESTINATION_URL [@@ocaml.doc ""]
type nonrec attack_property =
  {
  total: int option ;
  unit_: unit_ option ;
  top_contributors: contributor list option ;
  attack_property_identifier: attack_property_identifier option ;
  attack_layer: attack_layer option }[@@ocaml.doc
                                       "Details of a Shield event. This is provided as part of an [AttackDetail].\n"]
type nonrec attack_detail =
  {
  mitigations: mitigation list option ;
  attack_properties: attack_property list option ;
  attack_counters: summarized_counter list option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  sub_resources: sub_resource_summary list option ;
  resource_arn: string option ;
  attack_id: string option }[@@ocaml.doc "The details of a DDoS attack.\n"]
type nonrec describe_attack_response = {
  attack: attack_detail option }[@@ocaml.doc ""]
type nonrec describe_attack_request = {
  attack_id: string }[@@ocaml.doc ""]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "Exception that indicates the specified [AttackId] does not exist, or the requester does not have the appropriate permissions to access the [AttackId].\n"]
type nonrec delete_subscription_response = unit
type nonrec delete_subscription_request = unit
type nonrec delete_protection_response = unit
type nonrec delete_protection_request = {
  protection_id: string }[@@ocaml.doc ""]
type nonrec delete_protection_group_response = unit
type nonrec delete_protection_group_request = {
  protection_group_id: string }[@@ocaml.doc ""]
type nonrec create_subscription_response = unit
type nonrec create_subscription_request = unit
type nonrec create_protection_response = {
  protection_id: string option }[@@ocaml.doc ""]
type nonrec create_protection_request =
  {
  tags: tag list option ;
  resource_arn: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_protection_group_response = unit
type nonrec create_protection_group_request =
  {
  tags: tag list option ;
  members: string list option ;
  resource_type: protected_resource_type option ;
  pattern: protection_group_pattern ;
  aggregation: protection_group_aggregation ;
  protection_group_id: string }[@@ocaml.doc ""]
type nonrec associate_proactive_engagement_details_response = unit
type nonrec associate_proactive_engagement_details_request =
  {
  emergency_contact_list: emergency_contact list }[@@ocaml.doc ""]
type nonrec associate_health_check_response = unit
type nonrec associate_health_check_request =
  {
  health_check_arn: string ;
  protection_id: string }[@@ocaml.doc ""]
type nonrec associate_drt_role_response = unit
type nonrec associate_drt_role_request = {
  role_arn: string }[@@ocaml.doc ""]
type nonrec associate_drt_log_bucket_response = unit
type nonrec associate_drt_log_bucket_request = {
  log_bucket: string }[@@ocaml.doc ""]