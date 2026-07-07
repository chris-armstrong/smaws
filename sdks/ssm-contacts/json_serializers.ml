open Smaws_Lib.Json.SerializeHelpers
open Types

let day_of_week_to_yojson (x : day_of_week) =
  match x with
  | SUN -> `String "SUN"
  | SAT -> `String "SAT"
  | FRI -> `String "FRI"
  | THU -> `String "THU"
  | WED -> `String "WED"
  | TUE -> `String "TUE"
  | MON -> `String "MON"

let hour_of_day_to_yojson = int_to_yojson
let minute_of_hour_to_yojson = int_to_yojson

let hand_off_time_to_yojson (x : hand_off_time) =
  assoc_to_yojson
    [
      ("MinuteOfHour", Some (minute_of_hour_to_yojson x.minute_of_hour));
      ("HourOfDay", Some (hour_of_day_to_yojson x.hour_of_day));
    ]

let weekly_setting_to_yojson (x : weekly_setting) =
  assoc_to_yojson
    [
      ("HandOffTime", Some (hand_off_time_to_yojson x.hand_off_time));
      ("DayOfWeek", Some (day_of_week_to_yojson x.day_of_week));
    ]

let weekly_settings_to_yojson tree = list_to_yojson weekly_setting_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "OTHER"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | CANNOT_PARSE -> `String "CANNOT_PARSE"
  | UNKNOWN_OPERATION -> `String "UNKNOWN_OPERATION"

let string__to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [ ("Message", Some (string__to_yojson x.message)); ("Name", Some (string__to_yojson x.name)) ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Message", Some (string__to_yojson x.message));
    ]

let uuid_to_yojson = string_to_yojson
let update_rotation_result_to_yojson = unit_to_yojson
let ssm_contacts_arn_to_yojson = string_to_yojson
let rotation_contacts_arn_list_to_yojson tree = list_to_yojson ssm_contacts_arn_to_yojson tree
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let time_zone_id_to_yojson = string_to_yojson
let day_of_month_to_yojson = int_to_yojson

let monthly_setting_to_yojson (x : monthly_setting) =
  assoc_to_yojson
    [
      ("HandOffTime", Some (hand_off_time_to_yojson x.hand_off_time));
      ("DayOfMonth", Some (day_of_month_to_yojson x.day_of_month));
    ]

let monthly_settings_to_yojson tree = list_to_yojson monthly_setting_to_yojson tree
let daily_settings_to_yojson tree = list_to_yojson hand_off_time_to_yojson tree
let number_of_on_calls_to_yojson = int_to_yojson

let coverage_time_to_yojson (x : coverage_time) =
  assoc_to_yojson
    [
      ("End", option_to_yojson hand_off_time_to_yojson x.end_);
      ("Start", option_to_yojson hand_off_time_to_yojson x.start);
    ]

let coverage_times_to_yojson tree = list_to_yojson coverage_time_to_yojson tree

let shift_coverages_map_to_yojson tree =
  map_to_yojson day_of_week_to_yojson coverage_times_to_yojson tree

let recurrence_multiplier_to_yojson = int_to_yojson

let recurrence_settings_to_yojson (x : recurrence_settings) =
  assoc_to_yojson
    [
      ("RecurrenceMultiplier", Some (recurrence_multiplier_to_yojson x.recurrence_multiplier));
      ("ShiftCoverages", option_to_yojson shift_coverages_map_to_yojson x.shift_coverages);
      ("NumberOfOnCalls", Some (number_of_on_calls_to_yojson x.number_of_on_calls));
      ("DailySettings", option_to_yojson daily_settings_to_yojson x.daily_settings);
      ("WeeklySettings", option_to_yojson weekly_settings_to_yojson x.weekly_settings);
      ("MonthlySettings", option_to_yojson monthly_settings_to_yojson x.monthly_settings);
    ]

let update_rotation_request_to_yojson (x : update_rotation_request) =
  assoc_to_yojson
    [
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("TimeZoneId", option_to_yojson time_zone_id_to_yojson x.time_zone_id);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("ContactIds", option_to_yojson rotation_contacts_arn_list_to_yojson x.contact_ids);
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("Message", Some (string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", Some (string__to_yojson x.resource_type));
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("Message", Some (string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
      ("Message", Some (string__to_yojson x.message));
    ]

let ssm_contacts_arn_list_to_yojson tree = list_to_yojson ssm_contacts_arn_to_yojson tree

let dependent_entity_to_yojson (x : dependent_entity) =
  assoc_to_yojson
    [
      ("DependentResourceIds", Some (ssm_contacts_arn_list_to_yojson x.dependent_resource_ids));
      ("RelationType", Some (string__to_yojson x.relation_type));
    ]

let dependent_entity_list_to_yojson tree = list_to_yojson dependent_entity_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("DependentEntities", option_to_yojson dependent_entity_list_to_yojson x.dependent_entities);
      ("ResourceType", Some (string__to_yojson x.resource_type));
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("Message", Some (string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let update_contact_result_to_yojson = unit_to_yojson
let contact_name_to_yojson = string_to_yojson
let stage_duration_in_mins_to_yojson = int_to_yojson
let retry_interval_in_minutes_to_yojson = int_to_yojson

let channel_target_info_to_yojson (x : channel_target_info) =
  assoc_to_yojson
    [
      ( "RetryIntervalInMinutes",
        option_to_yojson retry_interval_in_minutes_to_yojson x.retry_interval_in_minutes );
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
    ]

let is_essential_to_yojson = bool_to_yojson

let contact_target_info_to_yojson (x : contact_target_info) =
  assoc_to_yojson
    [
      ("IsEssential", Some (is_essential_to_yojson x.is_essential));
      ("ContactId", option_to_yojson ssm_contacts_arn_to_yojson x.contact_id);
    ]

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("ContactTargetInfo", option_to_yojson contact_target_info_to_yojson x.contact_target_info);
      ("ChannelTargetInfo", option_to_yojson channel_target_info_to_yojson x.channel_target_info);
    ]

let targets_list_to_yojson tree = list_to_yojson target_to_yojson tree

let stage_to_yojson (x : stage) =
  assoc_to_yojson
    [
      ("Targets", Some (targets_list_to_yojson x.targets));
      ("DurationInMinutes", Some (stage_duration_in_mins_to_yojson x.duration_in_minutes));
    ]

let stages_list_to_yojson tree = list_to_yojson stage_to_yojson tree

let plan_to_yojson (x : plan) =
  assoc_to_yojson
    [
      ("RotationIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.rotation_ids);
      ("Stages", option_to_yojson stages_list_to_yojson x.stages);
    ]

let update_contact_request_to_yojson (x : update_contact_request) =
  assoc_to_yojson
    [
      ("Plan", option_to_yojson plan_to_yojson x.plan);
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
    ]

let update_contact_channel_result_to_yojson = unit_to_yojson
let channel_name_to_yojson = string_to_yojson
let simple_address_to_yojson = string_to_yojson

let contact_channel_address_to_yojson (x : contact_channel_address) =
  assoc_to_yojson [ ("SimpleAddress", option_to_yojson simple_address_to_yojson x.simple_address) ]

let update_contact_channel_request_to_yojson (x : update_contact_channel_request) =
  assoc_to_yojson
    [
      ("DeliveryAddress", option_to_yojson contact_channel_address_to_yojson x.delivery_address);
      ("Name", option_to_yojson channel_name_to_yojson x.name);
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
    ]

let data_encryption_exception_to_yojson (x : data_encryption_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (string__to_yojson x.service_code));
      ("QuotaCode", Some (string__to_yojson x.quota_code));
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
      ("Message", Some (string__to_yojson x.message));
    ]

let untag_resource_result_to_yojson = unit_to_yojson
let amazon_resource_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
    ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_resource_result_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_list_to_yojson x.tags));
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
    ]

let subject_to_yojson = string_to_yojson
let stop_reason_to_yojson = string_to_yojson
let stop_engagement_result_to_yojson = unit_to_yojson

let stop_engagement_request_to_yojson (x : stop_engagement_request) =
  assoc_to_yojson
    [
      ("Reason", option_to_yojson stop_reason_to_yojson x.reason);
      ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id));
    ]

let start_engagement_result_to_yojson (x : start_engagement_result) =
  assoc_to_yojson [ ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn)) ]

let sender_to_yojson = string_to_yojson
let content_to_yojson = string_to_yojson
let public_subject_to_yojson = string_to_yojson
let public_content_to_yojson = string_to_yojson
let incident_id_to_yojson = string_to_yojson
let idempotency_token_to_yojson = string_to_yojson

let start_engagement_request_to_yojson (x : start_engagement_request) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("Content", Some (content_to_yojson x.content));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Sender", Some (sender_to_yojson x.sender));
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
    ]

let stage_index_to_yojson = int_to_yojson

let shift_type_to_yojson (x : shift_type) =
  match x with OVERRIDDEN -> `String "OVERRIDDEN" | REGULAR -> `String "REGULAR"

let shift_details_to_yojson (x : shift_details) =
  assoc_to_yojson
    [ ("OverriddenContactIds", Some (ssm_contacts_arn_list_to_yojson x.overridden_contact_ids)) ]

let send_activation_code_result_to_yojson = unit_to_yojson

let send_activation_code_request_to_yojson (x : send_activation_code_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let put_contact_policy_result_to_yojson = unit_to_yojson
let policy_to_yojson = string_to_yojson

let put_contact_policy_request_to_yojson (x : put_contact_policy_request) =
  assoc_to_yojson
    [
      ("Policy", Some (policy_to_yojson x.policy));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let rotation_shift_to_yojson (x : rotation_shift) =
  assoc_to_yojson
    [
      ("ShiftDetails", option_to_yojson shift_details_to_yojson x.shift_details);
      ("Type", option_to_yojson shift_type_to_yojson x.type_);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("ContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.contact_ids);
    ]

let rotation_shifts_to_yojson tree = list_to_yojson rotation_shift_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let list_rotation_shifts_result_to_yojson (x : list_rotation_shifts_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RotationShifts", option_to_yojson rotation_shifts_to_yojson x.rotation_shifts);
    ]

let max_results_to_yojson = int_to_yojson

let list_rotation_shifts_request_to_yojson (x : list_rotation_shifts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let rotation_name_to_yojson = string_to_yojson

let rotation_to_yojson (x : rotation) =
  assoc_to_yojson
    [
      ("Recurrence", option_to_yojson recurrence_settings_to_yojson x.recurrence);
      ("TimeZoneId", option_to_yojson time_zone_id_to_yojson x.time_zone_id);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("ContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.contact_ids);
      ("Name", Some (rotation_name_to_yojson x.name));
      ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn));
    ]

let rotations_to_yojson tree = list_to_yojson rotation_to_yojson tree

let list_rotations_result_to_yojson (x : list_rotations_result) =
  assoc_to_yojson
    [
      ("Rotations", Some (rotations_to_yojson x.rotations));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rotations_request_to_yojson (x : list_rotations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RotationNamePrefix", option_to_yojson rotation_name_to_yojson x.rotation_name_prefix);
    ]

let rotation_override_to_yojson (x : rotation_override) =
  assoc_to_yojson
    [
      ("CreateTime", Some (date_time_to_yojson x.create_time));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("NewContactIds", Some (ssm_contacts_arn_list_to_yojson x.new_contact_ids));
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
    ]

let rotation_overrides_to_yojson tree = list_to_yojson rotation_override_to_yojson tree

let list_rotation_overrides_result_to_yojson (x : list_rotation_overrides_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RotationOverrides", option_to_yojson rotation_overrides_to_yojson x.rotation_overrides);
    ]

let list_rotation_overrides_request_to_yojson (x : list_rotation_overrides_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let list_preview_rotation_shifts_result_to_yojson (x : list_preview_rotation_shifts_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("RotationShifts", option_to_yojson rotation_shifts_to_yojson x.rotation_shifts);
    ]

let member_to_yojson = string_to_yojson
let rotation_preview_member_list_to_yojson tree = list_to_yojson member_to_yojson tree
let rotation_override_preview_member_list_to_yojson tree = list_to_yojson member_to_yojson tree

let preview_override_to_yojson (x : preview_override) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("NewMembers", option_to_yojson rotation_override_preview_member_list_to_yojson x.new_members);
    ]

let override_list_to_yojson tree = list_to_yojson preview_override_to_yojson tree

let list_preview_rotation_shifts_request_to_yojson (x : list_preview_rotation_shifts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Overrides", option_to_yojson override_list_to_yojson x.overrides);
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("Members", Some (rotation_preview_member_list_to_yojson x.members));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("RotationStartTime", option_to_yojson date_time_to_yojson x.rotation_start_time);
    ]

let page_to_yojson (x : page) =
  assoc_to_yojson
    [
      ("ReadTime", option_to_yojson date_time_to_yojson x.read_time);
      ("DeliveryTime", option_to_yojson date_time_to_yojson x.delivery_time);
      ("SentTime", option_to_yojson date_time_to_yojson x.sent_time);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("Sender", Some (sender_to_yojson x.sender));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("PageArn", Some (ssm_contacts_arn_to_yojson x.page_arn));
    ]

let pages_list_to_yojson tree = list_to_yojson page_to_yojson tree

let list_pages_by_engagement_result_to_yojson (x : list_pages_by_engagement_result) =
  assoc_to_yojson
    [
      ("Pages", Some (pages_list_to_yojson x.pages));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_pages_by_engagement_request_to_yojson (x : list_pages_by_engagement_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id));
    ]

let list_pages_by_contact_result_to_yojson (x : list_pages_by_contact_result) =
  assoc_to_yojson
    [
      ("Pages", Some (pages_list_to_yojson x.pages));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_pages_by_contact_request_to_yojson (x : list_pages_by_contact_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
    ]

let contact_type_to_yojson (x : contact_type) =
  match x with
  | ONCALL_SCHEDULE -> `String "ONCALL_SCHEDULE"
  | ESCALATION -> `String "ESCALATION"
  | PERSONAL -> `String "PERSONAL"

let resolution_contact_to_yojson (x : resolution_contact) =
  assoc_to_yojson
    [
      ("StageIndex", option_to_yojson stage_index_to_yojson x.stage_index);
      ("Type", Some (contact_type_to_yojson x.type_));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let resolution_list_to_yojson tree = list_to_yojson resolution_contact_to_yojson tree

let list_page_resolutions_result_to_yojson (x : list_page_resolutions_result) =
  assoc_to_yojson
    [
      ("PageResolutions", Some (resolution_list_to_yojson x.page_resolutions));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_page_resolutions_request_to_yojson (x : list_page_resolutions_request) =
  assoc_to_yojson
    [
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let receipt_type_to_yojson (x : receipt_type) =
  match x with
  | STOP -> `String "STOP"
  | SENT -> `String "SENT"
  | READ -> `String "READ"
  | ERROR -> `String "ERROR"
  | DELIVERED -> `String "DELIVERED"

let receipt_info_to_yojson = string_to_yojson

let receipt_to_yojson (x : receipt) =
  assoc_to_yojson
    [
      ("ReceiptTime", Some (date_time_to_yojson x.receipt_time));
      ("ReceiptInfo", option_to_yojson receipt_info_to_yojson x.receipt_info);
      ("ReceiptType", Some (receipt_type_to_yojson x.receipt_type));
      ("ContactChannelArn", option_to_yojson ssm_contacts_arn_to_yojson x.contact_channel_arn);
    ]

let receipts_list_to_yojson tree = list_to_yojson receipt_to_yojson tree

let list_page_receipts_result_to_yojson (x : list_page_receipts_result) =
  assoc_to_yojson
    [
      ("Receipts", option_to_yojson receipts_list_to_yojson x.receipts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_page_receipts_request_to_yojson (x : list_page_receipts_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
    ]

let engagement_to_yojson (x : engagement) =
  assoc_to_yojson
    [
      ("StopTime", option_to_yojson date_time_to_yojson x.stop_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("Sender", Some (sender_to_yojson x.sender));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
    ]

let engagements_list_to_yojson tree = list_to_yojson engagement_to_yojson tree

let list_engagements_result_to_yojson (x : list_engagements_result) =
  assoc_to_yojson
    [
      ("Engagements", Some (engagements_list_to_yojson x.engagements));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_engagements_request_to_yojson (x : list_engagements_request) =
  assoc_to_yojson
    [
      ("TimeRangeValue", option_to_yojson time_range_to_yojson x.time_range_value);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let contact_alias_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("Type", Some (contact_type_to_yojson x.type_));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Alias", Some (contact_alias_to_yojson x.alias));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let contacts_list_to_yojson tree = list_to_yojson contact_to_yojson tree

let list_contacts_result_to_yojson (x : list_contacts_result) =
  assoc_to_yojson
    [
      ("Contacts", option_to_yojson contacts_list_to_yojson x.contacts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_contacts_request_to_yojson (x : list_contacts_request) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson contact_type_to_yojson x.type_);
      ("AliasPrefix", option_to_yojson contact_alias_to_yojson x.alias_prefix);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let channel_type_to_yojson (x : channel_type) =
  match x with EMAIL -> `String "EMAIL" | VOICE -> `String "VOICE" | SMS -> `String "SMS"

let activation_status_to_yojson (x : activation_status) =
  match x with NOT_ACTIVATED -> `String "NOT_ACTIVATED" | ACTIVATED -> `String "ACTIVATED"

let contact_channel_to_yojson (x : contact_channel) =
  assoc_to_yojson
    [
      ("ActivationStatus", Some (activation_status_to_yojson x.activation_status));
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("Type", option_to_yojson channel_type_to_yojson x.type_);
      ("Name", Some (channel_name_to_yojson x.name));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn));
    ]

let contact_channel_list_to_yojson tree = list_to_yojson contact_channel_to_yojson tree

let list_contact_channels_result_to_yojson (x : list_contact_channels_result) =
  assoc_to_yojson
    [
      ("ContactChannels", Some (contact_channel_list_to_yojson x.contact_channels));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_contact_channels_request_to_yojson (x : list_contact_channels_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
    ]

let get_rotation_override_result_to_yojson (x : get_rotation_override_result) =
  assoc_to_yojson
    [
      ("CreateTime", option_to_yojson date_time_to_yojson x.create_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("NewContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.new_contact_ids);
      ("RotationArn", option_to_yojson ssm_contacts_arn_to_yojson x.rotation_arn);
      ("RotationOverrideId", option_to_yojson uuid_to_yojson x.rotation_override_id);
    ]

let get_rotation_override_request_to_yojson (x : get_rotation_override_request) =
  assoc_to_yojson
    [
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let get_rotation_result_to_yojson (x : get_rotation_result) =
  assoc_to_yojson
    [
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("ContactIds", Some (rotation_contacts_arn_list_to_yojson x.contact_ids));
      ("Name", Some (rotation_name_to_yojson x.name));
      ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn));
    ]

let get_rotation_request_to_yojson (x : get_rotation_request) =
  assoc_to_yojson [ ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id)) ]

let get_contact_policy_result_to_yojson (x : get_contact_policy_result) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("ContactArn", option_to_yojson ssm_contacts_arn_to_yojson x.contact_arn);
    ]

let get_contact_policy_request_to_yojson (x : get_contact_policy_request) =
  assoc_to_yojson [ ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn)) ]

let get_contact_channel_result_to_yojson (x : get_contact_channel_result) =
  assoc_to_yojson
    [
      ("ActivationStatus", option_to_yojson activation_status_to_yojson x.activation_status);
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("Type", Some (channel_type_to_yojson x.type_));
      ("Name", Some (channel_name_to_yojson x.name));
      ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let get_contact_channel_request_to_yojson (x : get_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let get_contact_result_to_yojson (x : get_contact_result) =
  assoc_to_yojson
    [
      ("Plan", Some (plan_to_yojson x.plan));
      ("Type", Some (contact_type_to_yojson x.type_));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Alias", Some (contact_alias_to_yojson x.alias));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let get_contact_request_to_yojson (x : get_contact_request) =
  assoc_to_yojson [ ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id)) ]

let describe_page_result_to_yojson (x : describe_page_result) =
  assoc_to_yojson
    [
      ("DeliveryTime", option_to_yojson date_time_to_yojson x.delivery_time);
      ("ReadTime", option_to_yojson date_time_to_yojson x.read_time);
      ("SentTime", option_to_yojson date_time_to_yojson x.sent_time);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("Content", Some (content_to_yojson x.content));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Sender", Some (sender_to_yojson x.sender));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("PageArn", Some (ssm_contacts_arn_to_yojson x.page_arn));
    ]

let describe_page_request_to_yojson (x : describe_page_request) =
  assoc_to_yojson [ ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id)) ]

let describe_engagement_result_to_yojson (x : describe_engagement_result) =
  assoc_to_yojson
    [
      ("StopTime", option_to_yojson date_time_to_yojson x.stop_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("Content", Some (content_to_yojson x.content));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Sender", Some (sender_to_yojson x.sender));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
    ]

let describe_engagement_request_to_yojson (x : describe_engagement_request) =
  assoc_to_yojson [ ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id)) ]

let delete_rotation_override_result_to_yojson = unit_to_yojson

let delete_rotation_override_request_to_yojson (x : delete_rotation_override_request) =
  assoc_to_yojson
    [
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let delete_rotation_result_to_yojson = unit_to_yojson

let delete_rotation_request_to_yojson (x : delete_rotation_request) =
  assoc_to_yojson [ ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id)) ]

let delete_contact_channel_result_to_yojson = unit_to_yojson

let delete_contact_channel_request_to_yojson (x : delete_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let delete_contact_result_to_yojson = unit_to_yojson

let delete_contact_request_to_yojson (x : delete_contact_request) =
  assoc_to_yojson [ ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id)) ]

let deactivate_contact_channel_result_to_yojson = unit_to_yojson

let deactivate_contact_channel_request_to_yojson (x : deactivate_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let create_rotation_override_result_to_yojson (x : create_rotation_override_result) =
  assoc_to_yojson [ ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id)) ]

let rotation_override_contacts_arn_list_to_yojson tree =
  list_to_yojson ssm_contacts_arn_to_yojson tree

let create_rotation_override_request_to_yojson (x : create_rotation_override_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("NewContactIds", Some (rotation_override_contacts_arn_list_to_yojson x.new_contact_ids));
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
    ]

let create_rotation_result_to_yojson (x : create_rotation_result) =
  assoc_to_yojson [ ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn)) ]

let create_rotation_request_to_yojson (x : create_rotation_request) =
  assoc_to_yojson
    [
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("ContactIds", Some (rotation_contacts_arn_list_to_yojson x.contact_ids));
      ("Name", Some (rotation_name_to_yojson x.name));
    ]

let create_contact_channel_result_to_yojson (x : create_contact_channel_result) =
  assoc_to_yojson [ ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn)) ]

let defer_activation_to_yojson = bool_to_yojson

let create_contact_channel_request_to_yojson (x : create_contact_channel_request) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("DeferActivation", option_to_yojson defer_activation_to_yojson x.defer_activation);
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("Type", Some (channel_type_to_yojson x.type_));
      ("Name", Some (channel_name_to_yojson x.name));
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
    ]

let create_contact_result_to_yojson (x : create_contact_result) =
  assoc_to_yojson [ ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn)) ]

let create_contact_request_to_yojson (x : create_contact_request) =
  assoc_to_yojson
    [
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
      ("Plan", Some (plan_to_yojson x.plan));
      ("Type", Some (contact_type_to_yojson x.type_));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Alias", Some (contact_alias_to_yojson x.alias));
    ]

let activate_contact_channel_result_to_yojson = unit_to_yojson
let activation_code_to_yojson = string_to_yojson

let activate_contact_channel_request_to_yojson (x : activate_contact_channel_request) =
  assoc_to_yojson
    [
      ("ActivationCode", Some (activation_code_to_yojson x.activation_code));
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
    ]

let accept_page_result_to_yojson = unit_to_yojson

let accept_type_to_yojson (x : accept_type) =
  match x with READ -> `String "READ" | DELIVERED -> `String "DELIVERED"

let accept_code_to_yojson = string_to_yojson

let accept_code_validation_to_yojson (x : accept_code_validation) =
  match x with ENFORCE -> `String "ENFORCE" | IGNORE -> `String "IGNORE"

let accept_page_request_to_yojson (x : accept_page_request) =
  assoc_to_yojson
    [
      ( "AcceptCodeValidation",
        option_to_yojson accept_code_validation_to_yojson x.accept_code_validation );
      ("AcceptCode", Some (accept_code_to_yojson x.accept_code));
      ("Note", option_to_yojson receipt_info_to_yojson x.note);
      ("AcceptType", Some (accept_type_to_yojson x.accept_type));
      ("ContactChannelId", option_to_yojson ssm_contacts_arn_to_yojson x.contact_channel_id);
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
    ]
