open Types

let make_account_attribute ~name:(name_ : account_attribute_name)
    ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; value = value_ } : account_attribute)

let make_account_limit ~name:(name_ : account_limit_name)
    ~used:(used_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~max:(max_ : Smaws_Lib.Smithy_api.Types.primitive_long) () =
  ({ name = name_; used = used_; max = max_ } : account_limit)

let make_validation_exception_field ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ name = name_; message = message_ } : validation_exception_field)

let make_associate_origination_identity_request
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ?client_token:(client_token_ : client_token option) ~pool_id:(pool_id_ : pool_id_or_arn)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn) () =
  ({
     pool_id = pool_id_;
     origination_identity = origination_identity_;
     iso_country_code = iso_country_code_;
     client_token = client_token_;
   }
    : associate_origination_identity_request)

let make_associate_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     configuration_set_name = configuration_set_name_;
   }
    : associate_protect_configuration_request)

let make_carrier_lookup_request
    ~phone_number:(phone_number_ : carrier_lookup_input_phone_number_type) () =
  ({ phone_number = phone_number_ } : carrier_lookup_request)

let make_carrier_status_information
    ~carrier_name:(carrier_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : carrier_status) () =
  ({ carrier_name = carrier_name_; status = status_ } : carrier_status_information)

let make_cloud_watch_logs_destination ~iam_role_arn:(iam_role_arn_ : iam_role_arn)
    ~log_group_arn:(log_group_arn_ : log_group_arn) () =
  ({ iam_role_arn = iam_role_arn_; log_group_arn = log_group_arn_ } : cloud_watch_logs_destination)

let make_configuration_set_filter ~name:(name_ : configuration_set_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : configuration_set_filter)

let make_sns_destination ~topic_arn:(topic_arn_ : sns_topic_arn) () =
  ({ topic_arn = topic_arn_ } : sns_destination)

let make_kinesis_firehose_destination ~iam_role_arn:(iam_role_arn_ : iam_role_arn)
    ~delivery_stream_arn:(delivery_stream_arn_ : delivery_stream_arn) () =
  ({ iam_role_arn = iam_role_arn_; delivery_stream_arn = delivery_stream_arn_ }
    : kinesis_firehose_destination)

let make_event_destination
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?sns_destination:(sns_destination_ : sns_destination option)
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~matching_event_types:(matching_event_types_ : event_type_list) () =
  ({
     event_destination_name = event_destination_name_;
     enabled = enabled_;
     matching_event_types = matching_event_types_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     sns_destination = sns_destination_;
   }
    : event_destination)

let make_configuration_set_information
    ?default_message_type:(default_message_type_ : message_type option)
    ?default_sender_id:(default_sender_id_ : sender_id option)
    ?default_message_feedback_enabled:
      (default_message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ~configuration_set_arn:(configuration_set_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name)
    ~event_destinations:(event_destinations_ : event_destination_list)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     configuration_set_arn = configuration_set_arn_;
     configuration_set_name = configuration_set_name_;
     event_destinations = event_destinations_;
     default_message_type = default_message_type_;
     default_sender_id = default_sender_id_;
     default_message_feedback_enabled = default_message_feedback_enabled_;
     created_timestamp = created_timestamp_;
     protect_configuration_id = protect_configuration_id_;
   }
    : configuration_set_information)

let make_country_launch_status_filter ~name:(name_ : country_launch_status_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : country_launch_status_filter)

let make_country_launch_status_information
    ?rcs_platform_id:(rcs_platform_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~status:(status_ : country_launch_status)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~carrier_status:(carrier_status_ : carrier_status_information_list) () =
  ({
     iso_country_code = iso_country_code_;
     status = status_;
     rcs_platform_id = rcs_platform_id_;
     registration_id = registration_id_;
     carrier_status = carrier_status_;
   }
    : country_launch_status_information)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_configuration_set_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ configuration_set_name = configuration_set_name_; tags = tags_; client_token = client_token_ }
    : create_configuration_set_request)

let make_create_event_destination_request
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?sns_destination:(sns_destination_ : sns_destination option)
    ?client_token:(client_token_ : client_token option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~matching_event_types:(matching_event_types_ : event_type_list) () =
  ({
     configuration_set_name = configuration_set_name_;
     event_destination_name = event_destination_name_;
     matching_event_types = matching_event_types_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     sns_destination = sns_destination_;
     client_token = client_token_;
   }
    : create_event_destination_request)

let make_create_notify_configuration_request
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ?pool_id:(pool_id_ : pool_id_or_arn option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ~display_name:(display_name_ : notify_configuration_display_name)
    ~use_case:(use_case_ : notify_configuration_use_case)
    ~enabled_channels:(enabled_channels_ : notify_enabled_channels_list) () =
  ({
     display_name = display_name_;
     use_case = use_case_;
     default_template_id = default_template_id_;
     pool_id = pool_id_;
     enabled_countries = enabled_countries_;
     enabled_channels = enabled_channels_;
     deletion_protection_enabled = deletion_protection_enabled_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_notify_configuration_request)

let make_create_opt_out_list_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name) () =
  ({ opt_out_list_name = opt_out_list_name_; tags = tags_; client_token = client_token_ }
    : create_opt_out_list_request)

let make_create_pool_request ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn)
    ~message_type:(message_type_ : message_type) () =
  ({
     origination_identity = origination_identity_;
     iso_country_code = iso_country_code_;
     message_type = message_type_;
     deletion_protection_enabled = deletion_protection_enabled_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_pool_request)

let make_create_protect_configuration_request ?client_token:(client_token_ : client_token option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) () =
  ({
     client_token = client_token_;
     deletion_protection_enabled = deletion_protection_enabled_;
     tags = tags_;
   }
    : create_protect_configuration_request)

let make_create_rcs_agent_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     opt_out_list_name = opt_out_list_name_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_rcs_agent_request)

let make_create_registration_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~registration_type:(registration_type_ : registration_type) () =
  ({ registration_type = registration_type_; tags = tags_; client_token = client_token_ }
    : create_registration_request)

let make_create_registration_association_request
    ~registration_id:(registration_id_ : registration_id_or_arn)
    ~resource_id:(resource_id_ : resource_id_or_arn) () =
  ({ registration_id = registration_id_; resource_id = resource_id_ }
    : create_registration_association_request)

let make_create_registration_attachment_request
    ?attachment_body:(attachment_body_ : attachment_body option)
    ?attachment_url:(attachment_url_ : attachment_url option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option) () =
  ({
     attachment_body = attachment_body_;
     attachment_url = attachment_url_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_registration_attachment_request)

let make_registration_version_status_history
    ?submitted_timestamp:(submitted_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?aws_reviewing_timestamp:
      (aws_reviewing_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?reviewing_timestamp:(reviewing_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?requires_authentication_timestamp:
      (requires_authentication_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?approved_timestamp:(approved_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?discarded_timestamp:(discarded_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?denied_timestamp:(denied_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_timestamp:(revoked_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?archived_timestamp:(archived_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~draft_timestamp:(draft_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     draft_timestamp = draft_timestamp_;
     submitted_timestamp = submitted_timestamp_;
     aws_reviewing_timestamp = aws_reviewing_timestamp_;
     reviewing_timestamp = reviewing_timestamp_;
     requires_authentication_timestamp = requires_authentication_timestamp_;
     approved_timestamp = approved_timestamp_;
     discarded_timestamp = discarded_timestamp_;
     denied_timestamp = denied_timestamp_;
     revoked_timestamp = revoked_timestamp_;
     archived_timestamp = archived_timestamp_;
   }
    : registration_version_status_history)

let make_create_registration_version_request
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ registration_id = registration_id_ } : create_registration_version_request)

let make_create_verified_destination_number_request
    ?rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     destination_phone_number = destination_phone_number_;
     rcs_agent_id = rcs_agent_id_;
     tags = tags_;
     client_token = client_token_;
   }
    : create_verified_destination_number_request)

let make_delete_account_default_protect_configuration_request () = (() : unit)

let make_delete_configuration_set_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_configuration_set_request)

let make_delete_default_message_type_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_default_message_type_request)

let make_delete_default_sender_id_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_default_sender_id_request)

let make_delete_event_destination_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~event_destination_name:(event_destination_name_ : event_destination_name) () =
  ({
     configuration_set_name = configuration_set_name_;
     event_destination_name = event_destination_name_;
   }
    : delete_event_destination_request)

let make_delete_keyword_request
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn)
    ~keyword:(keyword_ : keyword) () =
  ({ origination_identity = origination_identity_; keyword = keyword_ } : delete_keyword_request)

let make_delete_media_message_spend_limit_override_request () = (() : unit)

let make_delete_notify_configuration_request
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({ notify_configuration_id = notify_configuration_id_ } : delete_notify_configuration_request)

let make_delete_notify_message_spend_limit_override_request () = (() : unit)

let make_delete_opt_out_list_request
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({ opt_out_list_name = opt_out_list_name_ } : delete_opt_out_list_request)

let make_delete_opted_out_number_request
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn)
    ~opted_out_number:(opted_out_number_ : phone_number) () =
  ({ opt_out_list_name = opt_out_list_name_; opted_out_number = opted_out_number_ }
    : delete_opted_out_number_request)

let make_delete_pool_request ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({ pool_id = pool_id_ } : delete_pool_request)

let make_delete_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({ protect_configuration_id = protect_configuration_id_ } : delete_protect_configuration_request)

let make_delete_protect_configuration_rule_set_number_override_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     destination_phone_number = destination_phone_number_;
   }
    : delete_protect_configuration_rule_set_number_override_request)

let make_delete_rcs_agent_request ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({ rcs_agent_id = rcs_agent_id_ } : delete_rcs_agent_request)

let make_delete_rcs_message_spend_limit_override_request () = (() : unit)

let make_delete_registration_request ~registration_id:(registration_id_ : registration_id_or_arn) ()
    =
  ({ registration_id = registration_id_ } : delete_registration_request)

let make_delete_registration_attachment_request
    ~registration_attachment_id:(registration_attachment_id_ : registration_attachment_id_or_arn) ()
    =
  ({ registration_attachment_id = registration_attachment_id_ }
    : delete_registration_attachment_request)

let make_delete_registration_field_value_request
    ~registration_id:(registration_id_ : registration_id_or_arn)
    ~field_path:(field_path_ : field_path) () =
  ({ registration_id = registration_id_; field_path = field_path_ }
    : delete_registration_field_value_request)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_text_message_spend_limit_override_request () = (() : unit)

let make_delete_verified_destination_number_request
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn) () =
  ({ verified_destination_number_id = verified_destination_number_id_ }
    : delete_verified_destination_number_request)

let make_delete_voice_message_spend_limit_override_request () = (() : unit)

let make_describe_account_attributes_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_account_attributes_request)

let make_describe_account_limits_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_account_limits_request)

let make_describe_configuration_sets_request
    ?configuration_set_names:(configuration_set_names_ : configuration_set_name_list option)
    ?filters:(filters_ : configuration_set_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     configuration_set_names = configuration_set_names_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_configuration_sets_request)

let make_keyword_information ~keyword:(keyword_ : keyword)
    ~keyword_message:(keyword_message_ : keyword_message)
    ~keyword_action:(keyword_action_ : keyword_action) () =
  ({ keyword = keyword_; keyword_message = keyword_message_; keyword_action = keyword_action_ }
    : keyword_information)

let make_keyword_filter ~name:(name_ : keyword_filter_name) ~values:(values_ : filter_value_list) ()
    =
  ({ name = name_; values = values_ } : keyword_filter)

let make_describe_keywords_request ?keywords:(keywords_ : keyword_list option)
    ?filters:(filters_ : keyword_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn) () =
  ({
     origination_identity = origination_identity_;
     keywords = keywords_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_keywords_request)

let make_notify_configuration_information
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?rejection_reason:(rejection_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~notify_configuration_arn:(notify_configuration_arn_ : notify_configuration_arn)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id)
    ~display_name:(display_name_ : notify_configuration_display_name)
    ~use_case:(use_case_ : notify_configuration_use_case)
    ~enabled_channels:(enabled_channels_ : notify_enabled_channels_list)
    ~tier:(tier_ : notify_configuration_tier)
    ~tier_upgrade_status:(tier_upgrade_status_ : tier_upgrade_status)
    ~status:(status_ : notify_configuration_status)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     notify_configuration_arn = notify_configuration_arn_;
     notify_configuration_id = notify_configuration_id_;
     display_name = display_name_;
     use_case = use_case_;
     default_template_id = default_template_id_;
     pool_id = pool_id_;
     enabled_countries = enabled_countries_;
     enabled_channels = enabled_channels_;
     tier = tier_;
     tier_upgrade_status = tier_upgrade_status_;
     status = status_;
     rejection_reason = rejection_reason_;
     deletion_protection_enabled = deletion_protection_enabled_;
     created_timestamp = created_timestamp_;
   }
    : notify_configuration_information)

let make_notify_configuration_filter ~name:(name_ : notify_configuration_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : notify_configuration_filter)

let make_describe_notify_configurations_request
    ?notify_configuration_ids:(notify_configuration_ids_ : notify_configuration_id_list option)
    ?filters:(filters_ : notify_configuration_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     notify_configuration_ids = notify_configuration_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_notify_configurations_request)

let make_template_variable_metadata
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_value:(min_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_value:(max_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?pattern:(pattern_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?sample:(sample_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?source:(source_ : template_variable_source option) ~type_:(type__ : template_variable_type)
    ~required:(required_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     type_ = type__;
     required = required_;
     description = description_;
     max_length = max_length_;
     min_value = min_value_;
     max_value = max_value_;
     default_value = default_value_;
     pattern = pattern_;
     sample = sample_;
     source = source_;
   }
    : template_variable_metadata)

let make_notify_template_information
    ?tier_access:(tier_access_ : notify_configuration_tier_list option)
    ?status:(status_ : notify_template_status option)
    ?supported_countries:(supported_countries_ : iso_country_code_list option)
    ?language_code:(language_code_ : notify_language_code option)
    ?content:(content_ : template_content option)
    ?variables:(variables_ : template_variables_map option)
    ?supported_voice_ids:(supported_voice_ids_ : voice_id_list option)
    ~template_id:(template_id_ : notify_template_id) ~version:(version_ : notify_template_version)
    ~template_type:(template_type_ : notify_template_type)
    ~channels:(channels_ : number_capability_list)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     template_id = template_id_;
     version = version_;
     template_type = template_type_;
     channels = channels_;
     tier_access = tier_access_;
     status = status_;
     supported_countries = supported_countries_;
     language_code = language_code_;
     content = content_;
     variables = variables_;
     supported_voice_ids = supported_voice_ids_;
     created_timestamp = created_timestamp_;
   }
    : notify_template_information)

let make_notify_template_filter ~name:(name_ : notify_template_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : notify_template_filter)

let make_describe_notify_templates_request
    ?template_ids:(template_ids_ : notify_template_id_list option)
    ?filters:(filters_ : notify_template_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     template_ids = template_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_notify_templates_request)

let make_opt_out_list_information
    ~opt_out_list_arn:(opt_out_list_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     opt_out_list_arn = opt_out_list_arn_;
     opt_out_list_name = opt_out_list_name_;
     created_timestamp = created_timestamp_;
   }
    : opt_out_list_information)

let make_describe_opt_out_lists_request
    ?opt_out_list_names:(opt_out_list_names_ : opt_out_list_name_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?owner:(owner_ : owner option) () =
  ({
     opt_out_list_names = opt_out_list_names_;
     next_token = next_token_;
     max_results = max_results_;
     owner = owner_;
   }
    : describe_opt_out_lists_request)

let make_opted_out_number_information ~opted_out_number:(opted_out_number_ : phone_number)
    ~opted_out_timestamp:(opted_out_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~end_user_opted_out:(end_user_opted_out_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     opted_out_number = opted_out_number_;
     opted_out_timestamp = opted_out_timestamp_;
     end_user_opted_out = end_user_opted_out_;
   }
    : opted_out_number_information)

let make_opted_out_filter ~name:(name_ : opted_out_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : opted_out_filter)

let make_describe_opted_out_numbers_request
    ?opted_out_numbers:(opted_out_numbers_ : opted_out_number_list option)
    ?filters:(filters_ : opted_out_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({
     opt_out_list_name = opt_out_list_name_;
     opted_out_numbers = opted_out_numbers_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_opted_out_numbers_request)

let make_phone_number_information
    ?phone_number_id:(phone_number_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~phone_number_arn:(phone_number_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~phone_number:(phone_number_ : phone_number) ~status:(status_ : number_status)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~message_type:(message_type_ : message_type)
    ~number_capabilities:(number_capabilities_ : number_capability_list)
    ~number_type:(number_type_ : number_type)
    ~monthly_leasing_price:(monthly_leasing_price_ : Smaws_Lib.Smithy_api.Types.string_)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     phone_number_arn = phone_number_arn_;
     phone_number_id = phone_number_id_;
     phone_number = phone_number_;
     status = status_;
     iso_country_code = iso_country_code_;
     message_type = message_type_;
     number_capabilities = number_capabilities_;
     number_type = number_type_;
     monthly_leasing_price = monthly_leasing_price_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     international_sending_enabled = international_sending_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
     pool_id = pool_id_;
     registration_id = registration_id_;
     created_timestamp = created_timestamp_;
   }
    : phone_number_information)

let make_phone_number_filter ~name:(name_ : phone_number_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : phone_number_filter)

let make_describe_phone_numbers_request
    ?phone_number_ids:(phone_number_ids_ : phone_number_id_list option)
    ?filters:(filters_ : phone_number_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?owner:(owner_ : owner option) () =
  ({
     phone_number_ids = phone_number_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     owner = owner_;
   }
    : describe_phone_numbers_request)

let make_pool_information ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ~pool_arn:(pool_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_) ~status:(status_ : pool_status)
    ~message_type:(message_type_ : message_type)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~shared_routes_enabled:(shared_routes_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     pool_arn = pool_arn_;
     pool_id = pool_id_;
     status = status_;
     message_type = message_type_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     shared_routes_enabled = shared_routes_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
     created_timestamp = created_timestamp_;
   }
    : pool_information)

let make_pool_filter ~name:(name_ : pool_filter_name) ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : pool_filter)

let make_describe_pools_request ?pool_ids:(pool_ids_ : pool_id_list option)
    ?filters:(filters_ : pool_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?owner:(owner_ : owner option) () =
  ({
     pool_ids = pool_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     owner = owner_;
   }
    : describe_pools_request)

let make_protect_configuration_information
    ~protect_configuration_arn:(protect_configuration_arn_ : protect_configuration_arn)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~account_default:(account_default_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     protect_configuration_arn = protect_configuration_arn_;
     protect_configuration_id = protect_configuration_id_;
     created_timestamp = created_timestamp_;
     account_default = account_default_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : protect_configuration_information)

let make_protect_configuration_filter ~name:(name_ : protect_configuration_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : protect_configuration_filter)

let make_describe_protect_configurations_request
    ?protect_configuration_ids:(protect_configuration_ids_ : protect_configuration_id_list option)
    ?filters:(filters_ : protect_configuration_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     protect_configuration_ids = protect_configuration_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_protect_configurations_request)

let make_describe_rcs_agent_country_launch_status_request
    ?iso_country_codes:(iso_country_codes_ : iso_country_code_list option)
    ?filters:(filters_ : country_launch_status_filter_list option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({
     rcs_agent_id = rcs_agent_id_;
     iso_country_codes = iso_country_codes_;
     filters = filters_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_rcs_agent_country_launch_status_request)

let make_testing_agent_information
    ?testing_agent_id:(testing_agent_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : testing_agent_status)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ status = status_; testing_agent_id = testing_agent_id_; registration_id = registration_id_ }
    : testing_agent_information)

let make_rcs_agent_information ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?two_way_media_s3_bucket_name:
      (two_way_media_s3_bucket_name_ : two_way_media_s3_bucket_name option)
    ?two_way_media_s3_key_prefix:(two_way_media_s3_key_prefix_ : two_way_media_s3_key_prefix option)
    ?two_way_media_s3_role:(two_way_media_s3_role_ : iam_role_arn option)
    ?two_way_rcs_events_enabled:(two_way_rcs_events_enabled_ : rcs_event_type_list option)
    ?testing_agent:(testing_agent_ : testing_agent_information option)
    ~rcs_agent_arn:(rcs_agent_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~rcs_agent_id:(rcs_agent_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : rcs_agent_status)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     rcs_agent_arn = rcs_agent_arn_;
     rcs_agent_id = rcs_agent_id_;
     status = status_;
     created_timestamp = created_timestamp_;
     deletion_protection_enabled = deletion_protection_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     two_way_enabled = two_way_enabled_;
     pool_id = pool_id_;
     two_way_media_s3_bucket_name = two_way_media_s3_bucket_name_;
     two_way_media_s3_key_prefix = two_way_media_s3_key_prefix_;
     two_way_media_s3_role = two_way_media_s3_role_;
     two_way_rcs_events_enabled = two_way_rcs_events_enabled_;
     testing_agent = testing_agent_;
   }
    : rcs_agent_information)

let make_rcs_agent_filter ~name:(name_ : rcs_agent_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : rcs_agent_filter)

let make_describe_rcs_agents_request ?rcs_agent_ids:(rcs_agent_ids_ : rcs_agent_id_list option)
    ?owner:(owner_ : owner option) ?filters:(filters_ : rcs_agent_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     rcs_agent_ids = rcs_agent_ids_;
     owner = owner_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_rcs_agents_request)

let make_registration_attachments_information
    ?attachment_upload_error_reason:
      (attachment_upload_error_reason_ : attachment_upload_error_reason option)
    ?attachment_url:(attachment_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~registration_attachment_arn:(registration_attachment_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~registration_attachment_id:(registration_attachment_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~attachment_status:(attachment_status_ : attachment_status)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     registration_attachment_arn = registration_attachment_arn_;
     registration_attachment_id = registration_attachment_id_;
     attachment_status = attachment_status_;
     attachment_upload_error_reason = attachment_upload_error_reason_;
     created_timestamp = created_timestamp_;
     attachment_url = attachment_url_;
   }
    : registration_attachments_information)

let make_registration_attachment_filter ~name:(name_ : registration_attachment_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : registration_attachment_filter)

let make_describe_registration_attachments_request
    ?registration_attachment_ids:
      (registration_attachment_ids_ : registration_attachment_id_list option)
    ?filters:(filters_ : registration_attachment_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     registration_attachment_ids = registration_attachment_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_attachments_request)

let make_select_option_description ?title:(title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~option_:(option__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ option_ = option__; title = title_; description = description_ } : select_option_description)

let make_registration_field_display_hints
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?select_option_descriptions:
      (select_option_descriptions_ : select_option_descriptions_list option)
    ?text_validation_description:
      (text_validation_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?example_text_value:(example_text_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     title = title_;
     short_description = short_description_;
     long_description = long_description_;
     documentation_title = documentation_title_;
     documentation_link = documentation_link_;
     select_option_descriptions = select_option_descriptions_;
     text_validation_description = text_validation_description_;
     example_text_value = example_text_value_;
   }
    : registration_field_display_hints)

let make_text_validation ~min_length:(min_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~pattern:(pattern_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ min_length = min_length_; max_length = max_length_; pattern = pattern_ } : text_validation)

let make_select_validation ~min_choices:(min_choices_ : Smaws_Lib.Smithy_api.Types.integer)
    ~max_choices:(max_choices_ : Smaws_Lib.Smithy_api.Types.integer)
    ~options:(options_ : string_list) () =
  ({ min_choices = min_choices_; max_choices = max_choices_; options = options_ }
    : select_validation)

let make_registration_field_definition
    ?select_validation:(select_validation_ : select_validation option)
    ?text_validation:(text_validation_ : text_validation option)
    ~section_path:(section_path_ : section_path) ~field_path:(field_path_ : field_path)
    ~field_type:(field_type_ : field_type)
    ~field_requirement:(field_requirement_ : field_requirement)
    ~display_hints:(display_hints_ : registration_field_display_hints) () =
  ({
     section_path = section_path_;
     field_path = field_path_;
     field_type = field_type_;
     field_requirement = field_requirement_;
     select_validation = select_validation_;
     text_validation = text_validation_;
     display_hints = display_hints_;
   }
    : registration_field_definition)

let make_describe_registration_field_definitions_request
    ?section_path:(section_path_ : section_path option)
    ?field_paths:(field_paths_ : field_path_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~registration_type:(registration_type_ : registration_type) () =
  ({
     registration_type = registration_type_;
     section_path = section_path_;
     field_paths = field_paths_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_field_definitions_request)

let make_registration_field_value_information
    ?select_choices:(select_choices_ : select_choice_list option)
    ?text_value:(text_value_ : text_value option)
    ?registration_attachment_id:
      (registration_attachment_id_ : registration_attachment_id_or_arn option)
    ?denied_reason:(denied_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?feedback:(feedback_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~field_path:(field_path_ : field_path) () =
  ({
     field_path = field_path_;
     select_choices = select_choices_;
     text_value = text_value_;
     registration_attachment_id = registration_attachment_id_;
     denied_reason = denied_reason_;
     feedback = feedback_;
   }
    : registration_field_value_information)

let make_describe_registration_field_values_request
    ?version_number:(version_number_ : registration_version_number option)
    ?section_path:(section_path_ : section_path option)
    ?field_paths:(field_paths_ : field_path_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     registration_id = registration_id_;
     version_number = version_number_;
     section_path = section_path_;
     field_paths = field_paths_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_field_values_request)

let make_registration_section_display_hints
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     title = title_;
     short_description = short_description_;
     long_description = long_description_;
     documentation_title = documentation_title_;
     documentation_link = documentation_link_;
   }
    : registration_section_display_hints)

let make_registration_section_definition ~section_path:(section_path_ : section_path)
    ~display_hints:(display_hints_ : registration_section_display_hints) () =
  ({ section_path = section_path_; display_hints = display_hints_ }
    : registration_section_definition)

let make_describe_registration_section_definitions_request
    ?section_paths:(section_paths_ : section_path_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~registration_type:(registration_type_ : registration_type) () =
  ({
     registration_type = registration_type_;
     section_paths = section_paths_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_section_definitions_request)

let make_registration_type_display_hints
    ?short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     title = title_;
     short_description = short_description_;
     long_description = long_description_;
     documentation_title = documentation_title_;
     documentation_link = documentation_link_;
   }
    : registration_type_display_hints)

let make_supported_association ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~resource_type:(resource_type_ : Smaws_Lib.Smithy_api.Types.string_)
    ~association_behavior:(association_behavior_ : registration_association_behavior)
    ~disassociation_behavior:(disassociation_behavior_ : registration_disassociation_behavior) () =
  ({
     resource_type = resource_type_;
     iso_country_code = iso_country_code_;
     association_behavior = association_behavior_;
     disassociation_behavior = disassociation_behavior_;
   }
    : supported_association)

let make_registration_type_definition
    ?supported_associations:(supported_associations_ : supported_association_list option)
    ~registration_type:(registration_type_ : registration_type)
    ~display_hints:(display_hints_ : registration_type_display_hints) () =
  ({
     registration_type = registration_type_;
     supported_associations = supported_associations_;
     display_hints = display_hints_;
   }
    : registration_type_definition)

let make_registration_type_filter ~name:(name_ : registration_type_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : registration_type_filter)

let make_describe_registration_type_definitions_request
    ?registration_types:(registration_types_ : registration_type_list option)
    ?filters:(filters_ : registration_type_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     registration_types = registration_types_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_type_definitions_request)

let make_registration_denied_reason_information
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     reason = reason_;
     short_description = short_description_;
     long_description = long_description_;
     documentation_title = documentation_title_;
     documentation_link = documentation_link_;
   }
    : registration_denied_reason_information)

let make_registration_version_information
    ?denied_reasons:(denied_reasons_ : registration_denied_reason_information_list option)
    ?feedback:(feedback_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~version_number:(version_number_ : registration_version_number)
    ~registration_version_status:(registration_version_status_ : registration_version_status)
    ~registration_version_status_history:
      (registration_version_status_history_ : registration_version_status_history) () =
  ({
     version_number = version_number_;
     registration_version_status = registration_version_status_;
     registration_version_status_history = registration_version_status_history_;
     denied_reasons = denied_reasons_;
     feedback = feedback_;
   }
    : registration_version_information)

let make_registration_version_filter ~name:(name_ : registration_version_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : registration_version_filter)

let make_describe_registration_versions_request
    ?version_numbers:(version_numbers_ : registration_version_number_list option)
    ?filters:(filters_ : registration_version_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     registration_id = registration_id_;
     version_numbers = version_numbers_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registration_versions_request)

let make_registration_information
    ?approved_version_number:(approved_version_number_ : registration_version_number option)
    ?latest_denied_version_number:
      (latest_denied_version_number_ : registration_version_number option)
    ?additional_attributes:(additional_attributes_ : string_map option)
    ~registration_arn:(registration_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~registration_type:(registration_type_ : registration_type)
    ~registration_status:(registration_status_ : registration_status)
    ~current_version_number:(current_version_number_ : registration_version_number)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     registration_arn = registration_arn_;
     registration_id = registration_id_;
     registration_type = registration_type_;
     registration_status = registration_status_;
     current_version_number = current_version_number_;
     approved_version_number = approved_version_number_;
     latest_denied_version_number = latest_denied_version_number_;
     additional_attributes = additional_attributes_;
     created_timestamp = created_timestamp_;
   }
    : registration_information)

let make_registration_filter ~name:(name_ : registration_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : registration_filter)

let make_describe_registrations_request
    ?registration_ids:(registration_ids_ : registration_id_list option)
    ?filters:(filters_ : registration_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     registration_ids = registration_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_registrations_request)

let make_sender_id_information
    ?registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~sender_id_arn:(sender_id_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~sender_id:(sender_id_ : sender_id) ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~message_types:(message_types_ : message_type_list)
    ~monthly_leasing_price:(monthly_leasing_price_ : Smaws_Lib.Smithy_api.Types.string_)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~registered:(registered_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     sender_id_arn = sender_id_arn_;
     sender_id = sender_id_;
     iso_country_code = iso_country_code_;
     message_types = message_types_;
     monthly_leasing_price = monthly_leasing_price_;
     deletion_protection_enabled = deletion_protection_enabled_;
     registered = registered_;
     registration_id = registration_id_;
   }
    : sender_id_information)

let make_sender_id_filter ~name:(name_ : sender_id_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : sender_id_filter)

let make_sender_id_and_country ~sender_id:(sender_id_ : sender_id_or_arn)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({ sender_id = sender_id_; iso_country_code = iso_country_code_ } : sender_id_and_country)

let make_describe_sender_ids_request ?sender_ids:(sender_ids_ : sender_id_list option)
    ?filters:(filters_ : sender_id_filter_list option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) ?owner:(owner_ : owner option) () =
  ({
     sender_ids = sender_ids_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
     owner = owner_;
   }
    : describe_sender_ids_request)

let make_spend_limit ~name:(name_ : spend_limit_name)
    ~enforced_limit:(enforced_limit_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~max_limit:(max_limit_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~overridden:(overridden_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     name = name_;
     enforced_limit = enforced_limit_;
     max_limit = max_limit_;
     overridden = overridden_;
   }
    : spend_limit)

let make_describe_spend_limits_request ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : describe_spend_limits_request)

let make_verified_destination_number_information
    ?rcs_agent_id:(rcs_agent_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~verified_destination_number_arn:
      (verified_destination_number_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~verified_destination_number_id:
      (verified_destination_number_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~status:(status_ : verification_status)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     verified_destination_number_arn = verified_destination_number_arn_;
     verified_destination_number_id = verified_destination_number_id_;
     destination_phone_number = destination_phone_number_;
     status = status_;
     rcs_agent_id = rcs_agent_id_;
     created_timestamp = created_timestamp_;
   }
    : verified_destination_number_information)

let make_verified_destination_number_filter ~name:(name_ : verified_destination_number_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : verified_destination_number_filter)

let make_describe_verified_destination_numbers_request
    ?verified_destination_number_ids:
      (verified_destination_number_ids_ : verified_destination_number_id_list option)
    ?destination_phone_numbers:(destination_phone_numbers_ : destination_phone_number_list option)
    ?filters:(filters_ : verified_destination_number_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({
     verified_destination_number_ids = verified_destination_number_ids_;
     destination_phone_numbers = destination_phone_numbers_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : describe_verified_destination_numbers_request)

let make_disassociate_origination_identity_request
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ?client_token:(client_token_ : client_token option) ~pool_id:(pool_id_ : pool_id_or_arn)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn) () =
  ({
     pool_id = pool_id_;
     origination_identity = origination_identity_;
     iso_country_code = iso_country_code_;
     client_token = client_token_;
   }
    : disassociate_origination_identity_request)

let make_disassociate_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     configuration_set_name = configuration_set_name_;
   }
    : disassociate_protect_configuration_request)

let make_discard_registration_version_request
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ registration_id = registration_id_ } : discard_registration_version_request)

let make_protect_configuration_country_rule_set_information
    ~protect_status:(protect_status_ : protect_status) () =
  ({ protect_status = protect_status_ } : protect_configuration_country_rule_set_information)

let make_get_protect_configuration_country_rule_set_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~number_capability:(number_capability_ : number_capability) () =
  ({ protect_configuration_id = protect_configuration_id_; number_capability = number_capability_ }
    : get_protect_configuration_country_rule_set_request)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_notify_country_information ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~country_name:(country_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~supported_channels:(supported_channels_ : notify_enabled_channels_list)
    ~supported_use_cases:(supported_use_cases_ : notify_use_case_list)
    ~supported_tiers:(supported_tiers_ : notify_tier_list)
    ~customer_owned_identity_required:
      (customer_owned_identity_required_ : Smaws_Lib.Smithy_api.Types.primitive_boolean) () =
  ({
     iso_country_code = iso_country_code_;
     country_name = country_name_;
     supported_channels = supported_channels_;
     supported_use_cases = supported_use_cases_;
     supported_tiers = supported_tiers_;
     customer_owned_identity_required = customer_owned_identity_required_;
   }
    : notify_country_information)

let make_list_notify_countries_request ?channels:(channels_ : notify_enabled_channels_list option)
    ?use_cases:(use_cases_ : notify_use_case_list option)
    ?tier:(tier_ : notify_configuration_tier option) ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({
     channels = channels_;
     use_cases = use_cases_;
     tier = tier_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_notify_countries_request)

let make_origination_identity_metadata ?phone_number:(phone_number_ : phone_number option)
    ~origination_identity_arn:(origination_identity_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~origination_identity:(origination_identity_ : Smaws_Lib.Smithy_api.Types.string_)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~number_capabilities:(number_capabilities_ : number_capability_list) () =
  ({
     origination_identity_arn = origination_identity_arn_;
     origination_identity = origination_identity_;
     iso_country_code = iso_country_code_;
     number_capabilities = number_capabilities_;
     phone_number = phone_number_;
   }
    : origination_identity_metadata)

let make_pool_origination_identities_filter ~name:(name_ : pool_origination_identities_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : pool_origination_identities_filter)

let make_list_pool_origination_identities_request
    ?filters:(filters_ : pool_origination_identities_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({ pool_id = pool_id_; filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_pool_origination_identities_request)

let make_protect_configuration_rule_set_number_override_filter_item
    ~name:(name_ : protect_configuration_rule_set_number_override_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : protect_configuration_rule_set_number_override_filter_item)

let make_protect_configuration_rule_set_number_override
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ?expiration_timestamp:(expiration_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~action:(action_ : protect_configuration_rule_override_action) () =
  ({
     destination_phone_number = destination_phone_number_;
     created_timestamp = created_timestamp_;
     action = action_;
     iso_country_code = iso_country_code_;
     expiration_timestamp = expiration_timestamp_;
   }
    : protect_configuration_rule_set_number_override)

let make_list_protect_configuration_rule_set_number_overrides_request
    ?filters:(filters_ : list_protect_configuration_rule_set_number_override_filter option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_protect_configuration_rule_set_number_overrides_request)

let make_registration_association_metadata
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ?phone_number:(phone_number_ : phone_number option)
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_type:(resource_type_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     resource_arn = resource_arn_;
     resource_id = resource_id_;
     resource_type = resource_type_;
     iso_country_code = iso_country_code_;
     phone_number = phone_number_;
   }
    : registration_association_metadata)

let make_registration_association_filter ~name:(name_ : registration_association_filter_name)
    ~values:(values_ : filter_value_list) () =
  ({ name = name_; values = values_ } : registration_association_filter)

let make_list_registration_associations_request
    ?filters:(filters_ : registration_association_filter_list option)
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     registration_id = registration_id_;
     filters = filters_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_registration_associations_request)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_verify_destination_number_request
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn)
    ~verification_code:(verification_code_ : verification_code) () =
  ({
     verified_destination_number_id = verified_destination_number_id_;
     verification_code = verification_code_;
   }
    : verify_destination_number_request)

let make_update_sender_id_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~sender_id:(sender_id_ : sender_id_or_arn)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({
     sender_id = sender_id_;
     iso_country_code = iso_country_code_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : update_sender_id_request)

let make_update_rcs_agent_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_media_s3_bucket_name:
      (two_way_media_s3_bucket_name_ : two_way_media_s3_bucket_name_or_unset option)
    ?two_way_media_s3_key_prefix:(two_way_media_s3_key_prefix_ : two_way_media_s3_key_prefix option)
    ?two_way_media_s3_role:(two_way_media_s3_role_ : iam_role_arn_or_unset option)
    ?two_way_rcs_events_enabled:(two_way_rcs_events_enabled_ : rcs_event_type_list option)
    ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({
     rcs_agent_id = rcs_agent_id_;
     deletion_protection_enabled = deletion_protection_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     two_way_enabled = two_way_enabled_;
     two_way_media_s3_bucket_name = two_way_media_s3_bucket_name_;
     two_way_media_s3_key_prefix = two_way_media_s3_key_prefix_;
     two_way_media_s3_role = two_way_media_s3_role_;
     two_way_rcs_events_enabled = two_way_rcs_events_enabled_;
   }
    : update_rcs_agent_request)

let make_update_protect_configuration_country_rule_set_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~number_capability:(number_capability_ : number_capability)
    ~country_rule_set_updates:(country_rule_set_updates_ : protect_configuration_country_rule_set)
    () =
  ({
     protect_configuration_id = protect_configuration_id_;
     number_capability = number_capability_;
     country_rule_set_updates = country_rule_set_updates_;
   }
    : update_protect_configuration_country_rule_set_request)

let make_update_protect_configuration_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : update_protect_configuration_request)

let make_update_pool_request
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?shared_routes_enabled:(shared_routes_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({
     pool_id = pool_id_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     shared_routes_enabled = shared_routes_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : update_pool_request)

let make_update_phone_number_request
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~phone_number_id:(phone_number_id_ : phone_number_id_or_arn) () =
  ({
     phone_number_id = phone_number_id_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_channel_role = two_way_channel_role_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     international_sending_enabled = international_sending_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : update_phone_number_request)

let make_update_notify_configuration_request
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ?pool_id:(pool_id_ : notify_pool_id_or_unset option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?enabled_channels:(enabled_channels_ : notify_enabled_channels_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({
     notify_configuration_id = notify_configuration_id_;
     default_template_id = default_template_id_;
     pool_id = pool_id_;
     enabled_countries = enabled_countries_;
     enabled_channels = enabled_channels_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : update_notify_configuration_request)

let make_update_event_destination_request
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?matching_event_types:(matching_event_types_ : event_type_list option)
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?sns_destination:(sns_destination_ : sns_destination option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~event_destination_name:(event_destination_name_ : event_destination_name) () =
  ({
     configuration_set_name = configuration_set_name_;
     event_destination_name = event_destination_name_;
     enabled = enabled_;
     matching_event_types = matching_event_types_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     sns_destination = sns_destination_;
   }
    : update_event_destination_request)

let make_untag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~tags:(tags_ : non_empty_tag_list) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_submit_registration_version_request
    ?aws_review:(aws_review_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ registration_id = registration_id_; aws_review = aws_review_ }
    : submit_registration_version_request)

let make_set_voice_message_spend_limit_override_request
    ~monthly_limit:(monthly_limit_ : monthly_limit) () =
  ({ monthly_limit = monthly_limit_ } : set_voice_message_spend_limit_override_request)

let make_set_text_message_spend_limit_override_request
    ~monthly_limit:(monthly_limit_ : monthly_limit) () =
  ({ monthly_limit = monthly_limit_ } : set_text_message_spend_limit_override_request)

let make_set_rcs_message_spend_limit_override_request
    ~monthly_limit:(monthly_limit_ : monthly_limit) () =
  ({ monthly_limit = monthly_limit_ } : set_rcs_message_spend_limit_override_request)

let make_set_notify_message_spend_limit_override_request
    ~monthly_limit:(monthly_limit_ : monthly_limit) () =
  ({ monthly_limit = monthly_limit_ } : set_notify_message_spend_limit_override_request)

let make_set_media_message_spend_limit_override_request
    ~monthly_limit:(monthly_limit_ : monthly_limit) () =
  ({ monthly_limit = monthly_limit_ } : set_media_message_spend_limit_override_request)

let make_set_default_sender_id_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~sender_id:(sender_id_ : sender_id) () =
  ({ configuration_set_name = configuration_set_name_; sender_id = sender_id_ }
    : set_default_sender_id_request)

let make_set_default_message_type_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~message_type:(message_type_ : message_type) () =
  ({ configuration_set_name = configuration_set_name_; message_type = message_type_ }
    : set_default_message_type_request)

let make_set_default_message_feedback_enabled_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~message_feedback_enabled:(message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_) () =
  ({
     configuration_set_name = configuration_set_name_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : set_default_message_feedback_enabled_request)

let make_set_account_default_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({ protect_configuration_id = protect_configuration_id_ }
    : set_account_default_protect_configuration_request)

let make_send_voice_message_request ?message_body:(message_body_ : voice_message_body option)
    ?message_body_text_type:(message_body_text_type_ : voice_message_body_text_type option)
    ?voice_id:(voice_id_ : voice_id option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?max_price_per_minute:(max_price_per_minute_ : max_price option)
    ?time_to_live:(time_to_live_ : time_to_live option) ?context:(context_ : context_map option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~origination_identity:(origination_identity_ : voice_message_origination_identity) () =
  ({
     destination_phone_number = destination_phone_number_;
     origination_identity = origination_identity_;
     message_body = message_body_;
     message_body_text_type = message_body_text_type_;
     voice_id = voice_id_;
     configuration_set_name = configuration_set_name_;
     max_price_per_minute = max_price_per_minute_;
     time_to_live = time_to_live_;
     context = context_;
     dry_run = dry_run_;
     protect_configuration_id = protect_configuration_id_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_voice_message_request)

let make_send_text_message_request
    ?origination_identity:(origination_identity_ : text_message_origination_identity option)
    ?message_body:(message_body_ : text_message_body option)
    ?message_type:(message_type_ : message_type option) ?keyword:(keyword_ : keyword option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?max_price:(max_price_ : max_price option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?context:(context_ : context_map option)
    ?destination_country_parameters:
      (destination_country_parameters_ : destination_country_parameters option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     destination_phone_number = destination_phone_number_;
     origination_identity = origination_identity_;
     message_body = message_body_;
     message_type = message_type_;
     keyword = keyword_;
     configuration_set_name = configuration_set_name_;
     max_price = max_price_;
     time_to_live = time_to_live_;
     context = context_;
     destination_country_parameters = destination_country_parameters_;
     dry_run = dry_run_;
     protect_configuration_id = protect_configuration_id_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_text_message_request)

let make_rcs_fallback_configuration ?message_body:(message_body_ : rcs_fallback_message_body option)
    ?media_urls:(media_urls_ : media_url_list option)
    ?origination_identity:(origination_identity_ : rcs_fallback_origination_identity option)
    ~channel:(channel_ : rcs_fallback_channel) () =
  ({
     channel = channel_;
     message_body = message_body_;
     media_urls = media_urls_;
     origination_identity = origination_identity_;
   }
    : rcs_fallback_configuration)

let make_rcs_create_calendar_event_action
    ?description:(description_ : rcs_calendar_event_description option)
    ~text:(text_ : rcs_suggested_action_text) ~postback_data:(postback_data_ : rcs_postback_data)
    ~title:(title_ : rcs_calendar_event_title)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     text = text_;
     postback_data = postback_data_;
     title = title_;
     start_time = start_time_;
     end_time = end_time_;
     description = description_;
   }
    : rcs_create_calendar_event_action)

let make_rcs_request_location_action ~text:(text_ : rcs_suggested_action_text)
    ~postback_data:(postback_data_ : rcs_postback_data) () =
  ({ text = text_; postback_data = postback_data_ } : rcs_request_location_action)

let make_rcs_show_location_action ?label:(label_ : rcs_location_label option)
    ~text:(text_ : rcs_suggested_action_text) ~postback_data:(postback_data_ : rcs_postback_data)
    ~latitude:(latitude_ : Smaws_Lib.Smithy_api.Types.double)
    ~longitude:(longitude_ : Smaws_Lib.Smithy_api.Types.double) () =
  ({
     text = text_;
     postback_data = postback_data_;
     latitude = latitude_;
     longitude = longitude_;
     label = label_;
   }
    : rcs_show_location_action)

let make_rcs_dial_phone_action ~text:(text_ : rcs_suggested_action_text)
    ~postback_data:(postback_data_ : rcs_postback_data) ~phone_number:(phone_number_ : phone_number)
    () =
  ({ text = text_; postback_data = postback_data_; phone_number = phone_number_ }
    : rcs_dial_phone_action)

let make_rcs_open_url_action ?application:(application_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?webview_view_mode:(webview_view_mode_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~text:(text_ : rcs_suggested_action_text) ~postback_data:(postback_data_ : rcs_postback_data)
    ~url:(url_ : rcs_open_url_value) () =
  ({
     text = text_;
     postback_data = postback_data_;
     url = url_;
     application = application_;
     webview_view_mode = webview_view_mode_;
   }
    : rcs_open_url_action)

let make_rcs_reply_action ~text:(text_ : rcs_suggested_action_text)
    ~postback_data:(postback_data_ : rcs_postback_data) () =
  ({ text = text_; postback_data = postback_data_ } : rcs_reply_action)

let make_rcs_carousel_card_media ?thumbnail_url:(thumbnail_url_ : rcs_media_url option)
    ?height:(height_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~file_url:(file_url_ : rcs_media_url) () =
  ({ file_url = file_url_; thumbnail_url = thumbnail_url_; height = height_ }
    : rcs_carousel_card_media)

let make_rcs_carousel_card_content ?title:(title_ : rcs_card_title option)
    ?description:(description_ : rcs_card_description option)
    ?media:(media_ : rcs_carousel_card_media option)
    ?suggestions:(suggestions_ : rcs_card_suggested_action_list option) () =
  ({ title = title_; description = description_; media = media_; suggestions = suggestions_ }
    : rcs_carousel_card_content)

let make_rcs_carousel ~card_width:(card_width_ : Smaws_Lib.Smithy_api.Types.string_)
    ~card_contents:(card_contents_ : rcs_carousel_card_content_list) () =
  ({ card_width = card_width_; card_contents = card_contents_ } : rcs_carousel)

let make_rcs_card_media ?thumbnail_url:(thumbnail_url_ : rcs_media_url option)
    ?height:(height_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~file_url:(file_url_ : rcs_media_url) () =
  ({ file_url = file_url_; thumbnail_url = thumbnail_url_; height = height_ } : rcs_card_media)

let make_rcs_card_content ?title:(title_ : rcs_card_title option)
    ?description:(description_ : rcs_card_description option)
    ?media:(media_ : rcs_card_media option)
    ?suggestions:(suggestions_ : rcs_card_suggested_action_list option) () =
  ({ title = title_; description = description_; media = media_; suggestions = suggestions_ }
    : rcs_card_content)

let make_rcs_standalone_card
    ?thumbnail_image_alignment:
      (thumbnail_image_alignment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~card_orientation:(card_orientation_ : Smaws_Lib.Smithy_api.Types.string_)
    ~card_content:(card_content_ : rcs_card_content) () =
  ({
     card_orientation = card_orientation_;
     thumbnail_image_alignment = thumbnail_image_alignment_;
     card_content = card_content_;
   }
    : rcs_standalone_card)

let make_rcs_file_message ?thumbnail_url:(thumbnail_url_ : rcs_media_url option)
    ~file_url:(file_url_ : rcs_media_url) () =
  ({ file_url = file_url_; thumbnail_url = thumbnail_url_ } : rcs_file_message)

let make_rcs_text_message ~body:(body_ : rcs_text_body) () = ({ body = body_ } : rcs_text_message)

let make_rcs_message_content ?suggestions:(suggestions_ : rcs_suggested_action_list option)
    ~content:(content_ : rcs_content) () =
  ({ content = content_; suggestions = suggestions_ } : rcs_message_content)

let make_send_rcs_message_request
    ?rcs_message_content:(rcs_message_content_ : rcs_message_content option)
    ?time_to_live:(time_to_live_ : rcs_time_to_live option)
    ?message_traffic_type:(message_traffic_type_ : rcs_message_traffic_type option)
    ?fallback_configuration:(fallback_configuration_ : rcs_fallback_configuration option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?max_price:(max_price_ : max_price option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?context:(context_ : context_map option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~origination_identity:(origination_identity_ : rcs_message_origination_identity) () =
  ({
     destination_phone_number = destination_phone_number_;
     origination_identity = origination_identity_;
     rcs_message_content = rcs_message_content_;
     time_to_live = time_to_live_;
     message_traffic_type = message_traffic_type_;
     fallback_configuration = fallback_configuration_;
     protect_configuration_id = protect_configuration_id_;
     configuration_set_name = configuration_set_name_;
     max_price = max_price_;
     dry_run = dry_run_;
     context = context_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_rcs_message_request)

let make_send_notify_voice_message_request ?template_id:(template_id_ : notify_template_id option)
    ?voice_id:(voice_id_ : voice_id option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?context:(context_ : context_map option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~template_variables:(template_variables_ : template_variable_substitution_map) () =
  ({
     notify_configuration_id = notify_configuration_id_;
     destination_phone_number = destination_phone_number_;
     template_id = template_id_;
     template_variables = template_variables_;
     voice_id = voice_id_;
     time_to_live = time_to_live_;
     context = context_;
     configuration_set_name = configuration_set_name_;
     dry_run = dry_run_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_notify_voice_message_request)

let make_send_notify_text_message_request ?template_id:(template_id_ : notify_template_id option)
    ?time_to_live:(time_to_live_ : time_to_live option) ?context:(context_ : context_map option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~template_variables:(template_variables_ : template_variable_substitution_map) () =
  ({
     notify_configuration_id = notify_configuration_id_;
     destination_phone_number = destination_phone_number_;
     template_id = template_id_;
     template_variables = template_variables_;
     time_to_live = time_to_live_;
     context = context_;
     configuration_set_name = configuration_set_name_;
     dry_run = dry_run_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_notify_text_message_request)

let make_send_media_message_request ?message_body:(message_body_ : text_message_body option)
    ?media_urls:(media_urls_ : media_url_list option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?max_price:(max_price_ : max_price option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?context:(context_ : context_map option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~origination_identity:(origination_identity_ : media_message_origination_identity) () =
  ({
     destination_phone_number = destination_phone_number_;
     origination_identity = origination_identity_;
     message_body = message_body_;
     media_urls = media_urls_;
     configuration_set_name = configuration_set_name_;
     max_price = max_price_;
     time_to_live = time_to_live_;
     context = context_;
     dry_run = dry_run_;
     protect_configuration_id = protect_configuration_id_;
     message_feedback_enabled = message_feedback_enabled_;
   }
    : send_media_message_request)

let make_send_destination_number_verification_code_request
    ?language_code:(language_code_ : language_code option)
    ?origination_identity:(origination_identity_ : verification_message_origination_identity option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?context:(context_ : context_map option)
    ?destination_country_parameters:
      (destination_country_parameters_ : destination_country_parameters option)
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn)
    ~verification_channel:(verification_channel_ : verification_channel) () =
  ({
     verified_destination_number_id = verified_destination_number_id_;
     verification_channel = verification_channel_;
     language_code = language_code_;
     origination_identity = origination_identity_;
     configuration_set_name = configuration_set_name_;
     context = context_;
     destination_country_parameters = destination_country_parameters_;
   }
    : send_destination_number_verification_code_request)

let make_request_sender_id_request ?message_types:(message_types_ : message_type_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ~sender_id:(sender_id_ : sender_id) ~iso_country_code:(iso_country_code_ : iso_country_code) ()
    =
  ({
     sender_id = sender_id_;
     iso_country_code = iso_country_code_;
     message_types = message_types_;
     deletion_protection_enabled = deletion_protection_enabled_;
     tags = tags_;
     client_token = client_token_;
   }
    : request_sender_id_request)

let make_request_phone_number_request
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?pool_id:(pool_id_ : pool_id_or_arn option)
    ?registration_id:(registration_id_ : registration_id_or_arn option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?tags:(tags_ : tag_list option) ?client_token:(client_token_ : client_token option)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~message_type:(message_type_ : message_type)
    ~number_capabilities:(number_capabilities_ : number_capability_list)
    ~number_type:(number_type_ : requestable_number_type) () =
  ({
     iso_country_code = iso_country_code_;
     message_type = message_type_;
     number_capabilities = number_capabilities_;
     number_type = number_type_;
     opt_out_list_name = opt_out_list_name_;
     pool_id = pool_id_;
     registration_id = registration_id_;
     international_sending_enabled = international_sending_enabled_;
     deletion_protection_enabled = deletion_protection_enabled_;
     tags = tags_;
     client_token = client_token_;
   }
    : request_phone_number_request)

let make_release_sender_id_request ~sender_id:(sender_id_ : sender_id_or_arn)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({ sender_id = sender_id_; iso_country_code = iso_country_code_ } : release_sender_id_request)

let make_release_phone_number_request ~phone_number_id:(phone_number_id_ : phone_number_id_or_arn)
    () =
  ({ phone_number_id = phone_number_id_ } : release_phone_number_request)

let make_put_resource_policy_request ~resource_arn:(resource_arn_ : amazon_resource_name)
    ~policy:(policy_ : resource_policy) () =
  ({ resource_arn = resource_arn_; policy = policy_ } : put_resource_policy_request)

let make_put_registration_field_value_request
    ?select_choices:(select_choices_ : select_choice_list option)
    ?text_value:(text_value_ : text_value option)
    ?registration_attachment_id:
      (registration_attachment_id_ : registration_attachment_id_or_arn option)
    ~registration_id:(registration_id_ : registration_id_or_arn)
    ~field_path:(field_path_ : field_path) () =
  ({
     registration_id = registration_id_;
     field_path = field_path_;
     select_choices = select_choices_;
     text_value = text_value_;
     registration_attachment_id = registration_attachment_id_;
   }
    : put_registration_field_value_request)

let make_put_protect_configuration_rule_set_number_override_request
    ?client_token:(client_token_ : client_token option)
    ?expiration_timestamp:(expiration_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~action:(action_ : protect_configuration_rule_override_action) () =
  ({
     client_token = client_token_;
     protect_configuration_id = protect_configuration_id_;
     destination_phone_number = destination_phone_number_;
     action = action_;
     expiration_timestamp = expiration_timestamp_;
   }
    : put_protect_configuration_rule_set_number_override_request)

let make_put_opted_out_number_request
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn)
    ~opted_out_number:(opted_out_number_ : phone_number) () =
  ({ opt_out_list_name = opt_out_list_name_; opted_out_number = opted_out_number_ }
    : put_opted_out_number_request)

let make_put_message_feedback_request ~message_id:(message_id_ : message_id)
    ~message_feedback_status:(message_feedback_status_ : message_feedback_status) () =
  ({ message_id = message_id_; message_feedback_status = message_feedback_status_ }
    : put_message_feedback_request)

let make_put_keyword_request ?keyword_action:(keyword_action_ : keyword_action option)
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn)
    ~keyword:(keyword_ : keyword) ~keyword_message:(keyword_message_ : keyword_message) () =
  ({
     origination_identity = origination_identity_;
     keyword = keyword_;
     keyword_message = keyword_message_;
     keyword_action = keyword_action_;
   }
    : put_keyword_request)
