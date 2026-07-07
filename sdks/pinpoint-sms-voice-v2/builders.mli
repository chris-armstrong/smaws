open Types

val make_verify_destination_number_request :
  verification_code:verification_code ->
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  verify_destination_number_request

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_verified_destination_number_information :
  ?rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:verification_status ->
  destination_phone_number:phone_number ->
  verified_destination_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  verified_destination_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  verified_destination_number_information

val make_verified_destination_number_filter :
  values:filter_value_list ->
  name:verified_destination_number_filter_name ->
  unit ->
  verified_destination_number_filter

val make_update_sender_id_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id_or_arn ->
  unit ->
  update_sender_id_request

val make_update_rcs_agent_request :
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  ?two_way_media_s3_role:iam_role_arn_or_unset ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name_or_unset ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  update_rcs_agent_request

val make_update_protect_configuration_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  update_protect_configuration_request

val make_protect_configuration_country_rule_set_information :
  protect_status:protect_status -> unit -> protect_configuration_country_rule_set_information

val make_update_protect_configuration_country_rule_set_request :
  country_rule_set_updates:protect_configuration_country_rule_set ->
  number_capability:number_capability ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  update_protect_configuration_country_rule_set_request

val make_update_pool_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?shared_routes_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  pool_id:pool_id_or_arn ->
  unit ->
  update_pool_request

val make_update_phone_number_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?two_way_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  phone_number_id:phone_number_id_or_arn ->
  unit ->
  update_phone_number_request

val make_update_notify_configuration_request :
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enabled_channels:notify_enabled_channels_list ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:notify_pool_id_or_unset ->
  ?default_template_id:notify_template_id ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  update_notify_configuration_request

val make_cloud_watch_logs_destination :
  log_group_arn:log_group_arn -> iam_role_arn:iam_role_arn -> unit -> cloud_watch_logs_destination

val make_kinesis_firehose_destination :
  delivery_stream_arn:delivery_stream_arn ->
  iam_role_arn:iam_role_arn ->
  unit ->
  kinesis_firehose_destination

val make_sns_destination : topic_arn:sns_topic_arn -> unit -> sns_destination

val make_event_destination :
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  matching_event_types:event_type_list ->
  enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  event_destination_name:event_destination_name ->
  unit ->
  event_destination

val make_update_event_destination_request :
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  ?matching_event_types:event_type_list ->
  ?enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  update_event_destination_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_arn:amazon_resource_name -> unit -> untag_resource_request

val make_text_validation :
  pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  max_length:Smaws_Lib.Smithy_api.Types.integer ->
  min_length:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  text_validation

val make_testing_agent_information :
  ?testing_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:testing_agent_status ->
  unit ->
  testing_agent_information

val make_template_variable_metadata :
  ?source:template_variable_source ->
  ?sample:Smaws_Lib.Smithy_api.Types.string_ ->
  ?pattern:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?min_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?max_length:Smaws_Lib.Smithy_api.Types.integer ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  type_:template_variable_type ->
  unit ->
  template_variable_metadata

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:non_empty_tag_list -> resource_arn:amazon_resource_name -> unit -> tag_resource_request

val make_supported_association :
  ?iso_country_code:iso_country_code ->
  disassociation_behavior:registration_disassociation_behavior ->
  association_behavior:registration_association_behavior ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  supported_association

val make_registration_version_status_history :
  ?archived_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?revoked_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?denied_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?discarded_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?approved_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?requires_authentication_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?aws_reviewing_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?submitted_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  draft_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  registration_version_status_history

val make_submit_registration_version_request :
  ?aws_review:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  registration_id:registration_id_or_arn ->
  unit ->
  submit_registration_version_request

val make_spend_limit :
  overridden:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  max_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  enforced_limit:Smaws_Lib.Smithy_api.Types.primitive_long ->
  name:spend_limit_name ->
  unit ->
  spend_limit

val make_set_voice_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_voice_message_spend_limit_override_request

val make_set_text_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_text_message_spend_limit_override_request

val make_set_rcs_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_rcs_message_spend_limit_override_request

val make_set_notify_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_notify_message_spend_limit_override_request

val make_set_media_message_spend_limit_override_request :
  monthly_limit:monthly_limit -> unit -> set_media_message_spend_limit_override_request

val make_set_default_sender_id_request :
  sender_id:sender_id ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_sender_id_request

val make_set_default_message_type_request :
  message_type:message_type ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_message_type_request

val make_set_default_message_feedback_enabled_request :
  message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  set_default_message_feedback_enabled_request

val make_set_account_default_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  set_account_default_protect_configuration_request

val make_sender_id_and_country :
  iso_country_code:iso_country_code -> sender_id:sender_id_or_arn -> unit -> sender_id_and_country

val make_sender_id_information :
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registered:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  message_types:message_type_list ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id ->
  sender_id_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  sender_id_information

val make_sender_id_filter :
  values:filter_value_list -> name:sender_id_filter_name -> unit -> sender_id_filter

val make_send_voice_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price_per_minute:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?voice_id:voice_id ->
  ?message_body_text_type:voice_message_body_text_type ->
  ?message_body:voice_message_body ->
  origination_identity:voice_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_voice_message_request

val make_send_text_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?destination_country_parameters:destination_country_parameters ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?keyword:keyword ->
  ?message_type:message_type ->
  ?message_body:text_message_body ->
  ?origination_identity:text_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_text_message_request

val make_rcs_text_message : body:rcs_text_body -> unit -> rcs_text_message

val make_rcs_file_message :
  ?thumbnail_url:rcs_media_url -> file_url:rcs_media_url -> unit -> rcs_file_message

val make_rcs_card_media :
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  ?thumbnail_url:rcs_media_url ->
  file_url:rcs_media_url ->
  unit ->
  rcs_card_media

val make_rcs_reply_action :
  postback_data:rcs_postback_data -> text:rcs_suggested_action_text -> unit -> rcs_reply_action

val make_rcs_open_url_action :
  ?webview_view_mode:Smaws_Lib.Smithy_api.Types.string_ ->
  ?application:Smaws_Lib.Smithy_api.Types.string_ ->
  url:rcs_open_url_value ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_open_url_action

val make_rcs_dial_phone_action :
  phone_number:phone_number ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_dial_phone_action

val make_rcs_show_location_action :
  ?label:rcs_location_label ->
  longitude:Smaws_Lib.Smithy_api.Types.double ->
  latitude:Smaws_Lib.Smithy_api.Types.double ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_show_location_action

val make_rcs_request_location_action :
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_request_location_action

val make_rcs_create_calendar_event_action :
  ?description:rcs_calendar_event_description ->
  end_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  start_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  title:rcs_calendar_event_title ->
  postback_data:rcs_postback_data ->
  text:rcs_suggested_action_text ->
  unit ->
  rcs_create_calendar_event_action

val make_rcs_card_content :
  ?suggestions:rcs_card_suggested_action_list ->
  ?media:rcs_card_media ->
  ?description:rcs_card_description ->
  ?title:rcs_card_title ->
  unit ->
  rcs_card_content

val make_rcs_standalone_card :
  ?thumbnail_image_alignment:Smaws_Lib.Smithy_api.Types.string_ ->
  card_content:rcs_card_content ->
  card_orientation:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_standalone_card

val make_rcs_carousel_card_media :
  ?height:Smaws_Lib.Smithy_api.Types.string_ ->
  ?thumbnail_url:rcs_media_url ->
  file_url:rcs_media_url ->
  unit ->
  rcs_carousel_card_media

val make_rcs_carousel_card_content :
  ?suggestions:rcs_card_suggested_action_list ->
  ?media:rcs_carousel_card_media ->
  ?description:rcs_card_description ->
  ?title:rcs_card_title ->
  unit ->
  rcs_carousel_card_content

val make_rcs_carousel :
  card_contents:rcs_carousel_card_content_list ->
  card_width:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_carousel

val make_rcs_message_content :
  ?suggestions:rcs_suggested_action_list -> content:rcs_content -> unit -> rcs_message_content

val make_rcs_fallback_configuration :
  ?origination_identity:rcs_fallback_origination_identity ->
  ?media_urls:media_url_list ->
  ?message_body:rcs_fallback_message_body ->
  channel:rcs_fallback_channel ->
  unit ->
  rcs_fallback_configuration

val make_send_rcs_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?context:context_map ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?fallback_configuration:rcs_fallback_configuration ->
  ?message_traffic_type:rcs_message_traffic_type ->
  ?time_to_live:rcs_time_to_live ->
  ?rcs_message_content:rcs_message_content ->
  origination_identity:rcs_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_rcs_message_request

val make_send_notify_voice_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?voice_id:voice_id ->
  ?template_id:notify_template_id ->
  template_variables:template_variable_substitution_map ->
  destination_phone_number:phone_number ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  send_notify_voice_message_request

val make_send_notify_text_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?template_id:notify_template_id ->
  template_variables:template_variable_substitution_map ->
  destination_phone_number:phone_number ->
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  send_notify_text_message_request

val make_send_media_message_request :
  ?message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?dry_run:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?context:context_map ->
  ?time_to_live:time_to_live ->
  ?max_price:max_price ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?media_urls:media_url_list ->
  ?message_body:text_message_body ->
  origination_identity:media_message_origination_identity ->
  destination_phone_number:phone_number ->
  unit ->
  send_media_message_request

val make_send_destination_number_verification_code_request :
  ?destination_country_parameters:destination_country_parameters ->
  ?context:context_map ->
  ?configuration_set_name:configuration_set_name_or_arn ->
  ?origination_identity:verification_message_origination_identity ->
  ?language_code:language_code ->
  verification_channel:verification_channel ->
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  send_destination_number_verification_code_request

val make_select_validation :
  options:string_list ->
  max_choices:Smaws_Lib.Smithy_api.Types.integer ->
  min_choices:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  select_validation

val make_select_option_description :
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?title:Smaws_Lib.Smithy_api.Types.string_ ->
  option_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  select_option_description

val make_request_sender_id_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?message_types:message_type_list ->
  iso_country_code:iso_country_code ->
  sender_id:sender_id ->
  unit ->
  request_sender_id_request

val make_request_phone_number_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?registration_id:registration_id_or_arn ->
  ?pool_id:pool_id_or_arn ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  number_type:requestable_number_type ->
  number_capabilities:number_capability_list ->
  message_type:message_type ->
  iso_country_code:iso_country_code ->
  unit ->
  request_phone_number_request

val make_release_sender_id_request :
  iso_country_code:iso_country_code ->
  sender_id:sender_id_or_arn ->
  unit ->
  release_sender_id_request

val make_release_phone_number_request :
  phone_number_id:phone_number_id_or_arn -> unit -> release_phone_number_request

val make_registration_denied_reason_information :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  reason:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_denied_reason_information

val make_registration_version_information :
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  ?denied_reasons:registration_denied_reason_information_list ->
  registration_version_status_history:registration_version_status_history ->
  registration_version_status:registration_version_status ->
  version_number:registration_version_number ->
  unit ->
  registration_version_information

val make_registration_version_filter :
  values:filter_value_list ->
  name:registration_version_filter_name ->
  unit ->
  registration_version_filter

val make_registration_type_filter :
  values:filter_value_list -> name:registration_type_filter_name -> unit -> registration_type_filter

val make_registration_type_display_hints :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_type_display_hints

val make_registration_type_definition :
  ?supported_associations:supported_association_list ->
  display_hints:registration_type_display_hints ->
  registration_type:registration_type ->
  unit ->
  registration_type_definition

val make_registration_section_display_hints :
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_section_display_hints

val make_registration_section_definition :
  display_hints:registration_section_display_hints ->
  section_path:section_path ->
  unit ->
  registration_section_definition

val make_registration_information :
  ?additional_attributes:string_map ->
  ?latest_denied_version_number:registration_version_number ->
  ?approved_version_number:registration_version_number ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  current_version_number:registration_version_number ->
  registration_status:registration_status ->
  registration_type:registration_type ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_information

val make_registration_filter :
  values:filter_value_list -> name:registration_filter_name -> unit -> registration_filter

val make_registration_field_value_information :
  ?feedback:Smaws_Lib.Smithy_api.Types.string_ ->
  ?denied_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  ?text_value:text_value ->
  ?select_choices:select_choice_list ->
  field_path:field_path ->
  unit ->
  registration_field_value_information

val make_registration_field_display_hints :
  ?example_text_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?text_validation_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?select_option_descriptions:select_option_descriptions_list ->
  ?documentation_link:Smaws_Lib.Smithy_api.Types.string_ ->
  ?documentation_title:Smaws_Lib.Smithy_api.Types.string_ ->
  ?long_description:Smaws_Lib.Smithy_api.Types.string_ ->
  short_description:Smaws_Lib.Smithy_api.Types.string_ ->
  title:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_field_display_hints

val make_registration_field_definition :
  ?text_validation:text_validation ->
  ?select_validation:select_validation ->
  display_hints:registration_field_display_hints ->
  field_requirement:field_requirement ->
  field_type:field_type ->
  field_path:field_path ->
  section_path:section_path ->
  unit ->
  registration_field_definition

val make_registration_attachments_information :
  ?attachment_url:Smaws_Lib.Smithy_api.Types.string_ ->
  ?attachment_upload_error_reason:attachment_upload_error_reason ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  attachment_status:attachment_status ->
  registration_attachment_id:Smaws_Lib.Smithy_api.Types.string_ ->
  registration_attachment_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_attachments_information

val make_registration_attachment_filter :
  values:filter_value_list ->
  name:registration_attachment_filter_name ->
  unit ->
  registration_attachment_filter

val make_registration_association_metadata :
  ?phone_number:phone_number ->
  ?iso_country_code:iso_country_code ->
  resource_type:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_id:Smaws_Lib.Smithy_api.Types.string_ ->
  resource_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  registration_association_metadata

val make_registration_association_filter :
  values:filter_value_list ->
  name:registration_association_filter_name ->
  unit ->
  registration_association_filter

val make_rcs_agent_information :
  ?testing_agent:testing_agent_information ->
  ?two_way_rcs_events_enabled:rcs_event_type_list ->
  ?two_way_media_s3_role:iam_role_arn ->
  ?two_way_media_s3_key_prefix:two_way_media_s3_key_prefix ->
  ?two_way_media_s3_bucket_name:two_way_media_s3_bucket_name ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?opt_out_list_name:opt_out_list_name ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:rcs_agent_status ->
  rcs_agent_id:Smaws_Lib.Smithy_api.Types.string_ ->
  rcs_agent_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  rcs_agent_information

val make_rcs_agent_filter :
  values:filter_value_list -> name:rcs_agent_filter_name -> unit -> rcs_agent_filter

val make_put_resource_policy_request :
  policy:resource_policy -> resource_arn:amazon_resource_name -> unit -> put_resource_policy_request

val make_put_registration_field_value_request :
  ?registration_attachment_id:registration_attachment_id_or_arn ->
  ?text_value:text_value ->
  ?select_choices:select_choice_list ->
  field_path:field_path ->
  registration_id:registration_id_or_arn ->
  unit ->
  put_registration_field_value_request

val make_put_protect_configuration_rule_set_number_override_request :
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?client_token:client_token ->
  action:protect_configuration_rule_override_action ->
  destination_phone_number:phone_number ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  put_protect_configuration_rule_set_number_override_request

val make_put_opted_out_number_request :
  opted_out_number:phone_number ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  put_opted_out_number_request

val make_put_message_feedback_request :
  message_feedback_status:message_feedback_status ->
  message_id:message_id ->
  unit ->
  put_message_feedback_request

val make_put_keyword_request :
  ?keyword_action:keyword_action ->
  keyword_message:keyword_message ->
  keyword:keyword ->
  origination_identity:phone_or_pool_id_or_arn ->
  unit ->
  put_keyword_request

val make_protect_configuration_rule_set_number_override :
  ?expiration_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?iso_country_code:iso_country_code ->
  action:protect_configuration_rule_override_action ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  destination_phone_number:phone_number ->
  unit ->
  protect_configuration_rule_set_number_override

val make_protect_configuration_rule_set_number_override_filter_item :
  values:filter_value_list ->
  name:protect_configuration_rule_set_number_override_filter_name ->
  unit ->
  protect_configuration_rule_set_number_override_filter_item

val make_protect_configuration_information :
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  account_default:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  protect_configuration_id:protect_configuration_id ->
  protect_configuration_arn:protect_configuration_arn ->
  unit ->
  protect_configuration_information

val make_protect_configuration_filter :
  values:filter_value_list ->
  name:protect_configuration_filter_name ->
  unit ->
  protect_configuration_filter

val make_pool_origination_identities_filter :
  values:filter_value_list ->
  name:pool_origination_identities_filter_name ->
  unit ->
  pool_origination_identities_filter

val make_pool_information :
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  shared_routes_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  message_type:message_type ->
  status:pool_status ->
  pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  pool_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  pool_information

val make_pool_filter : values:filter_value_list -> name:pool_filter_name -> unit -> pool_filter

val make_list_tags_for_resource_request :
  resource_arn:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_registration_associations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_association_filter_list ->
  registration_id:registration_id_or_arn ->
  unit ->
  list_registration_associations_request

val make_list_protect_configuration_rule_set_number_overrides_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:list_protect_configuration_rule_set_number_override_filter ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  list_protect_configuration_rule_set_number_overrides_request

val make_origination_identity_metadata :
  ?phone_number:phone_number ->
  number_capabilities:number_capability_list ->
  iso_country_code:iso_country_code ->
  origination_identity:Smaws_Lib.Smithy_api.Types.string_ ->
  origination_identity_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  origination_identity_metadata

val make_list_pool_origination_identities_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:pool_origination_identities_filter_list ->
  pool_id:pool_id_or_arn ->
  unit ->
  list_pool_origination_identities_request

val make_notify_country_information :
  customer_owned_identity_required:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  supported_tiers:notify_tier_list ->
  supported_use_cases:notify_use_case_list ->
  supported_channels:notify_enabled_channels_list ->
  country_name:Smaws_Lib.Smithy_api.Types.string_ ->
  iso_country_code:iso_country_code ->
  unit ->
  notify_country_information

val make_list_notify_countries_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?tier:notify_configuration_tier ->
  ?use_cases:notify_use_case_list ->
  ?channels:notify_enabled_channels_list ->
  unit ->
  list_notify_countries_request

val make_get_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> get_resource_policy_request

val make_get_protect_configuration_country_rule_set_request :
  number_capability:number_capability ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  get_protect_configuration_country_rule_set_request

val make_discard_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> discard_registration_version_request

val make_disassociate_protect_configuration_request :
  configuration_set_name:configuration_set_name_or_arn ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  disassociate_protect_configuration_request

val make_disassociate_origination_identity_request :
  ?client_token:client_token ->
  ?iso_country_code:iso_country_code ->
  origination_identity:phone_or_sender_id_or_arn ->
  pool_id:pool_id_or_arn ->
  unit ->
  disassociate_origination_identity_request

val make_describe_verified_destination_numbers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:verified_destination_number_filter_list ->
  ?destination_phone_numbers:destination_phone_number_list ->
  ?verified_destination_number_ids:verified_destination_number_id_list ->
  unit ->
  describe_verified_destination_numbers_request

val make_describe_spend_limits_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_spend_limits_request

val make_describe_sender_ids_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:sender_id_filter_list ->
  ?sender_ids:sender_id_list ->
  unit ->
  describe_sender_ids_request

val make_describe_registration_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_version_filter_list ->
  ?version_numbers:registration_version_number_list ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_versions_request

val make_describe_registration_type_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_type_filter_list ->
  ?registration_types:registration_type_list ->
  unit ->
  describe_registration_type_definitions_request

val make_describe_registration_section_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?section_paths:section_path_list ->
  registration_type:registration_type ->
  unit ->
  describe_registration_section_definitions_request

val make_describe_registrations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_filter_list ->
  ?registration_ids:registration_id_list ->
  unit ->
  describe_registrations_request

val make_describe_registration_field_values_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?field_paths:field_path_list ->
  ?section_path:section_path ->
  ?version_number:registration_version_number ->
  registration_id:registration_id_or_arn ->
  unit ->
  describe_registration_field_values_request

val make_describe_registration_field_definitions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?field_paths:field_path_list ->
  ?section_path:section_path ->
  registration_type:registration_type ->
  unit ->
  describe_registration_field_definitions_request

val make_describe_registration_attachments_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:registration_attachment_filter_list ->
  ?registration_attachment_ids:registration_attachment_id_list ->
  unit ->
  describe_registration_attachments_request

val make_describe_rcs_agents_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:rcs_agent_filter_list ->
  ?owner:owner ->
  ?rcs_agent_ids:rcs_agent_id_list ->
  unit ->
  describe_rcs_agents_request

val make_carrier_status_information :
  status:carrier_status ->
  carrier_name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  carrier_status_information

val make_country_launch_status_information :
  ?rcs_platform_id:Smaws_Lib.Smithy_api.Types.string_ ->
  carrier_status:carrier_status_information_list ->
  registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  status:country_launch_status ->
  iso_country_code:iso_country_code ->
  unit ->
  country_launch_status_information

val make_country_launch_status_filter :
  values:filter_value_list ->
  name:country_launch_status_filter_name ->
  unit ->
  country_launch_status_filter

val make_describe_rcs_agent_country_launch_status_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:country_launch_status_filter_list ->
  ?iso_country_codes:iso_country_code_list ->
  rcs_agent_id:rcs_agent_id_or_arn ->
  unit ->
  describe_rcs_agent_country_launch_status_request

val make_describe_protect_configurations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:protect_configuration_filter_list ->
  ?protect_configuration_ids:protect_configuration_id_list ->
  unit ->
  describe_protect_configurations_request

val make_describe_pools_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:pool_filter_list ->
  ?pool_ids:pool_id_list ->
  unit ->
  describe_pools_request

val make_phone_number_information :
  ?registration_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?international_sending_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  ?two_way_channel_role:iam_role_arn ->
  ?two_way_channel_arn:two_way_channel_arn ->
  ?phone_number_id:Smaws_Lib.Smithy_api.Types.string_ ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opt_out_list_name:opt_out_list_name ->
  self_managed_opt_outs_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  two_way_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  monthly_leasing_price:Smaws_Lib.Smithy_api.Types.string_ ->
  number_type:number_type ->
  number_capabilities:number_capability_list ->
  message_type:message_type ->
  iso_country_code:iso_country_code ->
  status:number_status ->
  phone_number:phone_number ->
  phone_number_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  phone_number_information

val make_phone_number_filter :
  values:filter_value_list -> name:phone_number_filter_name -> unit -> phone_number_filter

val make_describe_phone_numbers_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:phone_number_filter_list ->
  ?phone_number_ids:phone_number_id_list ->
  unit ->
  describe_phone_numbers_request

val make_opt_out_list_information :
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  opt_out_list_name:opt_out_list_name ->
  opt_out_list_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  opt_out_list_information

val make_describe_opt_out_lists_request :
  ?owner:owner ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?opt_out_list_names:opt_out_list_name_list ->
  unit ->
  describe_opt_out_lists_request

val make_opted_out_number_information :
  end_user_opted_out:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  opted_out_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  opted_out_number:phone_number ->
  unit ->
  opted_out_number_information

val make_opted_out_filter :
  values:filter_value_list -> name:opted_out_filter_name -> unit -> opted_out_filter

val make_describe_opted_out_numbers_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:opted_out_filter_list ->
  ?opted_out_numbers:opted_out_number_list ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  describe_opted_out_numbers_request

val make_notify_template_information :
  ?supported_voice_ids:voice_id_list ->
  ?variables:template_variables_map ->
  ?content:template_content ->
  ?language_code:notify_language_code ->
  ?supported_countries:iso_country_code_list ->
  ?status:notify_template_status ->
  ?tier_access:notify_configuration_tier_list ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  channels:number_capability_list ->
  template_type:notify_template_type ->
  version:notify_template_version ->
  template_id:notify_template_id ->
  unit ->
  notify_template_information

val make_notify_template_filter :
  values:filter_value_list -> name:notify_template_filter_name -> unit -> notify_template_filter

val make_describe_notify_templates_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:notify_template_filter_list ->
  ?template_ids:notify_template_id_list ->
  unit ->
  describe_notify_templates_request

val make_notify_configuration_information :
  ?rejection_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?default_template_id:notify_template_id ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.primitive_boolean ->
  status:notify_configuration_status ->
  tier_upgrade_status:tier_upgrade_status ->
  tier:notify_configuration_tier ->
  enabled_channels:notify_enabled_channels_list ->
  use_case:notify_configuration_use_case ->
  display_name:notify_configuration_display_name ->
  notify_configuration_id:notify_configuration_id ->
  notify_configuration_arn:notify_configuration_arn ->
  unit ->
  notify_configuration_information

val make_notify_configuration_filter :
  values:filter_value_list ->
  name:notify_configuration_filter_name ->
  unit ->
  notify_configuration_filter

val make_describe_notify_configurations_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:notify_configuration_filter_list ->
  ?notify_configuration_ids:notify_configuration_id_list ->
  unit ->
  describe_notify_configurations_request

val make_keyword_information :
  keyword_action:keyword_action ->
  keyword_message:keyword_message ->
  keyword:keyword ->
  unit ->
  keyword_information

val make_keyword_filter :
  values:filter_value_list -> name:keyword_filter_name -> unit -> keyword_filter

val make_describe_keywords_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:keyword_filter_list ->
  ?keywords:keyword_list ->
  origination_identity:phone_or_pool_id_or_arn ->
  unit ->
  describe_keywords_request

val make_configuration_set_information :
  ?protect_configuration_id:protect_configuration_id_or_arn ->
  ?default_message_feedback_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?default_sender_id:sender_id ->
  ?default_message_type:message_type ->
  created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  event_destinations:event_destination_list ->
  configuration_set_name:configuration_set_name ->
  configuration_set_arn:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  configuration_set_information

val make_configuration_set_filter :
  values:filter_value_list -> name:configuration_set_filter_name -> unit -> configuration_set_filter

val make_describe_configuration_sets_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?filters:configuration_set_filter_list ->
  ?configuration_set_names:configuration_set_name_list ->
  unit ->
  describe_configuration_sets_request

val make_account_limit :
  max:Smaws_Lib.Smithy_api.Types.primitive_long ->
  used:Smaws_Lib.Smithy_api.Types.primitive_long ->
  name:account_limit_name ->
  unit ->
  account_limit

val make_describe_account_limits_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_account_limits_request

val make_account_attribute :
  value:Smaws_Lib.Smithy_api.Types.string_ ->
  name:account_attribute_name ->
  unit ->
  account_attribute

val make_describe_account_attributes_request :
  ?max_results:max_results -> ?next_token:next_token -> unit -> describe_account_attributes_request

val make_delete_voice_message_spend_limit_override_request : unit -> unit

val make_delete_verified_destination_number_request :
  verified_destination_number_id:verified_destination_number_id_or_arn ->
  unit ->
  delete_verified_destination_number_request

val make_delete_text_message_spend_limit_override_request : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:amazon_resource_name -> unit -> delete_resource_policy_request

val make_delete_registration_field_value_request :
  field_path:field_path ->
  registration_id:registration_id_or_arn ->
  unit ->
  delete_registration_field_value_request

val make_delete_registration_attachment_request :
  registration_attachment_id:registration_attachment_id_or_arn ->
  unit ->
  delete_registration_attachment_request

val make_delete_registration_request :
  registration_id:registration_id_or_arn -> unit -> delete_registration_request

val make_delete_rcs_message_spend_limit_override_request : unit -> unit

val make_delete_rcs_agent_request :
  rcs_agent_id:rcs_agent_id_or_arn -> unit -> delete_rcs_agent_request

val make_delete_protect_configuration_rule_set_number_override_request :
  destination_phone_number:phone_number ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  delete_protect_configuration_rule_set_number_override_request

val make_delete_protect_configuration_request :
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  delete_protect_configuration_request

val make_delete_pool_request : pool_id:pool_id_or_arn -> unit -> delete_pool_request

val make_delete_opt_out_list_request :
  opt_out_list_name:opt_out_list_name_or_arn -> unit -> delete_opt_out_list_request

val make_delete_opted_out_number_request :
  opted_out_number:phone_number ->
  opt_out_list_name:opt_out_list_name_or_arn ->
  unit ->
  delete_opted_out_number_request

val make_delete_notify_message_spend_limit_override_request : unit -> unit

val make_delete_notify_configuration_request :
  notify_configuration_id:notify_configuration_id_or_arn ->
  unit ->
  delete_notify_configuration_request

val make_delete_media_message_spend_limit_override_request : unit -> unit

val make_delete_keyword_request :
  keyword:keyword -> origination_identity:phone_or_pool_id_or_arn -> unit -> delete_keyword_request

val make_delete_event_destination_request :
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  delete_event_destination_request

val make_delete_default_sender_id_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_default_sender_id_request

val make_delete_default_message_type_request :
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  delete_default_message_type_request

val make_delete_configuration_set_request :
  configuration_set_name:configuration_set_name_or_arn -> unit -> delete_configuration_set_request

val make_delete_account_default_protect_configuration_request : unit -> unit

val make_create_verified_destination_number_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?rcs_agent_id:rcs_agent_id_or_arn ->
  destination_phone_number:phone_number ->
  unit ->
  create_verified_destination_number_request

val make_create_registration_version_request :
  registration_id:registration_id_or_arn -> unit -> create_registration_version_request

val make_create_registration_attachment_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?attachment_url:attachment_url ->
  ?attachment_body:attachment_body ->
  unit ->
  create_registration_attachment_request

val make_create_registration_association_request :
  resource_id:resource_id_or_arn ->
  registration_id:registration_id_or_arn ->
  unit ->
  create_registration_association_request

val make_create_registration_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  registration_type:registration_type ->
  unit ->
  create_registration_request

val make_create_rcs_agent_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?opt_out_list_name:opt_out_list_name_or_arn ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  unit ->
  create_rcs_agent_request

val make_create_protect_configuration_request :
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?client_token:client_token ->
  unit ->
  create_protect_configuration_request

val make_create_pool_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?iso_country_code:iso_country_code ->
  message_type:message_type ->
  origination_identity:phone_or_sender_id_or_arn ->
  unit ->
  create_pool_request

val make_create_opt_out_list_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  opt_out_list_name:opt_out_list_name ->
  unit ->
  create_opt_out_list_request

val make_create_notify_configuration_request :
  ?tags:tag_list ->
  ?client_token:client_token ->
  ?deletion_protection_enabled:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?enabled_countries:iso_country_code_list ->
  ?pool_id:pool_id_or_arn ->
  ?default_template_id:notify_template_id ->
  enabled_channels:notify_enabled_channels_list ->
  use_case:notify_configuration_use_case ->
  display_name:notify_configuration_display_name ->
  unit ->
  create_notify_configuration_request

val make_create_event_destination_request :
  ?client_token:client_token ->
  ?sns_destination:sns_destination ->
  ?kinesis_firehose_destination:kinesis_firehose_destination ->
  ?cloud_watch_logs_destination:cloud_watch_logs_destination ->
  matching_event_types:event_type_list ->
  event_destination_name:event_destination_name ->
  configuration_set_name:configuration_set_name_or_arn ->
  unit ->
  create_event_destination_request

val make_create_configuration_set_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  configuration_set_name:configuration_set_name ->
  unit ->
  create_configuration_set_request

val make_carrier_lookup_request :
  phone_number:carrier_lookup_input_phone_number_type -> unit -> carrier_lookup_request

val make_associate_protect_configuration_request :
  configuration_set_name:configuration_set_name_or_arn ->
  protect_configuration_id:protect_configuration_id_or_arn ->
  unit ->
  associate_protect_configuration_request

val make_associate_origination_identity_request :
  ?client_token:client_token ->
  ?iso_country_code:iso_country_code ->
  origination_identity:phone_or_sender_id_or_arn ->
  pool_id:pool_id_or_arn ->
  unit ->
  associate_origination_identity_request
