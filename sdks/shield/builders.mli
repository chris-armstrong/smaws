open Types

val make_validation_exception_field :
  message:string_ -> name:string_ -> unit -> validation_exception_field

val make_update_subscription_response : unit -> unit
val make_update_subscription_request : ?auto_renew:auto_renew -> unit -> update_subscription_request
val make_update_protection_group_response : unit -> unit

val make_update_protection_group_request :
  ?members:protection_group_members ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:protection_group_id ->
  unit ->
  update_protection_group_request

val make_update_emergency_contact_settings_response : unit -> unit

val make_emergency_contact :
  ?contact_notes:contact_notes ->
  ?phone_number:phone_number ->
  email_address:email_address ->
  unit ->
  emergency_contact

val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact_list ->
  unit ->
  update_emergency_contact_settings_request

val make_update_application_layer_automatic_response_response : unit -> unit
val make_block_action : unit -> unit
val make_count_action : unit -> unit
val make_response_action : ?count:count_action -> ?block:block_action -> unit -> response_action

val make_update_application_layer_automatic_response_request :
  action:response_action ->
  resource_arn:resource_arn ->
  unit ->
  update_application_layer_automatic_response_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:resource_arn -> unit -> untag_resource_request

val make_contributor : ?value:long -> ?name:string_ -> unit -> contributor
val make_time_range : ?to_exclusive:timestamp -> ?from_inclusive:timestamp -> unit -> time_range
val make_tag_resource_response : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:resource_arn -> unit -> tag_resource_request

val make_summarized_counter :
  ?unit_:string_ ->
  ?n:integer ->
  ?sum:double ->
  ?average:double ->
  ?max:double ->
  ?name:string_ ->
  unit ->
  summarized_counter

val make_summarized_attack_vector :
  ?vector_counters:summarized_counter_list ->
  vector_type:string_ ->
  unit ->
  summarized_attack_vector

val make_limit : ?max:long -> ?type_:string_ -> unit -> limit
val make_protection_limits : protected_resource_type_limits:limits -> unit -> protection_limits

val make_protection_group_arbitrary_pattern_limits :
  max_members:long -> unit -> protection_group_arbitrary_pattern_limits

val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits ->
  unit ->
  protection_group_pattern_type_limits

val make_protection_group_limits :
  pattern_type_limits:protection_group_pattern_type_limits ->
  max_protection_groups:long ->
  unit ->
  protection_group_limits

val make_subscription_limits :
  protection_group_limits:protection_group_limits ->
  protection_limits:protection_limits ->
  unit ->
  subscription_limits

val make_subscription :
  ?subscription_arn:resource_arn ->
  ?proactive_engagement_status:proactive_engagement_status ->
  ?limits:limits ->
  ?auto_renew:auto_renew ->
  ?time_commitment_in_seconds:duration_in_seconds ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  subscription_limits:subscription_limits ->
  unit ->
  subscription

val make_sub_resource_summary :
  ?counters:summarized_counter_list ->
  ?attack_vectors:summarized_attack_vector_list ->
  ?id:string_ ->
  ?type_:sub_resource_type ->
  unit ->
  sub_resource_summary

val make_application_layer_automatic_response_configuration :
  action:response_action ->
  status:application_layer_automatic_response_status ->
  unit ->
  application_layer_automatic_response_configuration

val make_protection :
  ?application_layer_automatic_response_configuration:
    application_layer_automatic_response_configuration ->
  ?protection_arn:resource_arn ->
  ?health_check_ids:health_check_ids ->
  ?resource_arn:resource_arn ->
  ?name:protection_name ->
  ?id:protection_id ->
  unit ->
  protection

val make_protection_group :
  ?protection_group_arn:resource_arn ->
  ?resource_type:protected_resource_type ->
  members:protection_group_members ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:protection_group_id ->
  unit ->
  protection_group

val make_mitigation : ?mitigation_name:string_ -> unit -> mitigation
val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:resource_arn -> unit -> list_tags_for_resource_request

val make_list_resources_in_protection_group_response :
  ?next_token:token ->
  resource_arns:resource_arn_list ->
  unit ->
  list_resources_in_protection_group_response

val make_list_resources_in_protection_group_request :
  ?max_results:max_results ->
  ?next_token:token ->
  protection_group_id:protection_group_id ->
  unit ->
  list_resources_in_protection_group_request

val make_list_protections_response :
  ?next_token:token -> ?protections:protections -> unit -> list_protections_response

val make_inclusion_protection_filters :
  ?resource_types:protected_resource_type_filters ->
  ?protection_names:protection_name_filters ->
  ?resource_arns:resource_arn_filters ->
  unit ->
  inclusion_protection_filters

val make_list_protections_request :
  ?inclusion_filters:inclusion_protection_filters ->
  ?max_results:max_results ->
  ?next_token:token ->
  unit ->
  list_protections_request

val make_list_protection_groups_response :
  ?next_token:token ->
  protection_groups:protection_groups ->
  unit ->
  list_protection_groups_response

val make_inclusion_protection_group_filters :
  ?aggregations:protection_group_aggregation_filters ->
  ?resource_types:protected_resource_type_filters ->
  ?patterns:protection_group_pattern_filters ->
  ?protection_group_ids:protection_group_id_filters ->
  unit ->
  inclusion_protection_group_filters

val make_list_protection_groups_request :
  ?inclusion_filters:inclusion_protection_group_filters ->
  ?max_results:max_results ->
  ?next_token:token ->
  unit ->
  list_protection_groups_request

val make_attack_vector_description : vector_type:string_ -> unit -> attack_vector_description

val make_attack_summary :
  ?attack_vectors:attack_vector_description_list ->
  ?end_time:attack_timestamp ->
  ?start_time:attack_timestamp ->
  ?resource_arn:string_ ->
  ?attack_id:string_ ->
  unit ->
  attack_summary

val make_list_attacks_response :
  ?next_token:token -> ?attack_summaries:attack_summaries -> unit -> list_attacks_response

val make_list_attacks_request :
  ?max_results:max_results ->
  ?next_token:token ->
  ?end_time:time_range ->
  ?start_time:time_range ->
  ?resource_arns:resource_arn_filter_list ->
  unit ->
  list_attacks_request

val make_get_subscription_state_response :
  subscription_state:subscription_state -> unit -> get_subscription_state_response

val make_get_subscription_state_request : unit -> unit
val make_enable_proactive_engagement_response : unit -> unit
val make_enable_proactive_engagement_request : unit -> unit
val make_enable_application_layer_automatic_response_response : unit -> unit

val make_enable_application_layer_automatic_response_request :
  action:response_action ->
  resource_arn:resource_arn ->
  unit ->
  enable_application_layer_automatic_response_request

val make_disassociate_health_check_response : unit -> unit

val make_disassociate_health_check_request :
  health_check_arn:health_check_arn ->
  protection_id:protection_id ->
  unit ->
  disassociate_health_check_request

val make_disassociate_drt_role_response : unit -> unit
val make_disassociate_drt_role_request : unit -> unit
val make_disassociate_drt_log_bucket_response : unit -> unit

val make_disassociate_drt_log_bucket_request :
  log_bucket:log_bucket -> unit -> disassociate_drt_log_bucket_request

val make_disable_proactive_engagement_response : unit -> unit
val make_disable_proactive_engagement_request : unit -> unit
val make_disable_application_layer_automatic_response_response : unit -> unit

val make_disable_application_layer_automatic_response_request :
  resource_arn:resource_arn -> unit -> disable_application_layer_automatic_response_request

val make_describe_subscription_response :
  ?subscription:subscription -> unit -> describe_subscription_response

val make_describe_subscription_request : unit -> unit

val make_describe_protection_response :
  ?protection:protection -> unit -> describe_protection_response

val make_describe_protection_request :
  ?resource_arn:resource_arn -> ?protection_id:protection_id -> unit -> describe_protection_request

val make_describe_protection_group_response :
  protection_group:protection_group -> unit -> describe_protection_group_response

val make_describe_protection_group_request :
  protection_group_id:protection_group_id -> unit -> describe_protection_group_request

val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact_list ->
  unit ->
  describe_emergency_contact_settings_response

val make_describe_emergency_contact_settings_request : unit -> unit

val make_describe_drt_access_response :
  ?log_bucket_list:log_bucket_list -> ?role_arn:role_arn -> unit -> describe_drt_access_response

val make_describe_drt_access_request : unit -> unit
val make_attack_volume_statistics : max:double -> unit -> attack_volume_statistics

val make_attack_volume :
  ?requests_per_second:attack_volume_statistics ->
  ?packets_per_second:attack_volume_statistics ->
  ?bits_per_second:attack_volume_statistics ->
  unit ->
  attack_volume

val make_attack_statistics_data_item :
  ?attack_volume:attack_volume -> attack_count:long -> unit -> attack_statistics_data_item

val make_describe_attack_statistics_response :
  data_items:attack_statistics_data_list ->
  time_range:time_range ->
  unit ->
  describe_attack_statistics_response

val make_describe_attack_statistics_request : unit -> unit

val make_attack_property :
  ?total:long ->
  ?unit_:unit_ ->
  ?top_contributors:top_contributors ->
  ?attack_property_identifier:attack_property_identifier ->
  ?attack_layer:attack_layer ->
  unit ->
  attack_property

val make_attack_detail :
  ?mitigations:mitigation_list ->
  ?attack_properties:attack_properties ->
  ?attack_counters:summarized_counter_list ->
  ?end_time:attack_timestamp ->
  ?start_time:attack_timestamp ->
  ?sub_resources:sub_resource_summary_list ->
  ?resource_arn:resource_arn ->
  ?attack_id:attack_id ->
  unit ->
  attack_detail

val make_describe_attack_response : ?attack:attack_detail -> unit -> describe_attack_response
val make_describe_attack_request : attack_id:attack_id -> unit -> describe_attack_request
val make_delete_subscription_response : unit -> unit
val make_delete_subscription_request : unit -> unit
val make_delete_protection_response : unit -> unit

val make_delete_protection_request :
  protection_id:protection_id -> unit -> delete_protection_request

val make_delete_protection_group_response : unit -> unit

val make_delete_protection_group_request :
  protection_group_id:protection_group_id -> unit -> delete_protection_group_request

val make_create_subscription_response : unit -> unit
val make_create_subscription_request : unit -> unit

val make_create_protection_response :
  ?protection_id:protection_id -> unit -> create_protection_response

val make_create_protection_request :
  ?tags:tag_list ->
  resource_arn:resource_arn ->
  name:protection_name ->
  unit ->
  create_protection_request

val make_create_protection_group_response : unit -> unit

val make_create_protection_group_request :
  ?tags:tag_list ->
  ?members:protection_group_members ->
  ?resource_type:protected_resource_type ->
  pattern:protection_group_pattern ->
  aggregation:protection_group_aggregation ->
  protection_group_id:protection_group_id ->
  unit ->
  create_protection_group_request

val make_associate_proactive_engagement_details_response : unit -> unit

val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact_list ->
  unit ->
  associate_proactive_engagement_details_request

val make_associate_health_check_response : unit -> unit

val make_associate_health_check_request :
  health_check_arn:health_check_arn ->
  protection_id:protection_id ->
  unit ->
  associate_health_check_request

val make_associate_drt_role_response : unit -> unit
val make_associate_drt_role_request : role_arn:role_arn -> unit -> associate_drt_role_request
val make_associate_drt_log_bucket_response : unit -> unit

val make_associate_drt_log_bucket_request :
  log_bucket:log_bucket -> unit -> associate_drt_log_bucket_request
