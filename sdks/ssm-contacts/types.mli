type nonrec day_of_week =
  | SUN [@ocaml.doc ""]
  | SAT [@ocaml.doc ""]
  | FRI [@ocaml.doc ""]
  | THU [@ocaml.doc ""]
  | WED [@ocaml.doc ""]
  | TUE [@ocaml.doc ""]
  | MON [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec hour_of_day = int [@@ocaml.doc ""]

type nonrec minute_of_hour = int [@@ocaml.doc ""]

type nonrec hand_off_time = {
  minute_of_hour : minute_of_hour;
      [@ocaml.doc "The minute when an on-call rotation shift begins or ends.\n"]
  hour_of_day : hour_of_day; [@ocaml.doc "The hour when an on-call rotation shift begins or ends.\n"]
}
[@@ocaml.doc "Details about when an on-call rotation shift begins or ends.\n"]

type nonrec weekly_setting = {
  hand_off_time : hand_off_time;
      [@ocaml.doc "The time of day when a weekly recurring on-call shift rotation begins.\n"]
  day_of_week : day_of_week;
      [@ocaml.doc "The day of the week when weekly recurring on-call shift rotations begins.\n"]
}
[@@ocaml.doc "Information about rotations that recur weekly.\n"]

type nonrec weekly_settings = weekly_setting list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | OTHER [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | UNKNOWN_OPERATION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  message : string_; [@ocaml.doc "Information about what caused the field to cause an exception.\n"]
  name : string_; [@ocaml.doc "The name of the field that caused the exception.\n"]
}
[@@ocaml.doc "Provides information about which field caused the exception.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception = {
  fields : validation_exception_field_list option; [@ocaml.doc "The fields that caused the error"]
  reason : validation_exception_reason option; [@ocaml.doc "Reason the request failed validation"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The input fails to satisfy the constraints specified by an Amazon Web Services service.\n"]

type nonrec uuid = string [@@ocaml.doc ""]

type nonrec update_rotation_result = unit [@@ocaml.doc ""]

type nonrec ssm_contacts_arn = string [@@ocaml.doc ""]

type nonrec rotation_contacts_arn_list = ssm_contacts_arn list [@@ocaml.doc ""]

type nonrec date_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec time_zone_id = string [@@ocaml.doc ""]

type nonrec day_of_month = int [@@ocaml.doc ""]

type nonrec monthly_setting = {
  hand_off_time : hand_off_time;
      [@ocaml.doc "The time of day when a monthly recurring on-call shift rotation begins.\n"]
  day_of_month : day_of_month;
      [@ocaml.doc "The day of the month when monthly recurring on-call rotations begin.\n"]
}
[@@ocaml.doc "Information about on-call rotations that recur monthly.\n"]

type nonrec monthly_settings = monthly_setting list [@@ocaml.doc ""]

type nonrec daily_settings = hand_off_time list [@@ocaml.doc ""]

type nonrec number_of_on_calls = int [@@ocaml.doc ""]

type nonrec coverage_time = {
  end_ : hand_off_time option;
      [@ocaml.doc "Information about when the on-call rotation shift ends.\n"]
  start : hand_off_time option;
      [@ocaml.doc "Information about when the on-call rotation shift begins.\n"]
}
[@@ocaml.doc "Information about when an on-call shift begins and ends.\n"]

type nonrec coverage_times = coverage_time list [@@ocaml.doc ""]

type nonrec shift_coverages_map = (day_of_week * coverage_times) list [@@ocaml.doc ""]

type nonrec recurrence_multiplier = int [@@ocaml.doc ""]

type nonrec recurrence_settings = {
  recurrence_multiplier : recurrence_multiplier;
      [@ocaml.doc "The number of days, weeks, or months a single rotation lasts.\n"]
  shift_coverages : shift_coverages_map option;
      [@ocaml.doc
        "Information about the days of the week that the on-call rotation coverage includes.\n"]
  number_of_on_calls : number_of_on_calls;
      [@ocaml.doc
        "The number of contacts, or shift team members designated to be on call concurrently \
         during a shift. For example, in an on-call schedule that contains ten contacts, a value \
         of [2] designates that two of them are on call at any given time.\n"]
  daily_settings : daily_settings option;
      [@ocaml.doc "Information about on-call rotations that recur daily.\n"]
  weekly_settings : weekly_settings option;
      [@ocaml.doc "Information about on-call rotations that recur weekly.\n"]
  monthly_settings : monthly_settings option;
      [@ocaml.doc "Information about on-call rotations that recur monthly.\n"]
}
[@@ocaml.doc
  "Information about when an on-call rotation is in effect and how long the rotation period lasts.\n"]

type nonrec update_rotation_request = {
  recurrence : recurrence_settings;
      [@ocaml.doc
        "Information about how long the updated rotation lasts before restarting at the beginning \
         of the shift order.\n"]
  time_zone_id : time_zone_id option;
      [@ocaml.doc
        "The time zone to base the updated rotation\226\128\153s activity on, in Internet Assigned \
         Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \
         \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time \
         Zone Database} on the IANA website.\n\n\
        \  Designators for time zones that don\226\128\153t support Daylight Savings Time Rules, \
         such as Pacific Standard Time (PST), aren't supported.\n\
        \  \n\
        \   "]
  start_time : date_time option; [@ocaml.doc "The date and time the rotation goes into effect.\n"]
  contact_ids : rotation_contacts_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts to include in the updated rotation. \n\n\
        \  Only the [PERSONAL] contact type is supported. The contact types [ESCALATION] and \
         [ONCALL_SCHEDULE] are not supported for this operation. \n\
        \  \n\
        \    The order in which you list the contacts is their shift order in the rotation schedule.\n\
        \    "]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rotation to update.\n"]
}
[@@ocaml.doc ""]

type nonrec retry_after_seconds = int [@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : retry_after_seconds option;
      [@ocaml.doc "Advice to clients on when the call can be safely retried"]
  service_code : string_ option;
      [@ocaml.doc "Service Quotas requirement to identify originating quota"]
  quota_code : string_ option;
      [@ocaml.doc "Service Quotas requirement to identify originating service"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = {
  resource_type : string_; [@ocaml.doc "Hypothetical resource type that was not found"]
  resource_id : string_; [@ocaml.doc "Hypothetical resource identifier that was not found"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc "Request references a resource that doesn't exist.\n"]

type nonrec internal_server_exception = {
  retry_after_seconds : retry_after_seconds option;
      [@ocaml.doc "Advice to clients on when the call can be safely retried"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc "Unexpected error occurred while processing the request.\n"]

type nonrec ssm_contacts_arn_list = ssm_contacts_arn list [@@ocaml.doc ""]

type nonrec dependent_entity = {
  dependent_resource_ids : ssm_contacts_arn_list;
      [@ocaml.doc "The Amazon Resource Names (ARNs) of the dependent resources.\n"]
  relation_type : string_;
      [@ocaml.doc
        "The type of relationship between one resource and the other resource that it is related \
         to or depends on.\n"]
}
[@@ocaml.doc
  "Information about a resource that another resource is related to or depends on.\n\n\
  \ For example, if a contact is a member of a rotation, the rotation is a dependent entity of the \
   contact.\n\
  \ "]

type nonrec dependent_entity_list = dependent_entity list [@@ocaml.doc ""]

type nonrec conflict_exception = {
  dependent_entities : dependent_entity_list option;
      [@ocaml.doc
        "List of dependent entities containing information on relation type and resourceArns \
         linked to the resource in use"]
  resource_type : string_; [@ocaml.doc "Type of the resource in use"]
  resource_id : string_; [@ocaml.doc "Identifier of the resource in use"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc "Updating or deleting a resource causes an inconsistent state.\n"]

type nonrec access_denied_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "You don't have sufficient access to perform this operation.\n"]

type nonrec update_contact_result = unit [@@ocaml.doc ""]

type nonrec contact_name = string [@@ocaml.doc ""]

type nonrec stage_duration_in_mins = int [@@ocaml.doc ""]

type nonrec retry_interval_in_minutes = int [@@ocaml.doc ""]

type nonrec channel_target_info = {
  retry_interval_in_minutes : retry_interval_in_minutes option;
      [@ocaml.doc
        "The number of minutes to wait before retrying to send engagement if the engagement \
         initially failed.\n"]
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc
  "Information about the contact channel that Incident Manager uses to engage the contact.\n"]

type nonrec is_essential = bool [@@ocaml.doc ""]

type nonrec contact_target_info = {
  is_essential : is_essential;
      [@ocaml.doc
        "A Boolean value determining if the contact's acknowledgement stops the progress of stages \
         in the plan.\n"]
  contact_id : ssm_contacts_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact.\n"]
}
[@@ocaml.doc "The contact that Incident Manager is engaging during an incident.\n"]

type nonrec target = {
  contact_target_info : contact_target_info option;
      [@ocaml.doc "Information about the contact that Incident Manager engages.\n"]
  channel_target_info : channel_target_info option;
      [@ocaml.doc "Information about the contact channel that Incident Manager engages.\n"]
}
[@@ocaml.doc "The contact or contact channel that's being engaged.\n"]

type nonrec targets_list = target list [@@ocaml.doc ""]

type nonrec stage = {
  targets : targets_list;
      [@ocaml.doc
        "The contacts or contact methods that the escalation plan or engagement plan is engaging.\n"]
  duration_in_minutes : stage_duration_in_mins;
      [@ocaml.doc
        "The time to wait until beginning the next stage. The duration can only be set to 0 if a \
         target is specified.\n"]
}
[@@ocaml.doc
  "A set amount of time that an escalation plan or engagement plan engages the specified contacts \
   or contact methods.\n"]

type nonrec stages_list = stage list [@@ocaml.doc ""]

type nonrec plan = {
  rotation_ids : ssm_contacts_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the on-call rotations associated with the plan. \n"]
  stages : stages_list option;
      [@ocaml.doc
        "A list of stages that the escalation plan or engagement plan uses to engage contacts and \
         contact methods.\n"]
}
[@@ocaml.doc
  "Information about the stages and on-call rotation teams associated with an escalation plan or \
   engagement plan. \n"]

type nonrec update_contact_request = {
  plan : plan option;
      [@ocaml.doc
        "A list of stages. A contact has an engagement plan with stages for specified contact \
         channels. An escalation plan uses these stages to contact specified contacts.\n"]
  display_name : contact_name option;
      [@ocaml.doc "The full name of the contact or escalation plan.\n"]
  contact_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact or escalation plan you're updating.\n"]
}
[@@ocaml.doc ""]

type nonrec update_contact_channel_result = unit [@@ocaml.doc ""]

type nonrec channel_name = string [@@ocaml.doc ""]

type nonrec simple_address = string [@@ocaml.doc ""]

type nonrec contact_channel_address = {
  simple_address : simple_address option;
      [@ocaml.doc
        "The format is dependent on the type of the contact channel. The following are the \
         expected formats:\n\n\
        \ {ul\n\
        \       {-  SMS - '+' followed by the country code and phone number\n\
        \           \n\
        \            }\n\
        \       {-  VOICE - '+' followed by the country code and phone number\n\
        \           \n\
        \            }\n\
        \       {-  EMAIL - any standard email format\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "The details that Incident Manager uses when trying to engage the contact channel.\n"]

type nonrec update_contact_channel_request = {
  delivery_address : contact_channel_address option;
      [@ocaml.doc
        "The details that Incident Manager uses when trying to engage the contact channel.\n"]
  name : channel_name option; [@ocaml.doc "The name of the contact channel.\n"]
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel you want to update.\n"]
}
[@@ocaml.doc ""]

type nonrec data_encryption_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "The operation failed to due an encryption key error.\n"]

type nonrec service_quota_exceeded_exception = {
  service_code : string_; [@ocaml.doc "Service Quotas requirement to identify originating quota"]
  quota_code : string_; [@ocaml.doc "Service Quotas requirement to identify originating service"]
  resource_type : string_ option; [@ocaml.doc "Type of the resource affected"]
  resource_id : string_ option; [@ocaml.doc "Identifier of the resource affected"]
  message : string_; [@ocaml.doc ""]
}
[@@ocaml.doc "Request would cause a service quota to be exceeded.\n"]

type nonrec untag_resource_result = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list; [@ocaml.doc "The key of the tag that you want to remove.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec time_range = {
  end_time : date_time option; [@ocaml.doc "The end of the time range.\n"]
  start_time : date_time option; [@ocaml.doc "The start of the time range.\n"]
}
[@@ocaml.doc "A range of between two set times\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option; [@ocaml.doc "Value of the tag.\n"]
  key : tag_key option; [@ocaml.doc "Name of the object key.\n"]
}
[@@ocaml.doc "A container of a key-value name pair.\n"]

type nonrec tags_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_result = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tags_list;
      [@ocaml.doc "A list of tags that you are adding to the contact or escalation plan.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec subject = string [@@ocaml.doc ""]

type nonrec stop_reason = string [@@ocaml.doc ""]

type nonrec stop_engagement_result = unit [@@ocaml.doc ""]

type nonrec stop_engagement_request = {
  reason : stop_reason option; [@ocaml.doc "The reason that you're stopping the engagement.\n"]
  engagement_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec start_engagement_result = {
  engagement_arn : ssm_contacts_arn; [@ocaml.doc "The ARN of the engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec sender = string [@@ocaml.doc ""]

type nonrec content = string [@@ocaml.doc ""]

type nonrec public_subject = string [@@ocaml.doc ""]

type nonrec public_content = string [@@ocaml.doc ""]

type nonrec incident_id = string [@@ocaml.doc ""]

type nonrec idempotency_token = string [@@ocaml.doc ""]

type nonrec start_engagement_request = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A token ensuring that the operation is called only once with the specified details.\n"]
  incident_id : incident_id option;
      [@ocaml.doc "The ARN of the incident that the engagement is part of.\n"]
  public_content : public_content option;
      [@ocaml.doc
        "The insecure content of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  public_subject : public_subject option;
      [@ocaml.doc
        "The insecure subject of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  content : content;
      [@ocaml.doc
        "The secure content of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] or [EMAIL].\n"]
  subject : subject;
      [@ocaml.doc
        "The secure subject of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] or [EMAIL].\n"]
  sender : sender; [@ocaml.doc "The user that started the engagement.\n"]
  contact_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact being engaged.\n"]
}
[@@ocaml.doc ""]

type nonrec stage_index = int [@@ocaml.doc ""]

type nonrec shift_type = OVERRIDDEN [@ocaml.doc ""] | REGULAR [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec shift_details = {
  overridden_contact_ids : ssm_contacts_arn_list;
      [@ocaml.doc
        "The Amazon Resources Names (ARNs) of the contacts who were replaced in a shift when an \
         override was created. If the override is deleted, these contacts are restored to the \
         shift.\n"]
}
[@@ocaml.doc "Information about overrides to an on-call rotation shift.\n"]

type nonrec send_activation_code_result = unit [@@ocaml.doc ""]

type nonrec send_activation_code_request = {
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec put_contact_policy_result = unit [@@ocaml.doc ""]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec put_contact_policy_request = {
  policy : policy; [@ocaml.doc "Details of the resource policy.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_result = {
  tags : tags_list option; [@ocaml.doc "The tags related to the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact, escalation plan, rotation, or on-call \
         schedule.\n"]
}
[@@ocaml.doc ""]

type nonrec rotation_shift = {
  shift_details : shift_details option;
      [@ocaml.doc "Additional information about an on-call rotation shift.\n"]
  type_ : shift_type option; [@ocaml.doc "The type of shift rotation.\n"]
  end_time : date_time; [@ocaml.doc "The time a shift rotation ends.\n"]
  start_time : date_time; [@ocaml.doc "The time a shift rotation begins.\n"]
  contact_ids : ssm_contacts_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts who are part of the shift rotation. \n"]
}
[@@ocaml.doc "Information about a shift that belongs to an on-call rotation.\n"]

type nonrec rotation_shifts = rotation_shift list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_rotation_shifts_result = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. Use this token to get the next set of \
         results.\n"]
  rotation_shifts : rotation_shifts option;
      [@ocaml.doc "Information about shifts that meet the filter criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_rotation_shifts_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         you can specify in a subsequent call to get the next set of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token to start the list. Use this token to get the next set of results.\n"]
  end_time : date_time;
      [@ocaml.doc "The date and time for the end of the time range to list shifts for.\n"]
  start_time : date_time option;
      [@ocaml.doc "The date and time for the beginning of the time range to list shifts for.\n"]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the rotation to retrieve shift information about. \n"]
}
[@@ocaml.doc ""]

type nonrec rotation_name = string [@@ocaml.doc ""]

type nonrec rotation = {
  recurrence : recurrence_settings option;
      [@ocaml.doc
        "Information about when an on-call rotation is in effect and how long the rotation period \
         lasts.\n"]
  time_zone_id : time_zone_id option;
      [@ocaml.doc
        "The time zone the rotation\226\128\153s activity is based on, in Internet Assigned \
         Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \
         \"Asia/Seoul\". \n"]
  start_time : date_time option; [@ocaml.doc "The date and time the rotation becomes active.\n"]
  contact_ids : ssm_contacts_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts assigned to the rotation team.\n"]
  name : rotation_name; [@ocaml.doc "The name of the rotation.\n"]
  rotation_arn : ssm_contacts_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the rotation.\n"]
}
[@@ocaml.doc "Information about a rotation in an on-call schedule.\n"]

type nonrec rotations = rotation list [@@ocaml.doc ""]

type nonrec list_rotations_result = {
  rotations : rotations; [@ocaml.doc "Information about rotations that meet the filter criteria.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. Use this token to get the next set of \
         results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rotations_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         you can specify in a subsequent call to get the next set of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token to start the list. Use this token to get the next set of results.\n"]
  rotation_name_prefix : rotation_name option;
      [@ocaml.doc
        "A filter to include rotations in list results based on their common prefix. For example, \
         entering prod returns a list of all rotation names that begin with [prod], such as \
         [production] and [prod-1].\n"]
}
[@@ocaml.doc ""]

type nonrec rotation_override = {
  create_time : date_time; [@ocaml.doc "The time a rotation override was created.\n"]
  end_time : date_time; [@ocaml.doc "The time a rotation override ends.\n"]
  start_time : date_time; [@ocaml.doc "The time a rotation override begins.\n"]
  new_contact_ids : ssm_contacts_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts assigned to the override of the on-call \
         rotation.\n"]
  rotation_override_id : uuid;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the override to an on-call rotation.\n"]
}
[@@ocaml.doc "Information about an override specified for an on-call rotation.\n"]

type nonrec rotation_overrides = rotation_override list [@@ocaml.doc ""]

type nonrec list_rotation_overrides_result = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. Use this token to get the next set of \
         results.\n"]
  rotation_overrides : rotation_overrides option;
      [@ocaml.doc "A list of rotation overrides in the specified time range.\n"]
}
[@@ocaml.doc ""]

type nonrec list_rotation_overrides_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         you can specify in a subsequent call to get the next set of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token to start the list. Use this token to get the next set of results.\n"]
  end_time : date_time;
      [@ocaml.doc "The date and time for the end of a time range for listing overrides.\n"]
  start_time : date_time;
      [@ocaml.doc "The date and time for the beginning of a time range for listing overrides.\n"]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rotation to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec list_preview_rotation_shifts_result = {
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. This token is used to get the next set of \
         results.\n"]
  rotation_shifts : rotation_shifts option;
      [@ocaml.doc "Details about a rotation shift, including times, types, and contacts.\n"]
}
[@@ocaml.doc ""]

type nonrec member = string [@@ocaml.doc ""]

type nonrec rotation_preview_member_list = member list [@@ocaml.doc ""]

type nonrec rotation_override_preview_member_list = member list [@@ocaml.doc ""]

type nonrec preview_override = {
  end_time : date_time option;
      [@ocaml.doc "Information about the time a rotation override would end.\n"]
  start_time : date_time option;
      [@ocaml.doc "Information about the time a rotation override would begin.\n"]
  new_members : rotation_override_preview_member_list option;
      [@ocaml.doc "Information about contacts to add to an on-call rotation override.\n"]
}
[@@ocaml.doc "Information about contacts and times that an on-call override replaces.\n"]

type nonrec override_list = preview_override list [@@ocaml.doc ""]

type nonrec list_preview_rotation_shifts_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of items to return for this call. The call also returns a token that \
         can be specified in a subsequent call to get the next set of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token to start the list. This token is used to get the next set of results.\n"]
  overrides : override_list option;
      [@ocaml.doc "Information about changes that would be made in a rotation override.\n"]
  recurrence : recurrence_settings;
      [@ocaml.doc
        "Information about how long a rotation would last before restarting at the beginning of \
         the shift order.\n"]
  time_zone_id : time_zone_id;
      [@ocaml.doc
        "The time zone the rotation\226\128\153s activity would be based on, in Internet Assigned \
         Numbers Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \
         \"Asia/Seoul\". \n"]
  members : rotation_preview_member_list;
      [@ocaml.doc "The contacts that would be assigned to a rotation.\n"]
  end_time : date_time; [@ocaml.doc "The date and time a rotation shift would end.\n"]
  start_time : date_time option;
      [@ocaml.doc
        "Used to filter the range of calculated shifts before sending the response back to the \
         user. \n"]
  rotation_start_time : date_time option;
      [@ocaml.doc
        "The date and time a rotation would begin. The first shift is calculated from this date \
         and time.\n"]
}
[@@ocaml.doc ""]

type nonrec page = {
  read_time : date_time option;
      [@ocaml.doc "The time that the contact channel acknowledged engagement.\n"]
  delivery_time : date_time option;
      [@ocaml.doc "The time the message was delivered to the contact channel.\n"]
  sent_time : date_time option;
      [@ocaml.doc "The time that Incident Manager engaged the contact channel.\n"]
  incident_id : incident_id option;
      [@ocaml.doc "The ARN of the incident that's engaging the contact channel.\n"]
  sender : sender; [@ocaml.doc "The user that started the engagement.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the contact that Incident Manager is engaging.\n"]
  engagement_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the engagement that this page is part of.\n"]
  page_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the page to the contact channel.\n"]
}
[@@ocaml.doc "Incident Manager engaging a contact's contact channel.\n"]

type nonrec pages_list = page list [@@ocaml.doc ""]

type nonrec list_pages_by_engagement_result = {
  pages : pages_list; [@ocaml.doc "The list of engagements to contact channels.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pages_by_engagement_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of engagements to contact channels to list per page of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
  engagement_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pages_by_contact_result = {
  pages : pages_list; [@ocaml.doc "The list of engagements to a contact's contact channel.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_pages_by_contact_request = {
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of engagements to contact channels to list per page of results. \n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
  contact_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact you are retrieving engagements for.\n"]
}
[@@ocaml.doc ""]

type nonrec contact_type =
  | ONCALL_SCHEDULE [@ocaml.doc ""]
  | ESCALATION [@ocaml.doc ""]
  | PERSONAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec resolution_contact = {
  stage_index : stage_index option;
      [@ocaml.doc "The stage in the escalation plan that resolves to this contact.\n"]
  type_ : contact_type; [@ocaml.doc "The type of contact for a resolution step.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a contact in the engagement resolution process. \n"]
}
[@@ocaml.doc
  "Information about the engagement resolution steps. The resolution starts from the first \
   contact, which can be an escalation plan, then resolves to an on-call rotation, and finally to \
   a personal contact.\n\n\
  \ The [ResolutionContact] structure describes the information for each node or step in that \
   process. It contains information about different contact types, such as the escalation, \
   rotation, and personal contacts.\n\
  \ "]

type nonrec resolution_list = resolution_contact list [@@ocaml.doc ""]

type nonrec list_page_resolutions_result = {
  page_resolutions : resolution_list;
      [@ocaml.doc "Information about the resolution for an engagement.\n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "The token for the next set of items to return. Use this token to get the next set of \
         results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_page_resolutions_request = {
  page_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact engaged for the incident.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "A token to start the list. Use this token to get the next set of results.\n"]
}
[@@ocaml.doc ""]

type nonrec receipt_type =
  | STOP [@ocaml.doc ""]
  | SENT [@ocaml.doc ""]
  | READ [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | DELIVERED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec receipt_info = string [@@ocaml.doc ""]

type nonrec receipt = {
  receipt_time : date_time; [@ocaml.doc "The time receipt was [SENT], [DELIVERED], or [READ].\n"]
  receipt_info : receipt_info option;
      [@ocaml.doc "Information provided during the page acknowledgement.\n"]
  receipt_type : receipt_type;
      [@ocaml.doc "The type follows the engagement cycle, [SENT], [DELIVERED], and [READ].\n"]
  contact_channel_arn : ssm_contacts_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact channel Incident Manager engaged.\n"]
}
[@@ocaml.doc "Records events during an engagement.\n"]

type nonrec receipts_list = receipt list [@@ocaml.doc ""]

type nonrec list_page_receipts_result = {
  receipts : receipts_list option; [@ocaml.doc "A list of each acknowledgement.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_page_receipts_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of acknowledgements per page of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
  page_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the engagement to a specific contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec engagement = {
  stop_time : date_time option; [@ocaml.doc "The time that the engagement ended.\n"]
  start_time : date_time option; [@ocaml.doc "The time that the engagement began.\n"]
  incident_id : incident_id option;
      [@ocaml.doc "The ARN of the incident that's engaging the contact.\n"]
  sender : sender; [@ocaml.doc "The user that started the engagement.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the escalation plan or contact that Incident Manager is engaging.\n"]
  engagement_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement.\n"]
}
[@@ocaml.doc
  "Incident Manager reaching out to a contact or escalation plan to engage contact during an \
   incident.\n"]

type nonrec engagements_list = engagement list [@@ocaml.doc ""]

type nonrec list_engagements_result = {
  engagements : engagements_list;
      [@ocaml.doc
        "A list of each engagement that occurred during the specified time range of an incident.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_engagements_request = {
  time_range_value : time_range option;
      [@ocaml.doc "The time range to lists engagements for an incident.\n"]
  incident_id : incident_id option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the incident you're listing engagements for.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of engagements per page of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec contact_alias = string [@@ocaml.doc ""]

type nonrec contact = {
  type_ : contact_type;
      [@ocaml.doc
        "The type of contact.\n\n\
        \ {ul\n\
        \       {-   [PERSONAL]: A single, individual contact.\n\
        \           \n\
        \            }\n\
        \       {-   [ESCALATION]: An escalation plan.\n\
        \           \n\
        \            }\n\
        \       {-   [ONCALL_SCHEDULE]: An on-call schedule.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  display_name : contact_name option;
      [@ocaml.doc "The full name of the contact or escalation plan.\n"]
  alias : contact_alias;
      [@ocaml.doc "The unique and identifiable alias of the contact or escalation plan.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc
  "A personal contact or escalation plan that Incident Manager engages during an incident.\n"]

type nonrec contacts_list = contact list [@@ocaml.doc ""]

type nonrec list_contacts_result = {
  contacts : contacts_list option;
      [@ocaml.doc "A list of the contacts and escalation plans in your Incident Manager account.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_contacts_request = {
  type_ : contact_type option; [@ocaml.doc "The type of contact.\n"]
  alias_prefix : contact_alias option;
      [@ocaml.doc "Used to list only contacts who's aliases start with the specified prefix.\n"]
  max_results : max_results option;
      [@ocaml.doc "The maximum number of contacts and escalation plans per page of results.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec channel_type = EMAIL [@ocaml.doc ""] | VOICE [@ocaml.doc ""] | SMS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec activation_status = NOT_ACTIVATED [@ocaml.doc ""] | ACTIVATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec contact_channel = {
  activation_status : activation_status;
      [@ocaml.doc
        "A Boolean value describing if the contact channel has been activated or not. If the \
         contact channel isn't activated, Incident Manager can't engage the contact through it.\n"]
  delivery_address : contact_channel_address;
      [@ocaml.doc
        "The details that Incident Manager uses when trying to engage the contact channel.\n"]
  type_ : channel_type option;
      [@ocaml.doc
        "The type of the contact channel. Incident Manager supports three contact methods:\n\n\
        \ {ul\n\
        \       {-  SMS\n\
        \           \n\
        \            }\n\
        \       {-  VOICE\n\
        \           \n\
        \            }\n\
        \       {-  EMAIL\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : channel_name; [@ocaml.doc "The name of the contact channel.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the contact that contains the contact channel.\n"]
  contact_channel_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc "The method that Incident Manager uses to engage a contact.\n"]

type nonrec contact_channel_list = contact_channel list [@@ocaml.doc ""]

type nonrec list_contact_channels_result = {
  contact_channels : contact_channel_list;
      [@ocaml.doc "A list of contact channels related to the specified contact.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_contact_channels_request = {
  max_results : max_results option;
      [@ocaml.doc "The maximum number of contact channels per page.\n"]
  next_token : pagination_token option;
      [@ocaml.doc "The pagination token to continue to the next page of results.\n"]
  contact_id : ssm_contacts_arn; [@ocaml.doc "The Amazon Resource Name (ARN) of the contact.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rotation_override_result = {
  create_time : date_time option; [@ocaml.doc "The date and time when the override was created.\n"]
  end_time : date_time option; [@ocaml.doc "The date and time when the override ends.\n"]
  start_time : date_time option;
      [@ocaml.doc "The date and time when the override goes into effect.\n"]
  new_contact_ids : ssm_contacts_arn_list option;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts assigned to the override of the on-call \
         rotation.\n"]
  rotation_arn : ssm_contacts_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the on-call rotation that was overridden.\n"]
  rotation_override_id : uuid option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the override to an on-call rotation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rotation_override_request = {
  rotation_override_id : uuid;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the on-call rotation override to retrieve information \
         about.\n"]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the overridden rotation to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rotation_result = {
  recurrence : recurrence_settings;
      [@ocaml.doc
        "Specifies how long a rotation lasts before restarting at the beginning of the shift order.\n"]
  time_zone_id : time_zone_id;
      [@ocaml.doc
        "The time zone that the rotation\226\128\153s activity is based on, in Internet Assigned \
         Numbers Authority (IANA) format.\n"]
  start_time : date_time; [@ocaml.doc "The specified start time for the on-call rotation.\n"]
  contact_ids : rotation_contacts_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts assigned to the on-call rotation team.\n"]
  name : rotation_name; [@ocaml.doc "The name of the on-call rotation.\n"]
  rotation_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the on-call rotation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_rotation_request = {
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the on-call rotation to retrieve information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_policy_result = {
  policy : policy option;
      [@ocaml.doc "Details about the resource policy attached to the contact or escalation plan.\n"]
  contact_arn : ssm_contacts_arn option; [@ocaml.doc "The ARN of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_policy_request = {
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_channel_result = {
  activation_status : activation_status option;
      [@ocaml.doc "A Boolean value indicating if the contact channel has been activated or not.\n"]
  delivery_address : contact_channel_address;
      [@ocaml.doc
        "The details that Incident Manager uses when trying to engage the contact channel.\n"]
  type_ : channel_type;
      [@ocaml.doc "The type of contact channel. The type is [SMS], [VOICE], or [EMAIL].\n"]
  name : channel_name; [@ocaml.doc "The name of the contact channel\n"]
  contact_channel_arn : ssm_contacts_arn; [@ocaml.doc "The ARN of the contact channel.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the contact that the channel belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_channel_request = {
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact channel you want information about.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_result = {
  plan : plan;
      [@ocaml.doc
        "Details about the specific timing or stages and targets of the escalation plan or \
         engagement plan.\n"]
  type_ : contact_type; [@ocaml.doc "The type of contact.\n"]
  display_name : contact_name option;
      [@ocaml.doc "The full name of the contact or escalation plan.\n"]
  alias : contact_alias;
      [@ocaml.doc
        "The alias of the contact or escalation plan. The alias is unique and identifiable.\n"]
  contact_arn : ssm_contacts_arn; [@ocaml.doc "The ARN of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec get_contact_request = {
  contact_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_page_result = {
  delivery_time : date_time option;
      [@ocaml.doc "The time that the contact channel received the engagement.\n"]
  read_time : date_time option;
      [@ocaml.doc "The time that the contact channel acknowledged the engagement.\n"]
  sent_time : date_time option;
      [@ocaml.doc "The time the engagement was sent to the contact channel.\n"]
  incident_id : incident_id option;
      [@ocaml.doc "The ARN of the incident that engaged the contact channel.\n"]
  public_content : public_content option;
      [@ocaml.doc
        "The insecure content of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  public_subject : public_subject option;
      [@ocaml.doc
        "The insecure subject of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  content : content;
      [@ocaml.doc
        "The secure content of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] and [EMAIL].\n"]
  subject : subject;
      [@ocaml.doc
        "The secure subject of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] and [EMAIL].\n"]
  sender : sender; [@ocaml.doc "The user that started the engagement.\n"]
  contact_arn : ssm_contacts_arn; [@ocaml.doc "The ARN of the contact that was engaged.\n"]
  engagement_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the engagement that engaged the contact channel.\n"]
  page_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement to a contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_page_request = {
  page_id : ssm_contacts_arn; [@ocaml.doc "The ID of the engagement to a contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_engagement_result = {
  stop_time : date_time option; [@ocaml.doc "The time that the engagement ended.\n"]
  start_time : date_time option; [@ocaml.doc "The time that the engagement started.\n"]
  incident_id : incident_id option;
      [@ocaml.doc "The ARN of the incident in which the engagement occurred.\n"]
  public_content : public_content option;
      [@ocaml.doc
        "The insecure content of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  public_subject : public_subject option;
      [@ocaml.doc
        "The insecure subject of the message that was sent to the contact. Use this field for \
         engagements to [SMS].\n"]
  content : content;
      [@ocaml.doc
        "The secure content of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] and [EMAIL].\n"]
  subject : subject;
      [@ocaml.doc
        "The secure subject of the message that was sent to the contact. Use this field for \
         engagements to [VOICE] and [EMAIL].\n"]
  sender : sender; [@ocaml.doc "The user that started the engagement.\n"]
  engagement_arn : ssm_contacts_arn; [@ocaml.doc "The ARN of the engagement.\n"]
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The ARN of the escalation plan or contacts involved in the engagement.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_engagement_request = {
  engagement_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement you want the details of.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rotation_override_result = unit [@@ocaml.doc ""]

type nonrec delete_rotation_override_request = {
  rotation_override_id : uuid;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the on-call rotation override to delete.\n"]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rotation that was overridden.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rotation_result = unit [@@ocaml.doc ""]

type nonrec delete_rotation_request = {
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the on-call rotation to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_contact_channel_result = unit [@@ocaml.doc ""]

type nonrec delete_contact_channel_request = {
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_contact_result = unit [@@ocaml.doc ""]

type nonrec delete_contact_request = {
  contact_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact that you're deleting.\n"]
}
[@@ocaml.doc ""]

type nonrec deactivate_contact_channel_result = unit [@@ocaml.doc ""]

type nonrec deactivate_contact_channel_request = {
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel you're deactivating.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rotation_override_result = {
  rotation_override_id : uuid;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created rotation override.\n"]
}
[@@ocaml.doc ""]

type nonrec rotation_override_contacts_arn_list = ssm_contacts_arn list [@@ocaml.doc ""]

type nonrec create_rotation_override_request = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A token that ensures that the operation is called only once with the specified details.\n"]
  end_time : date_time; [@ocaml.doc "The date and time when the override ends.\n"]
  start_time : date_time; [@ocaml.doc "The date and time when the override goes into effect.\n"]
  new_contact_ids : rotation_override_contacts_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts to replace those in the current on-call \
         rotation with.\n\n\
        \ If you want to include any current team members in the override shift, you must include \
         their ARNs in the new contact ID list.\n\
        \ "]
  rotation_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the rotation to create an override for.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rotation_result = {
  rotation_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created rotation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rotation_request = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A token that ensures that the operation is called only once with the specified details.\n"]
  tags : tags_list option;
      [@ocaml.doc
        "Optional metadata to assign to the rotation. Tags enable you to categorize a resource in \
         different ways, such as by purpose, owner, or environment. For more information, see \
         {{:https://docs.aws.amazon.com/incident-manager/latest/userguide/tagging.html}Tagging \
         Incident Manager resources} in the {i Incident Manager User Guide}.\n"]
  recurrence : recurrence_settings;
      [@ocaml.doc "Information about the rule that specifies when a shift's team members rotate.\n"]
  time_zone_id : time_zone_id;
      [@ocaml.doc
        "The time zone to base the rotation\226\128\153s activity on in Internet Assigned Numbers \
         Authority (IANA) format. For example: \"America/Los_Angeles\", \"UTC\", or \
         \"Asia/Seoul\". For more information, see the {{:https://www.iana.org/time-zones}Time \
         Zone Database} on the IANA website.\n\n\
        \  Designators for time zones that don\226\128\153t support Daylight Savings Time rules, \
         such as Pacific Standard Time (PST), are not supported.\n\
        \  \n\
        \   "]
  start_time : date_time option;
      [@ocaml.doc "The date and time that the rotation goes into effect.\n"]
  contact_ids : rotation_contacts_arn_list;
      [@ocaml.doc
        "The Amazon Resource Names (ARNs) of the contacts to add to the rotation.\n\n\
        \  Only the [PERSONAL] contact type is supported. The contact types [ESCALATION] and \
         [ONCALL_SCHEDULE] are not supported for this operation. \n\
        \  \n\
        \    The order that you list the contacts in is their shift order in the rotation \
         schedule. To change the order of the contact's shifts, use the [UpdateRotation] operation.\n\
        \    "]
  name : rotation_name; [@ocaml.doc "The name of the rotation.\n"]
}
[@@ocaml.doc ""]

type nonrec create_contact_channel_result = {
  contact_channel_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec defer_activation = bool [@@ocaml.doc ""]

type nonrec create_contact_channel_request = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A token ensuring that the operation is called only once with the specified details.\n"]
  defer_activation : defer_activation option;
      [@ocaml.doc
        "If you want to activate the channel at a later time, you can choose to defer activation. \
         Incident Manager can't engage your contact channel until it has been activated.\n"]
  delivery_address : contact_channel_address;
      [@ocaml.doc
        "The details that Incident Manager uses when trying to engage the contact channel. The \
         format is dependent on the type of the contact channel. The following are the expected \
         formats:\n\n\
        \ {ul\n\
        \       {-  SMS - '+' followed by the country code and phone number\n\
        \           \n\
        \            }\n\
        \       {-  VOICE - '+' followed by the country code and phone number\n\
        \           \n\
        \            }\n\
        \       {-  EMAIL - any standard email format\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_ : channel_type;
      [@ocaml.doc
        "Incident Manager supports three types of contact channels:\n\n\
        \ {ul\n\
        \       {-   [SMS] \n\
        \           \n\
        \            }\n\
        \       {-   [VOICE] \n\
        \           \n\
        \            }\n\
        \       {-   [EMAIL] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : channel_name; [@ocaml.doc "The name of the contact channel.\n"]
  contact_id : ssm_contacts_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the contact you are adding the contact channel to.\n"]
}
[@@ocaml.doc ""]

type nonrec create_contact_result = {
  contact_arn : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the created contact or escalation plan.\n"]
}
[@@ocaml.doc ""]

type nonrec create_contact_request = {
  idempotency_token : idempotency_token option;
      [@ocaml.doc
        "A token ensuring that the operation is called only once with the specified details.\n"]
  tags : tags_list option;
      [@ocaml.doc
        "Adds a tag to the target. You can only tag resources created in the first Region of your \
         replication set.\n"]
  plan : plan;
      [@ocaml.doc
        "A list of stages. A contact has an engagement plan with stages that contact specified \
         contact channels. An escalation plan uses stages that contact specified contacts.\n"]
  type_ : contact_type;
      [@ocaml.doc
        "The type of contact to create.\n\n\
        \ {ul\n\
        \       {-   [PERSONAL]: A single, individual contact.\n\
        \           \n\
        \            }\n\
        \       {-   [ESCALATION]: An escalation plan.\n\
        \           \n\
        \            }\n\
        \       {-   [ONCALL_SCHEDULE]: An on-call schedule.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  display_name : contact_name option;
      [@ocaml.doc "The full name of the contact or escalation plan.\n"]
  alias : contact_alias;
      [@ocaml.doc
        "The short name to quickly identify a contact or escalation plan. The contact alias must \
         be unique and identifiable.\n"]
}
[@@ocaml.doc ""]

type nonrec activate_contact_channel_result = unit [@@ocaml.doc ""]

type nonrec activation_code = string [@@ocaml.doc ""]

type nonrec activate_contact_channel_request = {
  activation_code : activation_code;
      [@ocaml.doc "The code sent to the contact channel when it was created in the contact.\n"]
  contact_channel_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the contact channel.\n"]
}
[@@ocaml.doc ""]

type nonrec accept_page_result = unit [@@ocaml.doc ""]

type nonrec accept_type = READ [@ocaml.doc ""] | DELIVERED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec accept_code = string [@@ocaml.doc ""]

type nonrec accept_code_validation = ENFORCE [@ocaml.doc ""] | IGNORE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec accept_page_request = {
  accept_code_validation : accept_code_validation option;
      [@ocaml.doc
        "An optional field that Incident Manager uses to [ENFORCE] [AcceptCode] validation when \
         acknowledging an page. Acknowledgement can occur by replying to a page, or when entering \
         the AcceptCode in the console. Enforcing AcceptCode validation causes Incident Manager to \
         verify that the code entered by the user matches the code sent by Incident Manager with \
         the page.\n\n\
        \ Incident Manager can also [IGNORE] [AcceptCode] validation. Ignoring [AcceptCode] \
         validation causes Incident Manager to accept any value entered for the [AcceptCode].\n\
        \ "]
  accept_code : accept_code; [@ocaml.doc "A 6-digit code used to acknowledge the page.\n"]
  note : receipt_info option;
      [@ocaml.doc "Information provided by the user when the user acknowledges the page.\n"]
  accept_type : accept_type;
      [@ocaml.doc "The type indicates if the page was [DELIVERED] or [READ].\n"]
  contact_channel_id : ssm_contacts_arn option; [@ocaml.doc "The ARN of the contact channel.\n"]
  page_id : ssm_contacts_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the engagement to a contact channel.\n"]
}
[@@ocaml.doc ""]
