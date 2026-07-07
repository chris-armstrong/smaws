open Smaws_Lib.Json.DeserializeHelpers
open Types

let day_of_week_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUN" -> SUN
    | `String "SAT" -> SAT
    | `String "FRI" -> FRI
    | `String "THU" -> THU
    | `String "WED" -> WED
    | `String "TUE" -> TUE
    | `String "MON" -> MON
    | `String value -> raise (deserialize_unknown_enum_value_error path "DayOfWeek" value)
    | _ -> raise (deserialize_wrong_type_error path "DayOfWeek")
     : day_of_week)
    : day_of_week)

let hour_of_day_of_yojson = int_of_yojson
let minute_of_hour_of_yojson = int_of_yojson

let hand_off_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minute_of_hour = value_for_key minute_of_hour_of_yojson "MinuteOfHour" _list path;
     hour_of_day = value_for_key hour_of_day_of_yojson "HourOfDay" _list path;
   }
    : hand_off_time)

let weekly_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hand_off_time = value_for_key hand_off_time_of_yojson "HandOffTime" _list path;
     day_of_week = value_for_key day_of_week_of_yojson "DayOfWeek" _list path;
   }
    : weekly_setting)

let weekly_settings_of_yojson tree path = list_of_yojson weekly_setting_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "FIELD_VALIDATION_FAILED" -> FIELD_VALIDATION_FAILED
    | `String "CANNOT_PARSE" -> CANNOT_PARSE
    | `String "UNKNOWN_OPERATION" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let string__of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key string__of_yojson "Message" _list path;
     name = value_for_key string__of_yojson "Name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "Fields")
         _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "Reason") _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : validation_exception)

let uuid_of_yojson = string_of_yojson

let update_rotation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let ssm_contacts_arn_of_yojson = string_of_yojson

let rotation_contacts_arn_list_of_yojson tree path =
  list_of_yojson ssm_contacts_arn_of_yojson tree path

let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let time_zone_id_of_yojson = string_of_yojson
let day_of_month_of_yojson = int_of_yojson

let monthly_setting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hand_off_time = value_for_key hand_off_time_of_yojson "HandOffTime" _list path;
     day_of_month = value_for_key day_of_month_of_yojson "DayOfMonth" _list path;
   }
    : monthly_setting)

let monthly_settings_of_yojson tree path = list_of_yojson monthly_setting_of_yojson tree path
let daily_settings_of_yojson tree path = list_of_yojson hand_off_time_of_yojson tree path
let number_of_on_calls_of_yojson = int_of_yojson

let coverage_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_ = option_of_yojson (value_for_key hand_off_time_of_yojson "End") _list path;
     start = option_of_yojson (value_for_key hand_off_time_of_yojson "Start") _list path;
   }
    : coverage_time)

let coverage_times_of_yojson tree path = list_of_yojson coverage_time_of_yojson tree path

let shift_coverages_map_of_yojson tree path =
  map_of_yojson day_of_week_of_yojson coverage_times_of_yojson tree path

let recurrence_multiplier_of_yojson = int_of_yojson

let recurrence_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurrence_multiplier =
       value_for_key recurrence_multiplier_of_yojson "RecurrenceMultiplier" _list path;
     shift_coverages =
       option_of_yojson (value_for_key shift_coverages_map_of_yojson "ShiftCoverages") _list path;
     number_of_on_calls = value_for_key number_of_on_calls_of_yojson "NumberOfOnCalls" _list path;
     daily_settings =
       option_of_yojson (value_for_key daily_settings_of_yojson "DailySettings") _list path;
     weekly_settings =
       option_of_yojson (value_for_key weekly_settings_of_yojson "WeeklySettings") _list path;
     monthly_settings =
       option_of_yojson (value_for_key monthly_settings_of_yojson "MonthlySettings") _list path;
   }
    : recurrence_settings)

let update_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurrence = value_for_key recurrence_settings_of_yojson "Recurrence" _list path;
     time_zone_id = option_of_yojson (value_for_key time_zone_id_of_yojson "TimeZoneId") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     contact_ids =
       option_of_yojson (value_for_key rotation_contacts_arn_list_of_yojson "ContactIds") _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : update_rotation_request)

let retry_after_seconds_of_yojson = int_of_yojson

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
     service_code = option_of_yojson (value_for_key string__of_yojson "ServiceCode") _list path;
     quota_code = option_of_yojson (value_for_key string__of_yojson "QuotaCode") _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key string__of_yojson "ResourceType" _list path;
     resource_id = value_for_key string__of_yojson "ResourceId" _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson (value_for_key retry_after_seconds_of_yojson "RetryAfterSeconds") _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : internal_server_exception)

let ssm_contacts_arn_list_of_yojson tree path = list_of_yojson ssm_contacts_arn_of_yojson tree path

let dependent_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dependent_resource_ids =
       value_for_key ssm_contacts_arn_list_of_yojson "DependentResourceIds" _list path;
     relation_type = value_for_key string__of_yojson "RelationType" _list path;
   }
    : dependent_entity)

let dependent_entity_list_of_yojson tree path = list_of_yojson dependent_entity_of_yojson tree path

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dependent_entities =
       option_of_yojson
         (value_for_key dependent_entity_list_of_yojson "DependentEntities")
         _list path;
     resource_type = value_for_key string__of_yojson "ResourceType" _list path;
     resource_id = value_for_key string__of_yojson "ResourceId" _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : conflict_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "Message" _list path } : access_denied_exception)

let update_contact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let contact_name_of_yojson = string_of_yojson
let stage_duration_in_mins_of_yojson = int_of_yojson
let retry_interval_in_minutes_of_yojson = int_of_yojson

let channel_target_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_interval_in_minutes =
       option_of_yojson
         (value_for_key retry_interval_in_minutes_of_yojson "RetryIntervalInMinutes")
         _list path;
     contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path;
   }
    : channel_target_info)

let is_essential_of_yojson = bool_of_yojson

let contact_target_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_essential = value_for_key is_essential_of_yojson "IsEssential" _list path;
     contact_id = option_of_yojson (value_for_key ssm_contacts_arn_of_yojson "ContactId") _list path;
   }
    : contact_target_info)

let target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact_target_info =
       option_of_yojson (value_for_key contact_target_info_of_yojson "ContactTargetInfo") _list path;
     channel_target_info =
       option_of_yojson (value_for_key channel_target_info_of_yojson "ChannelTargetInfo") _list path;
   }
    : target)

let targets_list_of_yojson tree path = list_of_yojson target_of_yojson tree path

let stage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     targets = value_for_key targets_list_of_yojson "Targets" _list path;
     duration_in_minutes =
       value_for_key stage_duration_in_mins_of_yojson "DurationInMinutes" _list path;
   }
    : stage)

let stages_list_of_yojson tree path = list_of_yojson stage_of_yojson tree path

let plan_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotation_ids =
       option_of_yojson (value_for_key ssm_contacts_arn_list_of_yojson "RotationIds") _list path;
     stages = option_of_yojson (value_for_key stages_list_of_yojson "Stages") _list path;
   }
    : plan)

let update_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan = option_of_yojson (value_for_key plan_of_yojson "Plan") _list path;
     display_name = option_of_yojson (value_for_key contact_name_of_yojson "DisplayName") _list path;
     contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path;
   }
    : update_contact_request)

let update_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let channel_name_of_yojson = string_of_yojson
let simple_address_of_yojson = string_of_yojson

let contact_channel_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     simple_address =
       option_of_yojson (value_for_key simple_address_of_yojson "SimpleAddress") _list path;
   }
    : contact_channel_address)

let update_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_address =
       option_of_yojson
         (value_for_key contact_channel_address_of_yojson "DeliveryAddress")
         _list path;
     name = option_of_yojson (value_for_key channel_name_of_yojson "Name") _list path;
     contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path;
   }
    : update_contact_channel_request)

let data_encryption_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key string__of_yojson "Message" _list path } : data_encryption_exception)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_code = value_for_key string__of_yojson "ServiceCode" _list path;
     quota_code = value_for_key string__of_yojson "QuotaCode" _list path;
     resource_type = option_of_yojson (value_for_key string__of_yojson "ResourceType") _list path;
     resource_id = option_of_yojson (value_for_key string__of_yojson "ResourceId") _list path;
     message = value_for_key string__of_yojson "Message" _list path;
   }
    : service_quota_exceeded_exception)

let untag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let amazon_resource_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : untag_resource_request)

let time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
   }
    : time_range)

let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tags_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_list_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path;
   }
    : tag_resource_request)

let subject_of_yojson = string_of_yojson
let stop_reason_of_yojson = string_of_yojson

let stop_engagement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let stop_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reason = option_of_yojson (value_for_key stop_reason_of_yojson "Reason") _list path;
     engagement_id = value_for_key ssm_contacts_arn_of_yojson "EngagementId" _list path;
   }
    : stop_engagement_request)

let start_engagement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ engagement_arn = value_for_key ssm_contacts_arn_of_yojson "EngagementArn" _list path }
    : start_engagement_result)

let sender_of_yojson = string_of_yojson
let content_of_yojson = string_of_yojson
let public_subject_of_yojson = string_of_yojson
let public_content_of_yojson = string_of_yojson
let incident_id_of_yojson = string_of_yojson
let idempotency_token_of_yojson = string_of_yojson

let start_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     public_content =
       option_of_yojson (value_for_key public_content_of_yojson "PublicContent") _list path;
     public_subject =
       option_of_yojson (value_for_key public_subject_of_yojson "PublicSubject") _list path;
     content = value_for_key content_of_yojson "Content" _list path;
     subject = value_for_key subject_of_yojson "Subject" _list path;
     sender = value_for_key sender_of_yojson "Sender" _list path;
     contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path;
   }
    : start_engagement_request)

let stage_index_of_yojson = int_of_yojson

let shift_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERRIDDEN" -> OVERRIDDEN
    | `String "REGULAR" -> REGULAR
    | `String value -> raise (deserialize_unknown_enum_value_error path "ShiftType" value)
    | _ -> raise (deserialize_wrong_type_error path "ShiftType")
     : shift_type)
    : shift_type)

let shift_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overridden_contact_ids =
       value_for_key ssm_contacts_arn_list_of_yojson "OverriddenContactIds" _list path;
   }
    : shift_details)

let send_activation_code_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let send_activation_code_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path }
    : send_activation_code_request)

let put_contact_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let policy_of_yojson = string_of_yojson

let put_contact_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = value_for_key policy_of_yojson "Policy" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : put_contact_policy_request)

let list_tags_for_resource_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_result)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_ar_n = value_for_key amazon_resource_name_of_yojson "ResourceARN" _list path }
    : list_tags_for_resource_request)

let rotation_shift_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     shift_details =
       option_of_yojson (value_for_key shift_details_of_yojson "ShiftDetails") _list path;
     type_ = option_of_yojson (value_for_key shift_type_of_yojson "Type") _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     contact_ids =
       option_of_yojson (value_for_key ssm_contacts_arn_list_of_yojson "ContactIds") _list path;
   }
    : rotation_shift)

let rotation_shifts_of_yojson tree path = list_of_yojson rotation_shift_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let list_rotation_shifts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rotation_shifts =
       option_of_yojson (value_for_key rotation_shifts_of_yojson "RotationShifts") _list path;
   }
    : list_rotation_shifts_result)

let max_results_of_yojson = int_of_yojson

let list_rotation_shifts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : list_rotation_shifts_request)

let rotation_name_of_yojson = string_of_yojson

let rotation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurrence =
       option_of_yojson (value_for_key recurrence_settings_of_yojson "Recurrence") _list path;
     time_zone_id = option_of_yojson (value_for_key time_zone_id_of_yojson "TimeZoneId") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     contact_ids =
       option_of_yojson (value_for_key ssm_contacts_arn_list_of_yojson "ContactIds") _list path;
     name = value_for_key rotation_name_of_yojson "Name" _list path;
     rotation_arn = value_for_key ssm_contacts_arn_of_yojson "RotationArn" _list path;
   }
    : rotation)

let rotations_of_yojson tree path = list_of_yojson rotation_of_yojson tree path

let list_rotations_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotations = value_for_key rotations_of_yojson "Rotations" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_rotations_result)

let list_rotations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rotation_name_prefix =
       option_of_yojson (value_for_key rotation_name_of_yojson "RotationNamePrefix") _list path;
   }
    : list_rotations_request)

let rotation_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_time = value_for_key date_time_of_yojson "CreateTime" _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     new_contact_ids = value_for_key ssm_contacts_arn_list_of_yojson "NewContactIds" _list path;
     rotation_override_id = value_for_key uuid_of_yojson "RotationOverrideId" _list path;
   }
    : rotation_override)

let rotation_overrides_of_yojson tree path = list_of_yojson rotation_override_of_yojson tree path

let list_rotation_overrides_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rotation_overrides =
       option_of_yojson (value_for_key rotation_overrides_of_yojson "RotationOverrides") _list path;
   }
    : list_rotation_overrides_result)

let list_rotation_overrides_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : list_rotation_overrides_request)

let list_preview_rotation_shifts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     rotation_shifts =
       option_of_yojson (value_for_key rotation_shifts_of_yojson "RotationShifts") _list path;
   }
    : list_preview_rotation_shifts_result)

let member_of_yojson = string_of_yojson
let rotation_preview_member_list_of_yojson tree path = list_of_yojson member_of_yojson tree path

let rotation_override_preview_member_list_of_yojson tree path =
  list_of_yojson member_of_yojson tree path

let preview_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     new_members =
       option_of_yojson
         (value_for_key rotation_override_preview_member_list_of_yojson "NewMembers")
         _list path;
   }
    : preview_override)

let override_list_of_yojson tree path = list_of_yojson preview_override_of_yojson tree path

let list_preview_rotation_shifts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     overrides = option_of_yojson (value_for_key override_list_of_yojson "Overrides") _list path;
     recurrence = value_for_key recurrence_settings_of_yojson "Recurrence" _list path;
     time_zone_id = value_for_key time_zone_id_of_yojson "TimeZoneId" _list path;
     members = value_for_key rotation_preview_member_list_of_yojson "Members" _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     rotation_start_time =
       option_of_yojson (value_for_key date_time_of_yojson "RotationStartTime") _list path;
   }
    : list_preview_rotation_shifts_request)

let page_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     read_time = option_of_yojson (value_for_key date_time_of_yojson "ReadTime") _list path;
     delivery_time = option_of_yojson (value_for_key date_time_of_yojson "DeliveryTime") _list path;
     sent_time = option_of_yojson (value_for_key date_time_of_yojson "SentTime") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     sender = value_for_key sender_of_yojson "Sender" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
     engagement_arn = value_for_key ssm_contacts_arn_of_yojson "EngagementArn" _list path;
     page_arn = value_for_key ssm_contacts_arn_of_yojson "PageArn" _list path;
   }
    : page)

let pages_list_of_yojson tree path = list_of_yojson page_of_yojson tree path

let list_pages_by_engagement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pages = value_for_key pages_list_of_yojson "Pages" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_pages_by_engagement_result)

let list_pages_by_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     engagement_id = value_for_key ssm_contacts_arn_of_yojson "EngagementId" _list path;
   }
    : list_pages_by_engagement_request)

let list_pages_by_contact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pages = value_for_key pages_list_of_yojson "Pages" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_pages_by_contact_result)

let list_pages_by_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path;
   }
    : list_pages_by_contact_request)

let contact_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONCALL_SCHEDULE" -> ONCALL_SCHEDULE
    | `String "ESCALATION" -> ESCALATION
    | `String "PERSONAL" -> PERSONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "ContactType" value)
    | _ -> raise (deserialize_wrong_type_error path "ContactType")
     : contact_type)
    : contact_type)

let resolution_contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stage_index = option_of_yojson (value_for_key stage_index_of_yojson "StageIndex") _list path;
     type_ = value_for_key contact_type_of_yojson "Type" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : resolution_contact)

let resolution_list_of_yojson tree path = list_of_yojson resolution_contact_of_yojson tree path

let list_page_resolutions_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_resolutions = value_for_key resolution_list_of_yojson "PageResolutions" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_page_resolutions_result)

let list_page_resolutions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     page_id = value_for_key ssm_contacts_arn_of_yojson "PageId" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_page_resolutions_request)

let receipt_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STOP" -> STOP
    | `String "SENT" -> SENT
    | `String "READ" -> READ
    | `String "ERROR" -> ERROR
    | `String "DELIVERED" -> DELIVERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReceiptType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReceiptType")
     : receipt_type)
    : receipt_type)

let receipt_info_of_yojson = string_of_yojson

let receipt_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     receipt_time = value_for_key date_time_of_yojson "ReceiptTime" _list path;
     receipt_info = option_of_yojson (value_for_key receipt_info_of_yojson "ReceiptInfo") _list path;
     receipt_type = value_for_key receipt_type_of_yojson "ReceiptType" _list path;
     contact_channel_arn =
       option_of_yojson (value_for_key ssm_contacts_arn_of_yojson "ContactChannelArn") _list path;
   }
    : receipt)

let receipts_list_of_yojson tree path = list_of_yojson receipt_of_yojson tree path

let list_page_receipts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     receipts = option_of_yojson (value_for_key receipts_list_of_yojson "Receipts") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_page_receipts_result)

let list_page_receipts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     page_id = value_for_key ssm_contacts_arn_of_yojson "PageId" _list path;
   }
    : list_page_receipts_request)

let engagement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_time = option_of_yojson (value_for_key date_time_of_yojson "StopTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     sender = value_for_key sender_of_yojson "Sender" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
     engagement_arn = value_for_key ssm_contacts_arn_of_yojson "EngagementArn" _list path;
   }
    : engagement)

let engagements_list_of_yojson tree path = list_of_yojson engagement_of_yojson tree path

let list_engagements_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     engagements = value_for_key engagements_list_of_yojson "Engagements" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_engagements_result)

let list_engagements_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range_value =
       option_of_yojson (value_for_key time_range_of_yojson "TimeRangeValue") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_engagements_request)

let contact_alias_of_yojson = string_of_yojson

let contact_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key contact_type_of_yojson "Type" _list path;
     display_name = option_of_yojson (value_for_key contact_name_of_yojson "DisplayName") _list path;
     alias = value_for_key contact_alias_of_yojson "Alias" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : contact)

let contacts_list_of_yojson tree path = list_of_yojson contact_of_yojson tree path

let list_contacts_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contacts = option_of_yojson (value_for_key contacts_list_of_yojson "Contacts") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_contacts_result)

let list_contacts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = option_of_yojson (value_for_key contact_type_of_yojson "Type") _list path;
     alias_prefix =
       option_of_yojson (value_for_key contact_alias_of_yojson "AliasPrefix") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_contacts_request)

let channel_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMAIL" -> EMAIL
    | `String "VOICE" -> VOICE
    | `String "SMS" -> SMS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ChannelType" value)
    | _ -> raise (deserialize_wrong_type_error path "ChannelType")
     : channel_type)
    : channel_type)

let activation_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_ACTIVATED" -> NOT_ACTIVATED
    | `String "ACTIVATED" -> ACTIVATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActivationStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActivationStatus")
     : activation_status)
    : activation_status)

let contact_channel_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_status = value_for_key activation_status_of_yojson "ActivationStatus" _list path;
     delivery_address = value_for_key contact_channel_address_of_yojson "DeliveryAddress" _list path;
     type_ = option_of_yojson (value_for_key channel_type_of_yojson "Type") _list path;
     name = value_for_key channel_name_of_yojson "Name" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
     contact_channel_arn = value_for_key ssm_contacts_arn_of_yojson "ContactChannelArn" _list path;
   }
    : contact_channel)

let contact_channel_list_of_yojson tree path = list_of_yojson contact_channel_of_yojson tree path

let list_contact_channels_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contact_channels = value_for_key contact_channel_list_of_yojson "ContactChannels" _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
   }
    : list_contact_channels_result)

let list_contact_channels_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "NextToken") _list path;
     contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path;
   }
    : list_contact_channels_request)

let get_rotation_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     create_time = option_of_yojson (value_for_key date_time_of_yojson "CreateTime") _list path;
     end_time = option_of_yojson (value_for_key date_time_of_yojson "EndTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     new_contact_ids =
       option_of_yojson (value_for_key ssm_contacts_arn_list_of_yojson "NewContactIds") _list path;
     rotation_arn =
       option_of_yojson (value_for_key ssm_contacts_arn_of_yojson "RotationArn") _list path;
     rotation_override_id =
       option_of_yojson (value_for_key uuid_of_yojson "RotationOverrideId") _list path;
   }
    : get_rotation_override_result)

let get_rotation_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotation_override_id = value_for_key uuid_of_yojson "RotationOverrideId" _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : get_rotation_override_request)

let get_rotation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recurrence = value_for_key recurrence_settings_of_yojson "Recurrence" _list path;
     time_zone_id = value_for_key time_zone_id_of_yojson "TimeZoneId" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     contact_ids = value_for_key rotation_contacts_arn_list_of_yojson "ContactIds" _list path;
     name = value_for_key rotation_name_of_yojson "Name" _list path;
     rotation_arn = value_for_key ssm_contacts_arn_of_yojson "RotationArn" _list path;
   }
    : get_rotation_result)

let get_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path }
    : get_rotation_request)

let get_contact_policy_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key policy_of_yojson "Policy") _list path;
     contact_arn =
       option_of_yojson (value_for_key ssm_contacts_arn_of_yojson "ContactArn") _list path;
   }
    : get_contact_policy_result)

let get_contact_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path }
    : get_contact_policy_request)

let get_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_status =
       option_of_yojson (value_for_key activation_status_of_yojson "ActivationStatus") _list path;
     delivery_address = value_for_key contact_channel_address_of_yojson "DeliveryAddress" _list path;
     type_ = value_for_key channel_type_of_yojson "Type" _list path;
     name = value_for_key channel_name_of_yojson "Name" _list path;
     contact_channel_arn = value_for_key ssm_contacts_arn_of_yojson "ContactChannelArn" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : get_contact_channel_result)

let get_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path }
    : get_contact_channel_request)

let get_contact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     plan = value_for_key plan_of_yojson "Plan" _list path;
     type_ = value_for_key contact_type_of_yojson "Type" _list path;
     display_name = option_of_yojson (value_for_key contact_name_of_yojson "DisplayName") _list path;
     alias = value_for_key contact_alias_of_yojson "Alias" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : get_contact_result)

let get_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path }
    : get_contact_request)

let describe_page_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delivery_time = option_of_yojson (value_for_key date_time_of_yojson "DeliveryTime") _list path;
     read_time = option_of_yojson (value_for_key date_time_of_yojson "ReadTime") _list path;
     sent_time = option_of_yojson (value_for_key date_time_of_yojson "SentTime") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     public_content =
       option_of_yojson (value_for_key public_content_of_yojson "PublicContent") _list path;
     public_subject =
       option_of_yojson (value_for_key public_subject_of_yojson "PublicSubject") _list path;
     content = value_for_key content_of_yojson "Content" _list path;
     subject = value_for_key subject_of_yojson "Subject" _list path;
     sender = value_for_key sender_of_yojson "Sender" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
     engagement_arn = value_for_key ssm_contacts_arn_of_yojson "EngagementArn" _list path;
     page_arn = value_for_key ssm_contacts_arn_of_yojson "PageArn" _list path;
   }
    : describe_page_result)

let describe_page_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ page_id = value_for_key ssm_contacts_arn_of_yojson "PageId" _list path }
    : describe_page_request)

let describe_engagement_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_time = option_of_yojson (value_for_key date_time_of_yojson "StopTime") _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     incident_id = option_of_yojson (value_for_key incident_id_of_yojson "IncidentId") _list path;
     public_content =
       option_of_yojson (value_for_key public_content_of_yojson "PublicContent") _list path;
     public_subject =
       option_of_yojson (value_for_key public_subject_of_yojson "PublicSubject") _list path;
     content = value_for_key content_of_yojson "Content" _list path;
     subject = value_for_key subject_of_yojson "Subject" _list path;
     sender = value_for_key sender_of_yojson "Sender" _list path;
     engagement_arn = value_for_key ssm_contacts_arn_of_yojson "EngagementArn" _list path;
     contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path;
   }
    : describe_engagement_result)

let describe_engagement_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ engagement_id = value_for_key ssm_contacts_arn_of_yojson "EngagementId" _list path }
    : describe_engagement_request)

let delete_rotation_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rotation_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rotation_override_id = value_for_key uuid_of_yojson "RotationOverrideId" _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : delete_rotation_override_request)

let delete_rotation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path }
    : delete_rotation_request)

let delete_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path }
    : delete_contact_channel_request)

let delete_contact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path }
    : delete_contact_request)

let deactivate_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let deactivate_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path }
    : deactivate_contact_channel_request)

let create_rotation_override_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rotation_override_id = value_for_key uuid_of_yojson "RotationOverrideId" _list path }
    : create_rotation_override_result)

let rotation_override_contacts_arn_list_of_yojson tree path =
  list_of_yojson ssm_contacts_arn_of_yojson tree path

let create_rotation_override_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     end_time = value_for_key date_time_of_yojson "EndTime" _list path;
     start_time = value_for_key date_time_of_yojson "StartTime" _list path;
     new_contact_ids =
       value_for_key rotation_override_contacts_arn_list_of_yojson "NewContactIds" _list path;
     rotation_id = value_for_key ssm_contacts_arn_of_yojson "RotationId" _list path;
   }
    : create_rotation_override_request)

let create_rotation_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rotation_arn = value_for_key ssm_contacts_arn_of_yojson "RotationArn" _list path }
    : create_rotation_result)

let create_rotation_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
     recurrence = value_for_key recurrence_settings_of_yojson "Recurrence" _list path;
     time_zone_id = value_for_key time_zone_id_of_yojson "TimeZoneId" _list path;
     start_time = option_of_yojson (value_for_key date_time_of_yojson "StartTime") _list path;
     contact_ids = value_for_key rotation_contacts_arn_list_of_yojson "ContactIds" _list path;
     name = value_for_key rotation_name_of_yojson "Name" _list path;
   }
    : create_rotation_request)

let create_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_channel_arn = value_for_key ssm_contacts_arn_of_yojson "ContactChannelArn" _list path }
    : create_contact_channel_result)

let defer_activation_of_yojson = bool_of_yojson

let create_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     defer_activation =
       option_of_yojson (value_for_key defer_activation_of_yojson "DeferActivation") _list path;
     delivery_address = value_for_key contact_channel_address_of_yojson "DeliveryAddress" _list path;
     type_ = value_for_key channel_type_of_yojson "Type" _list path;
     name = value_for_key channel_name_of_yojson "Name" _list path;
     contact_id = value_for_key ssm_contacts_arn_of_yojson "ContactId" _list path;
   }
    : create_contact_channel_request)

let create_contact_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contact_arn = value_for_key ssm_contacts_arn_of_yojson "ContactArn" _list path }
    : create_contact_result)

let create_contact_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     idempotency_token =
       option_of_yojson (value_for_key idempotency_token_of_yojson "IdempotencyToken") _list path;
     tags = option_of_yojson (value_for_key tags_list_of_yojson "Tags") _list path;
     plan = value_for_key plan_of_yojson "Plan" _list path;
     type_ = value_for_key contact_type_of_yojson "Type" _list path;
     display_name = option_of_yojson (value_for_key contact_name_of_yojson "DisplayName") _list path;
     alias = value_for_key contact_alias_of_yojson "Alias" _list path;
   }
    : create_contact_request)

let activate_contact_channel_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let activation_code_of_yojson = string_of_yojson

let activate_contact_channel_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activation_code = value_for_key activation_code_of_yojson "ActivationCode" _list path;
     contact_channel_id = value_for_key ssm_contacts_arn_of_yojson "ContactChannelId" _list path;
   }
    : activate_contact_channel_request)

let accept_page_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let accept_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "READ" -> READ
    | `String "DELIVERED" -> DELIVERED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AcceptType" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptType")
     : accept_type)
    : accept_type)

let accept_code_of_yojson = string_of_yojson

let accept_code_validation_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENFORCE" -> ENFORCE
    | `String "IGNORE" -> IGNORE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AcceptCodeValidation" value)
    | _ -> raise (deserialize_wrong_type_error path "AcceptCodeValidation")
     : accept_code_validation)
    : accept_code_validation)

let accept_page_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accept_code_validation =
       option_of_yojson
         (value_for_key accept_code_validation_of_yojson "AcceptCodeValidation")
         _list path;
     accept_code = value_for_key accept_code_of_yojson "AcceptCode" _list path;
     note = option_of_yojson (value_for_key receipt_info_of_yojson "Note") _list path;
     accept_type = value_for_key accept_type_of_yojson "AcceptType" _list path;
     contact_channel_id =
       option_of_yojson (value_for_key ssm_contacts_arn_of_yojson "ContactChannelId") _list path;
     page_id = value_for_key ssm_contacts_arn_of_yojson "PageId" _list path;
   }
    : accept_page_request)
