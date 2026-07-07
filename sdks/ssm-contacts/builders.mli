open Types

val make_hand_off_time :
  minute_of_hour:minute_of_hour -> hour_of_day:hour_of_day -> unit -> hand_off_time

val make_weekly_setting :
  hand_off_time:hand_off_time -> day_of_week:day_of_week -> unit -> weekly_setting

val make_validation_exception_field :
  message:string_ -> name:string_ -> unit -> validation_exception_field

val make_monthly_setting :
  hand_off_time:hand_off_time -> day_of_month:day_of_month -> unit -> monthly_setting

val make_coverage_time : ?end_:hand_off_time -> ?start:hand_off_time -> unit -> coverage_time

val make_recurrence_settings :
  ?shift_coverages:shift_coverages_map ->
  ?daily_settings:daily_settings ->
  ?weekly_settings:weekly_settings ->
  ?monthly_settings:monthly_settings ->
  recurrence_multiplier:recurrence_multiplier ->
  number_of_on_calls:number_of_on_calls ->
  unit ->
  recurrence_settings

val make_update_rotation_request :
  ?time_zone_id:time_zone_id ->
  ?start_time:date_time ->
  ?contact_ids:rotation_contacts_arn_list ->
  recurrence:recurrence_settings ->
  rotation_id:ssm_contacts_arn ->
  unit ->
  update_rotation_request

val make_dependent_entity :
  dependent_resource_ids:ssm_contacts_arn_list -> relation_type:string_ -> unit -> dependent_entity

val make_channel_target_info :
  ?retry_interval_in_minutes:retry_interval_in_minutes ->
  contact_channel_id:ssm_contacts_arn ->
  unit ->
  channel_target_info

val make_contact_target_info :
  ?contact_id:ssm_contacts_arn -> is_essential:is_essential -> unit -> contact_target_info

val make_target :
  ?contact_target_info:contact_target_info ->
  ?channel_target_info:channel_target_info ->
  unit ->
  target

val make_stage : targets:targets_list -> duration_in_minutes:stage_duration_in_mins -> unit -> stage
val make_plan : ?rotation_ids:ssm_contacts_arn_list -> ?stages:stages_list -> unit -> plan

val make_update_contact_request :
  ?plan:plan ->
  ?display_name:contact_name ->
  contact_id:ssm_contacts_arn ->
  unit ->
  update_contact_request

val make_contact_channel_address : ?simple_address:simple_address -> unit -> contact_channel_address

val make_update_contact_channel_request :
  ?delivery_address:contact_channel_address ->
  ?name:channel_name ->
  contact_channel_id:ssm_contacts_arn ->
  unit ->
  update_contact_channel_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_time_range : ?end_time:date_time -> ?start_time:date_time -> unit -> time_range
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tags_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_stop_engagement_request :
  ?reason:stop_reason -> engagement_id:ssm_contacts_arn -> unit -> stop_engagement_request

val make_start_engagement_request :
  ?idempotency_token:idempotency_token ->
  ?incident_id:incident_id ->
  ?public_content:public_content ->
  ?public_subject:public_subject ->
  content:content ->
  subject:subject ->
  sender:sender ->
  contact_id:ssm_contacts_arn ->
  unit ->
  start_engagement_request

val make_shift_details : overridden_contact_ids:ssm_contacts_arn_list -> unit -> shift_details

val make_send_activation_code_request :
  contact_channel_id:ssm_contacts_arn -> unit -> send_activation_code_request

val make_put_contact_policy_request :
  policy:policy -> contact_arn:ssm_contacts_arn -> unit -> put_contact_policy_request

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_rotation_shift :
  ?shift_details:shift_details ->
  ?type_:shift_type ->
  ?contact_ids:ssm_contacts_arn_list ->
  end_time:date_time ->
  start_time:date_time ->
  unit ->
  rotation_shift

val make_list_rotation_shifts_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?start_time:date_time ->
  end_time:date_time ->
  rotation_id:ssm_contacts_arn ->
  unit ->
  list_rotation_shifts_request

val make_rotation :
  ?recurrence:recurrence_settings ->
  ?time_zone_id:time_zone_id ->
  ?start_time:date_time ->
  ?contact_ids:ssm_contacts_arn_list ->
  name:rotation_name ->
  rotation_arn:ssm_contacts_arn ->
  unit ->
  rotation

val make_list_rotations_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?rotation_name_prefix:rotation_name ->
  unit ->
  list_rotations_request

val make_rotation_override :
  create_time:date_time ->
  end_time:date_time ->
  start_time:date_time ->
  new_contact_ids:ssm_contacts_arn_list ->
  rotation_override_id:uuid ->
  unit ->
  rotation_override

val make_list_rotation_overrides_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  end_time:date_time ->
  start_time:date_time ->
  rotation_id:ssm_contacts_arn ->
  unit ->
  list_rotation_overrides_request

val make_preview_override :
  ?end_time:date_time ->
  ?start_time:date_time ->
  ?new_members:rotation_override_preview_member_list ->
  unit ->
  preview_override

val make_list_preview_rotation_shifts_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  ?overrides:override_list ->
  ?start_time:date_time ->
  ?rotation_start_time:date_time ->
  recurrence:recurrence_settings ->
  time_zone_id:time_zone_id ->
  members:rotation_preview_member_list ->
  end_time:date_time ->
  unit ->
  list_preview_rotation_shifts_request

val make_page :
  ?read_time:date_time ->
  ?delivery_time:date_time ->
  ?sent_time:date_time ->
  ?incident_id:incident_id ->
  sender:sender ->
  contact_arn:ssm_contacts_arn ->
  engagement_arn:ssm_contacts_arn ->
  page_arn:ssm_contacts_arn ->
  unit ->
  page

val make_list_pages_by_engagement_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  engagement_id:ssm_contacts_arn ->
  unit ->
  list_pages_by_engagement_request

val make_list_pages_by_contact_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  contact_id:ssm_contacts_arn ->
  unit ->
  list_pages_by_contact_request

val make_resolution_contact :
  ?stage_index:stage_index ->
  type_:contact_type ->
  contact_arn:ssm_contacts_arn ->
  unit ->
  resolution_contact

val make_list_page_resolutions_request :
  ?next_token:pagination_token -> page_id:ssm_contacts_arn -> unit -> list_page_resolutions_request

val make_receipt :
  ?receipt_info:receipt_info ->
  ?contact_channel_arn:ssm_contacts_arn ->
  receipt_time:date_time ->
  receipt_type:receipt_type ->
  unit ->
  receipt

val make_list_page_receipts_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  page_id:ssm_contacts_arn ->
  unit ->
  list_page_receipts_request

val make_engagement :
  ?stop_time:date_time ->
  ?start_time:date_time ->
  ?incident_id:incident_id ->
  sender:sender ->
  contact_arn:ssm_contacts_arn ->
  engagement_arn:ssm_contacts_arn ->
  unit ->
  engagement

val make_list_engagements_request :
  ?time_range_value:time_range ->
  ?incident_id:incident_id ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_engagements_request

val make_contact :
  ?display_name:contact_name ->
  type_:contact_type ->
  alias:contact_alias ->
  contact_arn:ssm_contacts_arn ->
  unit ->
  contact

val make_list_contacts_request :
  ?type_:contact_type ->
  ?alias_prefix:contact_alias ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_contacts_request

val make_contact_channel :
  ?type_:channel_type ->
  activation_status:activation_status ->
  delivery_address:contact_channel_address ->
  name:channel_name ->
  contact_arn:ssm_contacts_arn ->
  contact_channel_arn:ssm_contacts_arn ->
  unit ->
  contact_channel

val make_list_contact_channels_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  contact_id:ssm_contacts_arn ->
  unit ->
  list_contact_channels_request

val make_get_rotation_override_request :
  rotation_override_id:uuid -> rotation_id:ssm_contacts_arn -> unit -> get_rotation_override_request

val make_get_rotation_request : rotation_id:ssm_contacts_arn -> unit -> get_rotation_request

val make_get_contact_policy_request :
  contact_arn:ssm_contacts_arn -> unit -> get_contact_policy_request

val make_get_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> get_contact_channel_request

val make_get_contact_request : contact_id:ssm_contacts_arn -> unit -> get_contact_request
val make_describe_page_request : page_id:ssm_contacts_arn -> unit -> describe_page_request

val make_describe_engagement_request :
  engagement_id:ssm_contacts_arn -> unit -> describe_engagement_request

val make_delete_rotation_override_request :
  rotation_override_id:uuid ->
  rotation_id:ssm_contacts_arn ->
  unit ->
  delete_rotation_override_request

val make_delete_rotation_request : rotation_id:ssm_contacts_arn -> unit -> delete_rotation_request

val make_delete_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> delete_contact_channel_request

val make_delete_contact_request : contact_id:ssm_contacts_arn -> unit -> delete_contact_request

val make_deactivate_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> deactivate_contact_channel_request

val make_create_rotation_override_request :
  ?idempotency_token:idempotency_token ->
  end_time:date_time ->
  start_time:date_time ->
  new_contact_ids:rotation_override_contacts_arn_list ->
  rotation_id:ssm_contacts_arn ->
  unit ->
  create_rotation_override_request

val make_create_rotation_request :
  ?idempotency_token:idempotency_token ->
  ?tags:tags_list ->
  ?start_time:date_time ->
  recurrence:recurrence_settings ->
  time_zone_id:time_zone_id ->
  contact_ids:rotation_contacts_arn_list ->
  name:rotation_name ->
  unit ->
  create_rotation_request

val make_create_contact_channel_request :
  ?idempotency_token:idempotency_token ->
  ?defer_activation:defer_activation ->
  delivery_address:contact_channel_address ->
  type_:channel_type ->
  name:channel_name ->
  contact_id:ssm_contacts_arn ->
  unit ->
  create_contact_channel_request

val make_create_contact_request :
  ?idempotency_token:idempotency_token ->
  ?tags:tags_list ->
  ?display_name:contact_name ->
  plan:plan ->
  type_:contact_type ->
  alias:contact_alias ->
  unit ->
  create_contact_request

val make_activate_contact_channel_request :
  activation_code:activation_code ->
  contact_channel_id:ssm_contacts_arn ->
  unit ->
  activate_contact_channel_request

val make_accept_page_request :
  ?accept_code_validation:accept_code_validation ->
  ?note:receipt_info ->
  ?contact_channel_id:ssm_contacts_arn ->
  accept_code:accept_code ->
  accept_type:accept_type ->
  page_id:ssm_contacts_arn ->
  unit ->
  accept_page_request
