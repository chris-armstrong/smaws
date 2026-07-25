open Smaws_Lib.Json.SerializeHelpers
open Types

let accept_code_to_yojson = string_to_yojson

let accept_code_validation_to_yojson (x : accept_code_validation) =
  match x with IGNORE -> `String "IGNORE" | ENFORCE -> `String "ENFORCE"

let string__to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [ ("Name", Some (string__to_yojson x.name)); ("Message", Some (string__to_yojson x.message)) ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "UNKNOWN_OPERATION"
  | CANNOT_PARSE -> `String "CANNOT_PARSE"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | OTHER -> `String "OTHER"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let retry_after_seconds_to_yojson = int_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("QuotaCode", option_to_yojson string__to_yojson x.quota_code);
      ("ServiceCode", option_to_yojson string__to_yojson x.service_code);
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("ResourceType", Some (string__to_yojson x.resource_type));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds);
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let accept_page_result_to_yojson = unit_to_yojson
let receipt_info_to_yojson = string_to_yojson

let accept_type_to_yojson (x : accept_type) =
  match x with DELIVERED -> `String "DELIVERED" | READ -> `String "READ"

let ssm_contacts_arn_to_yojson = string_to_yojson

let accept_page_request_to_yojson (x : accept_page_request) =
  assoc_to_yojson
    [
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
      ("ContactChannelId", option_to_yojson ssm_contacts_arn_to_yojson x.contact_channel_id);
      ("AcceptType", Some (accept_type_to_yojson x.accept_type));
      ("Note", option_to_yojson receipt_info_to_yojson x.note);
      ("AcceptCode", Some (accept_code_to_yojson x.accept_code));
      ( "AcceptCodeValidation",
        option_to_yojson accept_code_validation_to_yojson x.accept_code_validation );
    ]

let activate_contact_channel_result_to_yojson = unit_to_yojson
let activation_code_to_yojson = string_to_yojson

let activate_contact_channel_request_to_yojson (x : activate_contact_channel_request) =
  assoc_to_yojson
    [
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
      ("ActivationCode", Some (activation_code_to_yojson x.activation_code));
    ]

let activation_status_to_yojson (x : activation_status) =
  match x with ACTIVATED -> `String "ACTIVATED" | NOT_ACTIVATED -> `String "NOT_ACTIVATED"

let amazon_resource_name_to_yojson = string_to_yojson
let channel_name_to_yojson = string_to_yojson
let retry_interval_in_minutes_to_yojson = int_to_yojson

let channel_target_info_to_yojson (x : channel_target_info) =
  assoc_to_yojson
    [
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
      ( "RetryIntervalInMinutes",
        option_to_yojson retry_interval_in_minutes_to_yojson x.retry_interval_in_minutes );
    ]

let channel_type_to_yojson (x : channel_type) =
  match x with SMS -> `String "SMS" | VOICE -> `String "VOICE" | EMAIL -> `String "EMAIL"

let ssm_contacts_arn_list_to_yojson tree = list_to_yojson ssm_contacts_arn_to_yojson tree

let dependent_entity_to_yojson (x : dependent_entity) =
  assoc_to_yojson
    [
      ("RelationType", Some (string__to_yojson x.relation_type));
      ("DependentResourceIds", Some (ssm_contacts_arn_list_to_yojson x.dependent_resource_ids));
    ]

let dependent_entity_list_to_yojson tree = list_to_yojson dependent_entity_to_yojson tree

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ResourceId", Some (string__to_yojson x.resource_id));
      ("ResourceType", Some (string__to_yojson x.resource_type));
      ("DependentEntities", option_to_yojson dependent_entity_list_to_yojson x.dependent_entities);
    ]

let contact_type_to_yojson (x : contact_type) =
  match x with
  | PERSONAL -> `String "PERSONAL"
  | ESCALATION -> `String "ESCALATION"
  | ONCALL_SCHEDULE -> `String "ONCALL_SCHEDULE"

let contact_name_to_yojson = string_to_yojson
let contact_alias_to_yojson = string_to_yojson

let contact_to_yojson (x : contact) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Alias", Some (contact_alias_to_yojson x.alias));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Type", Some (contact_type_to_yojson x.type_));
    ]

let simple_address_to_yojson = string_to_yojson

let contact_channel_address_to_yojson (x : contact_channel_address) =
  assoc_to_yojson [ ("SimpleAddress", option_to_yojson simple_address_to_yojson x.simple_address) ]

let contact_channel_to_yojson (x : contact_channel) =
  assoc_to_yojson
    [
      ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Name", Some (channel_name_to_yojson x.name));
      ("Type", option_to_yojson channel_type_to_yojson x.type_);
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("ActivationStatus", Some (activation_status_to_yojson x.activation_status));
    ]

let contact_channel_list_to_yojson tree = list_to_yojson contact_channel_to_yojson tree
let is_essential_to_yojson = bool_to_yojson

let contact_target_info_to_yojson (x : contact_target_info) =
  assoc_to_yojson
    [
      ("ContactId", option_to_yojson ssm_contacts_arn_to_yojson x.contact_id);
      ("IsEssential", Some (is_essential_to_yojson x.is_essential));
    ]

let contacts_list_to_yojson tree = list_to_yojson contact_to_yojson tree
let content_to_yojson = string_to_yojson
let minute_of_hour_to_yojson = int_to_yojson
let hour_of_day_to_yojson = int_to_yojson

let hand_off_time_to_yojson (x : hand_off_time) =
  assoc_to_yojson
    [
      ("HourOfDay", Some (hour_of_day_to_yojson x.hour_of_day));
      ("MinuteOfHour", Some (minute_of_hour_to_yojson x.minute_of_hour));
    ]

let coverage_time_to_yojson (x : coverage_time) =
  assoc_to_yojson
    [
      ("Start", option_to_yojson hand_off_time_to_yojson x.start);
      ("End", option_to_yojson hand_off_time_to_yojson x.end_);
    ]

let coverage_times_to_yojson tree = list_to_yojson coverage_time_to_yojson tree

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (string__to_yojson x.message));
      ("ResourceId", option_to_yojson string__to_yojson x.resource_id);
      ("ResourceType", option_to_yojson string__to_yojson x.resource_type);
      ("QuotaCode", Some (string__to_yojson x.quota_code));
      ("ServiceCode", Some (string__to_yojson x.service_code));
    ]

let data_encryption_exception_to_yojson (x : data_encryption_exception) =
  assoc_to_yojson [ ("Message", Some (string__to_yojson x.message)) ]

let create_contact_result_to_yojson (x : create_contact_result) =
  assoc_to_yojson [ ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn)) ]

let idempotency_token_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let target_to_yojson (x : target) =
  assoc_to_yojson
    [
      ("ChannelTargetInfo", option_to_yojson channel_target_info_to_yojson x.channel_target_info);
      ("ContactTargetInfo", option_to_yojson contact_target_info_to_yojson x.contact_target_info);
    ]

let targets_list_to_yojson tree = list_to_yojson target_to_yojson tree
let stage_duration_in_mins_to_yojson = int_to_yojson

let stage_to_yojson (x : stage) =
  assoc_to_yojson
    [
      ("DurationInMinutes", Some (stage_duration_in_mins_to_yojson x.duration_in_minutes));
      ("Targets", Some (targets_list_to_yojson x.targets));
    ]

let stages_list_to_yojson tree = list_to_yojson stage_to_yojson tree

let plan_to_yojson (x : plan) =
  assoc_to_yojson
    [
      ("Stages", option_to_yojson stages_list_to_yojson x.stages);
      ("RotationIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.rotation_ids);
    ]

let create_contact_request_to_yojson (x : create_contact_request) =
  assoc_to_yojson
    [
      ("Alias", Some (contact_alias_to_yojson x.alias));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Type", Some (contact_type_to_yojson x.type_));
      ("Plan", Some (plan_to_yojson x.plan));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_contact_channel_result_to_yojson (x : create_contact_channel_result) =
  assoc_to_yojson [ ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn)) ]

let defer_activation_to_yojson = bool_to_yojson

let create_contact_channel_request_to_yojson (x : create_contact_channel_request) =
  assoc_to_yojson
    [
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
      ("Name", Some (channel_name_to_yojson x.name));
      ("Type", Some (channel_type_to_yojson x.type_));
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("DeferActivation", option_to_yojson defer_activation_to_yojson x.defer_activation);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_rotation_result_to_yojson (x : create_rotation_result) =
  assoc_to_yojson [ ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn)) ]

let recurrence_multiplier_to_yojson = int_to_yojson

let day_of_week_to_yojson (x : day_of_week) =
  match x with
  | MON -> `String "MON"
  | TUE -> `String "TUE"
  | WED -> `String "WED"
  | THU -> `String "THU"
  | FRI -> `String "FRI"
  | SAT -> `String "SAT"
  | SUN -> `String "SUN"

let shift_coverages_map_to_yojson tree =
  map_to_yojson day_of_week_to_yojson coverage_times_to_yojson tree

let number_of_on_calls_to_yojson = int_to_yojson
let daily_settings_to_yojson tree = list_to_yojson hand_off_time_to_yojson tree

let weekly_setting_to_yojson (x : weekly_setting) =
  assoc_to_yojson
    [
      ("DayOfWeek", Some (day_of_week_to_yojson x.day_of_week));
      ("HandOffTime", Some (hand_off_time_to_yojson x.hand_off_time));
    ]

let weekly_settings_to_yojson tree = list_to_yojson weekly_setting_to_yojson tree
let day_of_month_to_yojson = int_to_yojson

let monthly_setting_to_yojson (x : monthly_setting) =
  assoc_to_yojson
    [
      ("DayOfMonth", Some (day_of_month_to_yojson x.day_of_month));
      ("HandOffTime", Some (hand_off_time_to_yojson x.hand_off_time));
    ]

let monthly_settings_to_yojson tree = list_to_yojson monthly_setting_to_yojson tree

let recurrence_settings_to_yojson (x : recurrence_settings) =
  assoc_to_yojson
    [
      ("MonthlySettings", option_to_yojson monthly_settings_to_yojson x.monthly_settings);
      ("WeeklySettings", option_to_yojson weekly_settings_to_yojson x.weekly_settings);
      ("DailySettings", option_to_yojson daily_settings_to_yojson x.daily_settings);
      ("NumberOfOnCalls", Some (number_of_on_calls_to_yojson x.number_of_on_calls));
      ("ShiftCoverages", option_to_yojson shift_coverages_map_to_yojson x.shift_coverages);
      ("RecurrenceMultiplier", Some (recurrence_multiplier_to_yojson x.recurrence_multiplier));
    ]

let time_zone_id_to_yojson = string_to_yojson
let date_time_to_yojson = timestamp_epoch_seconds_to_yojson
let rotation_contacts_arn_list_to_yojson tree = list_to_yojson ssm_contacts_arn_to_yojson tree
let rotation_name_to_yojson = string_to_yojson

let create_rotation_request_to_yojson (x : create_rotation_request) =
  assoc_to_yojson
    [
      ("Name", Some (rotation_name_to_yojson x.name));
      ("ContactIds", Some (rotation_contacts_arn_list_to_yojson x.contact_ids));
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("Tags", option_to_yojson tags_list_to_yojson x.tags);
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
    ]

let uuid_to_yojson = string_to_yojson

let create_rotation_override_result_to_yojson (x : create_rotation_override_result) =
  assoc_to_yojson [ ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id)) ]

let rotation_override_contacts_arn_list_to_yojson tree =
  list_to_yojson ssm_contacts_arn_to_yojson tree

let create_rotation_override_request_to_yojson (x : create_rotation_override_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("NewContactIds", Some (rotation_override_contacts_arn_list_to_yojson x.new_contact_ids));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("IdempotencyToken", option_to_yojson idempotency_token_to_yojson x.idempotency_token);
    ]

let deactivate_contact_channel_result_to_yojson = unit_to_yojson

let deactivate_contact_channel_request_to_yojson (x : deactivate_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let delete_contact_result_to_yojson = unit_to_yojson

let delete_contact_request_to_yojson (x : delete_contact_request) =
  assoc_to_yojson [ ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id)) ]

let delete_contact_channel_result_to_yojson = unit_to_yojson

let delete_contact_channel_request_to_yojson (x : delete_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let delete_rotation_result_to_yojson = unit_to_yojson

let delete_rotation_request_to_yojson (x : delete_rotation_request) =
  assoc_to_yojson [ ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id)) ]

let delete_rotation_override_result_to_yojson = unit_to_yojson

let delete_rotation_override_request_to_yojson (x : delete_rotation_override_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
    ]

let incident_id_to_yojson = string_to_yojson
let public_content_to_yojson = string_to_yojson
let public_subject_to_yojson = string_to_yojson
let subject_to_yojson = string_to_yojson
let sender_to_yojson = string_to_yojson

let describe_engagement_result_to_yojson (x : describe_engagement_result) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("Sender", Some (sender_to_yojson x.sender));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Content", Some (content_to_yojson x.content));
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("StopTime", option_to_yojson date_time_to_yojson x.stop_time);
    ]

let describe_engagement_request_to_yojson (x : describe_engagement_request) =
  assoc_to_yojson [ ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id)) ]

let describe_page_result_to_yojson (x : describe_page_result) =
  assoc_to_yojson
    [
      ("PageArn", Some (ssm_contacts_arn_to_yojson x.page_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Sender", Some (sender_to_yojson x.sender));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Content", Some (content_to_yojson x.content));
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("SentTime", option_to_yojson date_time_to_yojson x.sent_time);
      ("ReadTime", option_to_yojson date_time_to_yojson x.read_time);
      ("DeliveryTime", option_to_yojson date_time_to_yojson x.delivery_time);
    ]

let describe_page_request_to_yojson (x : describe_page_request) =
  assoc_to_yojson [ ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id)) ]

let engagement_to_yojson (x : engagement) =
  assoc_to_yojson
    [
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Sender", Some (sender_to_yojson x.sender));
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("StopTime", option_to_yojson date_time_to_yojson x.stop_time);
    ]

let engagements_list_to_yojson tree = list_to_yojson engagement_to_yojson tree

let get_contact_result_to_yojson (x : get_contact_result) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Alias", Some (contact_alias_to_yojson x.alias));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Type", Some (contact_type_to_yojson x.type_));
      ("Plan", Some (plan_to_yojson x.plan));
    ]

let get_contact_request_to_yojson (x : get_contact_request) =
  assoc_to_yojson [ ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id)) ]

let get_contact_channel_result_to_yojson (x : get_contact_channel_result) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("ContactChannelArn", Some (ssm_contacts_arn_to_yojson x.contact_channel_arn));
      ("Name", Some (channel_name_to_yojson x.name));
      ("Type", Some (channel_type_to_yojson x.type_));
      ("DeliveryAddress", Some (contact_channel_address_to_yojson x.delivery_address));
      ("ActivationStatus", option_to_yojson activation_status_to_yojson x.activation_status);
    ]

let get_contact_channel_request_to_yojson (x : get_contact_channel_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]

let policy_to_yojson = string_to_yojson

let get_contact_policy_result_to_yojson (x : get_contact_policy_result) =
  assoc_to_yojson
    [
      ("ContactArn", option_to_yojson ssm_contacts_arn_to_yojson x.contact_arn);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
    ]

let get_contact_policy_request_to_yojson (x : get_contact_policy_request) =
  assoc_to_yojson [ ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn)) ]

let get_rotation_result_to_yojson (x : get_rotation_result) =
  assoc_to_yojson
    [
      ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn));
      ("Name", Some (rotation_name_to_yojson x.name));
      ("ContactIds", Some (rotation_contacts_arn_list_to_yojson x.contact_ids));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
    ]

let get_rotation_request_to_yojson (x : get_rotation_request) =
  assoc_to_yojson [ ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id)) ]

let get_rotation_override_result_to_yojson (x : get_rotation_override_result) =
  assoc_to_yojson
    [
      ("RotationOverrideId", option_to_yojson uuid_to_yojson x.rotation_override_id);
      ("RotationArn", option_to_yojson ssm_contacts_arn_to_yojson x.rotation_arn);
      ("NewContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.new_contact_ids);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
      ("CreateTime", option_to_yojson date_time_to_yojson x.create_time);
    ]

let get_rotation_override_request_to_yojson (x : get_rotation_override_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
    ]

let pagination_token_to_yojson = string_to_yojson

let list_contact_channels_result_to_yojson (x : list_contact_channels_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ContactChannels", Some (contact_channel_list_to_yojson x.contact_channels));
    ]

let max_results_to_yojson = int_to_yojson

let list_contact_channels_request_to_yojson (x : list_contact_channels_request) =
  assoc_to_yojson
    [
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_contacts_result_to_yojson (x : list_contacts_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Contacts", option_to_yojson contacts_list_to_yojson x.contacts);
    ]

let list_contacts_request_to_yojson (x : list_contacts_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AliasPrefix", option_to_yojson contact_alias_to_yojson x.alias_prefix);
      ("Type", option_to_yojson contact_type_to_yojson x.type_);
    ]

let list_engagements_result_to_yojson (x : list_engagements_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Engagements", Some (engagements_list_to_yojson x.engagements));
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
    ]

let list_engagements_request_to_yojson (x : list_engagements_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("TimeRangeValue", option_to_yojson time_range_to_yojson x.time_range_value);
    ]

let receipt_type_to_yojson (x : receipt_type) =
  match x with
  | DELIVERED -> `String "DELIVERED"
  | ERROR -> `String "ERROR"
  | READ -> `String "READ"
  | SENT -> `String "SENT"
  | STOP -> `String "STOP"

let receipt_to_yojson (x : receipt) =
  assoc_to_yojson
    [
      ("ContactChannelArn", option_to_yojson ssm_contacts_arn_to_yojson x.contact_channel_arn);
      ("ReceiptType", Some (receipt_type_to_yojson x.receipt_type));
      ("ReceiptInfo", option_to_yojson receipt_info_to_yojson x.receipt_info);
      ("ReceiptTime", Some (date_time_to_yojson x.receipt_time));
    ]

let receipts_list_to_yojson tree = list_to_yojson receipt_to_yojson tree

let list_page_receipts_result_to_yojson (x : list_page_receipts_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Receipts", option_to_yojson receipts_list_to_yojson x.receipts);
    ]

let list_page_receipts_request_to_yojson (x : list_page_receipts_request) =
  assoc_to_yojson
    [
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let stage_index_to_yojson = int_to_yojson

let resolution_contact_to_yojson (x : resolution_contact) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Type", Some (contact_type_to_yojson x.type_));
      ("StageIndex", option_to_yojson stage_index_to_yojson x.stage_index);
    ]

let resolution_list_to_yojson tree = list_to_yojson resolution_contact_to_yojson tree

let list_page_resolutions_result_to_yojson (x : list_page_resolutions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageResolutions", Some (resolution_list_to_yojson x.page_resolutions));
    ]

let list_page_resolutions_request_to_yojson (x : list_page_resolutions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("PageId", Some (ssm_contacts_arn_to_yojson x.page_id));
    ]

let page_to_yojson (x : page) =
  assoc_to_yojson
    [
      ("PageArn", Some (ssm_contacts_arn_to_yojson x.page_arn));
      ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn));
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Sender", Some (sender_to_yojson x.sender));
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ("SentTime", option_to_yojson date_time_to_yojson x.sent_time);
      ("DeliveryTime", option_to_yojson date_time_to_yojson x.delivery_time);
      ("ReadTime", option_to_yojson date_time_to_yojson x.read_time);
    ]

let pages_list_to_yojson tree = list_to_yojson page_to_yojson tree

let list_pages_by_contact_result_to_yojson (x : list_pages_by_contact_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Pages", Some (pages_list_to_yojson x.pages));
    ]

let list_pages_by_contact_request_to_yojson (x : list_pages_by_contact_request) =
  assoc_to_yojson
    [
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_pages_by_engagement_result_to_yojson (x : list_pages_by_engagement_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Pages", Some (pages_list_to_yojson x.pages));
    ]

let list_pages_by_engagement_request_to_yojson (x : list_pages_by_engagement_request) =
  assoc_to_yojson
    [
      ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let shift_details_to_yojson (x : shift_details) =
  assoc_to_yojson
    [ ("OverriddenContactIds", Some (ssm_contacts_arn_list_to_yojson x.overridden_contact_ids)) ]

let shift_type_to_yojson (x : shift_type) =
  match x with REGULAR -> `String "REGULAR" | OVERRIDDEN -> `String "OVERRIDDEN"

let rotation_shift_to_yojson (x : rotation_shift) =
  assoc_to_yojson
    [
      ("ContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.contact_ids);
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("Type", option_to_yojson shift_type_to_yojson x.type_);
      ("ShiftDetails", option_to_yojson shift_details_to_yojson x.shift_details);
    ]

let rotation_shifts_to_yojson tree = list_to_yojson rotation_shift_to_yojson tree

let list_preview_rotation_shifts_result_to_yojson (x : list_preview_rotation_shifts_result) =
  assoc_to_yojson
    [
      ("RotationShifts", option_to_yojson rotation_shifts_to_yojson x.rotation_shifts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let member_to_yojson = string_to_yojson
let rotation_override_preview_member_list_to_yojson tree = list_to_yojson member_to_yojson tree

let preview_override_to_yojson (x : preview_override) =
  assoc_to_yojson
    [
      ("NewMembers", option_to_yojson rotation_override_preview_member_list_to_yojson x.new_members);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", option_to_yojson date_time_to_yojson x.end_time);
    ]

let override_list_to_yojson tree = list_to_yojson preview_override_to_yojson tree
let rotation_preview_member_list_to_yojson tree = list_to_yojson member_to_yojson tree

let list_preview_rotation_shifts_request_to_yojson (x : list_preview_rotation_shifts_request) =
  assoc_to_yojson
    [
      ("RotationStartTime", option_to_yojson date_time_to_yojson x.rotation_start_time);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("Members", Some (rotation_preview_member_list_to_yojson x.members));
      ("TimeZoneId", Some (time_zone_id_to_yojson x.time_zone_id));
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
      ("Overrides", option_to_yojson override_list_to_yojson x.overrides);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let rotation_override_to_yojson (x : rotation_override) =
  assoc_to_yojson
    [
      ("RotationOverrideId", Some (uuid_to_yojson x.rotation_override_id));
      ("NewContactIds", Some (ssm_contacts_arn_list_to_yojson x.new_contact_ids));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("CreateTime", Some (date_time_to_yojson x.create_time));
    ]

let rotation_overrides_to_yojson tree = list_to_yojson rotation_override_to_yojson tree

let list_rotation_overrides_result_to_yojson (x : list_rotation_overrides_result) =
  assoc_to_yojson
    [
      ("RotationOverrides", option_to_yojson rotation_overrides_to_yojson x.rotation_overrides);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rotation_overrides_request_to_yojson (x : list_rotation_overrides_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("StartTime", Some (date_time_to_yojson x.start_time));
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_rotation_shifts_result_to_yojson (x : list_rotation_shifts_result) =
  assoc_to_yojson
    [
      ("RotationShifts", option_to_yojson rotation_shifts_to_yojson x.rotation_shifts);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rotation_shifts_request_to_yojson (x : list_rotation_shifts_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("EndTime", Some (date_time_to_yojson x.end_time));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let rotation_to_yojson (x : rotation) =
  assoc_to_yojson
    [
      ("RotationArn", Some (ssm_contacts_arn_to_yojson x.rotation_arn));
      ("Name", Some (rotation_name_to_yojson x.name));
      ("ContactIds", option_to_yojson ssm_contacts_arn_list_to_yojson x.contact_ids);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TimeZoneId", option_to_yojson time_zone_id_to_yojson x.time_zone_id);
      ("Recurrence", option_to_yojson recurrence_settings_to_yojson x.recurrence);
    ]

let rotations_to_yojson tree = list_to_yojson rotation_to_yojson tree

let list_rotations_result_to_yojson (x : list_rotations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Rotations", Some (rotations_to_yojson x.rotations));
    ]

let list_rotations_request_to_yojson (x : list_rotations_request) =
  assoc_to_yojson
    [
      ("RotationNamePrefix", option_to_yojson rotation_name_to_yojson x.rotation_name_prefix);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_result_to_yojson (x : list_tags_for_resource_result) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n)) ]

let put_contact_policy_result_to_yojson = unit_to_yojson

let put_contact_policy_request_to_yojson (x : put_contact_policy_request) =
  assoc_to_yojson
    [
      ("ContactArn", Some (ssm_contacts_arn_to_yojson x.contact_arn));
      ("Policy", Some (policy_to_yojson x.policy));
    ]

let update_rotation_result_to_yojson = unit_to_yojson

let update_rotation_request_to_yojson (x : update_rotation_request) =
  assoc_to_yojson
    [
      ("RotationId", Some (ssm_contacts_arn_to_yojson x.rotation_id));
      ("ContactIds", option_to_yojson rotation_contacts_arn_list_to_yojson x.contact_ids);
      ("StartTime", option_to_yojson date_time_to_yojson x.start_time);
      ("TimeZoneId", option_to_yojson time_zone_id_to_yojson x.time_zone_id);
      ("Recurrence", Some (recurrence_settings_to_yojson x.recurrence));
    ]

let update_contact_channel_result_to_yojson = unit_to_yojson

let update_contact_channel_request_to_yojson (x : update_contact_channel_request) =
  assoc_to_yojson
    [
      ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id));
      ("Name", option_to_yojson channel_name_to_yojson x.name);
      ("DeliveryAddress", option_to_yojson contact_channel_address_to_yojson x.delivery_address);
    ]

let update_contact_result_to_yojson = unit_to_yojson

let update_contact_request_to_yojson (x : update_contact_request) =
  assoc_to_yojson
    [
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
      ("DisplayName", option_to_yojson contact_name_to_yojson x.display_name);
      ("Plan", option_to_yojson plan_to_yojson x.plan);
    ]

let untag_resource_result_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_result_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (amazon_resource_name_to_yojson x.resource_ar_n));
      ("Tags", Some (tags_list_to_yojson x.tags));
    ]

let stop_engagement_result_to_yojson = unit_to_yojson
let stop_reason_to_yojson = string_to_yojson

let stop_engagement_request_to_yojson (x : stop_engagement_request) =
  assoc_to_yojson
    [
      ("EngagementId", Some (ssm_contacts_arn_to_yojson x.engagement_id));
      ("Reason", option_to_yojson stop_reason_to_yojson x.reason);
    ]

let start_engagement_result_to_yojson (x : start_engagement_result) =
  assoc_to_yojson [ ("EngagementArn", Some (ssm_contacts_arn_to_yojson x.engagement_arn)) ]

let start_engagement_request_to_yojson (x : start_engagement_request) =
  assoc_to_yojson
    [
      ("ContactId", Some (ssm_contacts_arn_to_yojson x.contact_id));
      ("Sender", Some (sender_to_yojson x.sender));
      ("Subject", Some (subject_to_yojson x.subject));
      ("Content", Some (content_to_yojson x.content));
      ("PublicSubject", option_to_yojson public_subject_to_yojson x.public_subject);
      ("PublicContent", option_to_yojson public_content_to_yojson x.public_content);
      ("IncidentId", option_to_yojson incident_id_to_yojson x.incident_id);
      ( "IdempotencyToken",
        Some
          (idempotency_token_to_yojson
             (Option.value x.idempotency_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let send_activation_code_result_to_yojson = unit_to_yojson

let send_activation_code_request_to_yojson (x : send_activation_code_request) =
  assoc_to_yojson [ ("ContactChannelId", Some (ssm_contacts_arn_to_yojson x.contact_channel_id)) ]
