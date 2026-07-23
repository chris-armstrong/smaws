open Types

val make_validation_exception_field :
  name:string_ -> message:string_ -> unit -> validation_exception_field

val make_update_subscription_response : unit -> unit
val make_update_subscription_request : ?auto_renew:auto_renew -> unit -> update_subscription_request
val make_update_protection_group_response : unit -> unit

val make_update_protection_group_request :
  ?resource_type:protected_resource_type ->
  ?members:protection_group_members ->
  protection_group_id:protection_group_id ->
  aggregation:protection_group_aggregation ->
  pattern:protection_group_pattern ->
  unit ->
  update_protection_group_request

val make_update_emergency_contact_settings_response : unit -> unit

val make_emergency_contact :
  ?phone_number:phone_number ->
  ?contact_notes:contact_notes ->
  email_address:email_address ->
  unit ->
  emergency_contact

val make_update_emergency_contact_settings_request :
  ?emergency_contact_list:emergency_contact_list ->
  unit ->
  update_emergency_contact_settings_request

val make_update_application_layer_automatic_response_response : unit -> unit
val make_count_action : unit -> unit
val make_block_action : unit -> unit
val make_response_action : ?block:block_action -> ?count:count_action -> unit -> response_action

val make_update_application_layer_automatic_response_request :
  resource_arn:resource_arn ->
  action:response_action ->
  unit ->
  update_application_layer_automatic_response_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:resource_arn -> tags:tag_list -> unit -> tag_resource_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:resource_arn -> unit -> list_tags_for_resource_request

val make_list_resources_in_protection_group_response :
  ?next_token:token ->
  resource_arns:resource_arn_list ->
  unit ->
  list_resources_in_protection_group_response

val make_list_resources_in_protection_group_request :
  ?next_token:token ->
  ?max_results:max_results ->
  protection_group_id:protection_group_id ->
  unit ->
  list_resources_in_protection_group_request

val make_application_layer_automatic_response_configuration :
  status:application_layer_automatic_response_status ->
  action:response_action ->
  unit ->
  application_layer_automatic_response_configuration

val make_protection :
  ?id:protection_id ->
  ?name:protection_name ->
  ?resource_arn:resource_arn ->
  ?health_check_ids:health_check_ids ->
  ?protection_arn:resource_arn ->
  ?application_layer_automatic_response_configuration:
    application_layer_automatic_response_configuration ->
  unit ->
  protection

val make_list_protections_response :
  ?protections:protections -> ?next_token:token -> unit -> list_protections_response

val make_inclusion_protection_filters :
  ?resource_arns:resource_arn_filters ->
  ?protection_names:protection_name_filters ->
  ?resource_types:protected_resource_type_filters ->
  unit ->
  inclusion_protection_filters

val make_list_protections_request :
  ?next_token:token ->
  ?max_results:max_results ->
  ?inclusion_filters:inclusion_protection_filters ->
  unit ->
  list_protections_request

val make_protection_group :
  ?resource_type:protected_resource_type ->
  ?protection_group_arn:resource_arn ->
  protection_group_id:protection_group_id ->
  aggregation:protection_group_aggregation ->
  pattern:protection_group_pattern ->
  members:protection_group_members ->
  unit ->
  protection_group

val make_list_protection_groups_response :
  ?next_token:token ->
  protection_groups:protection_groups ->
  unit ->
  list_protection_groups_response

val make_inclusion_protection_group_filters :
  ?protection_group_ids:protection_group_id_filters ->
  ?patterns:protection_group_pattern_filters ->
  ?resource_types:protected_resource_type_filters ->
  ?aggregations:protection_group_aggregation_filters ->
  unit ->
  inclusion_protection_group_filters

val make_list_protection_groups_request :
  ?next_token:token ->
  ?max_results:max_results ->
  ?inclusion_filters:inclusion_protection_group_filters ->
  unit ->
  list_protection_groups_request

val make_attack_vector_description : vector_type:string_ -> unit -> attack_vector_description

val make_attack_summary :
  ?attack_id:string_ ->
  ?resource_arn:string_ ->
  ?start_time:attack_timestamp ->
  ?end_time:attack_timestamp ->
  ?attack_vectors:attack_vector_description_list ->
  unit ->
  attack_summary

val make_list_attacks_response :
  ?attack_summaries:attack_summaries -> ?next_token:token -> unit -> list_attacks_response

val make_time_range : ?from_inclusive:timestamp -> ?to_exclusive:timestamp -> unit -> time_range

val make_list_attacks_request :
  ?resource_arns:resource_arn_filter_list ->
  ?start_time:time_range ->
  ?end_time:time_range ->
  ?next_token:token ->
  ?max_results:max_results ->
  unit ->
  list_attacks_request

val make_get_subscription_state_response :
  subscription_state:subscription_state -> unit -> get_subscription_state_response

val make_get_subscription_state_request : unit -> unit
val make_enable_proactive_engagement_response : unit -> unit
val make_enable_proactive_engagement_request : unit -> unit
val make_enable_application_layer_automatic_response_response : unit -> unit

val make_enable_application_layer_automatic_response_request :
  resource_arn:resource_arn ->
  action:response_action ->
  unit ->
  enable_application_layer_automatic_response_request

val make_disassociate_health_check_response : unit -> unit

val make_disassociate_health_check_request :
  protection_id:protection_id ->
  health_check_arn:health_check_arn ->
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

val make_protection_group_arbitrary_pattern_limits :
  max_members:long -> unit -> protection_group_arbitrary_pattern_limits

val make_protection_group_pattern_type_limits :
  arbitrary_pattern_limits:protection_group_arbitrary_pattern_limits ->
  unit ->
  protection_group_pattern_type_limits

val make_protection_group_limits :
  max_protection_groups:long ->
  pattern_type_limits:protection_group_pattern_type_limits ->
  unit ->
  protection_group_limits

val make_limit : ?type_:string_ -> ?max:long -> unit -> limit
val make_protection_limits : protected_resource_type_limits:limits -> unit -> protection_limits

val make_subscription_limits :
  protection_limits:protection_limits ->
  protection_group_limits:protection_group_limits ->
  unit ->
  subscription_limits

val make_subscription :
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?time_commitment_in_seconds:duration_in_seconds ->
  ?auto_renew:auto_renew ->
  ?limits:limits ->
  ?proactive_engagement_status:proactive_engagement_status ->
  ?subscription_arn:resource_arn ->
  subscription_limits:subscription_limits ->
  unit ->
  subscription

val make_describe_subscription_response :
  ?subscription:subscription -> unit -> describe_subscription_response

val make_describe_subscription_request : unit -> unit

val make_describe_protection_group_response :
  protection_group:protection_group -> unit -> describe_protection_group_response

val make_describe_protection_group_request :
  protection_group_id:protection_group_id -> unit -> describe_protection_group_request

val make_describe_protection_response :
  ?protection:protection -> unit -> describe_protection_response

val make_describe_protection_request :
  ?protection_id:protection_id -> ?resource_arn:resource_arn -> unit -> describe_protection_request

val make_describe_emergency_contact_settings_response :
  ?emergency_contact_list:emergency_contact_list ->
  unit ->
  describe_emergency_contact_settings_response

val make_describe_emergency_contact_settings_request : unit -> unit

val make_describe_drt_access_response :
  ?role_arn:role_arn -> ?log_bucket_list:log_bucket_list -> unit -> describe_drt_access_response

val make_describe_drt_access_request : unit -> unit
val make_attack_volume_statistics : max:double -> unit -> attack_volume_statistics

val make_attack_volume :
  ?bits_per_second:attack_volume_statistics ->
  ?packets_per_second:attack_volume_statistics ->
  ?requests_per_second:attack_volume_statistics ->
  unit ->
  attack_volume

val make_attack_statistics_data_item :
  ?attack_volume:attack_volume -> attack_count:long -> unit -> attack_statistics_data_item

val make_describe_attack_statistics_response :
  time_range:time_range ->
  data_items:attack_statistics_data_list ->
  unit ->
  describe_attack_statistics_response

val make_describe_attack_statistics_request : unit -> unit
val make_mitigation : ?mitigation_name:string_ -> unit -> mitigation
val make_contributor : ?name:string_ -> ?value:long -> unit -> contributor

val make_attack_property :
  ?attack_layer:attack_layer ->
  ?attack_property_identifier:attack_property_identifier ->
  ?top_contributors:top_contributors ->
  ?unit_:unit_ ->
  ?total:long ->
  unit ->
  attack_property

val make_summarized_counter :
  ?name:string_ ->
  ?max:double ->
  ?average:double ->
  ?sum:double ->
  ?n:integer ->
  ?unit_:string_ ->
  unit ->
  summarized_counter

val make_summarized_attack_vector :
  ?vector_counters:summarized_counter_list ->
  vector_type:string_ ->
  unit ->
  summarized_attack_vector

val make_sub_resource_summary :
  ?type_:sub_resource_type ->
  ?id:string_ ->
  ?attack_vectors:summarized_attack_vector_list ->
  ?counters:summarized_counter_list ->
  unit ->
  sub_resource_summary

val make_attack_detail :
  ?attack_id:attack_id ->
  ?resource_arn:resource_arn ->
  ?sub_resources:sub_resource_summary_list ->
  ?start_time:attack_timestamp ->
  ?end_time:attack_timestamp ->
  ?attack_counters:summarized_counter_list ->
  ?attack_properties:attack_properties ->
  ?mitigations:mitigation_list ->
  unit ->
  attack_detail

val make_describe_attack_response : ?attack:attack_detail -> unit -> describe_attack_response
val make_describe_attack_request : attack_id:attack_id -> unit -> describe_attack_request
val make_delete_subscription_response : unit -> unit
val make_delete_subscription_request : unit -> unit
val make_delete_protection_group_response : unit -> unit

val make_delete_protection_group_request :
  protection_group_id:protection_group_id -> unit -> delete_protection_group_request

val make_delete_protection_response : unit -> unit

val make_delete_protection_request :
  protection_id:protection_id -> unit -> delete_protection_request

val make_create_subscription_response : unit -> unit
val make_create_subscription_request : unit -> unit
val make_create_protection_group_response : unit -> unit

val make_create_protection_group_request :
  ?resource_type:protected_resource_type ->
  ?members:protection_group_members ->
  ?tags:tag_list ->
  protection_group_id:protection_group_id ->
  aggregation:protection_group_aggregation ->
  pattern:protection_group_pattern ->
  unit ->
  create_protection_group_request

val make_create_protection_response :
  ?protection_id:protection_id -> unit -> create_protection_response

val make_create_protection_request :
  ?tags:tag_list ->
  name:protection_name ->
  resource_arn:resource_arn ->
  unit ->
  create_protection_request

val make_associate_proactive_engagement_details_response : unit -> unit

val make_associate_proactive_engagement_details_request :
  emergency_contact_list:emergency_contact_list ->
  unit ->
  associate_proactive_engagement_details_request

val make_associate_health_check_response : unit -> unit

val make_associate_health_check_request :
  protection_id:protection_id ->
  health_check_arn:health_check_arn ->
  unit ->
  associate_health_check_request

val make_associate_drt_role_response : unit -> unit
val make_associate_drt_role_request : role_arn:role_arn -> unit -> associate_drt_role_request
val make_associate_drt_log_bucket_response : unit -> unit

val make_associate_drt_log_bucket_request :
  log_bucket:log_bucket -> unit -> associate_drt_log_bucket_request
