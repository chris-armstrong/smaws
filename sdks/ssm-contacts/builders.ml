open Types

let make_validation_exception_field ~name:(name_ : string_) ~message:(message_ : string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_accept_page_request ?contact_channel_id:(contact_channel_id_ : ssm_contacts_arn option)
    ?note:(note_ : receipt_info option)
    ?accept_code_validation:(accept_code_validation_ : accept_code_validation option)
    ~page_id:(page_id_ : ssm_contacts_arn) ~accept_type:(accept_type_ : accept_type)
    ~accept_code:(accept_code_ : accept_code) () =
  ({
     page_id = page_id_;
     contact_channel_id = contact_channel_id_;
     accept_type = accept_type_;
     note = note_;
     accept_code = accept_code_;
     accept_code_validation = accept_code_validation_;
   }
    : accept_page_request)

let make_activate_contact_channel_request
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    ~activation_code:(activation_code_ : activation_code) () =
  ({ contact_channel_id = contact_channel_id_; activation_code = activation_code_ }
    : activate_contact_channel_request)

let make_channel_target_info
    ?retry_interval_in_minutes:(retry_interval_in_minutes_ : retry_interval_in_minutes option)
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({
     contact_channel_id = contact_channel_id_;
     retry_interval_in_minutes = retry_interval_in_minutes_;
   }
    : channel_target_info)

let make_dependent_entity ~relation_type:(relation_type_ : string_)
    ~dependent_resource_ids:(dependent_resource_ids_ : ssm_contacts_arn_list) () =
  ({ relation_type = relation_type_; dependent_resource_ids = dependent_resource_ids_ }
    : dependent_entity)

let make_contact ?display_name:(display_name_ : contact_name option)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) ~alias:(alias_ : contact_alias)
    ~type_:(type__ : contact_type) () =
  ({ contact_arn = contact_arn_; alias = alias_; display_name = display_name_; type_ = type__ }
    : contact)

let make_contact_channel_address ?simple_address:(simple_address_ : simple_address option) () =
  ({ simple_address = simple_address_ } : contact_channel_address)

let make_contact_channel ?type_:(type__ : channel_type option)
    ~contact_channel_arn:(contact_channel_arn_ : ssm_contacts_arn)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) ~name:(name_ : channel_name)
    ~delivery_address:(delivery_address_ : contact_channel_address)
    ~activation_status:(activation_status_ : activation_status) () =
  ({
     contact_channel_arn = contact_channel_arn_;
     contact_arn = contact_arn_;
     name = name_;
     type_ = type__;
     delivery_address = delivery_address_;
     activation_status = activation_status_;
   }
    : contact_channel)

let make_contact_target_info ?contact_id:(contact_id_ : ssm_contacts_arn option)
    ~is_essential:(is_essential_ : is_essential) () =
  ({ contact_id = contact_id_; is_essential = is_essential_ } : contact_target_info)

let make_hand_off_time ~hour_of_day:(hour_of_day_ : hour_of_day)
    ~minute_of_hour:(minute_of_hour_ : minute_of_hour) () =
  ({ hour_of_day = hour_of_day_; minute_of_hour = minute_of_hour_ } : hand_off_time)

let make_coverage_time ?start:(start_ : hand_off_time option) ?end_:(end__ : hand_off_time option)
    () =
  ({ start = start_; end_ = end__ } : coverage_time)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_target ?channel_target_info:(channel_target_info_ : channel_target_info option)
    ?contact_target_info:(contact_target_info_ : contact_target_info option) () =
  ({ channel_target_info = channel_target_info_; contact_target_info = contact_target_info_ }
    : target)

let make_stage ~duration_in_minutes:(duration_in_minutes_ : stage_duration_in_mins)
    ~targets:(targets_ : targets_list) () =
  ({ duration_in_minutes = duration_in_minutes_; targets = targets_ } : stage)

let make_plan ?stages:(stages_ : stages_list option)
    ?rotation_ids:(rotation_ids_ : ssm_contacts_arn_list option) () =
  ({ stages = stages_; rotation_ids = rotation_ids_ } : plan)

let make_create_contact_request ?display_name:(display_name_ : contact_name option)
    ?tags:(tags_ : tags_list option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~alias:(alias_ : contact_alias) ~type_:(type__ : contact_type) ~plan:(plan_ : plan) () =
  ({
     alias = alias_;
     display_name = display_name_;
     type_ = type__;
     plan = plan_;
     tags = tags_;
     idempotency_token = idempotency_token_;
   }
    : create_contact_request)

let make_create_contact_channel_request
    ?defer_activation:(defer_activation_ : defer_activation option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~contact_id:(contact_id_ : ssm_contacts_arn) ~name:(name_ : channel_name)
    ~type_:(type__ : channel_type) ~delivery_address:(delivery_address_ : contact_channel_address)
    () =
  ({
     contact_id = contact_id_;
     name = name_;
     type_ = type__;
     delivery_address = delivery_address_;
     defer_activation = defer_activation_;
     idempotency_token = idempotency_token_;
   }
    : create_contact_channel_request)

let make_weekly_setting ~day_of_week:(day_of_week_ : day_of_week)
    ~hand_off_time:(hand_off_time_ : hand_off_time) () =
  ({ day_of_week = day_of_week_; hand_off_time = hand_off_time_ } : weekly_setting)

let make_monthly_setting ~day_of_month:(day_of_month_ : day_of_month)
    ~hand_off_time:(hand_off_time_ : hand_off_time) () =
  ({ day_of_month = day_of_month_; hand_off_time = hand_off_time_ } : monthly_setting)

let make_recurrence_settings ?monthly_settings:(monthly_settings_ : monthly_settings option)
    ?weekly_settings:(weekly_settings_ : weekly_settings option)
    ?daily_settings:(daily_settings_ : daily_settings option)
    ?shift_coverages:(shift_coverages_ : shift_coverages_map option)
    ~number_of_on_calls:(number_of_on_calls_ : number_of_on_calls)
    ~recurrence_multiplier:(recurrence_multiplier_ : recurrence_multiplier) () =
  ({
     monthly_settings = monthly_settings_;
     weekly_settings = weekly_settings_;
     daily_settings = daily_settings_;
     number_of_on_calls = number_of_on_calls_;
     shift_coverages = shift_coverages_;
     recurrence_multiplier = recurrence_multiplier_;
   }
    : recurrence_settings)

let make_create_rotation_request ?start_time:(start_time_ : date_time option)
    ?tags:(tags_ : tags_list option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option) ~name:(name_ : rotation_name)
    ~contact_ids:(contact_ids_ : rotation_contacts_arn_list)
    ~time_zone_id:(time_zone_id_ : time_zone_id) ~recurrence:(recurrence_ : recurrence_settings) ()
    =
  ({
     name = name_;
     contact_ids = contact_ids_;
     start_time = start_time_;
     time_zone_id = time_zone_id_;
     recurrence = recurrence_;
     tags = tags_;
     idempotency_token = idempotency_token_;
   }
    : create_rotation_request)

let make_create_rotation_override_request
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    ~new_contact_ids:(new_contact_ids_ : rotation_override_contacts_arn_list)
    ~start_time:(start_time_ : date_time) ~end_time:(end_time_ : date_time) () =
  ({
     rotation_id = rotation_id_;
     new_contact_ids = new_contact_ids_;
     start_time = start_time_;
     end_time = end_time_;
     idempotency_token = idempotency_token_;
   }
    : create_rotation_override_request)

let make_deactivate_contact_channel_request
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({ contact_channel_id = contact_channel_id_ } : deactivate_contact_channel_request)

let make_delete_contact_request ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({ contact_id = contact_id_ } : delete_contact_request)

let make_delete_contact_channel_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    () =
  ({ contact_channel_id = contact_channel_id_ } : delete_contact_channel_request)

let make_delete_rotation_request ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_id = rotation_id_ } : delete_rotation_request)

let make_delete_rotation_override_request ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    ~rotation_override_id:(rotation_override_id_ : uuid) () =
  ({ rotation_id = rotation_id_; rotation_override_id = rotation_override_id_ }
    : delete_rotation_override_request)

let make_describe_engagement_request ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ engagement_id = engagement_id_ } : describe_engagement_request)

let make_describe_page_request ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ page_id = page_id_ } : describe_page_request)

let make_engagement ?incident_id:(incident_id_ : incident_id option)
    ?start_time:(start_time_ : date_time option) ?stop_time:(stop_time_ : date_time option)
    ~engagement_arn:(engagement_arn_ : ssm_contacts_arn)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) ~sender:(sender_ : sender) () =
  ({
     engagement_arn = engagement_arn_;
     contact_arn = contact_arn_;
     sender = sender_;
     incident_id = incident_id_;
     start_time = start_time_;
     stop_time = stop_time_;
   }
    : engagement)

let make_get_contact_request ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({ contact_id = contact_id_ } : get_contact_request)

let make_get_contact_channel_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) ()
    =
  ({ contact_channel_id = contact_channel_id_ } : get_contact_channel_request)

let make_get_contact_policy_request ~contact_arn:(contact_arn_ : ssm_contacts_arn) () =
  ({ contact_arn = contact_arn_ } : get_contact_policy_request)

let make_get_rotation_request ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_id = rotation_id_ } : get_rotation_request)

let make_get_rotation_override_request ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    ~rotation_override_id:(rotation_override_id_ : uuid) () =
  ({ rotation_id = rotation_id_; rotation_override_id = rotation_override_id_ }
    : get_rotation_override_request)

let make_list_contact_channels_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~contact_id:(contact_id_ : ssm_contacts_arn) ()
    =
  ({ contact_id = contact_id_; next_token = next_token_; max_results = max_results_ }
    : list_contact_channels_request)

let make_list_contacts_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?alias_prefix:(alias_prefix_ : contact_alias option) ?type_:(type__ : contact_type option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     alias_prefix = alias_prefix_;
     type_ = type__;
   }
    : list_contacts_request)

let make_time_range ?start_time:(start_time_ : date_time option)
    ?end_time:(end_time_ : date_time option) () =
  ({ start_time = start_time_; end_time = end_time_ } : time_range)

let make_list_engagements_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?incident_id:(incident_id_ : incident_id option)
    ?time_range_value:(time_range_value_ : time_range option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     incident_id = incident_id_;
     time_range_value = time_range_value_;
   }
    : list_engagements_request)

let make_receipt ?contact_channel_arn:(contact_channel_arn_ : ssm_contacts_arn option)
    ?receipt_info:(receipt_info_ : receipt_info option) ~receipt_type:(receipt_type_ : receipt_type)
    ~receipt_time:(receipt_time_ : date_time) () =
  ({
     contact_channel_arn = contact_channel_arn_;
     receipt_type = receipt_type_;
     receipt_info = receipt_info_;
     receipt_time = receipt_time_;
   }
    : receipt)

let make_list_page_receipts_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ page_id = page_id_; next_token = next_token_; max_results = max_results_ }
    : list_page_receipts_request)

let make_resolution_contact ?stage_index:(stage_index_ : stage_index option)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) ~type_:(type__ : contact_type) () =
  ({ contact_arn = contact_arn_; type_ = type__; stage_index = stage_index_ } : resolution_contact)

let make_list_page_resolutions_request ?next_token:(next_token_ : pagination_token option)
    ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ next_token = next_token_; page_id = page_id_ } : list_page_resolutions_request)

let make_page ?incident_id:(incident_id_ : incident_id option)
    ?sent_time:(sent_time_ : date_time option) ?delivery_time:(delivery_time_ : date_time option)
    ?read_time:(read_time_ : date_time option) ~page_arn:(page_arn_ : ssm_contacts_arn)
    ~engagement_arn:(engagement_arn_ : ssm_contacts_arn)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) ~sender:(sender_ : sender) () =
  ({
     page_arn = page_arn_;
     engagement_arn = engagement_arn_;
     contact_arn = contact_arn_;
     sender = sender_;
     incident_id = incident_id_;
     sent_time = sent_time_;
     delivery_time = delivery_time_;
     read_time = read_time_;
   }
    : page)

let make_list_pages_by_contact_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~contact_id:(contact_id_ : ssm_contacts_arn) ()
    =
  ({ contact_id = contact_id_; next_token = next_token_; max_results = max_results_ }
    : list_pages_by_contact_request)

let make_list_pages_by_engagement_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ engagement_id = engagement_id_; next_token = next_token_; max_results = max_results_ }
    : list_pages_by_engagement_request)

let make_shift_details ~overridden_contact_ids:(overridden_contact_ids_ : ssm_contacts_arn_list) ()
    =
  ({ overridden_contact_ids = overridden_contact_ids_ } : shift_details)

let make_rotation_shift ?contact_ids:(contact_ids_ : ssm_contacts_arn_list option)
    ?type_:(type__ : shift_type option) ?shift_details:(shift_details_ : shift_details option)
    ~start_time:(start_time_ : date_time) ~end_time:(end_time_ : date_time) () =
  ({
     contact_ids = contact_ids_;
     start_time = start_time_;
     end_time = end_time_;
     type_ = type__;
     shift_details = shift_details_;
   }
    : rotation_shift)

let make_preview_override ?new_members:(new_members_ : rotation_override_preview_member_list option)
    ?start_time:(start_time_ : date_time option) ?end_time:(end_time_ : date_time option) () =
  ({ new_members = new_members_; start_time = start_time_; end_time = end_time_ }
    : preview_override)

let make_list_preview_rotation_shifts_request
    ?rotation_start_time:(rotation_start_time_ : date_time option)
    ?start_time:(start_time_ : date_time option) ?overrides:(overrides_ : override_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~end_time:(end_time_ : date_time)
    ~members:(members_ : rotation_preview_member_list) ~time_zone_id:(time_zone_id_ : time_zone_id)
    ~recurrence:(recurrence_ : recurrence_settings) () =
  ({
     rotation_start_time = rotation_start_time_;
     start_time = start_time_;
     end_time = end_time_;
     members = members_;
     time_zone_id = time_zone_id_;
     recurrence = recurrence_;
     overrides = overrides_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_preview_rotation_shifts_request)

let make_rotation_override ~rotation_override_id:(rotation_override_id_ : uuid)
    ~new_contact_ids:(new_contact_ids_ : ssm_contacts_arn_list)
    ~start_time:(start_time_ : date_time) ~end_time:(end_time_ : date_time)
    ~create_time:(create_time_ : date_time) () =
  ({
     rotation_override_id = rotation_override_id_;
     new_contact_ids = new_contact_ids_;
     start_time = start_time_;
     end_time = end_time_;
     create_time = create_time_;
   }
    : rotation_override)

let make_list_rotation_overrides_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    ~start_time:(start_time_ : date_time) ~end_time:(end_time_ : date_time) () =
  ({
     rotation_id = rotation_id_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_rotation_overrides_request)

let make_list_rotation_shifts_request ?start_time:(start_time_ : date_time option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    ~end_time:(end_time_ : date_time) () =
  ({
     rotation_id = rotation_id_;
     start_time = start_time_;
     end_time = end_time_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_rotation_shifts_request)

let make_rotation ?contact_ids:(contact_ids_ : ssm_contacts_arn_list option)
    ?start_time:(start_time_ : date_time option) ?time_zone_id:(time_zone_id_ : time_zone_id option)
    ?recurrence:(recurrence_ : recurrence_settings option)
    ~rotation_arn:(rotation_arn_ : ssm_contacts_arn) ~name:(name_ : rotation_name) () =
  ({
     rotation_arn = rotation_arn_;
     name = name_;
     contact_ids = contact_ids_;
     start_time = start_time_;
     time_zone_id = time_zone_id_;
     recurrence = recurrence_;
   }
    : rotation)

let make_list_rotations_request ?rotation_name_prefix:(rotation_name_prefix_ : rotation_name option)
    ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     rotation_name_prefix = rotation_name_prefix_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_rotations_request)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_put_contact_policy_request ~contact_arn:(contact_arn_ : ssm_contacts_arn)
    ~policy:(policy_ : policy) () =
  ({ contact_arn = contact_arn_; policy = policy_ } : put_contact_policy_request)

let make_update_rotation_request ?contact_ids:(contact_ids_ : rotation_contacts_arn_list option)
    ?start_time:(start_time_ : date_time option) ?time_zone_id:(time_zone_id_ : time_zone_id option)
    ~rotation_id:(rotation_id_ : ssm_contacts_arn) ~recurrence:(recurrence_ : recurrence_settings)
    () =
  ({
     rotation_id = rotation_id_;
     contact_ids = contact_ids_;
     start_time = start_time_;
     time_zone_id = time_zone_id_;
     recurrence = recurrence_;
   }
    : update_rotation_request)

let make_update_contact_channel_request ?name:(name_ : channel_name option)
    ?delivery_address:(delivery_address_ : contact_channel_address option)
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({ contact_channel_id = contact_channel_id_; name = name_; delivery_address = delivery_address_ }
    : update_contact_channel_request)

let make_update_contact_request ?display_name:(display_name_ : contact_name option)
    ?plan:(plan_ : plan option) ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({ contact_id = contact_id_; display_name = display_name_; plan = plan_ }
    : update_contact_request)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tags_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_stop_engagement_request ?reason:(reason_ : stop_reason option)
    ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ engagement_id = engagement_id_; reason = reason_ } : stop_engagement_request)

let make_start_engagement_request ?public_subject:(public_subject_ : public_subject option)
    ?public_content:(public_content_ : public_content option)
    ?incident_id:(incident_id_ : incident_id option)
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~contact_id:(contact_id_ : ssm_contacts_arn) ~sender:(sender_ : sender)
    ~subject:(subject_ : subject) ~content:(content_ : content) () =
  ({
     contact_id = contact_id_;
     sender = sender_;
     subject = subject_;
     content = content_;
     public_subject = public_subject_;
     public_content = public_content_;
     incident_id = incident_id_;
     idempotency_token = idempotency_token_;
   }
    : start_engagement_request)

let make_send_activation_code_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    () =
  ({ contact_channel_id = contact_channel_id_ } : send_activation_code_request)
