open Types

val make_validation_exception_field :
  name:string_ -> message:string_ -> unit -> validation_exception_field

val make_accept_page_request :
  ?contact_channel_id:ssm_contacts_arn ->
  ?note:receipt_info ->
  ?accept_code_validation:accept_code_validation ->
  page_id:ssm_contacts_arn ->
  accept_type:accept_type ->
  accept_code:accept_code ->
  unit ->
  accept_page_request

val make_activate_contact_channel_request :
  contact_channel_id:ssm_contacts_arn ->
  activation_code:activation_code ->
  unit ->
  activate_contact_channel_request

val make_channel_target_info :
  ?retry_interval_in_minutes:retry_interval_in_minutes ->
  contact_channel_id:ssm_contacts_arn ->
  unit ->
  channel_target_info

val make_dependent_entity :
  relation_type:string_ -> dependent_resource_ids:ssm_contacts_arn_list -> unit -> dependent_entity

val make_contact :
  ?display_name:contact_name ->
  contact_arn:ssm_contacts_arn ->
  alias:contact_alias ->
  type_:contact_type ->
  unit ->
  contact

val make_contact_channel_address : ?simple_address:simple_address -> unit -> contact_channel_address

val make_contact_channel :
  ?type_:channel_type ->
  contact_channel_arn:ssm_contacts_arn ->
  contact_arn:ssm_contacts_arn ->
  name:channel_name ->
  delivery_address:contact_channel_address ->
  activation_status:activation_status ->
  unit ->
  contact_channel

val make_contact_target_info :
  ?contact_id:ssm_contacts_arn -> is_essential:is_essential -> unit -> contact_target_info

val make_hand_off_time :
  hour_of_day:hour_of_day -> minute_of_hour:minute_of_hour -> unit -> hand_off_time

val make_coverage_time : ?start:hand_off_time -> ?end_:hand_off_time -> unit -> coverage_time
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_target :
  ?channel_target_info:channel_target_info ->
  ?contact_target_info:contact_target_info ->
  unit ->
  target

val make_stage : duration_in_minutes:stage_duration_in_mins -> targets:targets_list -> unit -> stage
val make_plan : ?stages:stages_list -> ?rotation_ids:ssm_contacts_arn_list -> unit -> plan

val make_create_contact_request :
  ?display_name:contact_name ->
  ?tags:tags_list ->
  ?idempotency_token:idempotency_token ->
  alias:contact_alias ->
  type_:contact_type ->
  plan:plan ->
  unit ->
  create_contact_request

val make_create_contact_channel_request :
  ?defer_activation:defer_activation ->
  ?idempotency_token:idempotency_token ->
  contact_id:ssm_contacts_arn ->
  name:channel_name ->
  type_:channel_type ->
  delivery_address:contact_channel_address ->
  unit ->
  create_contact_channel_request

val make_weekly_setting :
  day_of_week:day_of_week -> hand_off_time:hand_off_time -> unit -> weekly_setting

val make_monthly_setting :
  day_of_month:day_of_month -> hand_off_time:hand_off_time -> unit -> monthly_setting

val make_recurrence_settings :
  ?monthly_settings:monthly_settings ->
  ?weekly_settings:weekly_settings ->
  ?daily_settings:daily_settings ->
  ?shift_coverages:shift_coverages_map ->
  number_of_on_calls:number_of_on_calls ->
  recurrence_multiplier:recurrence_multiplier ->
  unit ->
  recurrence_settings

val make_create_rotation_request :
  ?start_time:date_time ->
  ?tags:tags_list ->
  ?idempotency_token:idempotency_token ->
  name:rotation_name ->
  contact_ids:rotation_contacts_arn_list ->
  time_zone_id:time_zone_id ->
  recurrence:recurrence_settings ->
  unit ->
  create_rotation_request

val make_create_rotation_override_request :
  ?idempotency_token:idempotency_token ->
  rotation_id:ssm_contacts_arn ->
  new_contact_ids:rotation_override_contacts_arn_list ->
  start_time:date_time ->
  end_time:date_time ->
  unit ->
  create_rotation_override_request

val make_deactivate_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> deactivate_contact_channel_request

val make_delete_contact_request : contact_id:ssm_contacts_arn -> unit -> delete_contact_request

val make_delete_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> delete_contact_channel_request

val make_delete_rotation_request : rotation_id:ssm_contacts_arn -> unit -> delete_rotation_request

val make_delete_rotation_override_request :
  rotation_id:ssm_contacts_arn ->
  rotation_override_id:uuid ->
  unit ->
  delete_rotation_override_request

val make_describe_engagement_request :
  engagement_id:ssm_contacts_arn -> unit -> describe_engagement_request

val make_describe_page_request : page_id:ssm_contacts_arn -> unit -> describe_page_request

val make_engagement :
  ?incident_id:incident_id ->
  ?start_time:date_time ->
  ?stop_time:date_time ->
  engagement_arn:ssm_contacts_arn ->
  contact_arn:ssm_contacts_arn ->
  sender:sender ->
  unit ->
  engagement

val make_get_contact_request : contact_id:ssm_contacts_arn -> unit -> get_contact_request

val make_get_contact_channel_request :
  contact_channel_id:ssm_contacts_arn -> unit -> get_contact_channel_request

val make_get_contact_policy_request :
  contact_arn:ssm_contacts_arn -> unit -> get_contact_policy_request

val make_get_rotation_request : rotation_id:ssm_contacts_arn -> unit -> get_rotation_request

val make_get_rotation_override_request :
  rotation_id:ssm_contacts_arn -> rotation_override_id:uuid -> unit -> get_rotation_override_request

val make_list_contact_channels_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  contact_id:ssm_contacts_arn ->
  unit ->
  list_contact_channels_request

val make_list_contacts_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?alias_prefix:contact_alias ->
  ?type_:contact_type ->
  unit ->
  list_contacts_request

val make_time_range : ?start_time:date_time -> ?end_time:date_time -> unit -> time_range

val make_list_engagements_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?incident_id:incident_id ->
  ?time_range_value:time_range ->
  unit ->
  list_engagements_request

val make_receipt :
  ?contact_channel_arn:ssm_contacts_arn ->
  ?receipt_info:receipt_info ->
  receipt_type:receipt_type ->
  receipt_time:date_time ->
  unit ->
  receipt

val make_list_page_receipts_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  page_id:ssm_contacts_arn ->
  unit ->
  list_page_receipts_request

val make_resolution_contact :
  ?stage_index:stage_index ->
  contact_arn:ssm_contacts_arn ->
  type_:contact_type ->
  unit ->
  resolution_contact

val make_list_page_resolutions_request :
  ?next_token:pagination_token -> page_id:ssm_contacts_arn -> unit -> list_page_resolutions_request

val make_page :
  ?incident_id:incident_id ->
  ?sent_time:date_time ->
  ?delivery_time:date_time ->
  ?read_time:date_time ->
  page_arn:ssm_contacts_arn ->
  engagement_arn:ssm_contacts_arn ->
  contact_arn:ssm_contacts_arn ->
  sender:sender ->
  unit ->
  page

val make_list_pages_by_contact_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  contact_id:ssm_contacts_arn ->
  unit ->
  list_pages_by_contact_request

val make_list_pages_by_engagement_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  engagement_id:ssm_contacts_arn ->
  unit ->
  list_pages_by_engagement_request

val make_shift_details : overridden_contact_ids:ssm_contacts_arn_list -> unit -> shift_details

val make_rotation_shift :
  ?contact_ids:ssm_contacts_arn_list ->
  ?type_:shift_type ->
  ?shift_details:shift_details ->
  start_time:date_time ->
  end_time:date_time ->
  unit ->
  rotation_shift

val make_preview_override :
  ?new_members:rotation_override_preview_member_list ->
  ?start_time:date_time ->
  ?end_time:date_time ->
  unit ->
  preview_override

val make_list_preview_rotation_shifts_request :
  ?rotation_start_time:date_time ->
  ?start_time:date_time ->
  ?overrides:override_list ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  end_time:date_time ->
  members:rotation_preview_member_list ->
  time_zone_id:time_zone_id ->
  recurrence:recurrence_settings ->
  unit ->
  list_preview_rotation_shifts_request

val make_rotation_override :
  rotation_override_id:uuid ->
  new_contact_ids:ssm_contacts_arn_list ->
  start_time:date_time ->
  end_time:date_time ->
  create_time:date_time ->
  unit ->
  rotation_override

val make_list_rotation_overrides_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  rotation_id:ssm_contacts_arn ->
  start_time:date_time ->
  end_time:date_time ->
  unit ->
  list_rotation_overrides_request

val make_list_rotation_shifts_request :
  ?start_time:date_time ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  rotation_id:ssm_contacts_arn ->
  end_time:date_time ->
  unit ->
  list_rotation_shifts_request

val make_rotation :
  ?contact_ids:ssm_contacts_arn_list ->
  ?start_time:date_time ->
  ?time_zone_id:time_zone_id ->
  ?recurrence:recurrence_settings ->
  rotation_arn:ssm_contacts_arn ->
  name:rotation_name ->
  unit ->
  rotation

val make_list_rotations_request :
  ?rotation_name_prefix:rotation_name ->
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  unit ->
  list_rotations_request

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_put_contact_policy_request :
  contact_arn:ssm_contacts_arn -> policy:policy -> unit -> put_contact_policy_request

val make_update_rotation_request :
  ?contact_ids:rotation_contacts_arn_list ->
  ?start_time:date_time ->
  ?time_zone_id:time_zone_id ->
  rotation_id:ssm_contacts_arn ->
  recurrence:recurrence_settings ->
  unit ->
  update_rotation_request

val make_update_contact_channel_request :
  ?name:channel_name ->
  ?delivery_address:contact_channel_address ->
  contact_channel_id:ssm_contacts_arn ->
  unit ->
  update_contact_channel_request

val make_update_contact_request :
  ?display_name:contact_name ->
  ?plan:plan ->
  contact_id:ssm_contacts_arn ->
  unit ->
  update_contact_request

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tags_list -> unit -> tag_resource_request

val make_stop_engagement_request :
  ?reason:stop_reason -> engagement_id:ssm_contacts_arn -> unit -> stop_engagement_request

val make_start_engagement_request :
  ?public_subject:public_subject ->
  ?public_content:public_content ->
  ?incident_id:incident_id ->
  ?idempotency_token:idempotency_token ->
  contact_id:ssm_contacts_arn ->
  sender:sender ->
  subject:subject ->
  content:content ->
  unit ->
  start_engagement_request

val make_send_activation_code_request :
  contact_channel_id:ssm_contacts_arn -> unit -> send_activation_code_request
