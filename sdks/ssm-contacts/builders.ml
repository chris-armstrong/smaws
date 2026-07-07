open Types

let make_hand_off_time ~minute_of_hour:(minute_of_hour_ : minute_of_hour)
    ~hour_of_day:(hour_of_day_ : hour_of_day) () =
  ({ minute_of_hour = minute_of_hour_; hour_of_day = hour_of_day_ } : hand_off_time)

let make_weekly_setting ~hand_off_time:(hand_off_time_ : hand_off_time)
    ~day_of_week:(day_of_week_ : day_of_week) () =
  ({ hand_off_time = hand_off_time_; day_of_week = day_of_week_ } : weekly_setting)

let make_validation_exception_field ~message:(message_ : string_) ~name:(name_ : string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_monthly_setting ~hand_off_time:(hand_off_time_ : hand_off_time)
    ~day_of_month:(day_of_month_ : day_of_month) () =
  ({ hand_off_time = hand_off_time_; day_of_month = day_of_month_ } : monthly_setting)

let make_coverage_time ?end_:(end__ : hand_off_time option) ?start:(start_ : hand_off_time option)
    () =
  ({ end_ = end__; start = start_ } : coverage_time)

let make_recurrence_settings ?shift_coverages:(shift_coverages_ : shift_coverages_map option)
    ?daily_settings:(daily_settings_ : daily_settings option)
    ?weekly_settings:(weekly_settings_ : weekly_settings option)
    ?monthly_settings:(monthly_settings_ : monthly_settings option)
    ~recurrence_multiplier:(recurrence_multiplier_ : recurrence_multiplier)
    ~number_of_on_calls:(number_of_on_calls_ : number_of_on_calls) () =
  ({
     recurrence_multiplier = recurrence_multiplier_;
     shift_coverages = shift_coverages_;
     number_of_on_calls = number_of_on_calls_;
     daily_settings = daily_settings_;
     weekly_settings = weekly_settings_;
     monthly_settings = monthly_settings_;
   }
    : recurrence_settings)

let make_update_rotation_request ?time_zone_id:(time_zone_id_ : time_zone_id option)
    ?start_time:(start_time_ : date_time option)
    ?contact_ids:(contact_ids_ : rotation_contacts_arn_list option)
    ~recurrence:(recurrence_ : recurrence_settings) ~rotation_id:(rotation_id_ : ssm_contacts_arn)
    () =
  ({
     recurrence = recurrence_;
     time_zone_id = time_zone_id_;
     start_time = start_time_;
     contact_ids = contact_ids_;
     rotation_id = rotation_id_;
   }
    : update_rotation_request)

let make_dependent_entity ~dependent_resource_ids:(dependent_resource_ids_ : ssm_contacts_arn_list)
    ~relation_type:(relation_type_ : string_) () =
  ({ dependent_resource_ids = dependent_resource_ids_; relation_type = relation_type_ }
    : dependent_entity)

let make_channel_target_info
    ?retry_interval_in_minutes:(retry_interval_in_minutes_ : retry_interval_in_minutes option)
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({
     retry_interval_in_minutes = retry_interval_in_minutes_;
     contact_channel_id = contact_channel_id_;
   }
    : channel_target_info)

let make_contact_target_info ?contact_id:(contact_id_ : ssm_contacts_arn option)
    ~is_essential:(is_essential_ : is_essential) () =
  ({ is_essential = is_essential_; contact_id = contact_id_ } : contact_target_info)

let make_target ?contact_target_info:(contact_target_info_ : contact_target_info option)
    ?channel_target_info:(channel_target_info_ : channel_target_info option) () =
  ({ contact_target_info = contact_target_info_; channel_target_info = channel_target_info_ }
    : target)

let make_stage ~targets:(targets_ : targets_list)
    ~duration_in_minutes:(duration_in_minutes_ : stage_duration_in_mins) () =
  ({ targets = targets_; duration_in_minutes = duration_in_minutes_ } : stage)

let make_plan ?rotation_ids:(rotation_ids_ : ssm_contacts_arn_list option)
    ?stages:(stages_ : stages_list option) () =
  ({ rotation_ids = rotation_ids_; stages = stages_ } : plan)

let make_update_contact_request ?plan:(plan_ : plan option)
    ?display_name:(display_name_ : contact_name option) ~contact_id:(contact_id_ : ssm_contacts_arn)
    () =
  ({ plan = plan_; display_name = display_name_; contact_id = contact_id_ }
    : update_contact_request)

let make_contact_channel_address ?simple_address:(simple_address_ : simple_address option) () =
  ({ simple_address = simple_address_ } : contact_channel_address)

let make_update_contact_channel_request
    ?delivery_address:(delivery_address_ : contact_channel_address option)
    ?name:(name_ : channel_name option) ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    () =
  ({ delivery_address = delivery_address_; name = name_; contact_channel_id = contact_channel_id_ }
    : update_contact_channel_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_time_range ?end_time:(end_time_ : date_time option)
    ?start_time:(start_time_ : date_time option) () =
  ({ end_time = end_time_; start_time = start_time_ } : time_range)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tags_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_stop_engagement_request ?reason:(reason_ : stop_reason option)
    ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ reason = reason_; engagement_id = engagement_id_ } : stop_engagement_request)

let make_start_engagement_request ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?incident_id:(incident_id_ : incident_id option)
    ?public_content:(public_content_ : public_content option)
    ?public_subject:(public_subject_ : public_subject option) ~content:(content_ : content)
    ~subject:(subject_ : subject) ~sender:(sender_ : sender)
    ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({
     idempotency_token = idempotency_token_;
     incident_id = incident_id_;
     public_content = public_content_;
     public_subject = public_subject_;
     content = content_;
     subject = subject_;
     sender = sender_;
     contact_id = contact_id_;
   }
    : start_engagement_request)

let make_shift_details ~overridden_contact_ids:(overridden_contact_ids_ : ssm_contacts_arn_list) ()
    =
  ({ overridden_contact_ids = overridden_contact_ids_ } : shift_details)

let make_send_activation_code_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    () =
  ({ contact_channel_id = contact_channel_id_ } : send_activation_code_request)

let make_put_contact_policy_request ~policy:(policy_ : policy)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn) () =
  ({ policy = policy_; contact_arn = contact_arn_ } : put_contact_policy_request)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_rotation_shift ?shift_details:(shift_details_ : shift_details option)
    ?type_:(type__ : shift_type option) ?contact_ids:(contact_ids_ : ssm_contacts_arn_list option)
    ~end_time:(end_time_ : date_time) ~start_time:(start_time_ : date_time) () =
  ({
     shift_details = shift_details_;
     type_ = type__;
     end_time = end_time_;
     start_time = start_time_;
     contact_ids = contact_ids_;
   }
    : rotation_shift)

let make_list_rotation_shifts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ?start_time:(start_time_ : date_time option)
    ~end_time:(end_time_ : date_time) ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     rotation_id = rotation_id_;
   }
    : list_rotation_shifts_request)

let make_rotation ?recurrence:(recurrence_ : recurrence_settings option)
    ?time_zone_id:(time_zone_id_ : time_zone_id option) ?start_time:(start_time_ : date_time option)
    ?contact_ids:(contact_ids_ : ssm_contacts_arn_list option) ~name:(name_ : rotation_name)
    ~rotation_arn:(rotation_arn_ : ssm_contacts_arn) () =
  ({
     recurrence = recurrence_;
     time_zone_id = time_zone_id_;
     start_time = start_time_;
     contact_ids = contact_ids_;
     name = name_;
     rotation_arn = rotation_arn_;
   }
    : rotation)

let make_list_rotations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?rotation_name_prefix:(rotation_name_prefix_ : rotation_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     rotation_name_prefix = rotation_name_prefix_;
   }
    : list_rotations_request)

let make_rotation_override ~create_time:(create_time_ : date_time) ~end_time:(end_time_ : date_time)
    ~start_time:(start_time_ : date_time)
    ~new_contact_ids:(new_contact_ids_ : ssm_contacts_arn_list)
    ~rotation_override_id:(rotation_override_id_ : uuid) () =
  ({
     create_time = create_time_;
     end_time = end_time_;
     start_time = start_time_;
     new_contact_ids = new_contact_ids_;
     rotation_override_id = rotation_override_id_;
   }
    : rotation_override)

let make_list_rotation_overrides_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~end_time:(end_time_ : date_time)
    ~start_time:(start_time_ : date_time) ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     end_time = end_time_;
     start_time = start_time_;
     rotation_id = rotation_id_;
   }
    : list_rotation_overrides_request)

let make_preview_override ?end_time:(end_time_ : date_time option)
    ?start_time:(start_time_ : date_time option)
    ?new_members:(new_members_ : rotation_override_preview_member_list option) () =
  ({ end_time = end_time_; start_time = start_time_; new_members = new_members_ }
    : preview_override)

let make_list_preview_rotation_shifts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ?overrides:(overrides_ : override_list option) ?start_time:(start_time_ : date_time option)
    ?rotation_start_time:(rotation_start_time_ : date_time option)
    ~recurrence:(recurrence_ : recurrence_settings) ~time_zone_id:(time_zone_id_ : time_zone_id)
    ~members:(members_ : rotation_preview_member_list) ~end_time:(end_time_ : date_time) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     overrides = overrides_;
     recurrence = recurrence_;
     time_zone_id = time_zone_id_;
     members = members_;
     end_time = end_time_;
     start_time = start_time_;
     rotation_start_time = rotation_start_time_;
   }
    : list_preview_rotation_shifts_request)

let make_page ?read_time:(read_time_ : date_time option)
    ?delivery_time:(delivery_time_ : date_time option) ?sent_time:(sent_time_ : date_time option)
    ?incident_id:(incident_id_ : incident_id option) ~sender:(sender_ : sender)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn)
    ~engagement_arn:(engagement_arn_ : ssm_contacts_arn) ~page_arn:(page_arn_ : ssm_contacts_arn) ()
    =
  ({
     read_time = read_time_;
     delivery_time = delivery_time_;
     sent_time = sent_time_;
     incident_id = incident_id_;
     sender = sender_;
     contact_arn = contact_arn_;
     engagement_arn = engagement_arn_;
     page_arn = page_arn_;
   }
    : page)

let make_list_pages_by_engagement_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option)
    ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ max_results = max_results_; next_token = next_token_; engagement_id = engagement_id_ }
    : list_pages_by_engagement_request)

let make_list_pages_by_contact_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~contact_id:(contact_id_ : ssm_contacts_arn)
    () =
  ({ max_results = max_results_; next_token = next_token_; contact_id = contact_id_ }
    : list_pages_by_contact_request)

let make_resolution_contact ?stage_index:(stage_index_ : stage_index option)
    ~type_:(type__ : contact_type) ~contact_arn:(contact_arn_ : ssm_contacts_arn) () =
  ({ stage_index = stage_index_; type_ = type__; contact_arn = contact_arn_ } : resolution_contact)

let make_list_page_resolutions_request ?next_token:(next_token_ : pagination_token option)
    ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ page_id = page_id_; next_token = next_token_ } : list_page_resolutions_request)

let make_receipt ?receipt_info:(receipt_info_ : receipt_info option)
    ?contact_channel_arn:(contact_channel_arn_ : ssm_contacts_arn option)
    ~receipt_time:(receipt_time_ : date_time) ~receipt_type:(receipt_type_ : receipt_type) () =
  ({
     receipt_time = receipt_time_;
     receipt_info = receipt_info_;
     receipt_type = receipt_type_;
     contact_channel_arn = contact_channel_arn_;
   }
    : receipt)

let make_list_page_receipts_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ max_results = max_results_; next_token = next_token_; page_id = page_id_ }
    : list_page_receipts_request)

let make_engagement ?stop_time:(stop_time_ : date_time option)
    ?start_time:(start_time_ : date_time option) ?incident_id:(incident_id_ : incident_id option)
    ~sender:(sender_ : sender) ~contact_arn:(contact_arn_ : ssm_contacts_arn)
    ~engagement_arn:(engagement_arn_ : ssm_contacts_arn) () =
  ({
     stop_time = stop_time_;
     start_time = start_time_;
     incident_id = incident_id_;
     sender = sender_;
     contact_arn = contact_arn_;
     engagement_arn = engagement_arn_;
   }
    : engagement)

let make_list_engagements_request ?time_range_value:(time_range_value_ : time_range option)
    ?incident_id:(incident_id_ : incident_id option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     time_range_value = time_range_value_;
     incident_id = incident_id_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_engagements_request)

let make_contact ?display_name:(display_name_ : contact_name option) ~type_:(type__ : contact_type)
    ~alias:(alias_ : contact_alias) ~contact_arn:(contact_arn_ : ssm_contacts_arn) () =
  ({ type_ = type__; display_name = display_name_; alias = alias_; contact_arn = contact_arn_ }
    : contact)

let make_list_contacts_request ?type_:(type__ : contact_type option)
    ?alias_prefix:(alias_prefix_ : contact_alias option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     type_ = type__;
     alias_prefix = alias_prefix_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_contacts_request)

let make_contact_channel ?type_:(type__ : channel_type option)
    ~activation_status:(activation_status_ : activation_status)
    ~delivery_address:(delivery_address_ : contact_channel_address) ~name:(name_ : channel_name)
    ~contact_arn:(contact_arn_ : ssm_contacts_arn)
    ~contact_channel_arn:(contact_channel_arn_ : ssm_contacts_arn) () =
  ({
     activation_status = activation_status_;
     delivery_address = delivery_address_;
     type_ = type__;
     name = name_;
     contact_arn = contact_arn_;
     contact_channel_arn = contact_channel_arn_;
   }
    : contact_channel)

let make_list_contact_channels_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~contact_id:(contact_id_ : ssm_contacts_arn)
    () =
  ({ max_results = max_results_; next_token = next_token_; contact_id = contact_id_ }
    : list_contact_channels_request)

let make_get_rotation_override_request ~rotation_override_id:(rotation_override_id_ : uuid)
    ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_override_id = rotation_override_id_; rotation_id = rotation_id_ }
    : get_rotation_override_request)

let make_get_rotation_request ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_id = rotation_id_ } : get_rotation_request)

let make_get_contact_policy_request ~contact_arn:(contact_arn_ : ssm_contacts_arn) () =
  ({ contact_arn = contact_arn_ } : get_contact_policy_request)

let make_get_contact_channel_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) ()
    =
  ({ contact_channel_id = contact_channel_id_ } : get_contact_channel_request)

let make_get_contact_request ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({ contact_id = contact_id_ } : get_contact_request)

let make_describe_page_request ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({ page_id = page_id_ } : describe_page_request)

let make_describe_engagement_request ~engagement_id:(engagement_id_ : ssm_contacts_arn) () =
  ({ engagement_id = engagement_id_ } : describe_engagement_request)

let make_delete_rotation_override_request ~rotation_override_id:(rotation_override_id_ : uuid)
    ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_override_id = rotation_override_id_; rotation_id = rotation_id_ }
    : delete_rotation_override_request)

let make_delete_rotation_request ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({ rotation_id = rotation_id_ } : delete_rotation_request)

let make_delete_contact_channel_request ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn)
    () =
  ({ contact_channel_id = contact_channel_id_ } : delete_contact_channel_request)

let make_delete_contact_request ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({ contact_id = contact_id_ } : delete_contact_request)

let make_deactivate_contact_channel_request
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({ contact_channel_id = contact_channel_id_ } : deactivate_contact_channel_request)

let make_create_rotation_override_request
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ~end_time:(end_time_ : date_time) ~start_time:(start_time_ : date_time)
    ~new_contact_ids:(new_contact_ids_ : rotation_override_contacts_arn_list)
    ~rotation_id:(rotation_id_ : ssm_contacts_arn) () =
  ({
     idempotency_token = idempotency_token_;
     end_time = end_time_;
     start_time = start_time_;
     new_contact_ids = new_contact_ids_;
     rotation_id = rotation_id_;
   }
    : create_rotation_override_request)

let make_create_rotation_request ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?tags:(tags_ : tags_list option) ?start_time:(start_time_ : date_time option)
    ~recurrence:(recurrence_ : recurrence_settings) ~time_zone_id:(time_zone_id_ : time_zone_id)
    ~contact_ids:(contact_ids_ : rotation_contacts_arn_list) ~name:(name_ : rotation_name) () =
  ({
     idempotency_token = idempotency_token_;
     tags = tags_;
     recurrence = recurrence_;
     time_zone_id = time_zone_id_;
     start_time = start_time_;
     contact_ids = contact_ids_;
     name = name_;
   }
    : create_rotation_request)

let make_create_contact_channel_request
    ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?defer_activation:(defer_activation_ : defer_activation option)
    ~delivery_address:(delivery_address_ : contact_channel_address) ~type_:(type__ : channel_type)
    ~name:(name_ : channel_name) ~contact_id:(contact_id_ : ssm_contacts_arn) () =
  ({
     idempotency_token = idempotency_token_;
     defer_activation = defer_activation_;
     delivery_address = delivery_address_;
     type_ = type__;
     name = name_;
     contact_id = contact_id_;
   }
    : create_contact_channel_request)

let make_create_contact_request ?idempotency_token:(idempotency_token_ : idempotency_token option)
    ?tags:(tags_ : tags_list option) ?display_name:(display_name_ : contact_name option)
    ~plan:(plan_ : plan) ~type_:(type__ : contact_type) ~alias:(alias_ : contact_alias) () =
  ({
     idempotency_token = idempotency_token_;
     tags = tags_;
     plan = plan_;
     type_ = type__;
     display_name = display_name_;
     alias = alias_;
   }
    : create_contact_request)

let make_activate_contact_channel_request ~activation_code:(activation_code_ : activation_code)
    ~contact_channel_id:(contact_channel_id_ : ssm_contacts_arn) () =
  ({ activation_code = activation_code_; contact_channel_id = contact_channel_id_ }
    : activate_contact_channel_request)

let make_accept_page_request
    ?accept_code_validation:(accept_code_validation_ : accept_code_validation option)
    ?note:(note_ : receipt_info option)
    ?contact_channel_id:(contact_channel_id_ : ssm_contacts_arn option)
    ~accept_code:(accept_code_ : accept_code) ~accept_type:(accept_type_ : accept_type)
    ~page_id:(page_id_ : ssm_contacts_arn) () =
  ({
     accept_code_validation = accept_code_validation_;
     accept_code = accept_code_;
     note = note_;
     accept_type = accept_type_;
     contact_channel_id = contact_channel_id_;
     page_id = page_id_;
   }
    : accept_page_request)
