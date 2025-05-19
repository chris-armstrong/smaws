(** 
    Shield client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
  log_bucket: string }[@@ocaml.doc ""](** {1:builders Builders} *)

val make_validation_exception_field :
  message:string -> name:string -> unit -> validation_exception_field
val make_update_subscription_response : unit -> update_subscription_response
val make_update_subscription_request :
  ?auto_renew:auto_renew -> unit -> update_subscription_request
val make_update_protection_group_response :
  unit -> update_protection_group_response
val make_update_protection_group_request :
  ?members:string list ->
    ?resource_type:protected_resource_type ->
      pattern:protection_group_pattern ->
        aggregation:protection_group_aggregation ->
          protection_group_id:string ->
            unit -> update_protection_group_request
val make_update_emergency_contact_settings_response :
  unit -> update_emergency_contact_settings_response
val make_emergency_contact :
  ?contact_notes:string ->
    ?phone_number:string -> email_address:string -> unit -> emergency_contact
val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact list ->
    unit -> update_emergency_contact_settings_request
val make_update_application_layer_automatic_response_response :
  unit -> update_application_layer_automatic_response_response
val make_block_action : unit -> block_action
val make_count_action : unit -> count_action
val make_response_action :
  ?count:count_action -> ?block:block_action -> unit -> response_action
val make_update_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:string ->
      unit -> update_application_layer_automatic_response_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_contributor : ?value:int -> ?name:string -> unit -> contributor
val make_time_range :
  ?to_exclusive:CoreTypes.Timestamp.t ->
    ?from_inclusive:CoreTypes.Timestamp.t -> unit -> time_range
val make_tag_resource_response : unit -> tag_resource_response
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
val make_get_subscription_state_request :
  unit -> get_subscription_state_request
val make_enable_proactive_engagement_response :
  unit -> enable_proactive_engagement_response
val make_enable_proactive_engagement_request :
  unit -> enable_proactive_engagement_request
val make_enable_application_layer_automatic_response_response :
  unit -> enable_application_layer_automatic_response_response
val make_enable_application_layer_automatic_response_request :
  action:response_action ->
    resource_arn:string ->
      unit -> enable_application_layer_automatic_response_request
val make_disassociate_health_check_response :
  unit -> disassociate_health_check_response
val make_disassociate_health_check_request :
  health_check_arn:string ->
    protection_id:string -> unit -> disassociate_health_check_request
val make_disassociate_drt_role_response :
  unit -> disassociate_drt_role_response
val make_disassociate_drt_role_request :
  unit -> disassociate_drt_role_request
val make_disassociate_drt_log_bucket_response :
  unit -> disassociate_drt_log_bucket_response
val make_disassociate_drt_log_bucket_request :
  log_bucket:string -> unit -> disassociate_drt_log_bucket_request
val make_disable_proactive_engagement_response :
  unit -> disable_proactive_engagement_response
val make_disable_proactive_engagement_request :
  unit -> disable_proactive_engagement_request
val make_disable_application_layer_automatic_response_response :
  unit -> disable_application_layer_automatic_response_response
val make_disable_application_layer_automatic_response_request :
  resource_arn:string ->
    unit -> disable_application_layer_automatic_response_request
val make_describe_subscription_response :
  ?subscription:subscription -> unit -> describe_subscription_response
val make_describe_subscription_request :
  unit -> describe_subscription_request
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
val make_describe_emergency_contact_settings_request :
  unit -> describe_emergency_contact_settings_request
val make_describe_drt_access_response :
  ?log_bucket_list:string list ->
    ?role_arn:string -> unit -> describe_drt_access_response
val make_describe_drt_access_request : unit -> describe_drt_access_request
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
val make_describe_attack_statistics_request :
  unit -> describe_attack_statistics_request
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
val make_delete_subscription_response : unit -> delete_subscription_response
val make_delete_subscription_request : unit -> delete_subscription_request
val make_delete_protection_response : unit -> delete_protection_response
val make_delete_protection_request :
  protection_id:string -> unit -> delete_protection_request
val make_delete_protection_group_response :
  unit -> delete_protection_group_response
val make_delete_protection_group_request :
  protection_group_id:string -> unit -> delete_protection_group_request
val make_create_subscription_response : unit -> create_subscription_response
val make_create_subscription_request : unit -> create_subscription_request
val make_create_protection_response :
  ?protection_id:string -> unit -> create_protection_response
val make_create_protection_request :
  ?tags:tag list ->
    resource_arn:string -> name:string -> unit -> create_protection_request
val make_create_protection_group_response :
  unit -> create_protection_group_response
val make_create_protection_group_request :
  ?tags:tag list ->
    ?members:string list ->
      ?resource_type:protected_resource_type ->
        pattern:protection_group_pattern ->
          aggregation:protection_group_aggregation ->
            protection_group_id:string ->
              unit -> create_protection_group_request
val make_associate_proactive_engagement_details_response :
  unit -> associate_proactive_engagement_details_response
val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact list ->
    unit -> associate_proactive_engagement_details_request
val make_associate_health_check_response :
  unit -> associate_health_check_response
val make_associate_health_check_request :
  health_check_arn:string ->
    protection_id:string -> unit -> associate_health_check_request
val make_associate_drt_role_response : unit -> associate_drt_role_response
val make_associate_drt_role_request :
  role_arn:string -> unit -> associate_drt_role_request
val make_associate_drt_log_bucket_response :
  unit -> associate_drt_log_bucket_response
val make_associate_drt_log_bucket_request :
  log_bucket:string -> unit -> associate_drt_log_bucket_request(** {1:operations Operations} *)

module AssociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_log_bucket_request ->
        (associate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Authorizes the Shield Response Team (SRT) to access the specified Amazon S3 bucket containing log data such as Application Load Balancer access logs, CloudFront logs, or logs from third party sources. You can associate up to 10 Amazon S3 buckets with your subscription.

 To use the services of the SRT and make an [AssociateDRTLogBucket] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.
  *)

  
end

module AssociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_drt_role_request ->
        (associate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Authorizes the Shield Response Team (SRT) using the specified role, to access your Amazon Web Services account to assist with DDoS attack mitigation during potential attacks. This enables the SRT to inspect your WAF configuration and create or update WAF rules and web ACLs.

 You can associate only one [RoleArn] with your subscription. If you submit an [AssociateDRTRole] request for an account that already has an associated role, the new [RoleArn] will replace the existing [RoleArn]. 
 
  Prior to making the [AssociateDRTRole] request, you must attach the [AWSShieldDRTAccessPolicy] managed policy to the role that you'll specify in the request. You can access this policy in the IAM console at {{:https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSShieldDRTAccessPolicy}AWSShieldDRTAccessPolicy}. For more information see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_manage-attach-detach.html}Adding and removing IAM identity permissions}. The role must also trust the service principal [drt.shield.amazonaws.com]. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html}IAM JSON policy elements: Principal}.
  
   The SRT will have access only to your WAF and Shield resources. By submitting this request, you authorize the SRT to inspect your WAF and Shield configuration and create and update WAF rules and web ACLs on your behalf. The SRT takes these actions only if explicitly authorized by you.
   
    You must have the [iam:PassRole] permission to make an [AssociateDRTRole] request. For more information, see {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html}Granting a user permissions to pass a role to an Amazon Web Services service}. 
    
     To use the services of the SRT and make an [AssociateDRTRole] request, you must be subscribed to the {{:http://aws.amazon.com/premiumsupport/business-support/}Business Support plan} or the {{:http://aws.amazon.com/premiumsupport/enterprise-support/}Enterprise Support plan}.
      *)

  
end

module AssociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_health_check_request ->
        (associate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Adds health-based detection to the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response. 

 You define the health check in Route 53 and then associate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}. 
  *)

  
end

module AssociateProactiveEngagementDetails : sig
  val request :
    Smaws_Lib.Context.t ->
      associate_proactive_engagement_details_request ->
        (associate_proactive_engagement_details_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Initializes proactive engagement and sets the list of contacts for the Shield Response Team (SRT) to use. You must provide at least one phone number in the emergency contact list. 

 After you have initialized proactive engagement using this call, to disable or enable proactive engagement, use the calls [DisableProactiveEngagement] and [EnableProactiveEngagement]. 
 
   This call defines the list of email addresses and phone numbers that the SRT can use to contact you for escalations to the SRT and to initiate proactive customer support.
   
    The contacts that you provide in the request replace any contacts that were already defined. If you already have contacts defined and want to use them, retrieve the list using [DescribeEmergencyContactSettings] and then provide it to this call. 
    
      *)

  
end

module CreateProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_request ->
        (create_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Enables Shield Advanced for a specific Amazon Web Services resource. The resource can be an Amazon CloudFront distribution, Amazon Route 53 hosted zone, Global Accelerator standard accelerator, Elastic IP Address, Application Load Balancer, or a Classic Load Balancer. You can protect Amazon EC2 instances and Network Load Balancers by association with protected Amazon EC2 Elastic IP addresses.

 You can add protection to only a single resource with each [CreateProtection] request. You can add protection to multiple resources at once through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced} and {{:https://docs.aws.amazon.com/waf/latest/developerguide/configure-new-protection.html}Adding Shield Advanced protection to Amazon Web Services resources}.
  *)

  
end

module CreateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      create_protection_group_request ->
        (create_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Creates a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives. 
 *)

  
end

module CreateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      create_subscription_request ->
        (create_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceAlreadyExistsException of resource_already_exists_exception
            
        ]
      ) result
  (** Activates Shield Advanced for an account.

  For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed. 
  
    When you initially create a subscription, your subscription is set to be automatically renewed at the end of the existing subscription period. You can change this by submitting an [UpdateSubscription] request. 
     *)

  
end

module DeleteProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_request ->
        (delete_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Deletes an Shield Advanced [Protection].
 *)

  
end

module DeleteProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_protection_group_request ->
        (delete_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes the specified protection group.
 *)

  
end

module DeleteSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_subscription_request ->
        (delete_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes Shield Advanced from an account. Shield Advanced requires a 1-year subscription commitment. You cannot delete a subscription prior to the completion of that commitment. 
 *)

  
end

module DescribeAttack : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_request ->
        (describe_attack_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `InternalErrorException of internal_error_exception
            
        ]
      ) result
  (** Describes the details of a DDoS attack. 
 *)

  
end

module DescribeAttackStatistics : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_attack_statistics_request ->
        (describe_attack_statistics_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
  (** Provides information about the number and type of attacks Shield has detected in the last year for all resources that belong to your account, regardless of whether you've defined Shield protections for them. This operation is available to Shield customers as well as to Shield Advanced customers.

 The operation returns data for the time range of midnight UTC, one year ago, to midnight UTC, today. For example, if the current time is [2020-10-26 15:39:32 PDT], equal to [2020-10-26 22:39:32 UTC], then the time range for the attack data returned is from [2019-10-26 00:00:00 UTC] to [2020-10-26 00:00:00 UTC]. 
 
  The time range indicates the period covered by the attack statistics data items.
   *)

  
end

module DescribeDRTAccess : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_drt_access_request ->
        (describe_drt_access_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns the current role and list of Amazon S3 log buckets used by the Shield Response Team (SRT) to access your Amazon Web Services account while assisting with attack mitigation.
 *)

  
end

module DescribeEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_emergency_contact_settings_request ->
        (describe_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** A list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
 *)

  
end

module DescribeProtection : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_request ->
        (describe_protection_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Lists the details of a [Protection] object.
 *)

  
end

module DescribeProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_protection_group_request ->
        (describe_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Returns the specification for the specified protection group.
 *)

  
end

module DescribeSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_subscription_request ->
        (describe_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Provides details about the Shield Advanced subscription for an account.
 *)

  
end

module DisableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_application_layer_automatic_response_request ->
        (disable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Disable the Shield Advanced automatic application layer DDoS mitigation feature for the protected resource. This stops Shield Advanced from creating, verifying, and applying WAF rules for attacks that it detects for the resource. 
 *)

  
end

module DisableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_proactive_engagement_request ->
        (disable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes authorization from the Shield Response Team (SRT) to notify contacts about escalations to the SRT and to initiate proactive customer support.
 *)

  
end

module DisassociateDRTLogBucket : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_log_bucket_request ->
        (disassociate_drt_log_bucket_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedForDependencyException of access_denied_for_dependency_exception
            | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `NoAssociatedRoleException of no_associated_role_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes the Shield Response Team's (SRT) access to the specified Amazon S3 bucket containing the logs that you shared previously.
 *)

  
end

module DisassociateDRTRole : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_drt_role_request ->
        (disassociate_drt_role_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes the Shield Response Team's (SRT) access to your Amazon Web Services account.
 *)

  
end

module DisassociateHealthCheck : sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_health_check_request ->
        (disassociate_health_check_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes health-based detection from the Shield Advanced protection for a resource. Shield Advanced health-based detection uses the health of your Amazon Web Services resource to improve responsiveness and accuracy in attack detection and response. 

 You define the health check in Route 53 and then associate or disassociate it with your Shield Advanced protection. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-overview.html#ddos-advanced-health-check-option}Shield Advanced Health-Based Detection} in the {i WAF Developer Guide}. 
  *)

  
end

module EnableApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_application_layer_automatic_response_request ->
        (enable_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LimitsExceededException of limits_exceeded_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Enable the Shield Advanced automatic application layer DDoS mitigation for the protected resource. 

  This feature is available for Amazon CloudFront distributions and Application Load Balancers only.
  
    This causes Shield Advanced to create, verify, and apply WAF rules for DDoS attacks that it detects for the resource. Shield Advanced applies the rules in a Shield rule group inside the web ACL that you've associated with the resource. For information about how automatic mitigation works and the requirements for using it, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/ddos-advanced-automatic-app-layer-response.html}Shield Advanced automatic application layer DDoS mitigation}.
    
      Don't use this action to make changes to automatic mitigation settings when it's already enabled for a resource. Instead, use [UpdateApplicationLayerAutomaticResponse].
      
        To use this feature, you must associate a web ACL with the protected resource. The web ACL must be created using the latest version of WAF (v2). You can associate the web ACL through the Shield Advanced console at {{:https://console.aws.amazon.com/wafv2/shieldv2#/}https://console.aws.amazon.com/wafv2/shieldv2#/}. For more information, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/getting-started-ddos.html}Getting Started with Shield Advanced}. You can also associate the web ACL to the resource through the WAF console or the WAF API, but you must manage Shield Advanced automatic mitigation through Shield Advanced. For information about WAF, see {{:https://docs.aws.amazon.com/waf/latest/developerguide/}WAF Developer Guide}.
         *)

  
end

module EnableProactiveEngagement : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_proactive_engagement_request ->
        (enable_proactive_engagement_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Authorizes the Shield Response Team (SRT) to use email and phone to notify contacts about escalations to the SRT and to initiate proactive customer support.
 *)

  
end

module GetSubscriptionState : sig
  val request :
    Smaws_Lib.Context.t ->
      get_subscription_state_request ->
        (get_subscription_state_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            
        ]
      ) result
  (** Returns the [SubscriptionState], either [Active] or [Inactive].
 *)

  
end

module ListAttacks : sig
  val request :
    Smaws_Lib.Context.t ->
      list_attacks_request ->
        (list_attacks_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            
        ]
      ) result
  (** Returns all ongoing DDoS attacks or all DDoS attacks during a specified time period.
 *)

  
end

module ListProtectionGroups : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protection_groups_request ->
        (list_protection_groups_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves [ProtectionGroup] objects for the account. You can retrieve all protection groups or you can provide filtering criteria and retrieve just the subset of protection groups that match the criteria. 
 *)

  
end

module ListProtections : sig
  val request :
    Smaws_Lib.Context.t ->
      list_protections_request ->
        (list_protections_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves [Protection] objects for the account. You can retrieve all protections or you can provide filtering criteria and retrieve just the subset of protections that match the criteria. 
 *)

  
end

module ListResourcesInProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      list_resources_in_protection_group_request ->
        (list_resources_in_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidPaginationTokenException of invalid_pagination_token_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Retrieves the resources that are included in the protection group. 
 *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Gets information about Amazon Web Services tags for a specified Amazon Resource Name (ARN) in Shield.
 *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Adds or updates tags for a resource in Shield.
 *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidResourceException of invalid_resource_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Removes tags from a resource in Shield.
 *)

  
end

module UpdateApplicationLayerAutomaticResponse : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_layer_automatic_response_request ->
        (update_application_layer_automatic_response_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidOperationException of invalid_operation_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates an existing Shield Advanced automatic application layer DDoS mitigation configuration for the specified resource.
 *)

  
end

module UpdateEmergencyContactSettings : sig
  val request :
    Smaws_Lib.Context.t ->
      update_emergency_contact_settings_request ->
        (update_emergency_contact_settings_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates the details of the list of email addresses and phone numbers that the Shield Response Team (SRT) can use to contact you if you have proactive engagement enabled, for escalations to the SRT and to initiate proactive customer support.
 *)

  
end

module UpdateProtectionGroup : sig
  val request :
    Smaws_Lib.Context.t ->
      update_protection_group_request ->
        (update_protection_group_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates an existing protection group. A protection group is a grouping of protected resources so they can be handled as a collective. This resource grouping improves the accuracy of detection and reduces false positives. 
 *)

  
end

module UpdateSubscription : sig
  val request :
    Smaws_Lib.Context.t ->
      update_subscription_request ->
        (update_subscription_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InternalErrorException of internal_error_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `LockedSubscriptionException of locked_subscription_exception
            | `OptimisticLockException of optimistic_lock_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** Updates the details of an existing subscription. Only enter values for parameters you want to change. Empty parameters are not updated.

  For accounts that are members of an Organizations organization, Shield Advanced subscriptions are billed against the organization's payer account, regardless of whether the payer account itself is subscribed. 
  
    *)

  
end

