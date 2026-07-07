open Types

let make_verify_destination_number_request
    ~verification_code:(verification_code_ : verification_code)
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn) () =
  ({
     verification_code = verification_code_;
     verified_destination_number_id = verified_destination_number_id_;
   }
    : verify_destination_number_request)

let make_validation_exception_field ~message:(message_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ message = message_; name = name_ } : validation_exception_field)

let make_verified_destination_number_information
    ?rcs_agent_id:(rcs_agent_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : verification_status)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~verified_destination_number_id:
      (verified_destination_number_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~verified_destination_number_arn:
      (verified_destination_number_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     created_timestamp = created_timestamp_;
     rcs_agent_id = rcs_agent_id_;
     status = status_;
     destination_phone_number = destination_phone_number_;
     verified_destination_number_id = verified_destination_number_id_;
     verified_destination_number_arn = verified_destination_number_arn_;
   }
    : verified_destination_number_information)

let make_verified_destination_number_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : verified_destination_number_filter_name) () =
  ({ values = values_; name = name_ } : verified_destination_number_filter)

let make_update_sender_id_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~sender_id:(sender_id_ : sender_id_or_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     iso_country_code = iso_country_code_;
     sender_id = sender_id_;
   }
    : update_sender_id_request)

let make_update_rcs_agent_request
    ?two_way_rcs_events_enabled:(two_way_rcs_events_enabled_ : rcs_event_type_list option)
    ?two_way_media_s3_role:(two_way_media_s3_role_ : iam_role_arn_or_unset option)
    ?two_way_media_s3_key_prefix:(two_way_media_s3_key_prefix_ : two_way_media_s3_key_prefix option)
    ?two_way_media_s3_bucket_name:
      (two_way_media_s3_bucket_name_ : two_way_media_s3_bucket_name_or_unset option)
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({
     two_way_rcs_events_enabled = two_way_rcs_events_enabled_;
     two_way_media_s3_role = two_way_media_s3_role_;
     two_way_media_s3_key_prefix = two_way_media_s3_key_prefix_;
     two_way_media_s3_bucket_name = two_way_media_s3_bucket_name_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     deletion_protection_enabled = deletion_protection_enabled_;
     rcs_agent_id = rcs_agent_id_;
   }
    : update_rcs_agent_request)

let make_update_protect_configuration_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     protect_configuration_id = protect_configuration_id_;
   }
    : update_protect_configuration_request)

let make_protect_configuration_country_rule_set_information
    ~protect_status:(protect_status_ : protect_status) () =
  ({ protect_status = protect_status_ } : protect_configuration_country_rule_set_information)

let make_update_protect_configuration_country_rule_set_request
    ~country_rule_set_updates:(country_rule_set_updates_ : protect_configuration_country_rule_set)
    ~number_capability:(number_capability_ : number_capability)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     country_rule_set_updates = country_rule_set_updates_;
     number_capability = number_capability_;
     protect_configuration_id = protect_configuration_id_;
   }
    : update_protect_configuration_country_rule_set_request)

let make_update_pool_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?shared_routes_enabled:(shared_routes_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     shared_routes_enabled = shared_routes_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_enabled = two_way_enabled_;
     pool_id = pool_id_;
   }
    : update_pool_request)

let make_update_phone_number_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~phone_number_id:(phone_number_id_ : phone_number_id_or_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     international_sending_enabled = international_sending_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_enabled = two_way_enabled_;
     phone_number_id = phone_number_id_;
   }
    : update_phone_number_request)

let make_update_notify_configuration_request
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enabled_channels:(enabled_channels_ : notify_enabled_channels_list option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?pool_id:(pool_id_ : notify_pool_id_or_unset option)
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     enabled_channels = enabled_channels_;
     enabled_countries = enabled_countries_;
     pool_id = pool_id_;
     default_template_id = default_template_id_;
     notify_configuration_id = notify_configuration_id_;
   }
    : update_notify_configuration_request)

let make_cloud_watch_logs_destination ~log_group_arn:(log_group_arn_ : log_group_arn)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) () =
  ({ log_group_arn = log_group_arn_; iam_role_arn = iam_role_arn_ } : cloud_watch_logs_destination)

let make_kinesis_firehose_destination
    ~delivery_stream_arn:(delivery_stream_arn_ : delivery_stream_arn)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) () =
  ({ delivery_stream_arn = delivery_stream_arn_; iam_role_arn = iam_role_arn_ }
    : kinesis_firehose_destination)

let make_sns_destination ~topic_arn:(topic_arn_ : sns_topic_arn) () =
  ({ topic_arn = topic_arn_ } : sns_destination)

let make_event_destination ?sns_destination:(sns_destination_ : sns_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ~matching_event_types:(matching_event_types_ : event_type_list)
    ~enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~event_destination_name:(event_destination_name_ : event_destination_name) () =
  ({
     sns_destination = sns_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     matching_event_types = matching_event_types_;
     enabled = enabled_;
     event_destination_name = event_destination_name_;
   }
    : event_destination)

let make_update_event_destination_request
    ?sns_destination:(sns_destination_ : sns_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ?matching_event_types:(matching_event_types_ : event_type_list option)
    ?enabled:(enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     sns_destination = sns_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     matching_event_types = matching_event_types_;
     enabled = enabled_;
     event_destination_name = event_destination_name_;
     configuration_set_name = configuration_set_name_;
   }
    : update_event_destination_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_text_validation ~pattern:(pattern_ : Smaws_Lib.Smithy_api.Types.string_)
    ~max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~min_length:(min_length_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ pattern = pattern_; max_length = max_length_; min_length = min_length_ } : text_validation)

let make_testing_agent_information
    ?testing_agent_id:(testing_agent_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : testing_agent_status) () =
  ({ registration_id = registration_id_; testing_agent_id = testing_agent_id_; status = status_ }
    : testing_agent_information)

let make_template_variable_metadata ?source:(source_ : template_variable_source option)
    ?sample:(sample_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?pattern:(pattern_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_value:(default_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?max_value:(max_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?min_value:(min_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~required:(required_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~type_:(type__ : template_variable_type) () =
  ({
     source = source_;
     sample = sample_;
     pattern = pattern_;
     default_value = default_value_;
     max_value = max_value_;
     min_value = min_value_;
     max_length = max_length_;
     description = description_;
     required = required_;
     type_ = type__;
   }
    : template_variable_metadata)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : non_empty_tag_list)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_supported_association ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~disassociation_behavior:(disassociation_behavior_ : registration_disassociation_behavior)
    ~association_behavior:(association_behavior_ : registration_association_behavior)
    ~resource_type:(resource_type_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     disassociation_behavior = disassociation_behavior_;
     association_behavior = association_behavior_;
     iso_country_code = iso_country_code_;
     resource_type = resource_type_;
   }
    : supported_association)

let make_registration_version_status_history
    ?archived_timestamp:(archived_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?revoked_timestamp:(revoked_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?denied_timestamp:(denied_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?discarded_timestamp:(discarded_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?approved_timestamp:(approved_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?requires_authentication_timestamp:
      (requires_authentication_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?reviewing_timestamp:(reviewing_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?aws_reviewing_timestamp:
      (aws_reviewing_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?submitted_timestamp:(submitted_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ~draft_timestamp:(draft_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     archived_timestamp = archived_timestamp_;
     revoked_timestamp = revoked_timestamp_;
     denied_timestamp = denied_timestamp_;
     discarded_timestamp = discarded_timestamp_;
     approved_timestamp = approved_timestamp_;
     requires_authentication_timestamp = requires_authentication_timestamp_;
     reviewing_timestamp = reviewing_timestamp_;
     aws_reviewing_timestamp = aws_reviewing_timestamp_;
     submitted_timestamp = submitted_timestamp_;
     draft_timestamp = draft_timestamp_;
   }
    : registration_version_status_history)

let make_submit_registration_version_request
    ?aws_review:(aws_review_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ aws_review = aws_review_; registration_id = registration_id_ }
    : submit_registration_version_request)

let make_spend_limit ~overridden:(overridden_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~max_limit:(max_limit_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~enforced_limit:(enforced_limit_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~name:(name_ : spend_limit_name) () =
  ({
     overridden = overridden_;
     max_limit = max_limit_;
     enforced_limit = enforced_limit_;
     name = name_;
   }
    : spend_limit)

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

let make_set_default_sender_id_request ~sender_id:(sender_id_ : sender_id)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ sender_id = sender_id_; configuration_set_name = configuration_set_name_ }
    : set_default_sender_id_request)

let make_set_default_message_type_request ~message_type:(message_type_ : message_type)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ message_type = message_type_; configuration_set_name = configuration_set_name_ }
    : set_default_message_type_request)

let make_set_default_message_feedback_enabled_request
    ~message_feedback_enabled:(message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     configuration_set_name = configuration_set_name_;
   }
    : set_default_message_feedback_enabled_request)

let make_set_account_default_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({ protect_configuration_id = protect_configuration_id_ }
    : set_account_default_protect_configuration_request)

let make_sender_id_and_country ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~sender_id:(sender_id_ : sender_id_or_arn) () =
  ({ iso_country_code = iso_country_code_; sender_id = sender_id_ } : sender_id_and_country)

let make_sender_id_information
    ?registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~registered:(registered_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~monthly_leasing_price:(monthly_leasing_price_ : Smaws_Lib.Smithy_api.Types.string_)
    ~message_types:(message_types_ : message_type_list)
    ~iso_country_code:(iso_country_code_ : iso_country_code) ~sender_id:(sender_id_ : sender_id)
    ~sender_id_arn:(sender_id_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     registration_id = registration_id_;
     registered = registered_;
     deletion_protection_enabled = deletion_protection_enabled_;
     monthly_leasing_price = monthly_leasing_price_;
     message_types = message_types_;
     iso_country_code = iso_country_code_;
     sender_id = sender_id_;
     sender_id_arn = sender_id_arn_;
   }
    : sender_id_information)

let make_sender_id_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : sender_id_filter_name) () =
  ({ values = values_; name = name_ } : sender_id_filter)

let make_send_voice_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?context:(context_ : context_map option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?max_price_per_minute:(max_price_per_minute_ : max_price option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?voice_id:(voice_id_ : voice_id option)
    ?message_body_text_type:(message_body_text_type_ : voice_message_body_text_type option)
    ?message_body:(message_body_ : voice_message_body option)
    ~origination_identity:(origination_identity_ : voice_message_origination_identity)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     protect_configuration_id = protect_configuration_id_;
     dry_run = dry_run_;
     context = context_;
     time_to_live = time_to_live_;
     max_price_per_minute = max_price_per_minute_;
     configuration_set_name = configuration_set_name_;
     voice_id = voice_id_;
     message_body_text_type = message_body_text_type_;
     message_body = message_body_;
     origination_identity = origination_identity_;
     destination_phone_number = destination_phone_number_;
   }
    : send_voice_message_request)

let make_send_text_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?destination_country_parameters:
      (destination_country_parameters_ : destination_country_parameters option)
    ?context:(context_ : context_map option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?max_price:(max_price_ : max_price option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?keyword:(keyword_ : keyword option) ?message_type:(message_type_ : message_type option)
    ?message_body:(message_body_ : text_message_body option)
    ?origination_identity:(origination_identity_ : text_message_origination_identity option)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     protect_configuration_id = protect_configuration_id_;
     dry_run = dry_run_;
     destination_country_parameters = destination_country_parameters_;
     context = context_;
     time_to_live = time_to_live_;
     max_price = max_price_;
     configuration_set_name = configuration_set_name_;
     keyword = keyword_;
     message_type = message_type_;
     message_body = message_body_;
     origination_identity = origination_identity_;
     destination_phone_number = destination_phone_number_;
   }
    : send_text_message_request)

let make_rcs_text_message ~body:(body_ : rcs_text_body) () = ({ body = body_ } : rcs_text_message)

let make_rcs_file_message ?thumbnail_url:(thumbnail_url_ : rcs_media_url option)
    ~file_url:(file_url_ : rcs_media_url) () =
  ({ thumbnail_url = thumbnail_url_; file_url = file_url_ } : rcs_file_message)

let make_rcs_card_media ?height:(height_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?thumbnail_url:(thumbnail_url_ : rcs_media_url option) ~file_url:(file_url_ : rcs_media_url) ()
    =
  ({ height = height_; thumbnail_url = thumbnail_url_; file_url = file_url_ } : rcs_card_media)

let make_rcs_reply_action ~postback_data:(postback_data_ : rcs_postback_data)
    ~text:(text_ : rcs_suggested_action_text) () =
  ({ postback_data = postback_data_; text = text_ } : rcs_reply_action)

let make_rcs_open_url_action
    ?webview_view_mode:(webview_view_mode_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?application:(application_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~url:(url_ : rcs_open_url_value) ~postback_data:(postback_data_ : rcs_postback_data)
    ~text:(text_ : rcs_suggested_action_text) () =
  ({
     webview_view_mode = webview_view_mode_;
     application = application_;
     url = url_;
     postback_data = postback_data_;
     text = text_;
   }
    : rcs_open_url_action)

let make_rcs_dial_phone_action ~phone_number:(phone_number_ : phone_number)
    ~postback_data:(postback_data_ : rcs_postback_data) ~text:(text_ : rcs_suggested_action_text) ()
    =
  ({ phone_number = phone_number_; postback_data = postback_data_; text = text_ }
    : rcs_dial_phone_action)

let make_rcs_show_location_action ?label:(label_ : rcs_location_label option)
    ~longitude:(longitude_ : Smaws_Lib.Smithy_api.Types.double)
    ~latitude:(latitude_ : Smaws_Lib.Smithy_api.Types.double)
    ~postback_data:(postback_data_ : rcs_postback_data) ~text:(text_ : rcs_suggested_action_text) ()
    =
  ({
     label = label_;
     longitude = longitude_;
     latitude = latitude_;
     postback_data = postback_data_;
     text = text_;
   }
    : rcs_show_location_action)

let make_rcs_request_location_action ~postback_data:(postback_data_ : rcs_postback_data)
    ~text:(text_ : rcs_suggested_action_text) () =
  ({ postback_data = postback_data_; text = text_ } : rcs_request_location_action)

let make_rcs_create_calendar_event_action
    ?description:(description_ : rcs_calendar_event_description option)
    ~end_time:(end_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~start_time:(start_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~title:(title_ : rcs_calendar_event_title) ~postback_data:(postback_data_ : rcs_postback_data)
    ~text:(text_ : rcs_suggested_action_text) () =
  ({
     description = description_;
     end_time = end_time_;
     start_time = start_time_;
     title = title_;
     postback_data = postback_data_;
     text = text_;
   }
    : rcs_create_calendar_event_action)

let make_rcs_card_content ?suggestions:(suggestions_ : rcs_card_suggested_action_list option)
    ?media:(media_ : rcs_card_media option)
    ?description:(description_ : rcs_card_description option)
    ?title:(title_ : rcs_card_title option) () =
  ({ suggestions = suggestions_; media = media_; description = description_; title = title_ }
    : rcs_card_content)

let make_rcs_standalone_card
    ?thumbnail_image_alignment:
      (thumbnail_image_alignment_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~card_content:(card_content_ : rcs_card_content)
    ~card_orientation:(card_orientation_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     card_content = card_content_;
     thumbnail_image_alignment = thumbnail_image_alignment_;
     card_orientation = card_orientation_;
   }
    : rcs_standalone_card)

let make_rcs_carousel_card_media ?height:(height_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?thumbnail_url:(thumbnail_url_ : rcs_media_url option) ~file_url:(file_url_ : rcs_media_url) ()
    =
  ({ height = height_; thumbnail_url = thumbnail_url_; file_url = file_url_ }
    : rcs_carousel_card_media)

let make_rcs_carousel_card_content
    ?suggestions:(suggestions_ : rcs_card_suggested_action_list option)
    ?media:(media_ : rcs_carousel_card_media option)
    ?description:(description_ : rcs_card_description option)
    ?title:(title_ : rcs_card_title option) () =
  ({ suggestions = suggestions_; media = media_; description = description_; title = title_ }
    : rcs_carousel_card_content)

let make_rcs_carousel ~card_contents:(card_contents_ : rcs_carousel_card_content_list)
    ~card_width:(card_width_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ card_contents = card_contents_; card_width = card_width_ } : rcs_carousel)

let make_rcs_message_content ?suggestions:(suggestions_ : rcs_suggested_action_list option)
    ~content:(content_ : rcs_content) () =
  ({ suggestions = suggestions_; content = content_ } : rcs_message_content)

let make_rcs_fallback_configuration
    ?origination_identity:(origination_identity_ : rcs_fallback_origination_identity option)
    ?media_urls:(media_urls_ : media_url_list option)
    ?message_body:(message_body_ : rcs_fallback_message_body option)
    ~channel:(channel_ : rcs_fallback_channel) () =
  ({
     origination_identity = origination_identity_;
     media_urls = media_urls_;
     message_body = message_body_;
     channel = channel_;
   }
    : rcs_fallback_configuration)

let make_send_rcs_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?context:(context_ : context_map option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?max_price:(max_price_ : max_price option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?fallback_configuration:(fallback_configuration_ : rcs_fallback_configuration option)
    ?message_traffic_type:(message_traffic_type_ : rcs_message_traffic_type option)
    ?time_to_live:(time_to_live_ : rcs_time_to_live option)
    ?rcs_message_content:(rcs_message_content_ : rcs_message_content option)
    ~origination_identity:(origination_identity_ : rcs_message_origination_identity)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     context = context_;
     dry_run = dry_run_;
     max_price = max_price_;
     configuration_set_name = configuration_set_name_;
     protect_configuration_id = protect_configuration_id_;
     fallback_configuration = fallback_configuration_;
     message_traffic_type = message_traffic_type_;
     time_to_live = time_to_live_;
     rcs_message_content = rcs_message_content_;
     origination_identity = origination_identity_;
     destination_phone_number = destination_phone_number_;
   }
    : send_rcs_message_request)

let make_send_notify_voice_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?context:(context_ : context_map option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?voice_id:(voice_id_ : voice_id option) ?template_id:(template_id_ : notify_template_id option)
    ~template_variables:(template_variables_ : template_variable_substitution_map)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     dry_run = dry_run_;
     configuration_set_name = configuration_set_name_;
     context = context_;
     time_to_live = time_to_live_;
     voice_id = voice_id_;
     template_variables = template_variables_;
     template_id = template_id_;
     destination_phone_number = destination_phone_number_;
     notify_configuration_id = notify_configuration_id_;
   }
    : send_notify_voice_message_request)

let make_send_notify_text_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?context:(context_ : context_map option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?template_id:(template_id_ : notify_template_id option)
    ~template_variables:(template_variables_ : template_variable_substitution_map)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     dry_run = dry_run_;
     configuration_set_name = configuration_set_name_;
     context = context_;
     time_to_live = time_to_live_;
     template_variables = template_variables_;
     template_id = template_id_;
     destination_phone_number = destination_phone_number_;
     notify_configuration_id = notify_configuration_id_;
   }
    : send_notify_text_message_request)

let make_send_media_message_request
    ?message_feedback_enabled:
      (message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?dry_run:(dry_run_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?context:(context_ : context_map option) ?time_to_live:(time_to_live_ : time_to_live option)
    ?max_price:(max_price_ : max_price option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?media_urls:(media_urls_ : media_url_list option)
    ?message_body:(message_body_ : text_message_body option)
    ~origination_identity:(origination_identity_ : media_message_origination_identity)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     message_feedback_enabled = message_feedback_enabled_;
     protect_configuration_id = protect_configuration_id_;
     dry_run = dry_run_;
     context = context_;
     time_to_live = time_to_live_;
     max_price = max_price_;
     configuration_set_name = configuration_set_name_;
     media_urls = media_urls_;
     message_body = message_body_;
     origination_identity = origination_identity_;
     destination_phone_number = destination_phone_number_;
   }
    : send_media_message_request)

let make_send_destination_number_verification_code_request
    ?destination_country_parameters:
      (destination_country_parameters_ : destination_country_parameters option)
    ?context:(context_ : context_map option)
    ?configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn option)
    ?origination_identity:(origination_identity_ : verification_message_origination_identity option)
    ?language_code:(language_code_ : language_code option)
    ~verification_channel:(verification_channel_ : verification_channel)
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn) () =
  ({
     destination_country_parameters = destination_country_parameters_;
     context = context_;
     configuration_set_name = configuration_set_name_;
     origination_identity = origination_identity_;
     language_code = language_code_;
     verification_channel = verification_channel_;
     verified_destination_number_id = verified_destination_number_id_;
   }
    : send_destination_number_verification_code_request)

let make_select_validation ~options:(options_ : string_list)
    ~max_choices:(max_choices_ : Smaws_Lib.Smithy_api.Types.integer)
    ~min_choices:(min_choices_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ options = options_; max_choices = max_choices_; min_choices = min_choices_ }
    : select_validation)

let make_select_option_description
    ?description:(description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?title:(title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~option_:(option__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ description = description_; title = title_; option_ = option__ } : select_option_description)

let make_request_sender_id_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?message_types:(message_types_ : message_type_list option)
    ~iso_country_code:(iso_country_code_ : iso_country_code) ~sender_id:(sender_id_ : sender_id) ()
    =
  ({
     client_token = client_token_;
     tags = tags_;
     deletion_protection_enabled = deletion_protection_enabled_;
     message_types = message_types_;
     iso_country_code = iso_country_code_;
     sender_id = sender_id_;
   }
    : request_sender_id_request)

let make_request_phone_number_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?registration_id:(registration_id_ : registration_id_or_arn option)
    ?pool_id:(pool_id_ : pool_id_or_arn option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ~number_type:(number_type_ : requestable_number_type)
    ~number_capabilities:(number_capabilities_ : number_capability_list)
    ~message_type:(message_type_ : message_type)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({
     client_token = client_token_;
     tags = tags_;
     deletion_protection_enabled = deletion_protection_enabled_;
     international_sending_enabled = international_sending_enabled_;
     registration_id = registration_id_;
     pool_id = pool_id_;
     opt_out_list_name = opt_out_list_name_;
     number_type = number_type_;
     number_capabilities = number_capabilities_;
     message_type = message_type_;
     iso_country_code = iso_country_code_;
   }
    : request_phone_number_request)

let make_release_sender_id_request ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~sender_id:(sender_id_ : sender_id_or_arn) () =
  ({ iso_country_code = iso_country_code_; sender_id = sender_id_ } : release_sender_id_request)

let make_release_phone_number_request ~phone_number_id:(phone_number_id_ : phone_number_id_or_arn)
    () =
  ({ phone_number_id = phone_number_id_ } : release_phone_number_request)

let make_registration_denied_reason_information
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_)
    ~reason:(reason_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     documentation_link = documentation_link_;
     documentation_title = documentation_title_;
     long_description = long_description_;
     short_description = short_description_;
     reason = reason_;
   }
    : registration_denied_reason_information)

let make_registration_version_information
    ?feedback:(feedback_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?denied_reasons:(denied_reasons_ : registration_denied_reason_information_list option)
    ~registration_version_status_history:
      (registration_version_status_history_ : registration_version_status_history)
    ~registration_version_status:(registration_version_status_ : registration_version_status)
    ~version_number:(version_number_ : registration_version_number) () =
  ({
     feedback = feedback_;
     denied_reasons = denied_reasons_;
     registration_version_status_history = registration_version_status_history_;
     registration_version_status = registration_version_status_;
     version_number = version_number_;
   }
    : registration_version_information)

let make_registration_version_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : registration_version_filter_name) () =
  ({ values = values_; name = name_ } : registration_version_filter)

let make_registration_type_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : registration_type_filter_name) () =
  ({ values = values_; name = name_ } : registration_type_filter)

let make_registration_type_display_hints
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     documentation_link = documentation_link_;
     documentation_title = documentation_title_;
     long_description = long_description_;
     short_description = short_description_;
     title = title_;
   }
    : registration_type_display_hints)

let make_registration_type_definition
    ?supported_associations:(supported_associations_ : supported_association_list option)
    ~display_hints:(display_hints_ : registration_type_display_hints)
    ~registration_type:(registration_type_ : registration_type) () =
  ({
     display_hints = display_hints_;
     supported_associations = supported_associations_;
     registration_type = registration_type_;
   }
    : registration_type_definition)

let make_registration_section_display_hints
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     documentation_link = documentation_link_;
     documentation_title = documentation_title_;
     long_description = long_description_;
     short_description = short_description_;
     title = title_;
   }
    : registration_section_display_hints)

let make_registration_section_definition
    ~display_hints:(display_hints_ : registration_section_display_hints)
    ~section_path:(section_path_ : section_path) () =
  ({ display_hints = display_hints_; section_path = section_path_ }
    : registration_section_definition)

let make_registration_information
    ?additional_attributes:(additional_attributes_ : string_map option)
    ?latest_denied_version_number:
      (latest_denied_version_number_ : registration_version_number option)
    ?approved_version_number:(approved_version_number_ : registration_version_number option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~current_version_number:(current_version_number_ : registration_version_number)
    ~registration_status:(registration_status_ : registration_status)
    ~registration_type:(registration_type_ : registration_type)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~registration_arn:(registration_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     created_timestamp = created_timestamp_;
     additional_attributes = additional_attributes_;
     latest_denied_version_number = latest_denied_version_number_;
     approved_version_number = approved_version_number_;
     current_version_number = current_version_number_;
     registration_status = registration_status_;
     registration_type = registration_type_;
     registration_id = registration_id_;
     registration_arn = registration_arn_;
   }
    : registration_information)

let make_registration_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : registration_filter_name) () =
  ({ values = values_; name = name_ } : registration_filter)

let make_registration_field_value_information
    ?feedback:(feedback_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?denied_reason:(denied_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?registration_attachment_id:
      (registration_attachment_id_ : registration_attachment_id_or_arn option)
    ?text_value:(text_value_ : text_value option)
    ?select_choices:(select_choices_ : select_choice_list option)
    ~field_path:(field_path_ : field_path) () =
  ({
     feedback = feedback_;
     denied_reason = denied_reason_;
     registration_attachment_id = registration_attachment_id_;
     text_value = text_value_;
     select_choices = select_choices_;
     field_path = field_path_;
   }
    : registration_field_value_information)

let make_registration_field_display_hints
    ?example_text_value:(example_text_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?text_validation_description:
      (text_validation_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?select_option_descriptions:
      (select_option_descriptions_ : select_option_descriptions_list option)
    ?documentation_link:(documentation_link_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?documentation_title:(documentation_title_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?long_description:(long_description_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~short_description:(short_description_ : Smaws_Lib.Smithy_api.Types.string_)
    ~title:(title_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     example_text_value = example_text_value_;
     text_validation_description = text_validation_description_;
     select_option_descriptions = select_option_descriptions_;
     documentation_link = documentation_link_;
     documentation_title = documentation_title_;
     long_description = long_description_;
     short_description = short_description_;
     title = title_;
   }
    : registration_field_display_hints)

let make_registration_field_definition ?text_validation:(text_validation_ : text_validation option)
    ?select_validation:(select_validation_ : select_validation option)
    ~display_hints:(display_hints_ : registration_field_display_hints)
    ~field_requirement:(field_requirement_ : field_requirement)
    ~field_type:(field_type_ : field_type) ~field_path:(field_path_ : field_path)
    ~section_path:(section_path_ : section_path) () =
  ({
     display_hints = display_hints_;
     text_validation = text_validation_;
     select_validation = select_validation_;
     field_requirement = field_requirement_;
     field_type = field_type_;
     field_path = field_path_;
     section_path = section_path_;
   }
    : registration_field_definition)

let make_registration_attachments_information
    ?attachment_url:(attachment_url_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attachment_upload_error_reason:
      (attachment_upload_error_reason_ : attachment_upload_error_reason option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~attachment_status:(attachment_status_ : attachment_status)
    ~registration_attachment_id:(registration_attachment_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~registration_attachment_arn:(registration_attachment_arn_ : Smaws_Lib.Smithy_api.Types.string_)
    () =
  ({
     attachment_url = attachment_url_;
     created_timestamp = created_timestamp_;
     attachment_upload_error_reason = attachment_upload_error_reason_;
     attachment_status = attachment_status_;
     registration_attachment_id = registration_attachment_id_;
     registration_attachment_arn = registration_attachment_arn_;
   }
    : registration_attachments_information)

let make_registration_attachment_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : registration_attachment_filter_name) () =
  ({ values = values_; name = name_ } : registration_attachment_filter)

let make_registration_association_metadata ?phone_number:(phone_number_ : phone_number option)
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~resource_type:(resource_type_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_id:(resource_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~resource_arn:(resource_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     phone_number = phone_number_;
     iso_country_code = iso_country_code_;
     resource_type = resource_type_;
     resource_id = resource_id_;
     resource_arn = resource_arn_;
   }
    : registration_association_metadata)

let make_registration_association_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : registration_association_filter_name) () =
  ({ values = values_; name = name_ } : registration_association_filter)

let make_rcs_agent_information ?testing_agent:(testing_agent_ : testing_agent_information option)
    ?two_way_rcs_events_enabled:(two_way_rcs_events_enabled_ : rcs_event_type_list option)
    ?two_way_media_s3_role:(two_way_media_s3_role_ : iam_role_arn option)
    ?two_way_media_s3_key_prefix:(two_way_media_s3_key_prefix_ : two_way_media_s3_key_prefix option)
    ?two_way_media_s3_bucket_name:
      (two_way_media_s3_bucket_name_ : two_way_media_s3_bucket_name option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name option)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~status:(status_ : rcs_agent_status)
    ~rcs_agent_id:(rcs_agent_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~rcs_agent_arn:(rcs_agent_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     testing_agent = testing_agent_;
     two_way_rcs_events_enabled = two_way_rcs_events_enabled_;
     two_way_media_s3_role = two_way_media_s3_role_;
     two_way_media_s3_key_prefix = two_way_media_s3_key_prefix_;
     two_way_media_s3_bucket_name = two_way_media_s3_bucket_name_;
     pool_id = pool_id_;
     two_way_enabled = two_way_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     opt_out_list_name = opt_out_list_name_;
     deletion_protection_enabled = deletion_protection_enabled_;
     created_timestamp = created_timestamp_;
     status = status_;
     rcs_agent_id = rcs_agent_id_;
     rcs_agent_arn = rcs_agent_arn_;
   }
    : rcs_agent_information)

let make_rcs_agent_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : rcs_agent_filter_name) () =
  ({ values = values_; name = name_ } : rcs_agent_filter)

let make_put_resource_policy_request ~policy:(policy_ : resource_policy)
    ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ policy = policy_; resource_arn = resource_arn_ } : put_resource_policy_request)

let make_put_registration_field_value_request
    ?registration_attachment_id:
      (registration_attachment_id_ : registration_attachment_id_or_arn option)
    ?text_value:(text_value_ : text_value option)
    ?select_choices:(select_choices_ : select_choice_list option)
    ~field_path:(field_path_ : field_path)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     registration_attachment_id = registration_attachment_id_;
     text_value = text_value_;
     select_choices = select_choices_;
     field_path = field_path_;
     registration_id = registration_id_;
   }
    : put_registration_field_value_request)

let make_put_protect_configuration_rule_set_number_override_request
    ?expiration_timestamp:(expiration_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?client_token:(client_token_ : client_token option)
    ~action:(action_ : protect_configuration_rule_override_action)
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     expiration_timestamp = expiration_timestamp_;
     action = action_;
     destination_phone_number = destination_phone_number_;
     protect_configuration_id = protect_configuration_id_;
     client_token = client_token_;
   }
    : put_protect_configuration_rule_set_number_override_request)

let make_put_opted_out_number_request ~opted_out_number:(opted_out_number_ : phone_number)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({ opted_out_number = opted_out_number_; opt_out_list_name = opt_out_list_name_ }
    : put_opted_out_number_request)

let make_put_message_feedback_request
    ~message_feedback_status:(message_feedback_status_ : message_feedback_status)
    ~message_id:(message_id_ : message_id) () =
  ({ message_feedback_status = message_feedback_status_; message_id = message_id_ }
    : put_message_feedback_request)

let make_put_keyword_request ?keyword_action:(keyword_action_ : keyword_action option)
    ~keyword_message:(keyword_message_ : keyword_message) ~keyword:(keyword_ : keyword)
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn) () =
  ({
     keyword_action = keyword_action_;
     keyword_message = keyword_message_;
     keyword = keyword_;
     origination_identity = origination_identity_;
   }
    : put_keyword_request)

let make_protect_configuration_rule_set_number_override
    ?expiration_timestamp:(expiration_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~action:(action_ : protect_configuration_rule_override_action)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     expiration_timestamp = expiration_timestamp_;
     iso_country_code = iso_country_code_;
     action = action_;
     created_timestamp = created_timestamp_;
     destination_phone_number = destination_phone_number_;
   }
    : protect_configuration_rule_set_number_override)

let make_protect_configuration_rule_set_number_override_filter_item
    ~values:(values_ : filter_value_list)
    ~name:(name_ : protect_configuration_rule_set_number_override_filter_name) () =
  ({ values = values_; name = name_ } : protect_configuration_rule_set_number_override_filter_item)

let make_protect_configuration_information
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~account_default:(account_default_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id)
    ~protect_configuration_arn:(protect_configuration_arn_ : protect_configuration_arn) () =
  ({
     deletion_protection_enabled = deletion_protection_enabled_;
     account_default = account_default_;
     created_timestamp = created_timestamp_;
     protect_configuration_id = protect_configuration_id_;
     protect_configuration_arn = protect_configuration_arn_;
   }
    : protect_configuration_information)

let make_protect_configuration_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : protect_configuration_filter_name) () =
  ({ values = values_; name = name_ } : protect_configuration_filter)

let make_pool_origination_identities_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : pool_origination_identities_filter_name) () =
  ({ values = values_; name = name_ } : pool_origination_identities_filter)

let make_pool_information ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~shared_routes_enabled:(shared_routes_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~message_type:(message_type_ : message_type) ~status:(status_ : pool_status)
    ~pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~pool_arn:(pool_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     created_timestamp = created_timestamp_;
     deletion_protection_enabled = deletion_protection_enabled_;
     shared_routes_enabled = shared_routes_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_enabled = two_way_enabled_;
     message_type = message_type_;
     status = status_;
     pool_id = pool_id_;
     pool_arn = pool_arn_;
   }
    : pool_information)

let make_pool_filter ~values:(values_ : filter_value_list) ~name:(name_ : pool_filter_name) () =
  ({ values = values_; name = name_ } : pool_filter)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_registration_associations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : registration_association_filter_list option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     registration_id = registration_id_;
   }
    : list_registration_associations_request)

let make_list_protect_configuration_rule_set_number_overrides_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : list_protect_configuration_rule_set_number_override_filter option)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     protect_configuration_id = protect_configuration_id_;
   }
    : list_protect_configuration_rule_set_number_overrides_request)

let make_origination_identity_metadata ?phone_number:(phone_number_ : phone_number option)
    ~number_capabilities:(number_capabilities_ : number_capability_list)
    ~iso_country_code:(iso_country_code_ : iso_country_code)
    ~origination_identity:(origination_identity_ : Smaws_Lib.Smithy_api.Types.string_)
    ~origination_identity_arn:(origination_identity_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     phone_number = phone_number_;
     number_capabilities = number_capabilities_;
     iso_country_code = iso_country_code_;
     origination_identity = origination_identity_;
     origination_identity_arn = origination_identity_arn_;
   }
    : origination_identity_metadata)

let make_list_pool_origination_identities_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : pool_origination_identities_filter_list option)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_; pool_id = pool_id_ }
    : list_pool_origination_identities_request)

let make_notify_country_information
    ~customer_owned_identity_required:
      (customer_owned_identity_required_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~supported_tiers:(supported_tiers_ : notify_tier_list)
    ~supported_use_cases:(supported_use_cases_ : notify_use_case_list)
    ~supported_channels:(supported_channels_ : notify_enabled_channels_list)
    ~country_name:(country_name_ : Smaws_Lib.Smithy_api.Types.string_)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({
     customer_owned_identity_required = customer_owned_identity_required_;
     supported_tiers = supported_tiers_;
     supported_use_cases = supported_use_cases_;
     supported_channels = supported_channels_;
     country_name = country_name_;
     iso_country_code = iso_country_code_;
   }
    : notify_country_information)

let make_list_notify_countries_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?tier:(tier_ : notify_configuration_tier option)
    ?use_cases:(use_cases_ : notify_use_case_list option)
    ?channels:(channels_ : notify_enabled_channels_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     tier = tier_;
     use_cases = use_cases_;
     channels = channels_;
   }
    : list_notify_countries_request)

let make_get_resource_policy_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : get_resource_policy_request)

let make_get_protect_configuration_country_rule_set_request
    ~number_capability:(number_capability_ : number_capability)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({ number_capability = number_capability_; protect_configuration_id = protect_configuration_id_ }
    : get_protect_configuration_country_rule_set_request)

let make_discard_registration_version_request
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ registration_id = registration_id_ } : discard_registration_version_request)

let make_disassociate_protect_configuration_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     configuration_set_name = configuration_set_name_;
     protect_configuration_id = protect_configuration_id_;
   }
    : disassociate_protect_configuration_request)

let make_disassociate_origination_identity_request
    ?client_token:(client_token_ : client_token option)
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({
     client_token = client_token_;
     iso_country_code = iso_country_code_;
     origination_identity = origination_identity_;
     pool_id = pool_id_;
   }
    : disassociate_origination_identity_request)

let make_describe_verified_destination_numbers_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : verified_destination_number_filter_list option)
    ?destination_phone_numbers:(destination_phone_numbers_ : destination_phone_number_list option)
    ?verified_destination_number_ids:
      (verified_destination_number_ids_ : verified_destination_number_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     destination_phone_numbers = destination_phone_numbers_;
     verified_destination_number_ids = verified_destination_number_ids_;
   }
    : describe_verified_destination_numbers_request)

let make_describe_spend_limits_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_spend_limits_request)

let make_describe_sender_ids_request ?owner:(owner_ : owner option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : sender_id_filter_list option)
    ?sender_ids:(sender_ids_ : sender_id_list option) () =
  ({
     owner = owner_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     sender_ids = sender_ids_;
   }
    : describe_sender_ids_request)

let make_describe_registration_versions_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : registration_version_filter_list option)
    ?version_numbers:(version_numbers_ : registration_version_number_list option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     version_numbers = version_numbers_;
     registration_id = registration_id_;
   }
    : describe_registration_versions_request)

let make_describe_registration_type_definitions_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : registration_type_filter_list option)
    ?registration_types:(registration_types_ : registration_type_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     registration_types = registration_types_;
   }
    : describe_registration_type_definitions_request)

let make_describe_registration_section_definitions_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?section_paths:(section_paths_ : section_path_list option)
    ~registration_type:(registration_type_ : registration_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     section_paths = section_paths_;
     registration_type = registration_type_;
   }
    : describe_registration_section_definitions_request)

let make_describe_registrations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : registration_filter_list option)
    ?registration_ids:(registration_ids_ : registration_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     registration_ids = registration_ids_;
   }
    : describe_registrations_request)

let make_describe_registration_field_values_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?field_paths:(field_paths_ : field_path_list option)
    ?section_path:(section_path_ : section_path option)
    ?version_number:(version_number_ : registration_version_number option)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     field_paths = field_paths_;
     section_path = section_path_;
     version_number = version_number_;
     registration_id = registration_id_;
   }
    : describe_registration_field_values_request)

let make_describe_registration_field_definitions_request
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?field_paths:(field_paths_ : field_path_list option)
    ?section_path:(section_path_ : section_path option)
    ~registration_type:(registration_type_ : registration_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     field_paths = field_paths_;
     section_path = section_path_;
     registration_type = registration_type_;
   }
    : describe_registration_field_definitions_request)

let make_describe_registration_attachments_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : registration_attachment_filter_list option)
    ?registration_attachment_ids:
      (registration_attachment_ids_ : registration_attachment_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     registration_attachment_ids = registration_attachment_ids_;
   }
    : describe_registration_attachments_request)

let make_describe_rcs_agents_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : rcs_agent_filter_list option)
    ?owner:(owner_ : owner option) ?rcs_agent_ids:(rcs_agent_ids_ : rcs_agent_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     owner = owner_;
     rcs_agent_ids = rcs_agent_ids_;
   }
    : describe_rcs_agents_request)

let make_carrier_status_information ~status:(status_ : carrier_status)
    ~carrier_name:(carrier_name_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ status = status_; carrier_name = carrier_name_ } : carrier_status_information)

let make_country_launch_status_information
    ?rcs_platform_id:(rcs_platform_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~carrier_status:(carrier_status_ : carrier_status_information_list)
    ~registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_)
    ~status:(status_ : country_launch_status)
    ~iso_country_code:(iso_country_code_ : iso_country_code) () =
  ({
     carrier_status = carrier_status_;
     registration_id = registration_id_;
     rcs_platform_id = rcs_platform_id_;
     status = status_;
     iso_country_code = iso_country_code_;
   }
    : country_launch_status_information)

let make_country_launch_status_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : country_launch_status_filter_name) () =
  ({ values = values_; name = name_ } : country_launch_status_filter)

let make_describe_rcs_agent_country_launch_status_request
    ?next_token:(next_token_ : next_token option) ?max_results:(max_results_ : max_results option)
    ?filters:(filters_ : country_launch_status_filter_list option)
    ?iso_country_codes:(iso_country_codes_ : iso_country_code_list option)
    ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     filters = filters_;
     iso_country_codes = iso_country_codes_;
     rcs_agent_id = rcs_agent_id_;
   }
    : describe_rcs_agent_country_launch_status_request)

let make_describe_protect_configurations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : protect_configuration_filter_list option)
    ?protect_configuration_ids:(protect_configuration_ids_ : protect_configuration_id_list option)
    () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     protect_configuration_ids = protect_configuration_ids_;
   }
    : describe_protect_configurations_request)

let make_describe_pools_request ?owner:(owner_ : owner option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : pool_filter_list option) ?pool_ids:(pool_ids_ : pool_id_list option) () =
  ({
     owner = owner_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     pool_ids = pool_ids_;
   }
    : describe_pools_request)

let make_phone_number_information
    ?registration_id:(registration_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?international_sending_enabled:
      (international_sending_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean option)
    ?two_way_channel_role:(two_way_channel_role_ : iam_role_arn option)
    ?two_way_channel_arn:(two_way_channel_arn_ : two_way_channel_arn option)
    ?phone_number_id:(phone_number_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~self_managed_opt_outs_enabled:
      (self_managed_opt_outs_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~two_way_enabled:(two_way_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~monthly_leasing_price:(monthly_leasing_price_ : Smaws_Lib.Smithy_api.Types.string_)
    ~number_type:(number_type_ : number_type)
    ~number_capabilities:(number_capabilities_ : number_capability_list)
    ~message_type:(message_type_ : message_type)
    ~iso_country_code:(iso_country_code_ : iso_country_code) ~status:(status_ : number_status)
    ~phone_number:(phone_number_ : phone_number)
    ~phone_number_arn:(phone_number_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     created_timestamp = created_timestamp_;
     registration_id = registration_id_;
     pool_id = pool_id_;
     deletion_protection_enabled = deletion_protection_enabled_;
     international_sending_enabled = international_sending_enabled_;
     opt_out_list_name = opt_out_list_name_;
     self_managed_opt_outs_enabled = self_managed_opt_outs_enabled_;
     two_way_channel_role = two_way_channel_role_;
     two_way_channel_arn = two_way_channel_arn_;
     two_way_enabled = two_way_enabled_;
     monthly_leasing_price = monthly_leasing_price_;
     number_type = number_type_;
     number_capabilities = number_capabilities_;
     message_type = message_type_;
     iso_country_code = iso_country_code_;
     status = status_;
     phone_number = phone_number_;
     phone_number_id = phone_number_id_;
     phone_number_arn = phone_number_arn_;
   }
    : phone_number_information)

let make_phone_number_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : phone_number_filter_name) () =
  ({ values = values_; name = name_ } : phone_number_filter)

let make_describe_phone_numbers_request ?owner:(owner_ : owner option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : phone_number_filter_list option)
    ?phone_number_ids:(phone_number_ids_ : phone_number_id_list option) () =
  ({
     owner = owner_;
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     phone_number_ids = phone_number_ids_;
   }
    : describe_phone_numbers_request)

let make_opt_out_list_information
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name)
    ~opt_out_list_arn:(opt_out_list_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     created_timestamp = created_timestamp_;
     opt_out_list_name = opt_out_list_name_;
     opt_out_list_arn = opt_out_list_arn_;
   }
    : opt_out_list_information)

let make_describe_opt_out_lists_request ?owner:(owner_ : owner option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    ?opt_out_list_names:(opt_out_list_names_ : opt_out_list_name_list option) () =
  ({
     owner = owner_;
     max_results = max_results_;
     next_token = next_token_;
     opt_out_list_names = opt_out_list_names_;
   }
    : describe_opt_out_lists_request)

let make_opted_out_number_information
    ~end_user_opted_out:(end_user_opted_out_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~opted_out_timestamp:(opted_out_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~opted_out_number:(opted_out_number_ : phone_number) () =
  ({
     end_user_opted_out = end_user_opted_out_;
     opted_out_timestamp = opted_out_timestamp_;
     opted_out_number = opted_out_number_;
   }
    : opted_out_number_information)

let make_opted_out_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : opted_out_filter_name) () =
  ({ values = values_; name = name_ } : opted_out_filter)

let make_describe_opted_out_numbers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : opted_out_filter_list option)
    ?opted_out_numbers:(opted_out_numbers_ : opted_out_number_list option)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     opted_out_numbers = opted_out_numbers_;
     opt_out_list_name = opt_out_list_name_;
   }
    : describe_opted_out_numbers_request)

let make_notify_template_information
    ?supported_voice_ids:(supported_voice_ids_ : voice_id_list option)
    ?variables:(variables_ : template_variables_map option)
    ?content:(content_ : template_content option)
    ?language_code:(language_code_ : notify_language_code option)
    ?supported_countries:(supported_countries_ : iso_country_code_list option)
    ?status:(status_ : notify_template_status option)
    ?tier_access:(tier_access_ : notify_configuration_tier_list option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~channels:(channels_ : number_capability_list)
    ~template_type:(template_type_ : notify_template_type)
    ~version:(version_ : notify_template_version) ~template_id:(template_id_ : notify_template_id)
    () =
  ({
     created_timestamp = created_timestamp_;
     supported_voice_ids = supported_voice_ids_;
     variables = variables_;
     content = content_;
     language_code = language_code_;
     supported_countries = supported_countries_;
     status = status_;
     tier_access = tier_access_;
     channels = channels_;
     template_type = template_type_;
     version = version_;
     template_id = template_id_;
   }
    : notify_template_information)

let make_notify_template_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : notify_template_filter_name) () =
  ({ values = values_; name = name_ } : notify_template_filter)

let make_describe_notify_templates_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : notify_template_filter_list option)
    ?template_ids:(template_ids_ : notify_template_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     template_ids = template_ids_;
   }
    : describe_notify_templates_request)

let make_notify_configuration_information
    ?rejection_reason:(rejection_reason_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?pool_id:(pool_id_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.primitive_boolean)
    ~status:(status_ : notify_configuration_status)
    ~tier_upgrade_status:(tier_upgrade_status_ : tier_upgrade_status)
    ~tier:(tier_ : notify_configuration_tier)
    ~enabled_channels:(enabled_channels_ : notify_enabled_channels_list)
    ~use_case:(use_case_ : notify_configuration_use_case)
    ~display_name:(display_name_ : notify_configuration_display_name)
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id)
    ~notify_configuration_arn:(notify_configuration_arn_ : notify_configuration_arn) () =
  ({
     created_timestamp = created_timestamp_;
     deletion_protection_enabled = deletion_protection_enabled_;
     rejection_reason = rejection_reason_;
     status = status_;
     tier_upgrade_status = tier_upgrade_status_;
     tier = tier_;
     enabled_channels = enabled_channels_;
     enabled_countries = enabled_countries_;
     pool_id = pool_id_;
     default_template_id = default_template_id_;
     use_case = use_case_;
     display_name = display_name_;
     notify_configuration_id = notify_configuration_id_;
     notify_configuration_arn = notify_configuration_arn_;
   }
    : notify_configuration_information)

let make_notify_configuration_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : notify_configuration_filter_name) () =
  ({ values = values_; name = name_ } : notify_configuration_filter)

let make_describe_notify_configurations_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : notify_configuration_filter_list option)
    ?notify_configuration_ids:(notify_configuration_ids_ : notify_configuration_id_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     notify_configuration_ids = notify_configuration_ids_;
   }
    : describe_notify_configurations_request)

let make_keyword_information ~keyword_action:(keyword_action_ : keyword_action)
    ~keyword_message:(keyword_message_ : keyword_message) ~keyword:(keyword_ : keyword) () =
  ({ keyword_action = keyword_action_; keyword_message = keyword_message_; keyword = keyword_ }
    : keyword_information)

let make_keyword_filter ~values:(values_ : filter_value_list) ~name:(name_ : keyword_filter_name) ()
    =
  ({ values = values_; name = name_ } : keyword_filter)

let make_describe_keywords_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) ?filters:(filters_ : keyword_filter_list option)
    ?keywords:(keywords_ : keyword_list option)
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     keywords = keywords_;
     origination_identity = origination_identity_;
   }
    : describe_keywords_request)

let make_configuration_set_information
    ?protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn option)
    ?default_message_feedback_enabled:
      (default_message_feedback_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?default_sender_id:(default_sender_id_ : sender_id option)
    ?default_message_type:(default_message_type_ : message_type option)
    ~created_timestamp:(created_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~event_destinations:(event_destinations_ : event_destination_list)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name)
    ~configuration_set_arn:(configuration_set_arn_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     protect_configuration_id = protect_configuration_id_;
     created_timestamp = created_timestamp_;
     default_message_feedback_enabled = default_message_feedback_enabled_;
     default_sender_id = default_sender_id_;
     default_message_type = default_message_type_;
     event_destinations = event_destinations_;
     configuration_set_name = configuration_set_name_;
     configuration_set_arn = configuration_set_arn_;
   }
    : configuration_set_information)

let make_configuration_set_filter ~values:(values_ : filter_value_list)
    ~name:(name_ : configuration_set_filter_name) () =
  ({ values = values_; name = name_ } : configuration_set_filter)

let make_describe_configuration_sets_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option)
    ?filters:(filters_ : configuration_set_filter_list option)
    ?configuration_set_names:(configuration_set_names_ : configuration_set_name_list option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     filters = filters_;
     configuration_set_names = configuration_set_names_;
   }
    : describe_configuration_sets_request)

let make_account_limit ~max:(max_ : Smaws_Lib.Smithy_api.Types.primitive_long)
    ~used:(used_ : Smaws_Lib.Smithy_api.Types.primitive_long) ~name:(name_ : account_limit_name) ()
    =
  ({ max = max_; used = used_; name = name_ } : account_limit)

let make_describe_account_limits_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_account_limits_request)

let make_account_attribute ~value:(value_ : Smaws_Lib.Smithy_api.Types.string_)
    ~name:(name_ : account_attribute_name) () =
  ({ value = value_; name = name_ } : account_attribute)

let make_describe_account_attributes_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : describe_account_attributes_request)

let make_delete_voice_message_spend_limit_override_request () = (() : unit)

let make_delete_verified_destination_number_request
    ~verified_destination_number_id:
      (verified_destination_number_id_ : verified_destination_number_id_or_arn) () =
  ({ verified_destination_number_id = verified_destination_number_id_ }
    : delete_verified_destination_number_request)

let make_delete_text_message_spend_limit_override_request () = (() : unit)

let make_delete_resource_policy_request ~resource_arn:(resource_arn_ : amazon_resource_name) () =
  ({ resource_arn = resource_arn_ } : delete_resource_policy_request)

let make_delete_registration_field_value_request ~field_path:(field_path_ : field_path)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ field_path = field_path_; registration_id = registration_id_ }
    : delete_registration_field_value_request)

let make_delete_registration_attachment_request
    ~registration_attachment_id:(registration_attachment_id_ : registration_attachment_id_or_arn) ()
    =
  ({ registration_attachment_id = registration_attachment_id_ }
    : delete_registration_attachment_request)

let make_delete_registration_request ~registration_id:(registration_id_ : registration_id_or_arn) ()
    =
  ({ registration_id = registration_id_ } : delete_registration_request)

let make_delete_rcs_message_spend_limit_override_request () = (() : unit)

let make_delete_rcs_agent_request ~rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn) () =
  ({ rcs_agent_id = rcs_agent_id_ } : delete_rcs_agent_request)

let make_delete_protect_configuration_rule_set_number_override_request
    ~destination_phone_number:(destination_phone_number_ : phone_number)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     destination_phone_number = destination_phone_number_;
     protect_configuration_id = protect_configuration_id_;
   }
    : delete_protect_configuration_rule_set_number_override_request)

let make_delete_protect_configuration_request
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({ protect_configuration_id = protect_configuration_id_ } : delete_protect_configuration_request)

let make_delete_pool_request ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({ pool_id = pool_id_ } : delete_pool_request)

let make_delete_opt_out_list_request
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({ opt_out_list_name = opt_out_list_name_ } : delete_opt_out_list_request)

let make_delete_opted_out_number_request ~opted_out_number:(opted_out_number_ : phone_number)
    ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn) () =
  ({ opted_out_number = opted_out_number_; opt_out_list_name = opt_out_list_name_ }
    : delete_opted_out_number_request)

let make_delete_notify_message_spend_limit_override_request () = (() : unit)

let make_delete_notify_configuration_request
    ~notify_configuration_id:(notify_configuration_id_ : notify_configuration_id_or_arn) () =
  ({ notify_configuration_id = notify_configuration_id_ } : delete_notify_configuration_request)

let make_delete_media_message_spend_limit_override_request () = (() : unit)

let make_delete_keyword_request ~keyword:(keyword_ : keyword)
    ~origination_identity:(origination_identity_ : phone_or_pool_id_or_arn) () =
  ({ keyword = keyword_; origination_identity = origination_identity_ } : delete_keyword_request)

let make_delete_event_destination_request
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     event_destination_name = event_destination_name_;
     configuration_set_name = configuration_set_name_;
   }
    : delete_event_destination_request)

let make_delete_default_sender_id_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_default_sender_id_request)

let make_delete_default_message_type_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_default_message_type_request)

let make_delete_configuration_set_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({ configuration_set_name = configuration_set_name_ } : delete_configuration_set_request)

let make_delete_account_default_protect_configuration_request () = (() : unit)

let make_create_verified_destination_number_request
    ?client_token:(client_token_ : client_token option) ?tags:(tags_ : tag_list option)
    ?rcs_agent_id:(rcs_agent_id_ : rcs_agent_id_or_arn option)
    ~destination_phone_number:(destination_phone_number_ : phone_number) () =
  ({
     client_token = client_token_;
     tags = tags_;
     rcs_agent_id = rcs_agent_id_;
     destination_phone_number = destination_phone_number_;
   }
    : create_verified_destination_number_request)

let make_create_registration_version_request
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ registration_id = registration_id_ } : create_registration_version_request)

let make_create_registration_attachment_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ?attachment_url:(attachment_url_ : attachment_url option)
    ?attachment_body:(attachment_body_ : attachment_body option) () =
  ({
     client_token = client_token_;
     tags = tags_;
     attachment_url = attachment_url_;
     attachment_body = attachment_body_;
   }
    : create_registration_attachment_request)

let make_create_registration_association_request ~resource_id:(resource_id_ : resource_id_or_arn)
    ~registration_id:(registration_id_ : registration_id_or_arn) () =
  ({ resource_id = resource_id_; registration_id = registration_id_ }
    : create_registration_association_request)

let make_create_registration_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ~registration_type:(registration_type_ : registration_type) () =
  ({ client_token = client_token_; tags = tags_; registration_type = registration_type_ }
    : create_registration_request)

let make_create_rcs_agent_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ?opt_out_list_name:(opt_out_list_name_ : opt_out_list_name_or_arn option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option) () =
  ({
     client_token = client_token_;
     tags = tags_;
     opt_out_list_name = opt_out_list_name_;
     deletion_protection_enabled = deletion_protection_enabled_;
   }
    : create_rcs_agent_request)

let make_create_protect_configuration_request ?tags:(tags_ : tag_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?client_token:(client_token_ : client_token option) () =
  ({
     tags = tags_;
     deletion_protection_enabled = deletion_protection_enabled_;
     client_token = client_token_;
   }
    : create_protect_configuration_request)

let make_create_pool_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~message_type:(message_type_ : message_type)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn) () =
  ({
     client_token = client_token_;
     tags = tags_;
     deletion_protection_enabled = deletion_protection_enabled_;
     message_type = message_type_;
     iso_country_code = iso_country_code_;
     origination_identity = origination_identity_;
   }
    : create_pool_request)

let make_create_opt_out_list_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option) ~opt_out_list_name:(opt_out_list_name_ : opt_out_list_name) () =
  ({ client_token = client_token_; tags = tags_; opt_out_list_name = opt_out_list_name_ }
    : create_opt_out_list_request)

let make_create_notify_configuration_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : client_token option)
    ?deletion_protection_enabled:
      (deletion_protection_enabled_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?enabled_countries:(enabled_countries_ : iso_country_code_list option)
    ?pool_id:(pool_id_ : pool_id_or_arn option)
    ?default_template_id:(default_template_id_ : notify_template_id option)
    ~enabled_channels:(enabled_channels_ : notify_enabled_channels_list)
    ~use_case:(use_case_ : notify_configuration_use_case)
    ~display_name:(display_name_ : notify_configuration_display_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     deletion_protection_enabled = deletion_protection_enabled_;
     enabled_channels = enabled_channels_;
     enabled_countries = enabled_countries_;
     pool_id = pool_id_;
     default_template_id = default_template_id_;
     use_case = use_case_;
     display_name = display_name_;
   }
    : create_notify_configuration_request)

let make_create_event_destination_request ?client_token:(client_token_ : client_token option)
    ?sns_destination:(sns_destination_ : sns_destination option)
    ?kinesis_firehose_destination:
      (kinesis_firehose_destination_ : kinesis_firehose_destination option)
    ?cloud_watch_logs_destination:
      (cloud_watch_logs_destination_ : cloud_watch_logs_destination option)
    ~matching_event_types:(matching_event_types_ : event_type_list)
    ~event_destination_name:(event_destination_name_ : event_destination_name)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn) () =
  ({
     client_token = client_token_;
     sns_destination = sns_destination_;
     kinesis_firehose_destination = kinesis_firehose_destination_;
     cloud_watch_logs_destination = cloud_watch_logs_destination_;
     matching_event_types = matching_event_types_;
     event_destination_name = event_destination_name_;
     configuration_set_name = configuration_set_name_;
   }
    : create_event_destination_request)

let make_create_configuration_set_request ?client_token:(client_token_ : client_token option)
    ?tags:(tags_ : tag_list option)
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name) () =
  ({ client_token = client_token_; tags = tags_; configuration_set_name = configuration_set_name_ }
    : create_configuration_set_request)

let make_carrier_lookup_request
    ~phone_number:(phone_number_ : carrier_lookup_input_phone_number_type) () =
  ({ phone_number = phone_number_ } : carrier_lookup_request)

let make_associate_protect_configuration_request
    ~configuration_set_name:(configuration_set_name_ : configuration_set_name_or_arn)
    ~protect_configuration_id:(protect_configuration_id_ : protect_configuration_id_or_arn) () =
  ({
     configuration_set_name = configuration_set_name_;
     protect_configuration_id = protect_configuration_id_;
   }
    : associate_protect_configuration_request)

let make_associate_origination_identity_request ?client_token:(client_token_ : client_token option)
    ?iso_country_code:(iso_country_code_ : iso_country_code option)
    ~origination_identity:(origination_identity_ : phone_or_sender_id_or_arn)
    ~pool_id:(pool_id_ : pool_id_or_arn) () =
  ({
     client_token = client_token_;
     iso_country_code = iso_country_code_;
     origination_identity = origination_identity_;
     pool_id = pool_id_;
   }
    : associate_origination_identity_request)
